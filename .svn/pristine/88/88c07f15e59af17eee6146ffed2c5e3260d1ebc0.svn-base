<%@ page import="com.integrosys.cms.app.cccertificate.trx.ICCCertificateTrxValue,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificateCustomerDetail,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificate,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.component.commondata.app.CommonDataSingleton,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 java.util.Date,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%  int row = 0;
    ICCCertificateTrxValue certTrxVal = (ICCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.certTrxVal");
    ICCCertificateCustomerDetail custDetail = (ICCCertificateCustomerDetail)request.getAttribute("custDetail");    
    ICCCertificate cert = (ICCCertificate)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.cert");        
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
    }
   
    ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    CountryList cList = CountryList.getInstance();    
    OrgCodeList orgList = OrgCodeList.getInstance();
    String countryName = "-";
    if (profile == null)
    {
        profile = new OBLimitProfile();        
        countryName = cList.getCountryName(customer.getOriginatingLocation().getCountryCode()) + " - " + customer.getOriginatingLocation().getOrganisationCode();
    }
    else
    {
        if (profile.getOriginatingLocation() != null)
        {
            countryName = cList.getCountryName(profile.getOriginatingLocation().getCountryCode());
        }
    }
    //String armName = (String)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.armName");    
    //String armCode = (String)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.armCode");    
    
    if(custDetail!=null){
        pageContext.setAttribute("cust",custDetail);
    }
    String cName = "-";
    String cSig = "-";
    String cCountry = "-";
    String cOrgCode = "-";
    String sName = "-";
    String sSig = "-";
    String sCountry = "-";
    String sOrgCode = "-";
    
 
    //For CR CMS-382  Starts
    Date lastGenDt=null; 
    ICCCertificate certActual =null;
    if(certTrxVal != null)
    	certActual = certTrxVal.getCCCertificate();
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
    
    String rem = "";
    if(certTrxVal!=null) {
    
        if (cert.getCreditOfficerName() != null)
        {
            cName = cert.getCreditOfficerName();
        }
        if (cert.getCreditOfficerSignNo() != null)
        {
            cSig = cert.getCreditOfficerSignNo();
        }
        if (cert.getCreditOfficerLocation() != null)
        {
            if (cert.getCreditOfficerLocation().getCountryCode() != null)
            {
                cCountry = cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode());
            }
            if (cert.getCreditOfficerLocation().getOrganisationCode() != null)
            {
                cOrgCode =orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode());
            }
        }    
           
        if (cert.getSeniorOfficerName() != null)
        {
            sName = cert.getSeniorOfficerName();
        }
        if (cert.getSeniorOfficerSignNo() != null)
        {
            sSig = cert.getSeniorOfficerSignNo();
        }        
        if (cert.getSeniorOfficerLocation() != null)
        {
            if (cert.getSeniorOfficerLocation().getCountryCode() != null)
            {
                sCountry = cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode());
            }
            if (cert.getSeniorOfficerLocation().getOrganisationCode() != null)
            {
                sOrgCode = orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode());
            }
        }
        rem = cert.getRemarks();  
       
    }
     
    String bizSgmt = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT,custDetail.getCustomerSegmentCode());

    if(bizSgmt == null){
        bizSgmt = "";
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
    
    ICCCertificateCustomerDetail coBorrowerDetail = (ICCCertificateCustomerDetail)request.getAttribute("coBorrowerDetail");
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
    ICCCertificateCustomerDetail pledgorDetail = (ICCCertificateCustomerDetail)request.getAttribute("pledgorDetail");
    if (pledgorDetail != null) {
     
        pageContext.setAttribute("pledgorDetail", pledgorDetail);
        
        pledgorCreditGrade = pledgorDetail.getCreditGrade().getCGCode();
        if (pledgorCreditGrade != null) {
            pledgorCreditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", pledgorCreditGrade.toString());
        }
        java.util.List l = (java.util.List)request.getAttribute("pledgorColList");
        if(l!=null){               
            pageContext.setAttribute("pledgorColList",l);
        }
    }
    
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
<table width="97%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  >
  <thead>
   </thead>
  <tbody>
    <tr>
       <td align="center"><h3>Constitutional and Contractual Compliance
        Certificate </h3></td>
    </tr>
   <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%"  class="fieldname">LE ID<br /> </td>
              <% if ((custDetail.getLegalID() == null) || (custDetail.getLegalID().equals("0")))
                 {%>
              <td >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td >&nbsp;<%=custDetail.getLegalID()%></td>
              <% } %>

              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<bean:write name="cust" property="legalName" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<bean:write name="cust" property="customerReference" /></td>
              <td class="fieldname">Customer Name<br /> </td>
              <td>&nbsp;<bean:write name="cust" property="customerName" /></td>              
            </tr>
<%  if (cert.getCCCertCategory().equals(ICMSConstant.CHECKLIST_NON_BORROWER))
    {
%>          <tr class="odd">
              <td class="fieldname">Business Segment</td>
              <td>&nbsp;<%=bizSgmt%></td>
              <td class="fieldname">CCC Ref. No.</td>
              <td>&nbsp;<%=custDetail.getLegalID()%>/<%= cert.getCCCertRef()%></td>
             </tr>
             <tr class="even">
              <td class="fieldname">Instruction Originating Location</td>
              <td>&nbsp;<%= countryName%></td>
              
              <td class="fieldname">Last Update Date</td>
	      <td>
	      <%if(lastGenDt != null) {%>
			<integro:date object="<%=lastGenDt%>" />
	       <%} else {%>- <%}%></td>
               
             </tr>
                       </tbody>
        </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td>We hereby certify that the Constitutional and Contractual Documentation required in
                terms of the above mentioned account has been perfected,
                physically checked and that all documents have been complied
                with.</td>
            </tr>
          </tbody>
        </table>
        
      </td>
    </tr>
<%  }
    else
    {%>
            
            <tr class="odd">
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=creditGradeName%></td>              
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
            <tr class="even">
              <td class="fieldname">CCC Ref. No.</td>
              <td>&nbsp;<%=custDetail.getLegalID()%>/<%= cert.getCCCertRef()%></td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>            
            <tr class="odd">
              <td class="fieldname">Business Segment</td>
              <td>&nbsp;<%=bizSgmt%></td>
              <td class="fieldname">Total Limit Amount per BCA</td>
              <td><%if(cert.getTotalApprovalAmount()!=null){ System.out.println("Amount "+cert.getTotalApprovalAmount()); %><integro:currency amount="<%=cert.getTotalApprovalAmount()%>" /> <% } %>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM Code</td>
              <td>&nbsp;<integro:empty-if-null value="<%=custDetail.getFamCode()%>" /></td>
              <td class="fieldname">FAM</td>
              <td>&nbsp;<integro:empty-if-null value="<%=custDetail.getFamName()%>" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">BCA Approval Date</td>
<%
    if (profile.getApprovalDate() != null)
    {
%>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",profile.getApprovalDate())%></td>
<%  }
    else
    {
%>
              <td>&nbsp;-</td>
<%  }
%>              <td class="fieldname">BCA Approval Authority</td>
              <td>&nbsp;<integro:empty-if-null value="<%= profile.getApproverEmployeeName1()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">BCA Next Review Date</td>
<%
    if (profile.getNextAnnualReviewDate() != null)
    {
%>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",profile.getNextAnnualReviewDate())%></td>
<%  }
    else
    {
%>
              <td>&nbsp;-</td>
<%  }
%>
              <td class="fieldname">BCA Originated Location</td>
              <td>&nbsp;<%= countryName%></td>
            </tr>
            <tr class="odd">
	    	       <td class="fieldname">Last Update Date</td>
	    	       <td colspan ="3" >
	    	       <%if(lastGenDt != null) {%>
	    		<integro:date object="<%=lastGenDt%>" />
	    	       <%} else {%>- <%}%></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
      <tr>
    <td>&nbsp;</td>
  </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <%  if (ICMSConstant.CHECKLIST_PLEDGER.equals(cert.getCCCertCategory()))
    {%>  
  <tbody>
    <tr> 
      <td> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
              <td>&nbsp;<%=creditGradeName%></td>
            </tr>                      
          </tbody>
        </table>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
    <tr> 
      <td> <hr /> </td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
        <logic:iterate id="OB" name="pledgorColList"  type="com.integrosys.cms.app.collateral.bus.ICollateral">  
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
<%  }
    else
    {
        if (ICMSConstant.CHECKLIST_CO_BORROWER.equals(cert.getCCCertCategory()))
        {%>
  <tbody>
    <tr> 
      <td> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
    <td>&nbsp;</td>
  </tr>
<%}%>       
  <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td> We hereby certify that constitutional documentation has been 
                completed and verified in accordance with the following standards 
                :<br />
                <br />
                <ul>
                  <li>Documentation are in accordance with the relevant laws, 
                    statutes, and/or any other regulations established by a governing 
                    body which the bank must comply with in the jurisdiction(s) 
                    where the customer relationship is established,<br />
                    <br />
                  </li>
                  <li>Documentation meets the minimum requirements set by the 
                    Group, and local legal &amp; compliance functions,<br />
                    <br />
                  </li>
                  <li>Documentation meets the minimum Know Your Customer Group 
                    and Country standards in relation to :<br />
                    <br />
                  </li>
                  <OL class="lowerroman">
                    <li>minimum incorporation / certification documentation required 
                      to be maintained,</li>
                    <li>ability to independently verify the KYC customer records 
                      and data in the KYC templates 
                    <li>ability to independently confirm that customer risk ratings 
                      are correct</li>
                    <li>ability to independently confirm customer searches have 
                      been properly performed against the Group Special Reference 
                      Listing</li>
                    <li>valid Group Introductory Certificates maintained from 
                      SCB offices where KYC procedures and completion have been 
                      relied upon, as permitted in the Group KYC standards</li>
                  </OL>
                  </ul>
				  We hereby also certify that the contractual documentation for 
                the customer have been completed in accordance with the approved 
                customer business credit application (&quot;BCAs&quot;) and/or 
                customer transaction approvals / mandates, and meets the minimum 
                contract law (or its equivalent) requirements of the jurisdictions 
                where the customer relationship is established. To the extent 
                that conditions precedents are established in the approved BCAs, 
                including any representations / obligations expected of the Customer, 
                completion of contractual documentation will be deemed to have 
                ensured all such condition precedents have been met, and verified.<br />
                <br />
                Note : Where any of the facilities / products offered above are 
                unsecured, completion of CCCC will avail these facilities and 
                products accordingly, through the activation of these unsecured 
                limits. Where any facility / product / limit is offered and approved 
                on condition of acceptable security, such facilities / products 
                can only be availed upon completion of CCCC, as well as Security 
                Completion Certificates. </td>
            </tr>
          </tbody>
        </table>        
      </td>
    </tr>
<%     
    if (cert.getCleanCCCertificateItemList() != null)
    {
%>    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="5%">S/N</td>
              <td width="5%">Limit ID</td>
              <td width="5%">Co-borrower LE <br>ID/Name</td> 
              <td width="15%">Limit Booking Location</td>
              <td width="15%">Product Desc</td>
              <td width="20%">Approved Limit</td>
              <td width="5%">Approved Date</td>
              <td width="20%">Limit Amount to be Activated</td>              
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
              <td>&nbsp;
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />          
              <br>
              &nbsp;<integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />           
              </td>
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td>&nbsp;<%=prodDesc%></td>
              <td class="amount">
              <%if (OB.isInnerLimit())
                {
              %>(
                <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" />
                )
              <%}
                else
                {
              %><integro:currency amount="<%=OB.getApprovedLimitAmount()%>" />
              <%}%>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getApprovalDate())%></td>              
              <td class="amount">
              <%if (OB.isInnerLimit())
                {
              %>(
                <integro:currency amount="<%=OB.getActivatedAmount()%>" />
                )
              <%}
                else
                {
              %><integro:currency amount="<%=OB.getActivatedAmount()%>" />
              <%}%>
              </td>                           
            </tr>
  </logic:iterate>
            <tr class="odd">
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
              <td colspan="8">There is no document</td>
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
%>  <tr>
      <td><hr /></td>
    </tr>   
    <tr>
       <td>The following require a Partial SCC or an SCC for the Activation of Limits:</td>
    </tr>
    <tr>      
      <td>     
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="5%">S/N</td>
              <td width="5%">Limit ID</td>
              <td width="5%">Co-borrower LE <br>ID/Name</td>
              <td width="15%">Limit Booking Location</td>
              <td width="15%">Product Desc</td>
              <td width="20%">Approved Limit</td>
              <td width="5%">Approved Date</td>
              <td width="20%">Limit Amount to be Activated</td>              
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
              <td>&nbsp;
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />          
              <br>
              &nbsp;<integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />           
              </td>
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td>&nbsp;<%=prodDesc%></td>
              <td class="amount">
              <%if (OB.isInnerLimit())
                {
              %>(
                <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" />
                )
              <%}
                else
                {
              %><integro:currency amount="<%=OB.getApprovedLimitAmount()%>" />
              <%}%>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getApprovalDate())%></td>              
              <td class="amount">
              <%if (OB.isInnerLimit())
                {
              %>(
                <integro:currency amount="<%=OB.getActivatedAmount()%>" />
                )
              <%}
                else
                {
              %><integro:currency amount="<%=OB.getActivatedAmount()%>" />
              <%}%>
              </td>                           
            </tr>
  </logic:iterate>
            <tr class="odd">
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
              <td colspan="8">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
        </td>
    </tr>  
<%
    }}}
%>
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
              <td colspan="5" style="text-align:left">Credit Documentation Officer
                / Manager</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;<%=cName%></td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">&nbsp;<%=cSig%></td>
               
            </tr>
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;<%=cCountry%></td>
              <td class="fieldname">Location Org Code</td>
              <td >&nbsp;<%=cOrgCode%></td>
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
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="5" style="text-align:left">Senior Credit Documentation Manager</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;<%=sName%></td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">&nbsp;<%=sSig%></td>
              
            </tr>
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;<%=sCountry%></td>
              <td class="fieldname">Location Org Code</td>
              <td >&nbsp;<%=sOrgCode%></td>
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
              <td><integro:wrapper value="<%=rem%>" lineLength="80" /></td>
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
   
  </tbody>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
