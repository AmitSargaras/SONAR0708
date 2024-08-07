<%@ page import="com.integrosys.cms.app.sccertificate.trx.IPartialSCCertificateTrxValue,                 
                 com.integrosys.cms.app.sccertificate.bus.ISCCertificateCustomerDetail,
                 com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificate,
                 com.integrosys.cms.app.sccertificate.proxy.ISCCertificateProxyManager,
                 com.integrosys.cms.app.sccertificate.proxy.SCCertificateProxyManagerFactory,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 com.integrosys.component.commondata.app.CommonDataSingleton,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.Date,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,                 
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

    IPartialSCCertificateTrxValue certTrxVal = (IPartialSCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.certTrxVal");
//    IPartialSCCertificate cert = (IPartialSCCertificate)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.cert");
    IPartialSCCertificate cert = (IPartialSCCertificate)request.getAttribute("cert");
    ISCCertificateCustomerDetail custDetail = (ISCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.custDetail");
    CountryList cList = CountryList.getInstance();
    String[] temp = {};
    OrgCodeList orgList = OrgCodeList.getInstance(temp);
    String countryName = cList.getCountryName(custDetail.getOriginatingLocation().getCountryCode());
    
    if(custDetail!=null){
        pageContext.setAttribute("cust",custDetail);
    }

    String cName = "";
    String cSig = "";
    String cCountry = "";
    String cOrgCode = "";

    String sName = "";
    String sSig = "";
    String sCountry = "";
    String sOrgCode = "";    
    String rem = "";
    //Amount appAmt = null;
    //Amount actAmt = null;
    Amount cleanAppAmt = null;
    Amount notCleanAppAmt = null;
    Amount cleanActAmt = null;
    Amount notCleanActAmt = null;


   //For CR CMS-382  Starts
     Date lastGenDt=null;
      IPartialSCCertificate certActual = null;
     if(certTrxVal != null)
	 certActual = certTrxVal.getPartialSCCertificate();
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
    ISCCertificateProxyManager proxy = SCCertificateProxyManagerFactory.getSCCertificateProxyManager();    
    if(certTrxVal!=null) {     
	    rem = certTrxVal.getRemarks();
        if(cert!=null){
            pageContext.setAttribute("cert",cert);
            cert = proxy.computeTotalAmountsForIssuedPSCC(cert);
            //appAmt = cert.getTotalApprovalAmount();
            //actAmt = cert.getTotalActivatedAmount();
            cleanAppAmt = cert.getCleanApprovalAmount();
            notCleanAppAmt = cert.getApprovalAmount();
            cleanActAmt = cert.getCleanActivatedAmount();
            notCleanActAmt = cert.getActivatedAmount();

            String isView = request.getParameter("isView");         
		    if ((isView != null && isView.equals("true")) ||
		    	ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) {
			    rem = cert.getRemarks();
	    	}
        }
        cName = cert.getCreditOfficerName();
        cSig = cert.getCreditOfficerSignNo();
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
        
    }

    int row = 0;

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

<body style="width:100%;overflow:auto;" >
<!-- InstanceBeginEditable name="Content" --> 
<table width="97%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td class="header" align="center" colspan="2">Memorandum - Partial SCC</td>
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
      <td class="header" align="center">Memorandum - Partial SCC</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
    -->
    <tr> 
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd"> 
              <td colspan="4" style="text-align:left">Customer Details</td>    ge
            </tr>
          </thead>
          <tbody>
            <!--
            <tr class="odd"> 
              <td width="20%"  class="fieldname">LE ID<br /> </td>
              <td width="30%"><bean:write name="cust" property="legalID" /></td>
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%"><bean:write name="cust" property="legalName" /></td>
            </tr>
            -->
            <tr class="even">
              <!--
              <td class="fieldname">Customer Category<br /> </td>
              <td>???</td>
              -->
              <td class="fieldname">Customer Name<br /> </td>
              <td><bean:write name="cust" property="customerName" /></td>
              <!--
              <td class="fieldname">Sub-Profile ID</td>
              <td><bean:write name="cust" property="customerReference" /></td>
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
                              <td><%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getFinalBFLIssuedDate())%></td>
                <%  }
                    else
                    {
                %>
                              <td>-</td>
                <%  }
                %>
              <td class="fieldname">PSCC Ref. No.</td>
              <td><%=custDetail.getLegalID()%>/<%= cert.getSCCertRef()%></td>
            </tr>
            -->
            <!--
            <tr class="even"> 
              <td class="fieldname">Business Segment</td>
              <td><%=bizSgmt%></td>
              <td class="fieldname">Limit Amount (Total)</td>
              <td><integro:currency amount="<%=cert.getTotalApprovalAmount()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM Code</td>
              <td><integro:empty-if-null value="<%=custDetail.getFamCode()%>" /></td>
              <td class="fieldname">FAM</td>
              <td><integro:empty-if-null value="<%=custDetail.getFamName()%>" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">BCA Approval Date</td>
              <td><%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getApprovalDate())%></td>
              <td class="fieldname">BCA Approval Authority</td>
              <td><integro:empty-if-null value="<%= custDetail.getApprovalAuthority()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">BCA Next Review Date</td>
              <td><%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getNextReviewDate())%></td>
              <td class="fieldname">Extended Review Date</td>
              <td><% if (custDetail.getExtReviewDate() == null) { %>
                    -
                  <% } else { %>
                    <integro:date object="<%= custDetail.getExtReviewDate() %>" />
                  <% } %>
              </td>
            </tr>
            <tr class="odd">
	          <td class="fieldname">Last Update Date</td>
	          <td colspan>
	          <% if (lastGenDt != null) { %>
		        <integro:date object="<%=lastGenDt%>" />
	          <% } else { %>
                -
              <% } %>
              </td>
              <td class="fieldname">BCA Originated Location</td>
              <td><%= countryName %></td>
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
    if (false) {//Ignore this
    if (cert.getCleanPSCCItemList() != null)
    {
        row=0;
        System.out.println("Clean Item List is not null - Size: " + cert.getCleanPSCCItemList().length);
        System.out.println("Product Description: " + (cert.getCleanPSCCItemList())[0].getProductDesc());
%>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td>The following are Un-Secured Limits:</td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
            </tr>
          </thead>
          <tbody>
<logic:present name="cert" >
   <logic:iterate id="OB" name="cert"  property="cleanPSCCItemList" type="com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificateItem"  >
<%

	//String temp = "actLimit"+(row-1);
    boolean partial = OB.getIsPartialSCCIssued();
    String prodDesc= "-";
		if(OB.getProductDesc()!=null) {
			prodDesc = OB.getProductDesc();
			if(prodDesc !=null)
			{
				if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
				 prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
			}

		}
    if(partial){
	    String rowClass="";
	    row++;
	    if(row%2!=0){
	       rowClass="odd";
	    }else{
	       rowClass="even";
	    }
   %>
            <tr class="<%=rowClass%>">
              <td class="index" width="4%" ><%=row%></td>
              <td width="16%"><%=OB.getLimitRef()%></td>
              <td>
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              <br>
              <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
              </td>
              <td><%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td width="30%"><%=prodDesc%></td>
              <td><%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%></td>
              <td class="amount" width="20%">
              <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td class="amount" width="29%">
              <integro:currency param="currency" amount="<%=OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
              <% } %>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
            </tr>
<% }%>
</logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>              
              <td class="total" style="text-align:right;padding-right:3px"><integro:currency amount="<%=cleanAppAmt%>" ></integro:currency></td>
              <td class="total" style="text-align:right;padding-right:3px"><integro:currency amount="<%=cleanActAmt%>" ></integro:currency></td>
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
<% }
    }

    //if(cert.getNotCleanPSCCItemList() != null && cert.getNotCleanPSCCItemList().length!= 0) {
    if (cert.getPartialSCCItemList() != null && cert.getPartialSCCItemList().length != 0) {
      row=0;
      System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanPSCCItemList().length);
      System.out.println("Partial Item List is not null - Size: " + cert.getPartialSCCItemList().length);

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
      <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
              <td>Security<br>Type</td>
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
                <!--<td>Issue Partial SCC</td>-->
                <td>Payment Instruction</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cert" >
   <logic:iterate id="OB" name="cert"  property="partialSCCItemList" type="com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificateItem"  >
<%
    //System.out.println("CHEE HONG ONE LOOP");
	//String temp = "actLimit"+(row-1);
    boolean partial = OB.getIsPartialSCCIssued();
    String prodDesc= "-";
		if(OB.getProductDesc()!=null) {
			prodDesc = OB.getProductDesc();
			if(prodDesc !=null)
			{
				if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
				 prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
			}

		}
    if(partial){
	    String rowClass="";
	    row++;
	    if(row%2!=0){
	       rowClass="odd";
	    }else{
	       rowClass="even";
	    }

        //String paymentInstruc = OB.getPaymentInstruction() == null ? "" : OB.getPaymentInstruction();
   %>
            <tr class="<%=rowClass%>">
              <!--S/N-->
              <td class="index" width="4%" ><%=row%></td>
              <!--Outer Limit ID-->
              <td><%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%></td>
              <!--Limit ID-->
              <td width="16%"><%=OB.getLimitRef()%></td>
              <!--Security ID-->
              <td width="12%"><logic:iterate id="temp0" name="OB" property="collateralAllocations" ><%=((ICollateralAllocation)temp0).getCollateral().getSCISecurityID() %><br></logic:iterate></td>
              <!--Security<br>Type-->
              <td width="12%"><logic:iterate id="temp1" name="OB" property="collateralAllocations" ><bean:write name="temp1" property="collateral.collateralType.typeName" /><br></logic:iterate></td>
              <!--Product Desc-->
              <td width="30%"><%=prodDesc%></td>
              <!--Approved Limit-->
              <td class="amount" width="20%">
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
                <!--Issue Partial SCC-->
                <!--
                <td style="text-align:center" width="12%">
                  <input name="checkbox" disabled type="checkbox" value="checkbox"
                <%  if (OB.getIsPartialSCCIssued()) {%>
                  checked
                <%  }%>
                  />
                -->
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
              <td class="amount" width="29%">
              <integro:currency param="currency" amount="<%=OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
              <% } %>
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
<% }%>
</logic:iterate>
            <!--
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total" style="text-align:right;padding-right:3px"><integro:currency amount="<%=notCleanAppAmt%>" ></integro:currency></td>
              <td class="total" style="text-align:right;padding-right:3px"><integro:currency amount="<%=notCleanActAmt%>" ></integro:currency></td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
            </tr>
            -->
</logic:present>
<logic:notPresent name="cert" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
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
              <td class="fieldname">Name</td>
              <td width="20%">
                <integro:empty-if-null value="<%=cName%>" />                
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">
                <integro:empty-if-null value="<%=cSig%>" />                                
              </td>
            </tr>
            <!--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>
                <integro:empty-if-null value="<%=cCountry%>" />                                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td >
                <integro:empty-if-null value="<%=cOrgCode%>" />                                
             </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Signature</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td >
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
    <td>&nbsp;</td>
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
              <td width="20%">
                <integro:empty-if-null value="<%=sName%>" />                                                
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">
                <integro:empty-if-null value="<%=sSig%>" />                                                                  
              </td>              
            </tr>
            <!--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>
                <integro:empty-if-null value="<%=sCountry%>" />                                                                                 
              </td>
              <td class="fieldname">Location Org Code</td>
              <td >
                <integro:empty-if-null value="<%=sOrgCode%>" />                                                                                               
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Signature</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td >
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
              <td><integro:wrapper value="<%=rem%>" /></td>
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
