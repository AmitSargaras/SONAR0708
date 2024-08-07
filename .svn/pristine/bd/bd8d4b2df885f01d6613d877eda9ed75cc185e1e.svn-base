<%@ page import="com.integrosys.cms.app.sccertificate.trx.ISCCertificateTrxValue,
                 com.integrosys.cms.app.sccertificate.bus.ISCCertificate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.genscc.GenerateSCCForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.sccertificate.bus.ISCCertificateCustomerDetail,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ISCCertificateTrxValue certTrxVal = (ISCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genscc.GenerateSCCAction.certTrxVal");

    ISCCertificate cert = (ISCCertificate)session.getAttribute("com.integrosys.cms.ui.genscc.GenerateSCCAction.cert");
    ISCCertificateCustomerDetail custDetail = (ISCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genscc.GenerateSCCAction.custDetail");
    if(custDetail!=null){
        pageContext.setAttribute("custDetail",custDetail);
    }
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
    }
    int row = 0;

    String remarks = "";
    String lastActionBy = "";
    //String status = "";
    if(certTrxVal!=null) {
//        status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    Amount appAmt = null;
    Amount actAmt = null;
    if(cert!=null){
        appAmt = cert.getTotalApprovalAmount();
        actAmt = cert.getTotalActivatedAmount();
    }

    Amount cleanAppAmt = null;
    Amount notCleanAppAmt = null;
    Amount cleanActAmt = null;
    Amount notCleanActAmt = null;
    /*
    if(cert!=null){
        cleanAppAmt = cert.getCleanApprovalAmount();
        notCleanAppAmt = cert.getApprovalAmount();
        cleanActAmt = cert.getCleanActivatedAmount();
        notCleanActAmt = cert.getActivatedAmount();
    }
    */
    GenerateSCCForm aForm = (GenerateSCCForm)request.getAttribute("GenerateSCCForm");
    if(request.getParameter("event").equals("update_return")) {
	    aForm.setRemarks(request.getParameter("remarks"));
    }

    String event = request.getParameter("event");

    boolean showDisbursementAmt = event.equals("edit_staging") ? true : false;
    
    //String actAmtAry[] = aForm.getActLimit();
    //String actAmtCurrCode[] = aForm.getActAmtCurrCode();
    //String maturityDate[] = aForm.getMaturityDate();

    String cleanActAmtAry[] = {};
    String cleanActAmtCurrCode[] = {};
    String cleanMaturityDate[] = {};
    String notCleanActAmtAry[] = {};
    String notCleanActAmtCurrCode[] = {};
    String notCleanMaturityDate[] = {};
    String creditgrade = "";
    String creditGradeName = "";

    /*
    String cleanActAmtAry[] = aForm.getCleanActLimit();
    String cleanActAmtCurrCode[] = aForm.getCleanActAmtCurrCode();
    String cleanMaturityDate[] = aForm.getCleanMaturityDate();
    String notCleanActAmtAry[] = aForm.getNotCleanActLimit();
    String notCleanActAmtCurrCode[] = aForm.getNotCleanActAmtCurrCode();
    String notCleanMaturityDate[] = aForm.getNotCleanMaturityDate();

    String creditgrade = null;
    String creditGradeName = "-";

    if(custDetail!=null) {
        creditgrade = custDetail.getCreditGrade().getCGCode();
        if (creditgrade != null) {
            creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
        }
    }
    */
    CountryList cList = CountryList.getInstance();

    String expAvalDate[] = aForm.getExpiryAvailabilityDate();
    String distAmt[] = aForm.getDistbursementAmt();
    String distAmtCurrCode[] = aForm.getDistbursementAmtCurrCode();
    String enforceAmt[] = aForm.getAmtEnforceTodate();
    String enforceAmtCurrCode[] = aForm.getAmtEnforceTodateCurrCode();
    String paymentInstruc[] = aForm.getPaymentInstruc();

    int i = 0; // index for maturity date.

    
    //Additional Table
    boolean selAll = true;
    String _selAll = "";
    String _hasCheck1 = "checked";
    String _hasCheck2 = "checked";
    String _hasCheck3 = "checked";
    String _hasCheck4 = "checked";

    if (aForm.getHasCheck1() == null) {selAll = false;_hasCheck1 = "";}
    else {
        if (aForm.getHasCheck1().trim().equals("") || aForm.getHasCheck1().equals("N")) {selAll = false;_hasCheck1 = "";}
    }

    if (aForm.getHasCheck2() == null) {selAll = false;_hasCheck2 = "";}
    else {
        if (aForm.getHasCheck2().trim().equals("") || aForm.getHasCheck2().equals("N")) {selAll = false;_hasCheck2 = "";}
    }

    if (aForm.getHasCheck3() == null) {selAll = false;_hasCheck3 = "";}
    else {
        if (aForm.getHasCheck3().trim().equals("") || aForm.getHasCheck3().equals("N")) {selAll = false;_hasCheck3 = "";}
    }

    if (aForm.getHasCheck4() == null) {selAll = false;_hasCheck4 = "";}
    else {
        if (aForm.getHasCheck4().trim().equals("") || aForm.getHasCheck4().equals("N")) {selAll = false;_hasCheck4 = "";}
    }

    _selAll = selAll ? "checked" : "";
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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




<script language="JavaScript" type="text/JavaScript">
<!--
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
    //var test = document.forms[0].remarksSCC.value;
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }

    document.forms[0].event.value="submit";
    document.forms[0].submit();
}

function refreshPage(){
    document.forms[0].event.value="refresh_gen_scc";
    document.forms[0].submit();
}

function makeTotal() {
    //var test = document.forms[0].remarksSCC.value;
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }

    document.forms[0].event.value="total";
    document.forms[0].submit();
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        // commented for jira CMS-3467
        // alert('Remarks field can be only 2000 Characters');
        // return false;
    }
	document.forms[0].event.value="update_view_outer_limit_bca";
	document.forms[0].outerLimitID.value=outerLimitID;
	document.forms[0].limitID.value=limitID;
	document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
	document.forms[0].submit();
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

function setUpdatedCleanDate (cal, date)
{
    var todayDate = new Date();
    todayDate.setHours(0);
    todayDate.setMinutes(0);
    todayDate.setSeconds(0);
    todayDate.setMilliseconds(0);
    var expDate = new Date(date.substring(7,11), months[date.substring(3,6)], date.substring(0,2));

    if (expDate.getTime() < todayDate.getTime()) {
        if (!confirm ("Care! Limit Maturity Date is an expired date.")) {
            return false;
        }
    }
    cal.sel.value = date;
    var name = cal.sel.name;
    var num = parseInt (name.substring (17, name.length));
    if (document.forms[0].cleanMaturityDate.length+'' == 'undefined') {
        document.forms[0].cleanMaturityDate.value = date;
    } else {
        document.forms[0].cleanMaturityDate[num].value = date;
    }
}

function setUpdatedNotCleanDate (cal, date)
{
    var todayDate = new Date();
    todayDate.setHours(0);
    todayDate.setMinutes(0);
    todayDate.setSeconds(0);
    todayDate.setMilliseconds(0);
    var expDate = new Date(date.substring(7,11), months[date.substring(3,6)], date.substring(0,2));

    if (expDate.getTime() < todayDate.getTime()) {
        //if (!confirm ("Care! Limit Maturity Date is an expired date.")) {
        //    return false;
        //}
        if (!confirm("Care! Expiry of Availability Period is an expired date.")) {
            return false;
        }
    }
    cal.sel.value = date;
    var name = cal.sel.name;
    var num = parseInt (name.substring (22, name.length));
    /*
    if (document.forms[0].notCleanMaturityDate.length+'' == 'undefined') {
        document.forms[0].notCleanMaturityDate.value = date;
    } else {
        document.forms[0].notCleanMaturityDate[num].value = date;
    }
    */
    if (document.forms[0].expiryAvailabilityDate.length + '' == 'undefined') {
        document.forms[0].expiryAvailabilityDate.value = date;
    } else {
        document.forms[0].expiryAvailabilityDate[num].value = date;
    }
}

function selAllOtherReq(inputDOM) {
    try {
        var checkVal = inputDOM.checked;

        var table = inputDOM.parentNode.parentNode.parentNode.parentNode.parentNode;

        var allInput = table.getElementsByTagName("INPUT");
        for (var i = 0; i <allInput.length; i++) {
            if (allInput[i].type != 'checkbox') continue;

            if (allInput[i].name.indexOf('hasCheck') == -1) continue;

            if (allInput[i].checked != checkVal) {
                allInput[i].checked = checkVal;
            }
        }
    } catch (err) {
        alert(err);
    }
    return false;
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif')">
<html:form action="GenerateSCC" >
<input type="hidden" name="event" />
<input type="hidden" name="actionName" value="GenerateSCC"/>
<input type="hidden" name="outerLimitID"/>
<input type="hidden" name="limitID"/>
<input type="hidden" name="outerLimitProfileID"/>
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<!-- InstanceBeginEditable name="Content" -->
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Security Compliance Certificate (SCC)</h3></td>
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
            <!--
            <tr class="odd">
              <td height="22" class="fieldname">LE ID<br /> </td>
              <td><%if(custDetail!=null  && !custDetail.getLegalID().equals("0")) {%>
			  &nbsp;<bean:write name="custDetail" property="legalID" /> <% } else {%> -
              <% } %>
			  </td>
              <td class="fieldname">Legal Name</td>
              <td>&nbsp;<bean:write name="custDetail" property="legalName" /></td>
            </tr>
            -->
            <tr class="even">
              <td class="fieldname">Customer Name<br /> </td>
              <td>&nbsp;<bean:write name="custDetail" property="customerName" /></td>
              <!--
              <td class="fieldname">Sub-Profile ID</td>
                            <td>&nbsp;<bean:write name="custDetail" property="customerReference" /></td>-->
            </tr>
            <tr class="odd">
                <td class="fieldname">CIF No</td>
                <td>
                    <%
                        String cifNo = (custDetail != null && !custDetail.getLegalID().equals("0")) ? custDetail.getLegalID() : "";
                        out.println(cifNo);
                    %>
                </td>
                <!--
                <td class="fieldname">Checklist ID</td>
                <td>
                    <%
                        String chckListID = (cert.getSCCertRef() != null) ? custDetail.getLegalID() + "/" + cert.getSCCertRef() : "-";
                        out.println(chckListID);
                    %>
                </td>
                -->
            </tr>
            <!--
            <tr class="odd">
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<integro:empty-if-null value="<%=creditGradeName%>"/></td>              
              <td class="fieldname">Customer BFL Issued<br>Date</td>
                <%
                    if (custDetail.getFinalBFLIssuedDate() != null)
                    {
                %>
                              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getFinalBFLIssuedDate())%></td>
                <%  }
                    else
                    {
                %>
                              <td>&nbsp;-</td>
                <%  }
                %>                     
            </tr>
            -->
            <!--
            <tr class="even">
              <td class="fieldname">FAM</td>
              <%
              //String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
              String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
	      String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
	      String fam = famCode + ", " + famName ; 
              %>
              <td><integro:empty-if-null value="<%=fam %>" /></td>
              <td class="fieldname">SCC Ref. No.</td>
              <td>
              <% if (cert.getSCCertRef() != null)
                 {
              %><%=custDetail.getLegalID()%>/<%= cert.getSCCertRef()%>
              <% }
                 else
                 {
              %>-
              <% }%>
              </td>
            </tr>
            -->
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<%
    if (false) {
    if (cert.getCleanSCCertificateItemList() != null)
    {
        row = 0;
        //System.out.println("Clean Item List is not null - Size: " + cert.getCleanSCCertificateItemList().length);
        //System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanSCCertificateItemList().length);

%>
  <thead>
    <tr>
      <td><h3>&nbsp;</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td>The following are Un-Secured Limits:</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Approved Date</td>
              <td>Limit Maturity Date</td>
              <td>Limit Amount to be Activated&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cert"  >
   <logic:iterate id="OB" name="cert"  property="cleanSCCertificateItemList" type="com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem"  >
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String temp = "cleanActLimit"+(row-1);
    String prodDesc= "-";
	if(OB.getProductDesc()!=null) {
		prodDesc = OB.getProductDesc();
		if(prodDesc !=null)
		{
			if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
		   prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
		}
	}
   %>
        <tr class="<%=rowClass%>">
              <td class="index"><%=row%></td>
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <td>
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              <br>
              <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
              </td>
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td>&nbsp;<%=prodDesc%></td>
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
              	<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %> </a> <% } %>
              </td>
              <td class="amount">
                <input type="hidden" name="cleanAppLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
              <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate(locale, OB.getApprovalDate())%></td>
              <td>
                  <html:text property="cleanMaturityDate" readonly="true" size="12" maxlength="11" value="<%= cleanMaturityDate[i] %>"/>
                  <%
                      String updatedDate = "cleanMaturityDate" + String.valueOf(i);
                      i++;
                  %>
                  <input type="hidden" name="<%=updatedDate%>"/>
                  <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedCleanDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                  <html:errors property="<%= updatedDate %>"/>
              </td>
              <td class="amount">
                <input type="hidden" name="cleanActAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>
              <%if (OB.isInnerLimit())
                {
              %>
                (
                <input type="text" name="cleanActLimit" value="<%=cleanActAmtAry[row-1]%>" />
                 )
              <%}
                else
                {
              %> <input type="text" name="cleanActLimit" value="<%=cleanActAmtAry[row-1]%>" />
              <%}%>  
                <html:errors property="<%=temp%>" />
              </td>              
            </tr>
</logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px"><a href="#" onClick="makeTotal()">Total</a></td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (cleanAppAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=cleanAppAmt%>" />
              <%    }%>
              </td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (cleanActAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=cleanActAmt%>" />
              <%    }%>
              </td>              
            </tr>
</logic:present>
<logic:notPresent name="cert" >
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
<% }
    }//disabled the upper part

    //if (cert.getNotCleanSCCertificateItemList() != null)
    if (cert.getSCCItemList() != null)
    {
        row=0;
        i=0;
        //System.out.println("Clean Item List is not null - Size: " + cert.getCleanSCCertificateItemList().length);
        //System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanSCCertificateItemList().length);
        System.out.println("SCC Item List is not null - Size : " + cert.getSCCItemList().length);
%>
  <thead>
    <tr>
      <td><h3>&nbsp;</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <!--
    <tr>
      <td>The following are Secured Limits:</td>
    </tr>
    -->
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <!--
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Approved Date</td>
              <td>Limit Maturity Date</td>
              <td>Limit Amount to be Activated&nbsp;<font color="#00AAFF">* </font></td>
            </tr>
            -->
            <tr>
                <td>S/N</td>
                <td>Outer Limit ID</td>
                <td>Limit ID</td>
                <td>Source Security ID</td>
                <td>Security Type / Sub-Type</td>
                <td>Product Desc</td>
                <td>Approved Limit</td>
                <td>Expiry of Availability Period</td>
                <td>Disbursement Amount</td>
                <td>Amount Enforced Todate</td>
                <td>Payment Instruction</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cert"  >
   <logic:iterate id="OB" name="cert"  property="SCCItemList" type="com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem"  >
<%
    //System.out.println("Inside ISCCertificareItem : " + OB.toString());
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String temp = "notCleanActLimit"+(row-1);
    String prodDesc= "-";
	if(OB.getProductDesc()!=null) {
		prodDesc = OB.getProductDesc();
		if(prodDesc !=null)
		{
			if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
		   prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
		}
	}

   %>
        <tr class="<%=rowClass%>">
              <!--S/N-->
              <td class="index"><%=row%></td>
              <!--Outer Limit ID-->
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <%
                  if (!OB.getIsInnerOuterSameBCA()) { %>
              	        <a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
                <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
                          </a>
              <% } %>
              </td>
              <!--Limit ID-->
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <!--Source Security ID-->
              <td width="12%">
                  <%if (OB.getCollateralAllocations() != null) {%>
                  <logic:iterate id="temp0" name="OB" property="collateralAllocations">
                      <%=((ICollateralAllocation) temp0).getCollateral().getSCISecurityID()%>
                      <br>
                  </logic:iterate>
                  <%} else out.println("-");%>
              </td>
              <!--Security Type / Sub-Type-->
              <td width="12%">
                  <%if (OB.getCollateralAllocations() != null) {%>
                  <logic:iterate id="temp1" name="OB" property="collateralAllocations">
                      <bean:write name="temp1" property="collateral.collateralType.typeName"/>
                      <br>
                  </logic:iterate>
                  <%} else out.println("-");%>
              </td>
              <!--Product Desc-->
              <td>&nbsp;<%=prodDesc%></td>
              <!--Approved Limit-->
              <td class="amount">
                <input type="hidden" name="appLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
              <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <!--Expiry of Availability Period-->
            <td>
                <html:text property="expiryAvailabilityDate" readonly="true" size="12" maxlength="11" value="<%=expAvalDate[i]%>"/>
                <%
                    String updatedDate = "expiryAvailabilityDate" + String.valueOf(i);
                    i++;
                %>
                <input type="hidden" name="<%=updatedDate%>"/>
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedNotCleanDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="<%=updatedDate%>"/>
            </td>

            <!--Disbursement Amount-->
            <!--Disbursement Amount shouldn't be shown the value according to the FS except for edit_staging event-->
            <td>
                <input type="hidden" name="distbursementAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>&nbsp;
                <% if (OB.isInnerLimit()) { %>
                <!--(<input type="text" name="distbursementAmt" value="<%=distAmt[row-1]%>"/>)-->
                (<input type="text" name="distbursementAmt" value="<%=(showDisbursementAmt) ? distAmt[row-1] : ""%>"/>)
                <% } else { %>
                <!--<input type="text" name="distbursementAmt" value="<%=distAmt[row-1]%>"/>-->
                <input type="text" name="distbursementAmt" value="<%=(showDisbursementAmt) ? distAmt[row-1] : ""%>"/>
                <% }
                String distAmtErr = "distAmt" + (row - 1);
                %>
                <html:errors property="<%=distAmtErr%>" />
            </td>

            <!-- Amount Enforce Todate-->
            <td>
                <input type="hidden" name="amtEnforceTodateCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>&nbsp;
                <input type="text" name="amtEnforceTodate" value="<%=enforceAmt[row-1]%>" />
                <%
                String enforceAmtErr = "enforceAmt" + (row - 1);
                %>
                <html:errors property="<%=enforceAmtErr%>" />
            </td>

            <!--Payment Instruction-->
            <td>
                <html:text property="paymentInstruc" value="<%=paymentInstruc[row-1]%>"></html:text>
            </td>
              <!--Co-borrower LE ID/Name-->
              <!--
              <td>
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              <br>
              <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
              </td>
              -->
              <!--Limit Booking Location-->
              <!--<td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>-->
              <!--Approved Date-->
              <!--<td>&nbsp;<%=DateUtil.formatDate(locale, OB.getApprovalDate())%></td>-->
              <!--Limit Maturity Date-->
              <!--
              <td>
                  <%if (false) {%>
                  <html:text property="notCleanMaturityDate" readonly="true" size="12" maxlength="11" value="<%= notCleanMaturityDate[i] %>"/>
                  <%
                      //String updatedDate = "notCleanMaturityDate" + String.valueOf(i);
                      updatedDate = "notCleanMaturityDate" + String.valueOf(i);
                      i++;
                  %>
                  <input type="hidden" name="<%=updatedDate%>"/>
                  <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedNotCleanDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                  <html:errors property="<%= updatedDate %>"/>
                  <%}%>
              </td>
              -->
              <!--Limit Amount to be Activated-->
              <!--
              <td class="amount">
                <input type="hidden" name="notCleanActAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>
              <%if (OB.isInnerLimit())
                {
              %>
                (
                <%if (false) {%><input type="text" name="notCleanActLimit" value="<%=notCleanActAmtAry[row-1]%>" /><%}%>
                 )
              <%}
                else
                {
              %> <%if (false) {%><input type="text" name="notCleanActLimit" value="<%=notCleanActAmtAry[row-1]%>" /><%}%>
              <%}%>
                <html:errors property="<%=temp%>" />
              </td>
              -->
            </tr>
</logic:iterate>
            <!--
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px"><a href="#" onClick="makeTotal()">Total</a></td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (notCleanAppAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=notCleanAppAmt%>" />
              <%    }%>
              </td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (notCleanActAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=notCleanActAmt%>" />
              <%    }%>
              </td>
            </tr>
            -->
</logic:present>
<logic:notPresent name="cert" >
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
<% } %>

    <tr>
        <td></td>
    </tr>
    <!--Additional Table Here-->
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                    <TR>
                        <TD style="TEXT-ALIGN: left" colSpan="7">
                            Other Requirements (As indicated by <SPAN style="TEXT-ALIGN: center"><INPUT value="checkbox" CHECKED type="checkbox" disabled="true"></SPAN>below)
                        </TD>
                    </TR>
                    <TR>
                        <TD width="2%">S/N</TD>
                        <TD width="12%">
                            Select (<SPAN style="TEXT-ALIGN: center"> <INPUT value="checkbox" type="checkbox" <%=_selAll%> onclick="javascript:selAllOtherReq(this);"></SPAN>)
                        </TD>
                        <TD width="86%">Item</TD>
                    </TR>
                </thead>
                <tbody>
                    <TR class="odd">
                        <TD class="index">1</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck1" <%=_hasCheck1%> value="Y"></TD>
                        <TD>
                            <P>
                                <STRONG>Fire Insurance Cover </STRONG>
                                <BR>
                                a) To insured with<SPAN class="amount"><INPUT class="currency"
                                                                              size="12" name="insuredWith" value="<%=aForm.getInsuredWith()%>"></SPAN>MYR<SPAN
                                    class="amount"><INPUT class="currency" size="12" name="insuredWithAmt" value="<%=aForm.getInsuredWithAmt()%>"><BR></SPAN>
                                b) M/Policy, endorse Mortgagee clause AMBM <SPAN class="amount"><INPUT
                                    class="currency" size="12" name="ambm" value="<%=aForm.getAmbm()%>"></SPAN>Expiry<SPAN
                                    style="TEXT-ALIGN: center"><INPUT
                                    onblur="itg_checkform('frmMain','sel7','Date','5');return document.MM_returnValue"
                                    style="WIDTH: 90px" id="sel7242" maxLength="10" size="15"
                                    name="expiry" value="<%=aForm.getExpiry()%>" readonly="true"> <IMG id="Image2131"
                                                       onmouseover="MM_swapImage('Image2131','','img/calendarb.gif',1)"
                                                       onmouseout=MM_swapImgRestore()
                                                       onclick="return showCalendar('sel7242', 'dd/mm/y');"
                                                       border="0" name="Image2131"
                                                       src="img/calendara.gif">&nbsp;</SPAN>
                            </P>
                        </TD>
                    </TR>
                    <TR class="even">
                        <TD class="index">2</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck2" <%=_hasCheck2%> value="Y"></TD>
                        <TD>
                            <P><STRONG>Advice to Branch on creation of Sinking Fund </STRONG><BR>Sinking
                                Fund of MYR <SPAN class="amount"><INPUT class="currency" size="12" name="sinkFundAmt" value="<%=aForm.getSinkFundAmt()%>"> </SPAN>p.m
                                for
                                period of <SPAN class="amount"><INPUT class="currency" size="12" name="pmForPeriodOf" value="<%=aForm.getPmForPeriodOf()%>"> </SPAN>commencing
                                from <SPAN class="amount"><INPUT class="currency" size="12" name="commencingFrom" value="<%=aForm.getCommencingFrom()%>"> </SPAN>until
                                the fund reaches MYR <SPAN class="amount"><INPUT class="currency"
                                                                                 size="12" name="fundReach" value="<%=aForm.getFundReach()%>"> </SPAN>
                            </P></TD>
                    </TR>
                    <TR class="odd">
                        <TD class="index">3</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck3" <%=_hasCheck3%> value="Y"></TD>
                        <TD>
                            <P><STRONG>Fees </STRONG><BR>To debit set-up fee MYR <SPAN
                                    class="amount"><INPUT
                                    class="currency" size="12" name="feesAmt" value="<%=aForm.getFeesAmt()%>"> </SPAN></P></TD>
                    </TR>
                    <TR class="even">
                        <TD class="index" height="52">4</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck4" <%=_hasCheck4%>  value="Y"></TD>
                        <TD>
                            <P><STRONG>Others </STRONG><BR><INPUT size="130" name="others" value="<%=aForm.getOthers()%>"></P>

                            <P></P></TD>
                    </TR>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Authorised Personnel 1</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name<%--&nbsp;<font color="#0000FF">* </font>--%></td>
              <td>
              	<html:text property="authorPerOneName" maxlength="50" size="30" />
              	<html:errors property="authorPerOneName"/>
              </td>
              <td class="fieldname">Signing Number<%--&nbsp;<font color="#0000FF">* </font>--%></td>
              <td>
              	<html:text property="authorPerOneSignNo" maxlength="20" size="30" />
              	<html:errors property="authorPerOneSignNo"/>
              </td>
            </tr>
            <%if (false) {%>
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>              
                  <html:select property="creditOfficerLocationCountry"  onchange="refreshPage()">
                    <option value="" >Please Select </option>				
                    <html:options name="countryValues" labelName="countryLabels"/>
    			  </html:select>
			  </td>
			  <td class="fieldname">Location Org Code</td>
              <td>              
                  <html:select property="creditOfficerLocationOrgCode" >
                    <option value="" >Please Select </option>				
                    <html:options name="creditOrgCodeValues" labelName="creditOrgCodeLabels"/>
    			  </html:select>
			  </td>
            </tr>
            <%}%>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Authorised Personnel 2</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td><html:text property="authorPerTwoName" maxlength="50" size="30" /></td>
              <td class="fieldname">Signing Number</td>
              <td><html:text property="authorPerTwoSignNo" maxlength="20" size="30" /></td>
            </tr>
            <%if (false) {%>
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>              
                  <html:select property="seniorCreditOfficerLocationCountry"  onchange="refreshPage()">
                    <option value="" >Please Select </option>				
                    <html:options name="countryValues" labelName="countryLabels"/>
    			  </html:select>
			  </td>
			  <td class="fieldname">Location Org Code</td>
              <td>              
                  <html:select property="seniorCreditOfficerLocationOrgCode" >
                    <option value="" >Please Select </option>				
                    <html:options name="seniorOrgCodeValues" labelName="seniorOrgCodeLabels"/>
    			  </html:select>
			  </td>
            </tr>
            <%}%>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <%if(!ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) { %>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td style="text-align:left">Remarks</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td><html:textarea property="remarks" rows="3" cols="100"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <% } %>
  </tbody>
</table>
</p>
</p>
</p>
<%if(ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) { %>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td width="20%" class="fieldname">Remarks</td>
                                  <td width="80%" class="odd"><html:textarea property="remarks" rows="3" cols="110"/>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even">&nbsp;<%=lastActionBy%></td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
                                </tr>
                              </tbody>
                            </table>
<% } %>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/submit2.gif',0)"><img src="img/submit1.gif" name="Image2" border="0" id="Image2" /></a></td>
<%  if (certTrxVal.getTransactionID() != null && certTrxVal.getSCCertificate() != null)
    {
%>  <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/printprevSCC2.gif',1)"><img src="img/printprevSCC1.gif" name="Image1" width="90" height="30" border="0" id="Image1" onclick="MM_openBrWindow('GenerateSCC.do?event=print_doc','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"/></a></td>
<%  }
%>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
