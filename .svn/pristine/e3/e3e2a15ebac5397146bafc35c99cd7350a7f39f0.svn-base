<%@ page import="com.integrosys.cms.app.cccertificate.bus.ICCCertificate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.cccertificate.trx.ICCCertificateTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.genccc.GenerateCCCForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificateCustomerDetail,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ICCCertificateTrxValue certTrxVal = (ICCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.certTrxVal");
    ICCCertificate cert = (ICCCertificate)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.cert");
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
    }
    int row = 0;
    int index = 0; 
    String remarks = "";
    String lastActionBy = "";
    //String status = "";
    if(certTrxVal!=null) {
        //status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


	Amount cleanAppAmt = null;
	Amount notCleanAppAmt = null;
	Amount cleanActAmt = null;
	Amount notCleanActAmt = null;
	
    if(cert!=null){
        cleanAppAmt = cert.getCleanApprovalAmount();
        notCleanAppAmt = cert.getApprovalAmount();
        cleanActAmt = cert.getCleanActivatedAmount();
        notCleanActAmt = cert.getActivatedAmount();
    }

    GenerateCCCForm aForm = (GenerateCCCForm)request.getAttribute("GenerateCCCForm");
    if(request.getParameter("event").equals("update_return")) {
	    aForm.setRemarks(request.getParameter("remarks"));
    }
    String actAmtAry[] = aForm.getActLimit();    
    String actAmtCurrCode[] = aForm.getActAmtCurrCode();
    String maturityDate[] = aForm.getMaturityDate();

    ICCCertificateCustomerDetail custDetail = (ICCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.custDetail");
    if(custDetail!=null){
        pageContext.setAttribute("custDetail",custDetail);        
    }
    String creditgrade = null;    
    String creditGradeName = "-";    

    if(custDetail!=null) {
        creditgrade = custDetail.getCreditGrade().getCGCode();
        if (creditgrade != null) {           
            creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
        }
    }

    String cbCreditGrade = null;
    String cbCreditGradeName = "-";
    ICCCertificateCustomerDetail coBorrowerDetail = (ICCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.coBorrowerDetail");
    if (coBorrowerDetail != null) {
        pageContext.setAttribute("coBorrowerDetail", coBorrowerDetail);
        
        cbCreditGrade = coBorrowerDetail.getCreditGrade().getCGCode();
        if (cbCreditGrade != null) {
            cbCreditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", cbCreditGrade.toString());
        }
    }

    String pledgorCreditGrade = null;
    String pledgorCreditGradeName = "-";
    String secTypeValue = "-";
    String secSubTypeValue = "-";
    ICCCertificateCustomerDetail pledgorDetail = (ICCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.pledgorDetail");
    if (pledgorDetail != null) {
        pageContext.setAttribute("pledgorDetail", pledgorDetail);
        
        pledgorCreditGrade = pledgorDetail.getCreditGrade().getCGCode();
        if (pledgorCreditGrade != null) {
            pledgorCreditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", pledgorCreditGrade.toString());
        }
        java.util.List l = (java.util.List)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.pledgorColList");
        if(l!=null){               
            pageContext.setAttribute("pledgorColList",l);
        }
    }
    CountryList cList = CountryList.getInstance();    
    String temp = "";
    int i = 0; //index for maturity date
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
<script type="text/javascript" src="js/validation.js"></script>



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
    //var test = document.forms[0].remarksCCC.value;
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }
    document.forms[0].event.value="submit";
    document.forms[0].submit();
}

function refreshPage(){
    document.forms[0].event.value="refresh_gen_ccc";
    document.forms[0].submit();
}

function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }
	document.forms[0].event.value="update_view_outer_limit_bca";
	document.forms[0].outerLimitID.value=outerLimitID;
	document.forms[0].limitID.value=limitID;
	document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
	document.forms[0].submit();
}

function makeTotal() {
    //var test = document.forms[0].remarksCCC.value;
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

function setUpdatedDate (cal, date)
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
    var num = parseInt (name.substring (12, name.length));
    if (document.forms[0].maturityDate.length+'' == 'undefined') {
        document.forms[0].maturityDate.value = date;
    } else {
        document.forms[0].maturityDate[num].value = date;
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif')">
<html:form action="GenerateCCC" >
<input type="hidden" name="event" />
<input type="hidden" name="actionName" value="GenerateCCC"/>
<input type="hidden" name="outerLimitID"/>
<input type="hidden" name="limitID"/>
<input type="hidden" name="outerLimitProfileID"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Generate CCC</h3></td>
    </tr>
    <tr>
      <td><hr />
        </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" height="22" class="fieldname">LE ID<br /> </td>
              <% if ((custDetail.getLegalID() == null) || (custDetail.getLegalID().equals("0")))
                 {%>
              <td width="30%" >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td width="30%">&nbsp;<%=custDetail.getLegalID()%></td>
              <% } %>
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%" >&nbsp;<bean:write name="custDetail" property="legalName" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<bean:write name="custDetail" property="customerReference" /></td>
              <td class="fieldname">Customer Sub-<br>Profile Name<br /> </td>
              <td>&nbsp;<bean:write name="custDetail" property="customerName" /></td>
            </tr>
            <tr class="odd">              
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=creditGradeName%></td>              
<%  if (!ICMSConstant.CHECKLIST_NON_BORROWER.equals(cert.getCCCertCategory()))
    {
%>            <td class="fieldname">Customer BFL Issued<br>Date</td>
                <%
                    if (custDetail.getFinalBFLIssuedDate() != null)
                    {
                %>
                              <td>&nbsp;<%=DateUtil.formatDate (locale, custDetail.getFinalBFLIssuedDate())%></td>
                <%  }
                    else
                    {
                %>
                              <td>&nbsp;-</td>
                <%  }
    }else {%>   
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
    <%}%>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM</td>
		<%          
		//String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
		 String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
		 String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
		 String fam = famCode + ", " + famName ; 

		%>
              <td><integro:empty-if-null value="<%=fam %>" />
              </td>
              <td class="fieldname">CCC Ref. No.</td>
<%              if (cert.getCCCertRef() != null) 
                {
%>              <td><%=custDetail.getLegalID()%>/<%= cert.getCCCertRef()%></td>
<%              }
                else
                {
%>              <td>&nbsp;-</td>
<%              }%>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
<%  if (ICMSConstant.CHECKLIST_PLEDGER.equals(cert.getCCCertCategory()))
  {%>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tbody>
    <tr> 
      <td> <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd"> 
              <td colspan="4" style="text-align:left">Pledgor Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td width="20%" height="22" class="fieldname">LE ID<br /> </td>          
              <% if ((pledgorDetail.getLegalID() == null) || (pledgorDetail.getLegalID().equals("0")))
                 {%>
              <td width="30%" >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td width="30%">&nbsp;<%=pledgorDetail.getLegalID()%></td>
              <% } %>             
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<bean:write name="pledgorDetail" property="legalName" /></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname">Pledgor ID</td>
              <td>&nbsp;<bean:write name="pledgorDetail" property="customerReference" /></td>
              <td class="fieldname">SCB Internal Credit Grade<br /> </td>
              <td>&nbsp;<%=pledgorCreditGradeName%></td>
            </tr>                 
          </tbody>
        </table></td>
    </tr>
    <tr> 
      <td> 
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
    <tr> 
      <td> <hr /> </td>
    </tr>
    <tr>
      <td><table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
		  <tr>
              <td width="6%">S/N</td>
              <td width="44%">Security ID</td>
              <td width="50%">Security Type /<br />
                SubType</td>
          </tr>
		  </thead>
		  <tbody>
    <logic:present name="pledgorColList"  >
<%
    SecurityTypeList secList = SecurityTypeList.getInstance();
    SecuritySubTypeList subList = SecuritySubTypeList.getInstance();               
%>
        <logic:iterate id="OB" name="pledgorColList"  type="com.integrosys.cms.app.collateral.bus.ICollateral" >  
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    secTypeValue = secList.getSecurityTypeValue(OB.getCollateralType().getTypeCode(),null);
    secSubTypeValue = subList.getSecuritySubTypeValue(OB.getCollateralSubType().getSubTypeCode(),null);
%>        <tr class="<%=rowClass%>">
              <td class="index"><%=row%></td>  
              <td>&nbsp;<%= OB.getSCISecurityID()%></td>
              <td><%= secTypeValue%><br />
                <%= secSubTypeValue%></td>
          </tr>
        </logic:iterate>
    </logic:present>
		  </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    </tbody>
</table>
<%}
  else
  { 
    if (ICMSConstant.CHECKLIST_CO_BORROWER.equals(cert.getCCCertCategory()))
    {%>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tbody>
    <tr> 
      <td> <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd"> 
              <td colspan="4" style="text-align:left">Co-borrower Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td width="20%" height="22" class="fieldname">LE ID<br /> </td>          
              <% if ((coBorrowerDetail.getLegalID() == null) || (coBorrowerDetail.getLegalID().equals("0")))
                 {%>
              <td width="30%" >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td width="30%">&nbsp;<%=coBorrowerDetail.getLegalID()%></td>
              <% } %>             
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<bean:write name="coBorrowerDetail" property="legalName" /></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname">Sub-profile ID</td>
              <td>&nbsp;<bean:write name="coBorrowerDetail" property="customerReference" /></td>
              <td class="fieldname">Customer Sub-<br>Profile Name<br /> </td>
              <td>&nbsp;<bean:write name="coBorrowerDetail" property="customerName" /></td>
            </tr>
            <tr class="odd">              
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=cbCreditGradeName%></td>              
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr> 
      <td> 
<%}%>
  </tbody>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<%
    if (cert.getCleanCCCertificateItemList() != null)
    {
%>
     <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
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
              <td>Limit Amount to be Activated</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cert"  >
   <logic:iterate id="OB" name="cert"  property="cleanCCCertificateItemList" type="com.integrosys.cms.app.cccertificate.bus.ICCCertificateItem"  >
<%
    String rowClass="";
    row++;
    index ++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    
    temp = "actLimit" + (index-1);
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
                <input type="hidden" name="appLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate (locale, OB.getApprovalDate())%></td>
              <td>
                <html:text property="maturityDate" readonly="true" size="12" maxlength="11" value="<%= maturityDate[i] %>"/>
                <%
                    String updatedDate = "maturityDate" + String.valueOf(i);
                    i++;
                %>
                <input type="hidden" name="<%=updatedDate%>"/>
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="<%= updatedDate %>"/>
              </td>
              <td class="amount">
                  <input type="hidden" name="actAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>
                  <% if (OB.isInnerLimit()) {%>
                    (<input type="text" name="actLimit" value="<%=actAmtAry[index-1]%>" />)
                  <% } else { %>
                    <input type="text" name="actLimit" value="<%=actAmtAry[index-1]%>" />
                  <% } %>
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
              <td colspan="7">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
        </td>
    </tr>
<%
    }
    if (cert.getNotCleanCCCertificateItemList() != null)
    {
%>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
       <td>The following require a Partial SCC or an SCC for the Activation of Limits:</td>
    </tr>
    <tr>
      <td>

      <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
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
              <td>Limit Amount to be Activated</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cert"  >
<%

    row = 0;
%>
   <logic:iterate id="OB" name="cert"  property="notCleanCCCertificateItemList" type="com.integrosys.cms.app.cccertificate.bus.ICCCertificateItem"  >
<%    
    String rowClass="";
    row++;
    index ++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
       
    temp = "actLimit" + (index-1);
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
                <input type="hidden" name="appLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate (locale, OB.getApprovalDate())%></td>
              <td>
                <% if (OB.getMaturityDate() == null) { %>
                  -
                <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" /></td>
                <% } %>
              <td class="amount">
                <integro:currency param="currency" amount="<%=OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
              <% } %>
              </td>                           
            </tr>
  </logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
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
</logic:present>
<logic:notPresent name="cert" >
            <tr class="odd">
              <td colspan="7">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
<%
    }
%></td>
    </tr> 
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
<%}%>
    <tr>
      <td><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="7" style="text-align:left">Credit Documentation Officer
                / Manager</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="creditOfficerName" maxlength="50" size="30" />
              	<html:errors property="creditOfficerName"/>
              </td>
              <td class="fieldname">Signing Number&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="creditOfficerSgnNo" maxlength="20" size="30" />
              	<html:errors property="creditOfficerSgnNo"/>
              </td>
              </tr>
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
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="7" style="text-align:left">Senior Credit Documentation Manager</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td><html:text property="seniorCreditOfficerName" maxlength="50" size="30" /></td>
              <td class="fieldname">Signing Number</td>
              <td><html:text property="seniorCreditOfficerSgnNo" maxlength="20" size="30" /></td>
            </tr>
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
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <%if(!ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) { %>
    <tr>
      <td><table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td style="text-align:left">Remarks</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td><html:textarea onkeyup="limitTextInput(this.form.remarks, 2000, 'Remarks');" property="remarks" rows="10" cols="110"/>&nbsp;</td>
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
                                <tr class="odd">
                                  <td width="20%" class="fieldname">Remarks</td>
                                  <td width="80%"><html:textarea onkeyup="limitTextInput(this.form.remarks, 2000, 'Remarks');" property="remarks" rows="10" cols="90"/>&nbsp;</td>
                                </tr>
                                <tr class="even">
                                  <td class="fieldname">Last Action By</td>
                                  <td>&nbsp;<%=lastActionBy%></td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><integro:wrapper value="<%=remarks%>" lineLength="75"/>&nbsp;</td>
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
<%
    if (certTrxVal.getTransactionID() != null && certTrxVal.getCCCertificate() != null)
    {
%>  <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/printprevCCC2.gif',1)"><img src="img/printprevCCC1.gif" name="Image1" width="90" height="30" border="0" id="Image1" onclick="MM_openBrWindow('GenerateCCC.do?event=print_doc','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"/></a></td>
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
