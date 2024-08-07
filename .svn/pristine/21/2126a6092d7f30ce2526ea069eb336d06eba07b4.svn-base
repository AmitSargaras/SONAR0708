<%@ page import="com.integrosys.cms.app.cccertificate.bus.ICCCertificate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.cccertificate.trx.ICCCertificateTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.component.commondata.app.CommonDataSingleton,                 
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,                 
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificateCustomerDetail"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    ICCCertificateTrxValue certTrxVal = (ICCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.certTrxVal");

    ICCCertificate cert = (ICCCertificate)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.cert");
    ICCCertificateCustomerDetail custDetail = (ICCCertificateCustomerDetail)request.getAttribute("custDetail");
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
    }
    
    //System.out.println("custDetail is null: "+(custDetail ==null));
    int row = 0;

    String remarks = "";
    String lastActionBy = "";
    String status = "";
    if(certTrxVal!=null) {
        status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";    

    boolean toTrack = false;
    boolean viewOnly = false;    
    String event = request.getParameter("event");
    String isTrack = request.getParameter("isTrack");
    String isView = request.getParameter("isView");
    
    if (isTrack != null && isTrack != "" && isTrack != "null") {
	    toTrack = Boolean.valueOf(isTrack).booleanValue();
    } else if("to_track".equals(event)){
        toTrack = true;
    }
    
    if (isView != null && isView != "" && isView != "null") {
	    viewOnly =Boolean.valueOf(isView).booleanValue();
    } else if ("view_print_doc".equals(event)) {
	    viewOnly = true;
    }
    
    if (viewOnly) {
	    remarks = cert.getRemarks();
    }
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
    OrgCodeList orgList = OrgCodeList.getInstance();
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
<script language="JavaScript" src="js/imageNavigation.js"></script>




<script language="JavaScript" type="text/JavaScript">
<!--

function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
	document.forms[0].event.value="view_outer_limit_bca";
	document.forms[0].outerLimitID.value=outerLimitID;
	document.forms[0].limitID.value=limitID;
	document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
	document.forms[0].submit();
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
<input type="hidden" name="isTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isView" value="<%=viewOnly%>"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td height="22%" class="fieldname">LE ID<br /> </td>
                            <% if ((custDetail.getLegalID() == null) || (custDetail.getLegalID().equals("0")))
                 {%>
              <td >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td >&nbsp;<%=custDetail.getLegalID()%></td>
              <% } %>

              <td class="fieldname">Legal Name</td>
              <td>&nbsp;<bean:write name="custDetail" property="legalName" scope="request" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Name<br /> </td>
              <td>&nbsp;<bean:write name="custDetail" property="customerName" scope="request" /></td>
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<bean:write name="custDetail" property="customerReference" scope="request" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=creditGradeName%></td>      
<%          if (!ICMSConstant.CHECKLIST_NON_BORROWER.equals(cert.getCCCertCategory()))
            {
%>            <td class="fieldname">Customer BFL Issued<br>Date</td>
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
            }else { %>                         
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
<%          }%>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM</td>
              <%
              //String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
              String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
	      String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
	      String fam = famCode + ", " + famName ;  
              %>
              <td><integro:empty-if-null value="<%=fam %>" /></td>
              <td class="fieldname">CCC Ref. No.</td>
              <td>
              <% if (cert.getCCCertRef() != null) 
                 {
              %><%=custDetail.getLegalID()%>/<%= cert.getCCCertRef()%>
              <% }
                 else 
                 {
              %>-
              <% }%>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>    
  </tbody>
</table>
<%  if (ICMSConstant.CHECKLIST_PLEDGER.equals(cert.getCCCertCategory()))
    {%>
    <br>
    <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">          
          
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
        </table>
   <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
    <tr> 
      <td> <hr /> </td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
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
        </table>
<%}
  else
  {   
    if (ICMSConstant.CHECKLIST_CO_BORROWER.equals(cert.getCCCertCategory()))
    {%>
<br>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
        </table>
<%}%> 
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<%
    if (cert.getCleanCCCertificateItemList() != null)
    {
%>  <thead>
    <tr>
      <td><h3>&nbsp;</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    Amount tAppAmt = OB.getApprovedLimitAmount();
    Amount tActAmt = OB.getActivatedAmount();
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
              <td class="amount">&nbsp;
              <integro:currency param="currency" amount="<%=tAppAmt%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=tAppAmt%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=tAppAmt%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getApprovalDate())%></td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              <td class="amount">&nbsp;
              <integro:currency param="currency" amount="<%=tActAmt%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=tActAmt%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=tActAmt%>" />
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
              <td class="total" style="text-align:right;padding-right:3px">&nbsp;
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
              <td class="total" style="text-align:right;padding-right:3px">&nbsp;
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
        </table>
        </td>
    </tr>
<%  }
    if (cert.getNotCleanCCCertificateItemList() != null)
    {
%>  <tr>
      <td><hr /></td>
    </tr>
    <tr>
       <td>The following require a Partial SCC or an SCC for the Activation of Limits:</td>
    </tr>
    <tr>
      <td>
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }

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
              <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getApprovalDate())%></td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
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
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
        </td>
    </tr>
<%
    }}
%>  <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Credit Documentation Officer
                / Manager</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name&nbsp;<font color="#0000FF">* </font></td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cert.getCreditOfficerName()%>" />
              </td>
              <td class="fieldname">Signing Number&nbsp;<font color="#0000FF">* </font></td>
              <td width="30%">&nbsp;
                <integro:empty-if-null value="<%=cert.getCreditOfficerSignNo()%>" />                
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;
                <integro:empty-if-null value="<%=cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode())%>" />                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td>&nbsp;
                <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode())%>" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Senior Credit Documentation Manager</td>
            </tr>
          </thead>
          <tbody>
            <tr class="even">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cert.getSeniorOfficerName()%>" />
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="30%">&nbsp;
                <integro:empty-if-null value="<%=cert.getSeniorOfficerSignNo()%>" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;
                <integro:empty-if-null value="<%=cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode())%>" />                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td>&nbsp;
                <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode())%>" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <%if(toTrack) { %>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td style="text-align:left">Remarks</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td>
              <integro:wrapper value="<%=remarks%>" lineLength="80" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <% } %>
  </tbody>
</table>
<%if(!toTrack) { %>
</p>
</p>
</p>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                              <% if (!viewOnly) { %>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even">&nbsp;<%=lastActionBy%></td>
                                </tr>
                                <% } %>
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
    <%if(toTrack){%>
     <td>  <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else if (!viewOnly) {%>
    <td><a href="GenerateCCC.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <% } else { %>
    <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/print2.gif',1)"><img src="img/print1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GenerateCCC.do?event=print_doc&isView=true','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"/></a></td>
    <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
