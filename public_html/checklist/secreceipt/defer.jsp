<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
				 com.integrosys.cms.ui.checklist.secreceipt.*,
                 java.util.*,
                 com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%
DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
SecurityReceiptForm form = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

String hdfcAmt="";
if(form.getHdfcAmt()!=null && !form.getHdfcAmt().trim().equals("")){
	hdfcAmt=form.getHdfcAmt();
}


String docAmt="";
if(form.getDocAmt()!=null && !form.getDocAmt().trim().equals("")){
	docAmt=form.getDocAmt();
}
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

String count=form.getDeferCount();
int count1=0;
boolean state=false;
if("AWAITING".equals(form.getItemStatus())){
	state=false;
}else{
if((form.getItemStatus().equals("DEFERRED")||form.getItemStatus().equals("PENDING_DEFER"))||!form.getDeferCount().equals("1")){
	state=true;
}}
if(form.getItemStatus().equals("DEFERRED")){
	
	count1=Integer.parseInt(count);
	count1=count1+1;	
	count=String.valueOf(count1);
}
if(form.getItemStatus().equals("AWAITING") || form.getItemStatus().equals("DISCREPANCY")){
	
	count="1";
}
String deferDate="";
if(form.getDeferDate()!=null && !form.getDeferDate().equals("")){
	deferDate=form.getDeferDate();	
}else{
	deferDate=df1.format(new Date());
}
String docDate=form.getDocDate();
String expiryDate=form.getDocExpDate();
    String lableDocDate = "Doc Expiry Date";
    ICheckListItem checkListItem =(ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.checkListItem");
    
    List deferCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.deferCreditApproverList");
    //System.out.println("::::::checkListItem:::::"+checkListItem.getItemStatus());
    
    if(deferCreditApproverList!=null){
    	pageContext.setAttribute("deferCreditApproverList",deferCreditApproverList);
    }
    List currencyList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.currencyList");
    if(currencyList!=null){
    	pageContext.setAttribute("currencyList",currencyList);
    }
    /*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0)
	{
		
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if(monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))
	{
				lableDocDate = "Due Date to Receive Premium Receipt";
	}*/
	
	List rocChargeList = (List)session.getAttribute(SecurityReceiptAction.class.getName() + "." + "rocChargeList" );
    if(rocChargeList!=null){
    	pageContext.setAttribute("rocChargeList",rocChargeList);
    }
    
    Boolean isCustomerCorporate = (Boolean) session.getAttribute(SecurityReceiptAction.class.getName() + "." + "isCustomerCorporate");
    Boolean isImageTagPending = (Boolean) session.getAttribute(SecurityReceiptAction.class.getName() + "." + ITagUntagImageConstant.IS_IMAGE_TAG_PENDING);
    
%>

<%--  // cr 36
    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();

    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);
    
--%>



<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
	//var chkResult = checkExtendedDate();
	//if(chkResult==true ){
	//int deferCount=document.forms["SecurityReceiptForm"].deferCount.value;
	//deferCount=deferCount+1;
	//document.forms["SecurityReceiptForm"].deferCount.value=deferCount;
    //}
	
	 var isImageTagPending = <%=isImageTagPending%>;
     var rocChargeVal = document.getElementsByName("rocCharge")[0].value;
	 if(isImageTagPending && (rocChargeVal == 'Y')){
		alert('<bean:message key="label.tagging.not.completed"/>');
			return;
	 }
	 else{
		 document.forms["SecurityReceiptForm"].event.value="save_defer";
			document.forms["SecurityReceiptForm"].submit();
	 }
}

function cancelForm() {
	document.forms["SecurityReceiptForm"].event.value="view_ok";
	document.forms["SecurityReceiptForm"].submit();
}
    var months = new Array();
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

/* moved validation into SecurityReceiptFormValidator.java
function checkExtendedDate(){
    var expiredate = document.forms[0].deferDate.value;
    var extenddate = document.forms[0].deferExtendedDate.value;
    var expDate = new Date();
    var extDate = new Date();
    document.all['blankDate'].innerHTML = '';
    document.all['extDate'].innerHTML = '';
    if(expiredate == null || expiredate == ''){
    	document.forms[0].deferExtendedDate.value = '';
    	document.all['blankDate'].innerHTML =  '<font color="#FF0000" size="1"><br>Defer To Date is blank.</font>';
        alert('The Defer To Date is invalid. Please verify.');
    	return false;
    }else if (extenddate != null && extenddate != '' ) {

        expDate = new Date(expiredate.substring(7,11), months[expiredate.substring(3,6)], expiredate.substring(0,2));
        extDate = new Date(extenddate.substring(7,11), months[extenddate.substring(3,6)], extenddate.substring(0,2));
        if(extDate < expDate){
        	document.forms[0].deferExtendedDate.value ='';
        	document.all['extDate'].innerHTML =  '<font color="#FF0000" size="1"><br>Extended Deferment Date should not be earlier than Defer to Date.</font>';
            alert('The Extended Deferment Date is invalid. Please verify.');
        	return false;
        }
	}
	return true;
}
*/

<%--
function days_between(date1, date2) {

    // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();

    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);

    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY);

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

function calculateDaysDiff() {
    strdate1 = document.forms[0].deferDate.value;
    strdate2 = document.forms[0].deferExtendedDate.value;
    date1 = new Date();
    date2 = new Date();
    if ((strdate2 == null || strdate2 == '') && (strdate1 == null || strdate1 == '')) {
       document.forms[0].ddnDays.value = '';
    } else {
        <% if (bcaApprovedDate == null) { %>
            document.forms[0].ddnDays.value = '';
        <% } else { %>
            if (strdate2 != null && strdate2 != '') {                
                date1 = new Date(strdate2.substring(7,11), months[strdate2.substring(3,6)], strdate2.substring(0,2));
            } else {              	
              	date1 = new Date(strdate1.substring(7,11), months[strdate1.substring(3,6)], strdate1.substring(0,2));
            }

            date2 = new Date(<%=cal.get(Calendar.YEAR)%>, <%=cal.get(Calendar.MONTH)%>, <%=cal.get(Calendar.DAY_OF_MONTH)%>);

            if (date1 < date2) {
                document.forms[0].ddnDays.value = 0;
            } else {

                daysDiff = days_between(date1, date2);
                document.forms[0].ddnDays.value = daysDiff;
                //if (daysDiff > 90)
                //  document.all['warning90'].innerHTML = '<font color="#FF0000" size="1">Deferral Date is more than 90 calendar days from BCA approval date.</font>';
                //else
                //  document.all['warning90'].innerHTML = '';
            }
        <% } %>
    }
}--%>
//-->
</script>
<script language="JavaScript" type="text/JavaScript">
function setDifferenceBetDate() {
    
	
    
	   var user_date =document.forms[0].deferDate.value;
	
		//alert("deferDate :"+user_date);
	
	var today_date =document.forms[0].originalTargetDate.value;
	//alert("otdDate :"+today_date);
	
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
    
    
    	var state="<%= state%>";
    	//alert("state "+state);
    	if(state=='true'){
    		var user_date =document.forms[0].deferExtendedDate.value;
    	}
    	else{
	   		var user_date =document.forms[0].expectedReturnDate.value;
    	}
	
	//alert("nextDate :"+user_date);
	
	var today_date =document.forms[0].originalTargetDate.value;;
	//alert("otd :"+today_date);
	
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
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<html:hidden property="docRef" />
<html:hidden property="formNo" />
<html:hidden property="deferCount" value="<%=count %>" />
<!-- <html:hidden property="identifyDate" /> -->
<!--<html:hidden property="origDeferDate" />
<html:hidden property="origDeferExtendedDate" />
--><html:hidden property="receivedDate" />


<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Security Doc Receipt </h3></td>
    </tr>
    <tr>
      <td><h3> Doc Description - Defer</h3></td>
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
              <td><html:text property="docAmt" size="31" maxlength="21" styleId="docAmt" onblur="javascript:formatAmountAsCommaSeparated(this)" />
               
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
<!--            <tr class="even">-->
<!--              <td class="fieldname">Document Type</td>-->
<!--              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>-->
<!--              <td>-</td>-->
<!--              <%}else{ %>-->
<!--              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>-->
<!--            	<%} %>-->
<!--            </tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="formNo" /></td>-->
<!--            </tr>-->
            <tr class="even">
              <td class="fieldname">Doc Date </td>
              <td><html:text property="docDate" size="12" maxlength="12" readonly="true"  value="<%=docDate%>"/>
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="docDate" />
              </td>
            </tr>
             <tr class="odd">
              <td class="fieldname"><%=lableDocDate%></td>
              <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true"  value="<%=expiryDate %>"/>
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="docExpDate" />
              </td>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td><html:text property="identifyDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('identifyDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="identifyDate" />
              </td>
            </tr>
--%>
           <tr class="even">
              <td class="fieldname">Date Deferred&nbsp;<font color="RED">* </font></td>
              <td>
                  
              <html:text property="deferDate" size="12" maxlength="12" readonly="true" onchange="setDifferenceBetDate();" value="<%=deferDate %>"/>
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('deferDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="deferDate" />
               
                
              </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Original Target Date &nbsp;<font color="RED">* </font></td>
              <td><html:text property="originalTargetDate" size="12" maxlength="12" readonly="true" onchange="setDifferenceBetDate();originalDeferedDaysCal();"/>
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('originalTargetDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="originalTargetDate" />
              </td>
            </tr>
            <%-- // cr 36 --%>
            <%if(!checkListItem.getItemStatus().equals("DEFERRED")&&!checkListItem.getItemStatus().equals("PENDING_DEFER")){ %>
            <tr class="odd">
              <td class="fieldname">Next Due Date <font color="RED">* </font></td>
              <td><html:text property="expectedReturnDate" size="12" maxlength="12" readonly="true"  onchange="originalDeferedDaysCal();"/>
                <img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" onclick="return showCalendar('expectedReturnDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" />
                <span id="extDate"></span>
                <html:errors property="expectedReturnDate" />
              </td>
            </tr>
            <%}else if(checkListItem.getDeferCount().equals("1")&& checkListItem.getItemStatus().equals("PENDING_DEFER")){ %>
            <tr class="odd">
              <td class="fieldname">Next Due Date <font color="RED">* </font></td>
              <td><html:text property="expectedReturnDate" size="12" maxlength="12" readonly="true"  onchange="originalDeferedDaysCal();"/>
                <img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" onclick="return showCalendar('expectedReturnDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" />
                <span id="extDate"></span>
                <html:errors property="expectedReturnDate" />
              </td>
            </tr>
            <%}else if(!checkListItem.getDeferCount().equals("1")&& checkListItem.getItemStatus().equals("PENDING_DEFER")){ %>
            
            <tr class="odd">
              <td class="fieldname">Last Due Date </td>
              <td>
              <integro:date object="<%=df1.parse(form.getExpectedReturnDate()) %>"></integro:date>
                <html:hidden property="expectedReturnDate" />
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Next Due Date  <font color="RED">* </font></td>
              <td><html:text property="deferExtendedDate" size="12" maxlength="12" readonly="true" onchange="originalDeferedDaysCal();"/>
                <img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" onclick="return showCalendar('deferExtendedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" />
                <span id="extDate"></span>
                <html:errors property="deferExtendedDate" />
              </td>
            </tr>     
            
            <%}else if(!checkListItem.getDeferCount().equals("1")|| checkListItem.getItemStatus().equals("DEFERRED")){ %>
            
            <tr class="odd">
              <td class="fieldname">Last Due Date </td>
              <td>
              <integro:date object="<%=df1.parse(form.getExpectedReturnDate()) %>"></integro:date>
                <html:hidden property="expectedReturnDate" />
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Next Due Date  <font color="RED">* </font></td>
              <td><html:text property="deferExtendedDate" size="12" maxlength="12" readonly="true" onchange="originalDeferedDaysCal();"/>
                <img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" onclick="return showCalendar('deferExtendedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" />
                <span id="extDate"></span>
                <html:errors property="deferExtendedDate" />
              </td>
            </tr>     
            <%} %>
             <tr class="even">
              <td class="fieldname">Defer Counter</td>
             <%if(form.getDeferCount()!=null && !form.getDeferCount().equals("") && !form.getDeferCount().equals("0")){ %>
             <td>&nbsp;<%=form.getDeferCount() %></td>
             <%}else{ %>
              <td>&nbsp;-</td>
             <%} %>
            </tr>
             <tr class="odd">
              <td class="fieldname">Aging of Deferred date from Original Target date</td>
             <td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
            </tr>
              <tr class="odd">
              <td class="fieldname">Aging of Next Due date from Original Target date</td>
              <td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
            </tr>
<%--            <tr class="odd">
              <td class="fieldname" >DDN valid for </td><td ><input type="text" name="ddnDays" size="5" readonly="true"> &nbsp;&nbsp;<a href="#" onclick="calculateDaysDiff()">Days</a></td>
            </tr>
--%>            

			<tr class="even">
                 <td class="fieldname"><bean:message key="label.roc.charge"/>&nbsp;</td>
                 <td>
                 <html:select property="rocCharge" disabled="<%=!isCustomerCorporate%>">
					<option value="">Please Select</option>
					<html:options collection="rocChargeList" labelProperty="label" property="value" />
			 	 </html:select>
	    		 <html:hidden property="rocCharge" />
                 </td>
  			</tr>

            <tr class="even">
              <td class="fieldname">Credit Approver <font color="RED">* </font></td>
              <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="deferCreditApproverList" labelProperty="label" property="value" />
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
<html:hidden property="deferCount" value="<%=form.getDeferCount() %>" />
<html:hidden property="deferedDays" value="<%=form.getDeferedDays() %>" />
<html:hidden property="actionParty" />
        </table>
<%--
             <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp" />
--%>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                <tr class="odd">
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
				<html:hidden property="documentStatus"  value="<%=form.getItemStatus() %>"/>
				<html:hidden property="itemStatus"  value="PENDING_DEFER"/>
			</tr>
			</table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                    <a href="#" onclick = "saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1"  border="0" id="Image1" /></a>
                    <a href="#" onclick="cancelForm()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4"  border="0" id="Image4" /></a>
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
