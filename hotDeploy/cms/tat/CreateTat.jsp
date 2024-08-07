<%@ page import="com.integrosys.cms.ui.tat.TatsForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.limit.trx.ILimitProfileTrxValue,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.ui.common.ForexHelper,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.*,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.util.CommonUtil"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/tat/CreateTat.jsp,v 1.60 2006/11/09 13:46:36 jitendra Exp $
     * @author $Author: jitendra $<br>
     * @version $Revision: 1.60 $
     * @since $Date: 2006/11/09 13:46:36 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>




<script language="JavaScript" type="text/JavaScript">
function setEvent(){
	 document.forms[0].action="Tat.do?event=refresh";
    document.forms[0].submit();

}
function setEvent1(){
	 document.forms[0].action="Tat.do?event=refreshresubmit";
    document.forms[0].submit();

}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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

function submitPage() {
    document.forms[0].action="Tat.do?event=update";
    document.forms[0].submit();
}
function resubmitPage() {
    document.forms[0].action="Tat.do?event=submit";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="Tat.do?event=cancel";
    document.forms[0].submit();
}
function submitBflPage() {
    document.forms[0].action="Tat.do?event=updateBflInd";
    document.forms[0].submit();
}

function locationWarning(tempvalue){

	<!--
	//for (i=0;i<document.forms[0].bcaLocalInd.length;i++){
		//if (document.forms[0].bcaLocalInd[i].value==tempvalue){
          //document.forms[0].bcaLocalInd[i].checked=false;
		  //var temp = document.forms[0].bcaLocalInd[i].value;
	      //alert("Temp Value:" + temp);
	   //}
    //}
    //-->

	if(!confirm('The change in BCA Type may affect the information in related Reports.'))
	{
			for (i=0;i<document.forms[0].bcaLocalInd.length;i++){
				if (document.forms[0].bcaLocalInd[i].value==tempvalue){
				    document.forms[0].bcaLocalInd[i].checked=false;
		    		}
		    	else{
			    document.forms[0].bcaLocalInd[i].checked=true;
		    	}
		   }
		   document.forms[0].bcaLocalInd.value = tempvalue;
   }
   else{
	   if(tempvalue == 'Y')
	   document.forms[0].bcaLocalInd.value = 'N';
	   else
	   document.forms[0].bcaLocalInd.value = 'Y';
   }
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
function getMonthLength(month,year)
{
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

function checkExtendedDateBFL (cal, date)
{
    if (date == null || date.length == 0) {
        return;
    }
    bflDue = document.forms[0].dueDate.value;
    var bflDueDate = new Date(bflDue.substring(7,11), months[bflDue.substring(3,6)], bflDue.substring(0,2));
    var extendedDate = new Date(date.substring(7,11), months[date.substring(3,6)], date.substring(0,2));

    if (extendedDate.getTime() < bflDueDate.getTime()) {
        alert ('Extended Date for Customer Acceptance of BFL cannot be earlier than the Due Date for Customer Acceptance of BFL');
        return false;
    }
    cal.sel.value = date;
    maxDate = document.forms[0].maxBFLExtendedDate.value;

    max = new Date();
    max.setFullYear(maxDate.substring(7,11));
    max.setMonth(months[maxDate.substring(3,6)]);
    max.setDate(maxDate.substring(0,2));

    if (extendedDate.getTime() <= max.getTime()) {
        return;
    } else {

    //numOfDays = days_between(due, extendedDate);

    //if (numOfDays > 90) {
        var errorMsg = 'Care! Due Date of Customer Acceptance of BFL ';
        errorMsg += 'exceeds <%=ICMSConstant.BFL_TAT_MAX_EXTENDED_DAY%> days from last Clean Type or ';
        errorMsg += 'Special Clean Type BFL issuance Date';
        alert(errorMsg);
    //}
    }
}

function days_between(date1, date2) {

    // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime()
    var date2_ms = date2.getTime()

    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms)

    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY)

}

</script>
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body onload="MM_preloadImages('img/cancel2.gif')">
<html:form  action="Tat.do?">
<input type="hidden" name="event">

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <%com.integrosys.cms.ui.tat.TatsForm aForm = (com.integrosys.cms.ui.tat.TatsForm) request.getAttribute("TatsForm");
       ILimitProfileTrxValue iLimitProfileTrxVal = (ILimitProfileTrxValue)session.getAttribute("com.integrosys.cms.ui.tat.TatAction.trxValue");
         String event = (String)request.getAttribute("event");
        String fam = (String)request.getAttribute("fam");
        String famcode = (String)request.getAttribute("famcode");
        String trxID = (String)request.getAttribute("trxID");
        String error_BFL = (String)request.getAttribute("Error_BFL");
        String sscStatus = (String)request.getAttribute("sscStatus");
        String status ="COMPLETED";
                   int sno=0;
         %>
        <input type="hidden" name="trxID" value="<%=trxID%>">
         <% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>
      <td><h3>Create TAT</h3></td>
    </tr>
    <tr>
      <td><hr />
        </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">LE ID<br /> </td>
              <td><bean:write scope="request" property="leRef" name="TatsForm"/></td>
              <td class="fieldname">Legal Name</td>
              <td><bean:write scope="request" property="leName" name="TatsForm"/></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Name<br /> </td>
              <td><bean:write scope="request" property="customerName" name="TatsForm"/></td>
              <td class="fieldname">Sub-Profile ID</td>
              <td><bean:write scope="request" property="subprofileID" name="TatsForm"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Credit Grade</td>
              <td><bean:write scope="request" property="creditGrade" name="TatsForm"/>&nbsp;</td>
              <td class="fieldname">Credit Status</td>
              <td><bean:write scope="request" property="creditStatus" name="TatsForm"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM</td>
              <td><integro:empty-if-null value="<%=famcode%>"/>&nbsp;<integro:empty-if-null value="<%=fam%>"/></td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>&nbsp;</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
<tbody>
    <tr>
      <td><table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="10%">Limit Booking Location</td>
              <td width="8%">Product Description</td>

              <td width="12%">Approved Limit</td>

            </tr>
          </thead>
           <% double USDappAmt =0;
             CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
             ForexHelper fr = new ForexHelper();
               List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
                List ctryVals = (List)CountryList.getInstance().getCountryValues();
               String limitbookinglocation="-";
            %>
          <tbody>
          <logic:present name="limitObList" property="nonDeletedLimits" >

           <logic:iterate id="subObj" name="limitObList" property="nonDeletedLimits" type="com.integrosys.cms.app.limit.bus.OBLimit" >

            <%

               String rowClass="";
       				sno++;
      				if(sno%2!=0){
          				 rowClass="odd";
      				 }else{
          				 rowClass="even";
      				 }
                 String outerLimitRef ="0";
                 if(subObj.getOuterLimitRef()!=null && (!subObj.getOuterLimitRef().equals("")))
                        outerLimitRef = subObj.getOuterLimitRef();
                     Amount appAmtLimit = subObj.getApprovedLimitAmount();
                     String limitID = subObj.getLimitRef();

                       try {
                            if(outerLimitRef.equals("0"))
                         {
                            if(USDappAmt!=ICMSConstant.LONG_INVALID_VALUE)
                        USDappAmt = USDappAmt + fr.convertAmount(appAmtLimit,usd);
                            }
                     }
                     catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDappAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }
                     String prodDesc= "-";

                     if(subObj.getProductDesc()!=null)
                     {
                         if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, subObj.getProductDesc().toString())!=null)
                        prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, subObj.getProductDesc().toString());
                     }



            %>
                <input type="hidden" name="instrID" value="<%=subObj.getLimitProfileID()%>">
             <tr class="<%=rowClass%>">
              <td class="index" valign="top" width="3%" ><%=sno%></td>
              <td valign="top" ><%=limitID%></td>
                <% for( int k=0; k<ctryLbls.size(); k++){
                        if((subObj.getBookingLocation().getCountryCode()!=null) && (subObj.getBookingLocation().getCountryCode().equals(ctryVals.get(k)))){  //if this value not in selected value print..
                       limitbookinglocation= (String) ctryLbls.get(k);
                %>
                               <%}}%>
               <td valign="top" ><%=limitbookinglocation%></td>
              <td valign="top" ><%=prodDesc%>&nbsp;</td>
             <% if(outerLimitRef.equals("0"))
                         {%>
               <td valign="top" class="amount"><%=appAmtLimit.getCurrencyCode()%>&nbsp;<integro:currency amount="<%=appAmtLimit%>" param="amount" /></td>
                            <%}else {%>
                            <td valign="top" class="amount"><%=appAmtLimit.getCurrencyCode()%>&nbsp;(<integro:currency amount="<%=appAmtLimit%>" param="amount" />)</td>
                     <%}%>
                     </tr>
             </logic:iterate>
            </logic:present>
            <% Amount USapprovedAmount = new Amount(USDappAmt,usd);%>

                 <tr class="odd">
              <td class="total" valign="top" >&nbsp;</td>
              <td class="total" valign="top" >&nbsp;</td>
              <td class="total" valign="top" >&nbsp;</td>
              <td class="total" valign="top" style="text-align:right;padding-right:3px" >Total</td>
              <td class="total" valign="top" style="text-align:right;padding-right:3px">
                <%
                if(USapprovedAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:currency amount="<%=USapprovedAmount%>" param="amount" />
              <% } else { %>
                Forex Error
              <% } %>
              </td>
            </tr>

          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
  <tbody>



          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">BCA Part I<br>
                Approved Date</td>
                <%
                    String bcaApprovalDt ="-";
                    if(aForm.getApprovalDate()!=null)
                    bcaApprovalDt =aForm.getApprovalDate();%>
              <td width="30%"><%=bcaApprovalDt%>&nbsp;</td>
              <td width="20%" class="fieldname">BCA Part I<br>
                CMS Update Date</td>
                <%
                     String bcaCreateDt ="-";
                    if(aForm.getBcaCreateDate()!=null)
                    bcaCreateDt =aForm.getBcaCreateDate();
                 %>
              <td><%=bcaCreateDt%>&nbsp;</td>
            </tr>

             <%  Calendar cal = Calendar.getInstance();

                Date sscDueOn= DateUtil.convertDate(locale,aForm.getApprovalDate());
                 cal.setTime(sscDueOn);
                 cal.add(Calendar.DATE, 90);
                sscDueOn = DateUtil.clearTime(cal.getTime());
             %>
             <% Date tatCreateDt = DateUtil.convertDate(locale,aForm.getTatCreateDate());%>

            <tr class="even">
              <td class="fieldname" width="20%">BCA Part I Received Date&nbsp;<font color="#0000FF">* </font></td>
              <%if (event!=null && !(event.equals("to_track"))) { %>
              <%  if (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW)) {%>
                <td width="30%"><input name="tatCreateDate" value="<%=aForm.getTatCreateDate()%>" readonly="true" type="text" id="sel3" size="12" maxlength="11" />
               <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('sel3', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /> <html:errors property="expDate" /></td>
                <% }else if (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)){  %>
               <%
                    if((iLimitProfileTrxVal.getTransactionSubType()!=null) && (iLimitProfileTrxVal.getTransactionSubType().equals("TAT"))){   %>
                         <td width="30%"><integro:date object="<%=tatCreateDt%>" />&nbsp;</td>
                 <%   }else {%>
                <td width="30%"><input name="tatCreateDate" value="<%=aForm.getTatCreateDate()%>" readonly="true" type="text" id="sel3" size="12" maxlength="11" />
               <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('sel3', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="expDate" /> </td>
               <% } %>
                <%} else {%>
                <td width="30%"><integro:date object="<%=tatCreateDt%>" />&nbsp;</td>
              <%}%>
               <td class="fieldname" width="20%">&nbsp;</td>
               <td>&nbsp; </td>
               </tr>
               <tr class="odd">
              <td class="fieldname" width="20%">BFL Required</td>
              <td>
              <%  if ((iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW))||(iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)) ||(iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_ACTIVE))){%>
                  <html:radio  property="bflRequired" value="Y"  />
                Yes
                 <html:radio  property="bflRequired" value="N" />
                  No

                  <%}else{%>
                   <html:radio  property="bflRequired" value="Y" disabled="true" />
                Yes
                 <html:radio  property="bflRequired" value="N" disabled="true" />
                  No
                  <%}} else {%>


                    <td width="30%"><integro:date object="<%=tatCreateDt%>" />&nbsp;</td>
                     <td class="fieldname" width="20%">&&&</td>
                     <td>&nbsp; </td>
               </tr>
               <tr class="odd">
                     <td class="fieldname" width="20%">BFL Required</td>
                     <td>
                  <html:radio  property="bflRequired" value="Y" disabled="true" />
                Yes
                 <html:radio  property="bflRequired" value="N" disabled="true" />
                  No
                  <%}%>
                </td>
                 <td class="fieldname" width="20%">Update Date</td>
                     <td><integro:empty-if-null value="<%=aForm.getBflIndUpdateDate()%>"/>&nbsp; </td>
            </tr>
            <tr class="odd">
              <td class="fieldname" width="20%">SCC Due On</td>
              <td width="30%">
            <%if(sscStatus!=null && sscStatus.equals("N.A."))  {%>
            <%=sscStatus%> &nbsp;
            <%}else {%>
            <integro:date object="<%=sscDueOn%>" />&nbsp;
            <%}%></td>
              <td class="fieldname" width="20%">Status</td>
              <td>
                <%if(iLimitProfileTrxVal!=null && iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_ACTIVE)) {%>
                <%=status%> <%} else {%>
                <%=aForm.getBcaStatus()%>
                <%}%></td>
            </tr>

             <tr class="even">
              <td class="fieldname" width="20%">BCA Type</td>
              <%if (event!=null && !(event.equals("to_track"))) { %>
                <%  if ((iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW))){%>
                <td>
                  <html:radio  property="bcaLocalInd" value="Y" />
                Local
                 <html:radio  property="bcaLocalInd" value="N" />
                  Overseas
                  </td>
                 <%} else if (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)){  %>

                  <%
                    if((iLimitProfileTrxVal.getTransactionSubType()!=null) && (iLimitProfileTrxVal.getTransactionSubType().equals("TAT"))){   %>
                    <td>
                   <html:radio  property="bcaLocalInd" value="Y" onclick="javascript:locationWarning('Y');" />
                Local
                 <html:radio  property="bcaLocalInd" value="N" onclick="javascript:locationWarning('N');" />
                  Overseas
                  </td>
                <%   }else {%>
                <td>
                 <html:radio  property="bcaLocalInd" value="Y" />
                Local
                 <html:radio  property="bcaLocalInd" value="N" />
                  Overseas
                  </td> <% } %>

              <%}else{%>
                 <td>
                   <html:radio  property="bcaLocalInd" value="Y" onclick="javascript:locationWarning('Y');" />
                Local
                 <html:radio  property="bcaLocalInd" value="N" onclick="javascript:locationWarning('N');" />
                  Overseas
                  </td>
               <%}}

         else {%>
                      <td>
                  <html:radio  property="bcaLocalInd" value="Y" onclick="javascript:locationWarning('Y');" />
                Local
                 <html:radio  property="bcaLocalInd" value="N" onclick="javascript:locationWarning('N');" />
                  Overseas
                  </td>
                  <%}%>

                <td class="fieldname" width="20%">Due Date for Customer Acceptance of BFL </td>
              <td width="30%">
              <%if(!(aForm.getDueDate()!=null)) {
                  if(((event.equals("refresh"))||(event.equals("refreshresubmit")))) {
                  %>
                  <font color="#FF0000" size="1">Setup is not complete for this country, segment and/or type of bca.</font>
                  <%} else {%> -
                  <%}%>
             <% }else if (aForm.getDueDate().equals("-") && ((event.equals("refresh"))||(event.equals("refreshresubmit")))){%>
                        <font color="#FF0000" size="1"> No BFL is required  </font>
             <%}else {    %>



 <integro:date object="<%=DateUtil.convertDate(locale,aForm.getDueDate())%>" />&nbsp; <%}%>
                <%   if (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED))
                            {
                      %>
                     <%-- <a href="javascript:setEvent1();">Calculate Date </a>--%>
                     <%-- have commented the hyperlink calculate date but not removed the calculate date functionality.--%>

                    <%} else if (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW)) {%>
                    <%-- <a href="javascript:setEvent();">Calculate Date </a>--%>
                    <%-- have commented the hyperlink calculate date but not removed the calculate date functionality.--%>
                <%} else {
                    }%>

              </td>

            </tr>
			<tr class="odd">
              <td class="fieldname" width="20%">Extended Date for Customer Acceptance of BFL</td>
              <%
              	if (event!=null && !(event.equals("to_track"))) {
	              	boolean hasDueDate = false;
	              	if (aForm.getDueDate() != null && aForm.getDueDate().length() > 0) {
		              	if (!aForm.getDueDate().equals("-")) {
		              		hasDueDate = true;
	              		}
	              	}
	          %>
              <td>
			  <html:text property="extendedDateBFL" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=hasDueDate?"":"disabled"%> onclick="return showCalendarWithCustomHandling('extendedDateBFL', 'dd/mm/y', checkExtendedDateBFL);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="extendedDateBFL"/>
              </td>
              <%}else{%>
              <td><bean:write name="TatsForm" property="extendedDateBFL"/>&nbsp; </td>
              <% } %>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
			</tr>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
   </thead>
  <tbody>
  </tbody>
</table>
<table  width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<thead>
    <tr> </tr>
     <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr>
  </thead>
  <tbody>
          <%   if (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED))
                            {
                      %>
                <tr class="even">
                  <td class="fieldname">Remarks</td>
                  <td><textarea name="remarks" cols="60" rows="3"></textarea></td>
                                  </tr>
                 <tr class="odd">
                    <td class="fieldname">Last Action By</td>
                    <td class="odd"><%=iLimitProfileTrxVal.getUserInfo()%>&nbsp;</td>

                 </tr>
                 <tr class="even">
                   <td class="fieldname">Last Remarks Made</td>
                   <td><integro:wrapper value="<%=iLimitProfileTrxVal.getRemarks()%>"/>&nbsp;</td>

                </tr>
                <%}%>
            </tbody>
          </table>
<br>     <!-- R1.5 SIT CMS-3338: To allow the calendar for "Extended Date for Customer Acceptance of BFL" field to appear fully -->
<br>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>                 <%if (event!=null && !(event.equals("to_track")))
  						{
	  					%>
   <tr>                 <%
   						if ( ((iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW))) ){
	   					%>
                        <td width="100" valign="baseline" align="center">
                        <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
                        <img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        	<%
                       		 if(error_BFL!=null &&((error_BFL.equals("Error_BFL")) || (error_BFL.equals("Error_Res_BFL"))) )
                       		 {
	                   		  %>
                      		  <font color="#FF0000" size="1">Setup is not complete for this country, segment and/or type of bca.</font>
                      		  <%
                      		  }
                       		 %>
                       		 </td>
                       		 <%
                       	}
                       else if  ((iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)) )
                        {
	                    %>
                       	<%
                        	if((iLimitProfileTrxVal.getTransactionSubType()!=null) && (iLimitProfileTrxVal.getTransactionSubType().equals("TAT")))
                        	{
	                        %>
                        	<td width="100" valign="baseline" align="center"> <a href="javascript:submitBflPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        	<%
                        	}
                        	else
                        	{
	                        %>
                            <td width="100" valign="baseline" align="center"> <a href="javascript:resubmitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                            <%
                            }
                            %>
                    		<%
                    		if(error_BFL!=null &&((error_BFL.equals("Error_BFL")) || (error_BFL.equals("Error_Res_BFL"))) )
                    		{
	                    		%>
                              <font color="#FF0000" size="1">Setup is not complete for this country, segment and/or type of bca.</font>
                            <%
                            }
                            %>
                            </td>
                  			<td width="100" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
  						<%
  						}
  						else if  (iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_ACTIVE))
  						{
	  					 %>
                  			<td width="100" valign="baseline" align="center"> <a href="javascript:submitBflPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                  			<%
                  			if(error_BFL!=null &&((error_BFL.equals("Error_BFL")) || (error_BFL.equals("Error_Res_BFL"))) )
                  			{
	                  		%>
                         	<font color="#FF0000" size="1">Setup is not complete for this country, segment and/or type of bca.</font>
                            <%
                            }
                           %>
                           </td>
                  		   <!--<td width="100" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>-->
  						  <%
  						}
  						else
  						{ }

                       }
                       else
                       {
	                     %>
                          <td width="100" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                         <%
                       }
                       %>

  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<br>     <!-- R1.5 SIT CMS-3338: To allow the calendar for "Extended Date for Customer Acceptance of BFL" field to appear fully -->
<br>


<html:hidden property="leRef" />
            <html:hidden property="leName" />
            <html:hidden property="customerName" />
            <html:hidden property="subprofileID" />
            <html:hidden property="creditGrade" />
            <html:hidden property="creditStatus" />
            <html:hidden property="approvalDate" />
            <html:hidden property="bcaCreateDate" />
            <html:hidden property="bcaLocalInd" />
            <html:hidden property="bcaStatus" />
            <html:hidden property="bflRequired" />
            <html:hidden property="tatCreateDate" />
            <html:hidden property="bflIndUpdateDate" />
            <html:hidden property="dueDate"/>
            <html:hidden property="maxBFLExtendedDate"/>


 </html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>


