<%@ page import="com.integrosys.cms.app.sccertificate.bus.ISCCertificateCustomerDetail,
                 com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificate,
                 com.integrosys.cms.app.sccertificate.trx.IPartialSCCertificateTrxValue,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 com.integrosys.cms.ui.genpscc.GeneratePSCCForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    IPartialSCCertificateTrxValue certTrxVal = (IPartialSCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.certTrxVal");

    IPartialSCCertificate cert = (IPartialSCCertificate)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.cert");
    ISCCertificateCustomerDetail custDetail = (ISCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.custDetail");
    if(custDetail!=null){
        pageContext.setAttribute("custDetail",custDetail);
    }
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
    }
    int row = 0;

    String remarks = "";
    String lastActionBy = "";
    if(certTrxVal!=null) {
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";    

    Amount appAmt = null;
    Amount actAmt = null;
    if(cert!=null){
        appAmt = cert.getTotalApprovalAmount();
        actAmt = cert.getTotalActivatedAmount();
    }

    //R1.5 CR146
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
    } else if ("view_generate_pscc".equals(event)) {
	    viewOnly = true;
    }
    if (viewOnly) {
	    remarks = cert.getRemarks();
    }
	if (remarks==null) remarks= "";
	
    String creditgrade = null;
    String creditGradeName = "-";

    if(custDetail!=null) {
        creditgrade = custDetail.getCreditGrade().getCGCode();
        if (creditgrade != null) {
            creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
        }
    }
    CountryList cList = CountryList.getInstance();
    //Chee Hong TODO : Refix this later
    String[] temp = {};
    OrgCodeList orgList = OrgCodeList.getInstance(temp);

        //Additional Table
        boolean selAll = true;
        String _selAll = "";
        String _hasCheck1 = "checked";
        String _hasCheck2 = "checked";
        String _hasCheck3 = "checked";
        String _hasCheck4 = "checked";

        //if (aForm.getHasCheck1() == null) {selAll = false;_hasCheck1 = "";}
        //else {
            if (cert.getHasCheck1() == 'N') {selAll = false;_hasCheck1 = "";}
        //}

        //if (aForm.getHasCheck2() == null) {selAll = false;_hasCheck2 = "";}
        //else {
            if (cert.getHasCheck2() == 'N') {selAll = false;_hasCheck2 = "";}
        //}

        //if (aForm.getHasCheck3() == null) {selAll = false;_hasCheck3 = "";}
        //else {
            if (cert.getHasCheck3() == 'N') {selAll = false;_hasCheck3 = "";}
        //}

        //if (aForm.getHasCheck4() == null) {selAll = false;_hasCheck4 = "";}
        //else {
            if (cert.getHasCheck4() == 'N') {selAll = false;_hasCheck4 = "";}
        //}

        _selAll = selAll ? "checked" : "";

        String globalCurrency = "";
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
<html:form action="GeneratePSCC" >
<input type="hidden" name="event" />
<input type="hidden" name="actionName" value="GeneratePSCC"/>
<input type="hidden" name="outerLimitID"/>
<input type="hidden" name="limitID"/>
<input type="hidden" name="outerLimitProfileID"/>
<input type="hidden" name="isTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isView" value="<%=viewOnly%>"/>
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<!-- InstanceBeginEditable name="Content" -->
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Generate Partial SCC</h3></td>
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
              <td><bean:write name="custDetail" property="legalID" /></td>
              <td class="fieldname">Legal Name</td>
              <td><bean:write name="custDetail" property="legalName" /></td>
            </tr>
            -->
            <tr class="even">
              <!--
              <td class="fieldname">Customer Gategory</td>
              <td>???&nbsp;</td>
              -->
              <td class="fieldname">Customer Name<br /> </td>
              <td><bean:write name="custDetail" property="customerName" /></td>
              <!--
              <td class="fieldname">Sub-Profile ID</td>
              <td><bean:write name="custDetail" property="customerReference" /></td>
              -->
            </tr>
            <tr class="odd">
                <td class="fieldname">CIF No</td>
                <td>
                    <%
                        String cifNo = (custDetail != null && !custDetail.getLegalID().equals("0")) ? custDetail.getLegalID() : "";
                        out.println(cifNo);
                    %>
                </td>
            </tr>
            <!--
            <tr class="odd">
              <td class="fieldname">Internal Credit Grade</td>
              <td><integro:empty-if-null value="<%=creditGradeName%>"/>&nbsp;</td>
              <td class="fieldname">Customer BFL Issued<br>Date</td>
                  <%
                      if (custDetail.getFinalBFLIssuedDate() != null)
                      {
                  %>
                                <td><%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getFinalBFLIssuedDate())%></td>
                  <%  }
                      else
                      {
                  %>
                                <td>-</td>
                  <%  }
                  %>                            
            </tr>
            <tr class="odd">
              <td class="fieldname">FAM</td>
              <%
               String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
	       String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
	       String fam = famCode + ", " + famName ; 
              %>
              <td><integro:empty-if-null value="<%=fam %>" /></td>
              <td class="fieldname">PSCC Ref. No.</td>
              <td><%=custDetail.getLegalID()%>/<%= cert.getSCCertRef()%></td>
            </tr>
            -->
          </tbody>
          </table></td>
    </tr>
  </tbody>
</table>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<%  if (false) {
    if (cert.getCleanPSCCItemList() != null)
    {
        row=0;
        System.out.println("Clean Item List is not null - Size: " + cert.getCleanPSCCItemList().length);
        System.out.println("Product Description: " + (cert.getCleanPSCCItemList())[0].getProductDesc());
%>
  <thead>
    <tr>
      <td width="50"><h3>&nbsp;</h3></td>
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
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
                <td>S/N</td>
                <td>Limit ID</td>
                <td>Co-borrower LE ID/Name</td>
                <td>Limit Booking Location</td>
                <td>Product Desc</td>
				<td>Outer Limit ID</td>
                <td>Approved Limit</td>
                <td>SCC Limit Amount to be Activated</td>
                <td>Limit Maturity Date</td>
                <td>Issue Partial SCC</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cert"  >
   <logic:iterate id="OB" name="cert"  property="cleanPSCCItemList" type="com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificateItem"  >
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
              <td width="9%"><%=OB.getLimitRef()%></td>
              <td>
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              <br>
              <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
              </td>
              <td><%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td width="6%"><%=prodDesc%></td>
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
              	<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %> </a> <% } %>
              </td>
              <td class="amount" width="20%">
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>&nbsp;
              </td>
              <td class="amount" width="19%">
                <integro:currency param="currency" amount="<%=OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
              <% } %>&nbsp;
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
              <%-- <td width="12%"><logic:iterate id="temp0" name="OB" property="collateralAllocations" ><%=((ICollateralAllocation)temp0).getCollateral().getSCISecurityID() %><br></logic:iterate>&nbsp;</td>
              <td width="12%"><logic:iterate id="temp1" name="OB" property="collateralAllocations" ><bean:write name="temp1" property="collateral.collateralType.typeName" /><br></logic:iterate>&nbsp;</td>              
              --%>
                <td style="text-align:center" width="12%">
                <input name="checkbox" disabled type="checkbox" value="checkbox" 
                <%  if (OB.getIsPartialSCCIssued()) 
                    {
                %>
                checked 
                <%  }%>
                />
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
              <td class="total" style="text-align:right;padding-right:3px" width="19%">
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
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
            </tr>
</logic:present>
<logic:notPresent name="cert" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
<% }}

    //if(cert.getNotCleanPSCCItemList() != null) {
    if(cert.getPartialSCCItemList() != null) {
      row=0;
      //System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanPSCCItemList().length);
      System.out.println("Partial Item List is not null - Size: " + cert.getPartialSCCItemList().length);

%>
    <thead>
      <tr>
        <td width="50"><h3>&nbsp;</h3></td>
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
        <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
                  <td>SCC Limit Amount to be Activated</td>
                  <td>Limit Maturity Date</td>
                  <td>Security ID</td>
                  <td>Security Type</td>
                  <td>Issue Partial SCC</td>
              </tr>
              -->
                <tr>
                    <td>S/N</td>
                    <td>Outer Limit ID</td>
                    <td>Limit ID</td>
                    <td>Source Security ID</td>
                    <td>Security Type / Sub-Type</td>
                    <td>Product Description</td>
                    <td>Approved Limit</td>
                    <td>Expiry of Availability Period</td>
                    <td>Disbursement Amount</td>
                    <td>Amount Enforced Todate</td>
                    <td>Issue Partial SCC</td>
                    <td>Payment Instruction</td>
                </tr>
            </thead>
            <tbody>
  <logic:present name="cert"  >
     <logic:iterate id="OB" name="cert"  property="partialSCCItemList" type="com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificateItem"  >
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

      //String paymentInstruc = OB.getPaymentInstruction() == null ? "" : OB.getPaymentInstruction();
   %>
              <tr class="<%=rowClass%>">
                <!--S/N-->
                <td class="index"><%=row%></td>
                <!--Outer Limit ID-->
                <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
                    <a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %> </a> <% } %>
                </td>
                <!--Limit ID-->
                <td width="9%"><%=OB.getLimitRef()%></td>
                <!--Security ID-->
                <td width="12%"><logic:iterate id="temp0" name="OB" property="collateralAllocations" ><%=((ICollateralAllocation)temp0).getCollateral().getSCISecurityID() %><br></logic:iterate>&nbsp;</td>
                <!--Security Type-->
                <td width="12%"><logic:iterate id="temp1" name="OB" property="collateralAllocations" ><bean:write name="temp1" property="collateral.collateralType.typeName" /><br></logic:iterate>&nbsp;</td>
                <!--Product Desc-->
                <td width="6%"><%=prodDesc%></td>
                <!--Approved Limit-->
                <td class="amount" width="20%">
                  <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>&nbsp;
                </td>
                <!--Expiry of Availability Period-->
                <td><% if (OB.getExpiryAvailabilityDate() == null) { %>
                      -
                  <% } else { %>
                    <integro:date object="<%= OB.getExpiryAvailabilityDate() %>" />
                  <% } %>
                </td>
                <!--Disbursement Amount-->
                <td class="amount" width="19%">
                  <integro:currency param="currency" amount="<%=OB.getDisbursementAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%=OB.getDisbursementAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%=OB.getDisbursementAmount()%>" />
              <% } %>&nbsp;
                </td>
                <!--Amount Enforced Todate-->
                <td class="amount" width="19%">
                  <integro:currency param="currency" amount="<%=OB.getEnforceAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%=OB.getEnforceAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%=OB.getEnforceAmount()%>" />
              <% } %>&nbsp;
                </td>
                <!--Issue Partial SCC-->
                <td style="text-align:center" width="12%">
                <input name="checkbox" disabled type="checkbox" value="checkbox"
                <%  if (OB.getIsPartialSCCIssued())
                      {
                %>
                  checked
                <%  }%>
                  />
                </td>
                <!--Payment Instruction-->
                <td>
                    <%--<%=paymentInstruc%>--%>
                    <integro:empty-if-null value="<%=OB.getPaymentInstruction()%>" />
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
                <!--<td><%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>-->
                <!--SCC Limit Amount to be Activated-->
                <!--
                <td class="amount" width="19%">
                  <integro:currency param="currency" amount="<%=OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
              <% } %>&nbsp;
                </td>
                -->
                <!--Limit Maturity Date-->
                <!--
                <td><% if (OB.getMaturityDate() == null) { %>
                    -
                  <% } else { %>
                    <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
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
                <td class="total" style="text-align:right;padding-right:3px" width="19%">
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
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
              </tr>
              -->
  </logic:present>
  <logic:notPresent name="cert" >
              <tr class="odd">
                <td colspan="12">There is no document</td>
              </tr>
  </logic:notPresent>
            </tbody>
          </table></td>
      </tr>
<% } %>
    <tr>
      <td>&nbsp;</td>
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
                            Select (<SPAN style="TEXT-ALIGN: center"> <INPUT value="checkbox" type="checkbox" <%=_selAll%> disabled="true"></SPAN>)
                        </TD>
                        <TD width="86%">Item</TD>
                    </TR>
                </thead>
                <tbody>
                    <TR class="odd">
                        <TD class="index">1</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck1" <%=_hasCheck1%> value="Y" disabled="true"></TD>
                        <TD>
                            <P>
                                <STRONG>Fire Insurance Cover </STRONG>
                                <BR><%Amount insuredWithAmt = new Amount(cert.getInsuredWithAmt(), new CurrencyCode("MYR"));%>
                                a) To insured with <SPAN class="amount"><integro:empty-if-null value="<%=cert.getInsuredWith()%>"/></SPAN> MYR <SPAN
                                    class="amount"><integro:currency param="amount" amount="<%=insuredWithAmt%>"/><BR></SPAN>
                                b) M/Policy, endorse Mortgagee clause AMBM <SPAN class="amount"><integro:empty-if-null value="<%=cert.getAmbm()%>"/></SPAN> Expiry <SPAN
                                    style="TEXT-ALIGN: center"><%
                                                                if (cert.getExpiry() == null) out.println("-");
                                                                else {
                                                                    %><integro:date object="<%=cert.getExpiry()%>"/><%
                                                                }
                                                                %></SPAN>
                            </P>
                        </TD>
                    </TR>
                    <TR class="even">
                        <TD class="index">2</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck2" <%=_hasCheck2%> value="Y" disabled="true"></TD>
                        <TD>
                            <P><STRONG>Advice to Branch on creation of Sinking Fund </STRONG><BR><%Amount sinkFundAmt = new Amount(cert.getSinkFundAmt(), new CurrencyCode("MYR"));%>Sinking
                                Fund of MYR <SPAN class="amount"><integro:currency param="amount" amount="<%=sinkFundAmt%>"/> </SPAN>p.m
                                for
                                period of <SPAN class="amount"><integro:empty-if-null value="<%=cert.getPmForPeriodOf()%>"/> </SPAN>commencing
                                from <SPAN class="amount"><integro:empty-if-null value="<%=cert.getCommencingFrom()%>"/> </SPAN>until<%Amount fundReachAmt = new Amount(cert.getFundReach(), new CurrencyCode("MYR"));%>
                                the fund reaches MYR <SPAN class="amount"><integro:currency param="amount" amount="<%=fundReachAmt%>"/> </SPAN>
                            </P></TD>
                    </TR>
                    <TR class="odd">
                        <TD class="index">3</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck3" <%=_hasCheck3%> value="Y" disabled="true"></TD>
                        <TD>
                            <P><STRONG>Fees </STRONG><BR>To debit set-up fee MYR <SPAN
                                    class="amount"><%Amount feesAmt = new Amount(cert.getFeesAmt(), new CurrencyCode("MYR"));%><integro:currency param="amount" amount="<%=feesAmt%>"/> </SPAN></P></TD>
                    </TR>
                    <TR class="even">
                        <TD class="index" height="52">4</TD>
                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck4" <%=_hasCheck4%>  value="Y" disabled="true"></TD>
                        <TD>
                            <P><STRONG>Others </STRONG><BR><integro:empty-if-null value="<%=cert.getOthers()%>"/></P>

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
              <td width="20%">
                <integro:empty-if-null value="<%=cert.getCreditOfficerName()%>" />
              </td>
              <td class="fieldname">Signing Number<%--&nbsp;<font color="#0000FF">* </font>--%></td>
              <td width="30%">
                <integro:empty-if-null value="<%=cert.getCreditOfficerSignNo()%>" />                
              </td>
            </tr>
            <!--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td width="20%">
                <integro:empty-if-null value="<%=cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode())%>" />                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td width="30%">
                <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode())%>" />
              </td>
            </tr>
            -->
          </tbody>
        </table></td>
    </tr>
    <tr>
    <td>&nbsp;</td>
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
              <td width="20%">
                <integro:empty-if-null value="<%=cert.getSeniorOfficerName()%>" />
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="30%">
                <integro:empty-if-null value="<%=cert.getSeniorOfficerSignNo()%>" />
              </td>
            </tr>
            <!--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td width="20%">
                <integro:empty-if-null value="<%=cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode())%>" />                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td width="30%">
                <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode())%>" />
              </td>
            </tr>
            -->
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
              <td><bean:write name="GeneratePSCCForm" property="remarks"  /></td>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                              <% if (!viewOnly) { %>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even"><%=lastActionBy%></td>
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
    <%} else if (!viewOnly) {%>
    <td><a href="GeneratePSCC.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/print2.gif',1)"><img src="img/print1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GeneratePSCC.do?event=print_doc&isView=true','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"/></a></td>
    <% } else { %>
    <!--<td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/print2.gif',1)"><img src="img/print1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GeneratePSCC.do?event=print_doc&isView=true','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"/></a></td>-->
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
