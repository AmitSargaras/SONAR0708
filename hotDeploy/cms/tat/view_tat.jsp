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
     * $Header: /home/cms2/cvsroot/cms2/public_html/tat/view_tat.jsp,v 1.11 2006/10/27 08:48:33 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.11 $
     * @since $Date: 2006/10/27 08:48:33 $
     * Tag: $Name: DEV_20061123_B286V1 $
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


</script>
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body onload="MM_preloadImages('img/cancel2.gif')">
<html:form  action="Tat.do?">
<input type="hidden" name="event">
<%
    com.integrosys.cms.ui.tat.TatsForm aForm = (com.integrosys.cms.ui.tat.TatsForm) request.getAttribute("TatsForm");
    ILimitProfileTrxValue iLimitProfileTrxVal = (ILimitProfileTrxValue)session.getAttribute("com.integrosys.cms.ui.tat.TatAction.trxValue");
    String event = (String)request.getAttribute("event");
    String fam = (String)request.getAttribute("fam");
    String famcode = (String)request.getAttribute("famcode");
    String trxID = (String)request.getAttribute("trxID");
    String status ="COMPLETED";
    int sno=0;
       String sscStatus = (String)request.getAttribute("sscStatus");
     if (!iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW))
    {
%>
<!-- InstanceBeginEditable name="Content" -->

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    
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
                    <td width="30%"><integro:date object="<%=tatCreateDt%>" />&nbsp;</td>
                    <td  class="fieldname">
              &nbsp;</td>
              <td>
              &nbsp;</td>
              </tr>
              <tr class="odd">
                     <td class="fieldname" width="20%">BFL Required</td>
                     <td>
                  <html:radio  property="bflRequired" value="Y" disabled="true" />
                Yes
                 <html:radio  property="bflRequired" value="N" disabled="true" />
                  No
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
                <%}%>
              </td>
            </tr>

             <tr class="even">
              <td class="fieldname" width="20%">BCA Type</td>
              <td>
                  <html:radio  property="bcaLocalInd" value="Y" disabled="true" />Local
                  <html:radio  property="bcaLocalInd" value="N" disabled="true" />Overseas
              </td>
                  <%Date dueDate= new Date();   %>
                  <%if(aForm.getBcaLocalInd().equals("Y")) {
                        dueDate= tatCreateDt;
                    }   else if (aForm.getBcaLocalInd().equals("N")) {
                        dueDate =sscDueOn;
                }else {
                           dueDate =null;
                }
    %>
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
                <integro:date object="<%=DateUtil.convertDate(locale,aForm.getDueDate())%>" />&nbsp; 
             <%}%>                
              </td>
            </tr>
            <tr class="odd">
            	<td class="fieldname" width="20%">Extended Date for Customer Acceptance of BFL</td>
            	<td><bean:write name="TatsForm" property="extendedDateBFL"/>&nbsp;</td>
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
<%}
  else
  {
%>
<table width="460" height="260" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd"> 
      <td style="text-align:center" valign="middle"><table width="400" height="200" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr> 
              <td class="even" style="text-align:center" valign="middle"> 
                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <tr class="even"> 
                      <td style="border:none;text-align:right;padding-right:5px" width="100"><strong><img src="img/warning3.gif" width="32" height="32" /></strong></td>
                      <td style="border:none" width="200"><strong><font size="2">TAT has not been created yet.</font></strong></td>
                    </tr>                    
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%}%>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
