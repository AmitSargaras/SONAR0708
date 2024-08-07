<%@ page import="com.integrosys.cms.app.sccertificate.trx.ISCCertificateTrxValue,
                 com.integrosys.cms.app.sccertificate.bus.ISCCertificateCustomerDetail,
                 com.integrosys.cms.app.sccertificate.bus.ISCCertificate,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.genscc.GenerateSCCForm,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.techinfra.util.DateUtil,  
                 java.util.Date,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

    ISCCertificateTrxValue certTrxVal = (ISCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genscc.GenerateSCCAction.certTrxVal");
    ISCCertificateCustomerDetail custDetail = (ISCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genscc.GenerateSCCAction.custDetail");
//    ISCCertificate cert = (ISCCertificate)session.getAttribute("com.integrosys.cms.ui.genscc.GenerateSCCAction.cert");
    ISCCertificate cert = (ISCCertificate)request.getAttribute("cert");

    if(custDetail!=null){
        pageContext.setAttribute("cust",custDetail);
    }

    CountryList cList = CountryList.getInstance();
    String[] temp = {};
    OrgCodeList orgList = OrgCodeList.getInstance(temp);
    String countryName = cList.getCountryName(custDetail.getOriginatingLocation().getCountryCode());

    String cName = "";
    String cSig = "";
    String cCountry = "";
    String cOrgCode = "";
    String sName = "";
    String sSig = "";
    String sCountry = "";
    String sOrgCode = "";
    String rem = "";
    int row =0;
        
    //String[] actAmtCurrCode = null;        //CR146 - check how to change!!!!
    //String[] actAmtAry = null;
    //Amount appAmt = null;
    //Amount actAmt = null;

    Amount cleanAppAmt = null;
    Amount notCleanAppAmt = null;
    Amount cleanActAmt = null;
    Amount notCleanActAmt = null;


   //For CR CMS-382  Starts
    Date lastGenDt=null;
    ISCCertificate certActual = null;
    if(certTrxVal != null)
       	certActual = certTrxVal.getSCCertificate();
    if(certActual != null)
      	lastGenDt = certActual.getDateGenerated();	
    //For CR CMS-382  Ends
    
    //For CR CMS-1366 Starts
    Date creditOfficerDt=null;
    Date seniorOfficerDt=null; 
    if(certActual != null){
	creditOfficerDt = certActual.getCreditOfficerDt();
	seniorOfficerDt = certActual.getSeniorOfficerDt();
    }
    //For CR CMS-1366 Ends

    if(cert!=null) {
                
        //appAmt = cert.getTotalApprovalAmount();
        //actAmt = cert.getTotalActivatedAmount();
        cleanAppAmt = cert.getCleanApprovalAmount();
        notCleanAppAmt = cert.getApprovalAmount();
        cleanActAmt = cert.getCleanActivatedAmount();
        notCleanActAmt = cert.getActivatedAmount();

        DefaultLogger.debug(this, "clean App Amt: " + cleanAppAmt);
        DefaultLogger.debug(this, "clean Act Amt: " + cleanActAmt);

        DefaultLogger.debug(this, "not clean App Amt: " + notCleanAppAmt);
        DefaultLogger.debug(this, "not clean Act Amt: " + notCleanActAmt);

        GenerateSCCForm aForm = (GenerateSCCForm)request.getAttribute("GenerateSCCForm");
        //actAmtAry = aForm.getActLimit();
        //actAmtCurrCode = aForm.getActAmtCurrCode();

        //String[] cleanActAmtCurrCode = null;
        //String[] notCleanActAmtCurrCode = null;

          
        cName = cert.getCreditOfficerName();
        cSig = cert.getCreditOfficerSignNo();
        sName = cert.getSeniorOfficerName();
        sSig = cert.getSeniorOfficerSignNo();
        //rem = cert.getRemarks();
        rem = certTrxVal.getRemarks();
        String isView = request.getParameter("isView");
	    if ((isView != null && isView.equals("true")) ||
	    	ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) {
		    rem = cert.getRemarks();
    	}
        if (cert.getCreditOfficerLocation() != null)
        {
            cCountry = cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode());
            cOrgCode = orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode());
        } 
        sName = cert.getSeniorOfficerName();
        sSig = cert.getSeniorOfficerSignNo();
        if (cert.getSeniorOfficerLocation() != null)
        {
            sCountry = cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode());
            sOrgCode = orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode());
        }     
        pageContext.setAttribute("cert",cert);    
    }

    String bizSgmt = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT,custDetail.getCustomerSegmentCode());

    if(bizSgmt == null){
        bizSgmt = "";
    }

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

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
.header { font-family:verdana; font-size:18px; color: #017AA7; font-weight:bold;}
</style>


<!-- InstanceEndEditable -->
</head>
<body style="width:100%;overflow:auto;">
<!-- InstanceBeginEditable name="Content" --> 
<table width="97%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td class="header" align="center" colspan="2">Memorandum - SCC</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td><h3>&nbsp;</h3>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                <tr class="odd">
                    <td width="150" class="fieldname">To<br/>
                    </td>
                    <td>Disbursement Unit</td>
                </tr>
                <tr class="even">
                    <td class="fieldname">From<br/>
                    </td>
                    <td>Documentation Unit</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Date</td>
                    <td><%=DateUtil.formatDate("dd/MMM/yyyy",new Date())%></td>
                </tr>
                <tr class="even">
                    <td class="fieldname">Ref</td>
                    <td>CAU / FBBL</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Subject</td>
                    <td>Disbursement</td>
                </tr>
                </tbody>
            </table>
            <p>&nbsp;</p>

            <h3>Partial SCC</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
    <!--
    <tr> 
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
    <tr> 
      <td><input name="imageField" type="image" src="img/banner.jpg" width="197" height="44" border="0" /> 
      </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp; </td>
    </tr>
    -->
  </thead>
  <tbody>
    <!--
    <tr> 
      <td class="header" align="center">Security Compliance Certificate</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    -->
    <tr> 
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd"> 
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <!--
            <tr class="odd">
              <td width="20%"  class="fieldname">LE ID<br /> </td>
              <td width="30%"><%if(custDetail!=null  && !custDetail.getLegalID().equals("0")){%>
			  &nbsp;<bean:write name="cust" property="legalID" /> <% } else {%> -
              <% } %></td>
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<bean:write name="cust" property="legalName" /></td>
            </tr>
            -->
            <tr class="even">
              <td class="fieldname">Customer Name<br /> </td>
              <td>&nbsp;<bean:write name="cust" property="customerName" /></td>
              <!--
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<bean:write name="cust" property="customerReference" /></td>
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
              <td class="fieldname">SCC Ref. No.</td>
              <td>&nbsp;<%=custDetail.getLegalID()%>/<%= cert.getSCCertRef()%></td>
            </tr>     
            <tr class="even">
              <td class="fieldname">Business Segment</td>
              <td>&nbsp;<%=bizSgmt%></td>
              <td class="fieldname">Limit Amount (Total)</td>
              <td>&nbsp;<integro:currency amount="<%=cert.getTotalApprovalAmount()%>" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">FAM Code</td>
              <td>&nbsp;<integro:empty-if-null value="<%=custDetail.getFamCode()%>" /></td>
              <td class="fieldname">FAM</td>
              <td>&nbsp;<integro:empty-if-null value="<%=custDetail.getFamName()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">BCA Approval Date</td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getApprovalDate())%></td>
              <td class="fieldname">BCA Approval Authority</td>
              <td>&nbsp;<integro:empty-if-null value="<%= custDetail.getApprovalAuthority()%>" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">BCA Next Review Date</td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getNextReviewDate())%></td>
              <td class="fieldname">Extended Review Date</td>
              <td><% if (custDetail.getExtReviewDate() == null) { %>
                    &nbsp;-
                  <% } else { %>
                    &nbsp;<integro:date object="<%= custDetail.getExtReviewDate() %>" />
                  <% } %>
              </td>
            </tr>
            <tr class="even">
		      <td class="fieldname">Last Update Date</td>
		      <td><% if (lastGenDt != null) { %>
                    &nbsp;<integro:date object="<%=lastGenDt%>" />
                  <% } else { %>
                    &nbsp;-
                  <% } %>
              </td>
              <td class="fieldname">BCA Originated Location</td>
              <td>&nbsp;<%= countryName %></td>
            </tr>
            -->
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <!--
    <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td>We hereby certify that all documentation related to securities pledged /
                  committed to the Bank as required by the approved business credit
                  applications ("BCAs"), and any due process (registrations, stamp duties, etc)
                  as required by the relevant jurisdictions under which the securities are governed,
                  have been perfected to ensure the Bank's rights to the securities are enforceable.
                  Where securities may be obtained through different SCB offices / locations,
                  issuance of the SCC by the booking location of the BCA is deemed to confirm that
                  security perfection has been completed for all securities, in their respective
                  jurisdictions.
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    -->
<%
    if (false) {
    if (cert.getCleanSCCertificateItemList() != null)
    {
        row=0;
        //System.out.println("Clean Item List is not null - Size: " + cert.getCleanSCCertificateItemList().length);
        //System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanSCCertificateItemList().length);

%>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td>The following are Un-Secured Limits:</td>
    </tr>
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
              <td>Limit Amount to be Activated&nbsp;</td>
            </tr>
          </thead>
          <tbody>

<logic:present name="cert"  >
    <logic:iterate id="OB" name="cert"  property="cleanSCCertificateItemList" type="com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem">
   <!-- logic:iterate id="OB" name="cert"  property="notCleanSCCertificateItemList" type="com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem" -->
<%

    System.out.println("Is Item CleanType:- " + OB.isCleanType());
    System.out.println("Limit Ref:- " + OB.getLimitRef());
    //System.out.println("Limit Ref:- " + OB.getApprovedLimitAmount());
    System.out.println("Activated Limit:- " + OB.getActivatedAmount()  + "\n");
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	//String temp = "actLimit"+(row-1);
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
              <td><%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%></td>
              <td class="amount">
                <input type="hidden" name="appLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<integro:date object="<%= OB.getApprovalDate() %>" /></td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
              <td class="amount">
                <%-- <input type="hidden" name="actAmtCurrCode" value="<%=actAmtCurrCode[row-1]%>"/> --%>
                <input type="hidden" name="actAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/>
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
}

    //if (cert.getNotCleanSCCertificateItemList() != null)
    if (cert.getSCCItemList() != null)
    {
        row=0;
        //System.out.println("Clean Item List is not null - Size: " + cert.getCleanSCCertificateItemList().length);
        //System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanSCCertificateItemList().length);
        System.out.println("SCC List is not null - Size: " + cert.getSCCItemList().length);

%>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <!--
    <tr>
      <td>The following are Secured Limits:</td>
    </tr>
    -->
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
              <td>Limit Amount to be Activated&nbsp;</td>
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
                <td>Payment Instruction</td>
            </tr>
          </thead>
          <tbody>

<logic:present name="cert"  >
    <logic:iterate id="OB" name="cert"  property="notCleanSCCertificateItemList" type="com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem">
   <!-- logic:iterate id="OB" name="cert"  property="notCleanSCCertificateItemList" type="com.integrosys.cms.app.sccertificate.bus.ISCCertificateItem" -->
<%

    //System.out.println("Is Item CleanType:- " + OB.isCleanType());
    //System.out.println("Item ID:- " + OB.getSCCertItemID());
    //System.out.println("Limit Ref:- " + OB.getLimitRef() + "\n");
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	//String temp = "actLimit"+(row-1);
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
              <td><%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%></td>
              <!--Limit ID-->
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <!--Security ID-->
              <td width="12%">
                  <%if (OB.getCollateralAllocations() != null) {%>
                    <logic:iterate id="temp0" name="OB" property="collateralAllocations" ><%=((ICollateralAllocation)temp0).getCollateral().getSCISecurityID() %><br></logic:iterate>
                  <%} else {
                      out.println("-");
                  }%>
                  </td>
              <!--Security<br>Type-->
              <td width="12%">
                  <%if (OB.getCollateralAllocations() != null) {%>
                    <logic:iterate id="temp1" name="OB" property="collateralAllocations" ><bean:write name="temp1" property="collateral.collateralType.typeName" /><br></logic:iterate>
                  <%} else {
                      out.println("-");
                  }%>
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
                <td><% if (OB.getExpiryAvailabilityDate() == null) { %>
                      -
                  <% } else { %>
                    <integro:date object="<%= OB.getExpiryAvailabilityDate() %>" />
                  <% } %>
                </td>
                <!--Disbursement Amount-->
                <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getDisbursementAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%= OB.getDisbursementAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%= OB.getDisbursementAmount()%>" />
              <% } %>
                </td>
                <!--Amount Enforced Todate-->
                <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getEnforceAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%= OB.getEnforceAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%= OB.getEnforceAmount()%>" />
              <% } %>
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
              <!--<td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>-->
              <!--Approved Date-->
              <!--<td>&nbsp;<integro:date object="<%= OB.getApprovalDate() %>" /></td>-->
              <!--Limit Maturity Date-->
              <!--
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
              -->
              <!--Limit Amount to be Activated-->
              <!--
              <td class="amount">
                <%-- <input type="hidden" name="actAmtCurrCode" value="<%=actAmtCurrCode[row-1]%>"/> --%>
                <input type="hidden" name="actAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/>
                <integro:currency param="currency" amount="<%=OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
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
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
    <tr> 
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr> 
              <td colspan="5" style="text-align:left">Authorised Personnel 1</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name&nbsp;</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cName%>" />                
              </td>
              <td class="fieldname">Signing Number&nbsp;</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cSig%>" />
              </td>
              
            </tr>
            <!--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;   
                <%--<integro:empty-if-null value="<%=cCountry%>" />--%>                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td >&nbsp;
                <%--<integro:empty-if-null value="<%=cOrgCode%>" />--%>                                
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Signature</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td >&nbsp;
              <%if(creditOfficerDt != null) {%>
	      	<integro:date object="<%=creditOfficerDt%>" />
	       <%} else {%>- <%}%>
              </td>
            </tr>
            -->
          </tbody>
        </table></td>
    </tr>
    <tr> 
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr> 
              <td colspan="5" style="text-align:left">Authorised Personnel 2</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=sName%>" />
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=sSig%>" />               
              </td>
              
            </tr>
            <!--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;
                <%--<integro:empty-if-null value="<%=sCountry%>" />--%>                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td >&nbsp;
                <%--<integro:empty-if-null value="<%=sOrgCode%>" />--%>                
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Signature</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td >&nbsp;
              <%if(seniorOfficerDt != null) {%>
	      	 <integro:date object="<%=seniorOfficerDt%>" />
	       <%} else {%>- <%}%>
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
              <td style="text-align:left">Remarks</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td>
                <integro:wrapper value="<%=rem%>" lineLength="80" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <td align="center">&nbsp;</td>
    </tr>
    <tr> 
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
  </tbody>
</table>
    
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>
