<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.math.BigDecimal,
                 java.util.List" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
 <title>View Customer Details</title>

    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link href="../css/smartlender.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" media="all" href="../css/calendar-blue.css" title="blue"/>

    <!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
    <link href="css/smartlender-print.css" media="print" rel="stylesheet" type="text/css" />
</head>
<%
    System.out.println("Entered viewlimitprofile.jsp page");
    OBCMSCustomer obCMSCustomer = (OBCMSCustomer) request.getAttribute("customerOb");
    String transactionID = (String) request.getAttribute("transactionID");
    long subpid =0000;
    ICMSLegalEntity legal =null;;
    String custCategory = new String();
    String custLegalConst = new String();
    String custSegment = new String();
    if (obCMSCustomer != null) {
        legal = obCMSCustomer.getCMSLegalEntity();
        subpid = obCMSCustomer.getCustomerID() ;
        if (obCMSCustomer.getNonBorrowerInd()) {
            if (obCMSCustomer.getCoBorrowerInd())
                custCategory = "Co-Borrower";
            else
                custCategory = "Non Borrower";
        } else
            custCategory = "Borrower";
        if (legal != null) {
            custSegment = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT, legal.getCustomerSegment());

        }
    } else{
        System.out.println("Creating new custSegment ");
        obCMSCustomer= new OBCMSCustomer();
    }

    OBLimitProfile limitprofile = (OBLimitProfile) request.getAttribute("limitprofileOb");


    String subprofid = Long.toString(subpid);
    String limitprofileid = null;
    if (limitprofile != null) {
        limitprofileid = Long.toString(limitprofile.getLimitProfileID());
    }

    String isiccd = "-";
    String isicdesc = "-";
    if (legal != null) {
        IISICCode isiccode[] = legal.getISICCode();
        if (isiccode != null && isiccode.length != 0) {
            for (int i = 0; i < isiccode.length; i++) {
                if (isiccode[i].getISICType() != null && isiccode[i].getISICType().equals("ISIC")) {
                    if (isiccode[i].getISICCode() != null)
                        isicdesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ISIC_CODE, isiccode[i].getISICCode().toString());
                    isiccd = isiccode[i].getISICCode().toString();
                }

            }
        }
    }else{
       legal = new OBCMSLegalEntity();
    }

    if (obCMSCustomer != null) {
        pageContext.setAttribute("customerOb", obCMSCustomer);
    }else{
      pageContext.setAttribute("customerOb", new OBCMSLegalEntity());
    }

    int rowIdx = 0;
%>
<body topmargin=1 leftmargin=5>

<html:form action="customerView.do?event=view_customer_details">

<DIV style="overflow: auto;width:750;height:600;scrollbar:true;">

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>View Customer Details</h3></td>
        <%

            String domicileCountry = "";
            List ctryLbls = (List) CountryList.getInstance().getCountryLabels();
            List ctryVals = (List) CountryList.getInstance().getCountryValues();
            String approvingOfficerGrade = "-";
            if (limitprofile != null && limitprofile.getApprovingOfficerGrade() != null
                    && !limitprofile.getApprovingOfficerGrade().equals(""))             {
                approvingOfficerGrade = limitprofile.getApprovingOfficerGrade();
            }

        %>

    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
            </thead>
            <tbody>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname" width="20%"><bean:message key="label.customer.id"/></td>
                    <td width="30%"><%=legal.getLEReference()%>&nbsp;</td>
                    <td class="fieldname" width="20%"><bean:message key="label.global.legal.name"/></td>
                    <td width="30%"><%=legal.getLegalName()%>&nbsp;</td>
                </tr>

                <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.customer.subprofile.id"/></td>
                    <td ><%=obCMSCustomer.getCustomerReference()%>&nbsp;</td>
                    <td class="fieldname"><bean:message key="label.customer.subprofile.name"/></td>
                    <td ><%=obCMSCustomer.getCustomerName()%>&nbsp;</td>
                </tr>
                <% } %>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Domicile Country</td>
                    <% for (int k = 0; k < ctryLbls.size(); k++) {
                        if ((obCMSCustomer.getDomicileCountry() != null) && (obCMSCustomer.getDomicileCountry().equals(ctryVals.get(k)))) {
                            domicileCountry = (String) ctryLbls.get(k);
                            }
                        }
                    %>
                    <td>
                        <%
                            String cty = null;
                            if (!(legal.getLegalRegCountry() == null || legal.getLegalRegCountry().equals(""))) {
                                cty = CountryList.getInstance().getCountryName(legal.getLegalRegCountry());
                            }
                        %>
                        <integro:empty-if-null value="<%=cty%>"/>&nbsp;</td>
                    <td class="fieldname">Referred (Bankcrupt, Writen-Off)</td>
                    <td><integro:boolean-display style="yn" value="<%=legal.getBlackListedInd()%>"/></td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Incorporate Country / Citizenship Country </td>
                    <td><integro:empty-if-null value="<%=cty%>"/>&nbsp;</td>
                    <td class="fieldname">ID No. (E.g. Business Reg No., IC No.)</td>
                    <td><%=legal.getLegalRegNumber()%>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Incorporate Date / Date of Birth </td>
                    <td><integro:date object="<%=legal.getIncorporateDate()%>"/>&nbsp;</td>
                    <td class="fieldname">ID Description (Personal, Corporate) </td>
                    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ID_TYPE,legal.getIDType())%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Nature of Business Code</td>
                    <td><integro:empty-if-null value="<%=isiccd%>"/></td>
                    <td class="fieldname">Relationship Start Date </td>
                    <td><integro:date object="<%=legal.getRelationshipStartDate()%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Nature of Business<!-- (ISIC)--> </td>
                    <td><integro:empty-if-null value="<%=isicdesc%>"/>&nbsp;</td>
                    <td class="fieldname">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Market Segment</td>
                    <td><integro:empty-if-null  value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT,legal.getCustomerSegment())%>"/>&nbsp;</td>
                    <td class="fieldname">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname" width="20%">Business Group</td>
                    <td><%=legal.getBusinessGroup()%>&nbsp;</td>
                    <td class="fieldname">Business Sector</td>
                    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUSSINESS_SECTOR,legal.getBusinessSector())%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Customer Type </td>
                    <td><integro:empty-if-null  value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_TYPE,legal.getCustomerType())%>"/>&nbsp;</td>
                    <td class="fieldname">Customer Legal Constitution</td>
                    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_LEGAL_CONST, legal.getLegalConstitution())%>"/>&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td>&nbsp;</td>
</tr>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            </thead>
            <tbody>
                <%
                    IContact address[] =null;
                    if (obCMSCustomer != null && obCMSCustomer.getCMSLegalEntity() != null ){
                           address= obCMSCustomer.getCMSLegalEntity().getRegisteredAddress();
                    }
                    IContact obContact = null;
                    IContact obContactOff = null;
                    if (address != null) {
                        for (int i = 0; i < address.length; i++) {
                            if (address[i].getContactType() != null && address[i].getContactType().equals(ICMSConstant.REGISTERED)) {
                                obContact = address[i];
                            }
                            if (address[i].getContactType() != null && address[i].getContactType().equals(ICMSConstant.OFFICE)) {
                                obContactOff = address[i];
                            }
                        }
                    }
                    if (obContact == null) {
                        obContact = new OBContact();
                    }
                    if (obContactOff == null) {
                        obContactOff = new OBContact();
                    }
                %>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td width="20%" class="fieldname">Address Type</td>
                    <td width="30%">Registered Address</td>
                    <td width="20%" class="fieldname">&nbsp;</td>
                    <td width="30%">&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Address (line 1)</td>
                    <td><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;</td>
                    <td class="fieldname">City</td>
                    <td><integro:empty-if-null value="<%=obContact.getCity()%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Address (line 2)</td>
                    <td><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;</td>
                    <td class="fieldname">State</td>
                    <td><integro:empty-if-null value="<%=obContact.getState()%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Postal Code</td>
                    <td><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;</td>
                    <td class="fieldname">Country</td>
                    <td>
                        <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obContact.getCountryCode())%>"/>&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td>&nbsp;</td>
</tr>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            </thead>
            <tbody>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td width="20%" class="fieldname">Address Type</td>
                    <td width="30%">Office Address</td>
                    <td width="20%" class="fieldname">&nbsp;</td>
                    <td width="30%">&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Address (line 1)</td>
                    <td><integro:empty-if-null value="<%=obContactOff.getAddressLine1()%>"/>&nbsp;</td>
                    <td class="fieldname">City</td>
                    <td><integro:empty-if-null value="<%=obContactOff.getCity()%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Address (line 2)</td>
                    <td><integro:empty-if-null value="<%=obContactOff.getAddressLine2()%>"/>&nbsp;</td>
                    <td class="fieldname">State</td>
                    <td><integro:empty-if-null value="<%=obContactOff.getState()%>"/>&nbsp;</td>
                </tr>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">Postal Code</td>
                    <td><integro:empty-if-null value="<%=obContactOff.getPostalCode()%>"/>&nbsp;</td>
                    <td class="fieldname">Country</td>
                    <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obContactOff.getCountryCode())%>"/>&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td>&nbsp;</td>
</tr>
<% if (limitprofile != null) { %>

<tr>
    <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
            </thead>
            <tbody>
                <tr class="odd">
                    <td class="fieldname" width="20%">Required AA Security Coverage (%)</td>
                    <%
                        String requiredSecurityCoverage = "";
                        String actualSecurityCoverage = "";
                        if (limitprofile.getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
                            BigDecimal bdreq = new BigDecimal(limitprofile.getRequiredSecurityCoverage()).setScale(0, BigDecimal.ROUND_HALF_UP);
                            requiredSecurityCoverage = "" + bdreq.toBigInteger().toString();
                        }
                        if (limitprofile.getActualSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
                            BigDecimal bdact = new BigDecimal(limitprofile.getActualSecurityCoverage()).setScale(0, BigDecimal.ROUND_HALF_UP);
                            actualSecurityCoverage = bdact.toBigInteger().toString();
                        }
                    %>
                    <td width="30%">100<%--<%=requiredSecurityCoverage%>--%>&nbsp;</td>

                    <td class="fieldname" width="20%">Actual AA Security Coverage (%)</td>
                    <td width="30%"><integro:empty-if-null value="<%=actualSecurityCoverage%>"/>&nbsp;</td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td>&nbsp;</td>
</tr>
</tbody>
</table>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
    </thead>
    <tbody>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="fieldname">Next Annual Review Date</td>
            <td width="30%">
                <%if (limitprofile.getNextAnnualReviewDate() != null) {%>
                    <integro:date object="<%=limitprofile.getNextAnnualReviewDate()%>"/>&nbsp;
                <%} else {%>- <%}%>
            </td>
            <td width="20%" class="fieldname">Extended Review Date</td>
            <td>
                <% if (limitprofile.getExtendedNextReviewDate() == null) { %>
                    -
                <% } else { %>
                    <integro:date object="<%=limitprofile.getExtendedNextReviewDate() %>"/>
                <% } %>
            </td>
        </tr>
    </tbody>
</table>
<% }%>


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                    <thead>
                    </thead>
                    <tbody>
                        <% rowIdx = 0; %>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">Income Range</td>
                            <td> <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INCOME_RANGE, legal.getIncomeRange())%>"/>&nbsp;</td>
                            <td class="fieldname" width="20%">TFA Amount </td>
                            <td width="30%"><integro:empty-if-null value="<%=legal.getTFAAmount()%>"/>&nbsp;</td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">Country of Permanent Residence</td>
                            <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName( legal.getCountryPR() )%>"/>&nbsp;</td>
                            <td class="fieldname">Old ID No. </td>
                            <td><integro:empty-if-null value="<%=legal.getIdOldNO()%>"/>&nbsp;</td>
                        </tr>
                    </tbody></table>
            </td></tr>
    </tbody>
</table>

<%@ include file="view_credit_rating.jsp"%>

</html:form>
    <p align="center">
    <a href="#" >
        <img  src="img/closeb.gif" name="Image42" width="70" height="20" border="0" id="Image42"   onclick="window.close();"/>
    </a>
    </p>
</div>
</body>

</html>