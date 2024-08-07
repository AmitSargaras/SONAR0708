<%@ page import="com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.TimeFreqList,
                 java.util.*,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.collateral.bus.type.commodity.*,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.math.BigDecimal,
                 com.integrosys.cms.app.common.util.CommonUtil"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/chk_view_loan_agency.jsp,v 1.28 2006/10/27 08:31:13 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.28 $
* Date: $Date: 2006/10/27 08:31:13 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");

    String title = "View";
    String actualSecID = (String)request.getAttribute("actualSecID");
    String stageSecID = (String)request.getAttribute("stageSecID");

    LoanAgencyForm aForm = (LoanAgencyForm)request.getAttribute("LoanAgencyForm");
    ILoanAgency actual = (ILoanAgency) request.getAttribute("actualLoanAgency");
    ILoanAgency staging = (ILoanAgency) request.getAttribute("stageLoanAgency");
    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");
    ILoanAgency loanAgencyObj = (ILoanAgency)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.serviceLoanAgency");
    HashMap limitMap = (HashMap)trxValueMap.get("stageLimit");
    HashMap limitList = (HashMap)trxValueMap.get("limitList");
    FacilityTypeList facTypeList = FacilityTypeList.getInstance();
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage() {
    document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

function viewSecurityDoc() {
    document.forms[0].event.value="<%=LoanAgencyAction.EVENT_VIEW_SECURITY_DOC%>";
    document.forms[0].submit();
}


function viewPaymentSchedule() {
    document.forms[0].event.value="<%=LoanAgencyAction.EVENT_VIEW_NON_EQUAL_PAYMENT%>";
    document.forms[0].submit();
}

//-->
</script>

</head>
<body>
<html:form action="LoanAgency.do">
<input type="hidden" name="event" value="<%=LoanAgencyAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.title.view.commodity"/></h3></td>
    </tr>
    <tr>
    <td>
      <h3><bean:mesage key="label.security.syndicate.facility"/> - <%=title%></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
        <%
            boolean isSecSame = false;
            if (actualSecID != null && stageSecID != null &&
                    actualSecID.equals(stageSecID)) {
                isSecSame = true;
            }
        %>
        <td width="20%" class="<%=isSecSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.id"/>&nbsp;<font color="#0000FF">* </font></td>
        <td colspan="3"><bean:write name="LoanAgencyForm" property="securityID"/>&nbsp;</td>
        </tr>
        <tr class="odd">
        <%  System.out.println("here... 1");
        	ILoanLimit[] actualLimit = null;
            if (actual != null) {
                if (actual.getLimitIDs() != null) {
                    actualLimit = actual.getLimitIDs();
                }
            }
            ILoanLimit[] stageLimit = null;
            if (staging != null) {
                if (staging.getLimitIDs() != null) {
                    stageLimit = staging.getLimitIDs();
                }
            }
            boolean isSame = true;
            if (actualLimit != null && actualLimit.length > 0 &&
                    (stageLimit == null || stageLimit.length == 0)) {
                isSame = false;
            } else if (stageLimit != null && stageLimit.length > 0 &&
                    (actualLimit == null || actualLimit.length == 0)) {
                isSame = false;
            } else if (stageLimit != null && actualLimit != null) {
                if (stageLimit.length != actualLimit.length) {
                    isSame = false;
                } else {
                    for (int i = 0; isSame && i < stageLimit.length; i++) {
                        if (stageLimit[i].getLimitID() != actualLimit[i].getLimitID()) {
                            isSame = false;
                        }
                    }
                }
            }
            System.out.println("here... 2");
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.limit.id"/>/<br><bean:message key="label.limit.approved.limit"/>/<br><bean:message key="label.agreement.product.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>  <br>
          <%        String[] limitIDList = aForm.getLimitID();
                    String style = "";
                    if (limitIDList == null || limitIDList.length == 0) {
                        style = "width:100%";
                    }
          %>
            <html:select property="limitID" style="<%=style%>" multiple="true" size="5" disabled="true">
            <%  if (limitIDList != null) {
                for (int i = 0; i < limitIDList.length; i++) {
					ICollateralLimitMap colLimitMap = (ICollateralLimitMap)limitMap.get(limitIDList[i]);
					System.out.println("here... 3");
					Amount approvedLimitAmt = null;
					long limitID = 0;
					if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER)) {
						ILimit limit = (ILimit)limitList.get(limitIDList[i]);
						approvedLimitAmt = limit.getApprovedLimitAmount();
						limitID = colLimitMap.getSCILimitID();
					} else if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER)) {
						ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitIDList[i]);
						approvedLimitAmt = colmt.getApprovedLimitAmount();
						limitID = colLimitMap.getSCICoBorrowerLimitID();
					}					
					System.out.println("here... 4");
            %>
            <option value="<%=limitIDList[i]%>">
                    <%=limitID%>&nbsp;(
                    <% if (approvedLimitAmt != null && approvedLimitAmt.getCurrencyCode() != null) { %>
                    <integro:currency amount="<%=approvedLimitAmt%>"/>
                    <% } %> ) -
                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, colLimitMap.getLimitType())%>"/>
            </option>
            <% } } %>
            </html:select>
          </td>
          <td valign="middle" style="border-left:0;border-right:0;text-align:center">
              <input name="Button" type="button" disabled class="btnNormal" style="width:80" onClick="moveDualList(limitID,selectedLimitID, false )" value="Add&gt;&gt;"/>
                <br/> <br/>
              <input name="Button" type="button" disabled class="btnNormal" style="width:80" onClick="moveDualList(selectedLimitID,limitID,false )" value="&lt;&lt;Remove"/>
          </td>
          <td width="30%"><br>
          <%        String[] selectedLimitIDList = aForm.getSelectedLimitID();
                    style = "";
                    if (selectedLimitIDList == null || selectedLimitIDList.length == 0) {
                        style = "width:100%";
                    }
          %>
            <html:select disabled="true" property="selectedLimitID" style="<%=style%>" multiple="true" size="5">
            <%  if (selectedLimitIDList != null) {
                for (int i = 0; i < selectedLimitIDList.length; i++) {
                System.out.println("here... 5");
					ICollateralLimitMap colLimitMap = (ICollateralLimitMap)limitMap.get(selectedLimitIDList[i]);
					Amount approvedLimitAmt = null;
					long limitID = 0;
					if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER)) {
						ILimit limit = (ILimit)limitList.get(selectedLimitIDList[i]);
						approvedLimitAmt = limit.getApprovedLimitAmount();
						limitID = colLimitMap.getSCILimitID();
					} else if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER)) {
						ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(selectedLimitIDList[i]);
						approvedLimitAmt = colmt.getApprovedLimitAmount();
						limitID = colLimitMap.getSCICoBorrowerLimitID();
					}					
					System.out.println("here... 6");
            %>
            <option value="<%=selectedLimitIDList[i]%>">
                    <%=limitID%>&nbsp;(
                    <% if (approvedLimitAmt != null && approvedLimitAmt.getCurrencyCode() != null) { %>
                    <integro:currency amount="<%=approvedLimitAmt%>"/>
                    <% } %> ) -
                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, colLimitMap.getLimitType())%>"/>
            </option>
            <% } } %>
            </html:select>
          </td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "collateralAgentName")?"fieldname":"fieldnamediff"%>">Collateral Agent Name</td>
          <td><integro:wrapper value="<%=aForm.getColAgentName()%>" lineLength="40"/>&nbsp;</td>
          <td width="20%" class="<%=CompareOBUtil.compOB(staging, actual, "administrativeAgentName")?"fieldname":"fieldnamediff"%>">Administrative Agent Name</td>
          <td width="30%"><integro:wrapper value="<%=aForm.getAdminAgentName()%>" lineLength="40"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "documentAgent")?"fieldname":"fieldnamediff"%>">Documentation Agent</td>
          <td><integro:wrapper value="<%=aForm.getDocumentAgent()%>" lineLength="40"/>&nbsp;</td>
          <td  class="<%=CompareOBUtil.compOB(staging, actual, "lCIssuingBank")?"fieldname":"fieldnamediff"%>">L/C issuing Bank</td>
          <td><integro:wrapper value="<%=aForm.getLcIssuingBank()%>" lineLength="40"/>&nbsp;</td>
        </tr>
        <%
            IBorrower[] actualBorrower = null;
            IBorrower[] stageBorrower = null;
            isSame = true;
            if (actual != null) {
                actualBorrower = actual.getBorrowers();
            }
            if (staging != null) {
                stageBorrower = staging.getBorrowers();
            }
            if (actualBorrower != null && actualBorrower.length > 0 &&
                    (stageBorrower == null || stageBorrower.length == 0)) {
                isSame = false;
            } else if (stageBorrower != null && stageBorrower.length > 0 &&
                    (actualBorrower == null || actualBorrower.length == 0)) {
                isSame = false;
            } else if (stageBorrower != null && actualBorrower != null) {
                if (stageBorrower.length != actualBorrower.length) {
                    isSame = false;
                } else {
                    for (int i = 0; isSame && i < stageBorrower.length; i++) {
                        if (!stageBorrower[i].getName().equals(actualBorrower[i].getName())) {
                            isSame = false;
                        }
                    }
                }
            }
        %>
        <tr class="even">
          <td height="64" class="<%=isSame?"fieldname":"fieldnamediff"%>">
            <p>Borrower/Obligor</p>
            <p>&nbsp; </p>
          </td>
          <td valign="middle" style="border-left:0;border-right:0" class="even">
            <html:text property="borrower" maxlength="150" size="30" disabled="true"/>
          </td>
          <td  valign="middle" style="border-left:0;border-right:0;text-align:left">
            <input type="button" name="Button2" value="Add&gt;&gt;" style="width:80" disabled onClick="addTextArea(borrower,borrowerList)" class="word"/>
            <br/>
            <br/>
            <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" disabled onClick="delOption(borrowerList)" class="word"/>
          </td>
          <td style="border-left:0">Borrower/Obligor List<br />
            <%
                String[] borrowerList = aForm.getBorrowerList();
                style = "";
                if (borrowerList == null) {
                    style = "width:100%";
                }
            %>
              <html:select property="borrowerList" size="5" multiple="true" disabled="true" style="<%=style%>">
          <%

              if (borrowerList != null) {
                  for (int i = 0; i < borrowerList.length; i++) {
          %>
                <option value="<%=borrowerList[i]%>"><%=borrowerList[i]%></option>
          <% } } %>
            </html:select>
          </td>
        </tr>
        <%
            IGuarantor[] actualGuarantor = null;
            IGuarantor[] stageGuarantor = null;
            isSame = true;
            if (actual != null) {
                actualGuarantor = actual.getGuarantors();
            }
            if (staging != null) {
                stageGuarantor = staging.getGuarantors();
            }
            if (actualGuarantor != null && actualGuarantor.length > 0 &&
                    (stageGuarantor == null || stageGuarantor.length == 0)) {
                isSame = false;
            } else if (stageGuarantor != null && stageGuarantor.length > 0 &&
                    (actualGuarantor == null || actualGuarantor.length == 0)) {
                isSame = false;
            } else if (stageGuarantor != null && actualGuarantor != null) {
                if (stageGuarantor.length != actualGuarantor.length) {
                    isSame = false;
                } else {
                    for (int i = 0; isSame && i < stageGuarantor.length; i++) {
                        if (!stageGuarantor[i].getName().equals(actualGuarantor[i].getName())) {
                            isSame = false;
                        }
                    }
                }
            }
        %>
        <tr class="odd">
          <td height="64" class="<%=isSame?"fieldname":"fieldnamediff"%>">
            <p><bean:message key="label.security.guarantor"/></p>
            <p>&nbsp; </p>
          </td>
          <td valign="middle" style="border-left:0;border-right:0" class="even">
            <html:text property="guarantor" maxlength="150" disabled="true"/>
          </td>
          <td  valign="middle" style="border-left:0;border-right:0;text-align:left">
            <input type="button" name="Button2" value="Add&gt;&gt;" disabled style="width:80" onClick="addTextArea(guarantor,guarantorList)" class="word"/>
            <br/>
            <br/>
            <input type="button" name="Button" value="&lt;&lt;Remove" disabled style="width:80" onClick="delOption(guarantorList)" class="word"/>
          </td>
          <td style="border-left:0"><bean:message key="label.security.guarantor.list"/> <br />
            <%
                String[] guarantorList = aForm.getGuarantorList();
                style = "";
                if (guarantorList == null) {
                    style = "width:100%";
                }
            %>
              <html:select property="guarantorList" size="5" disabled="true" multiple="true" style="<%=style%>">
          <%

              if (guarantorList != null) {
                  for (int i = 0; i < guarantorList.length; i++) {
          %>
                <option value="<%=guarantorList[i]%>"><%=guarantorList[i]%></option>
          <% } } %>
          </html:select>
          </td>
        </tr>
        <%
            String[] actualCurrency = null;
            String[] stageCurrency = null;
            isSame = true;
            boolean isMultipleCurrSame = CompareOBUtil.compOB(staging, actual, "isMultipleCurrencies");
            if (actual != null) {
                actualCurrency = actual.getGlobalCurrencies();
            }
            if (staging != null) {
                stageCurrency = staging.getGlobalCurrencies();
            }
            if (actualCurrency != null && actualCurrency.length > 0 &&
                    (stageCurrency == null || stageCurrency.length == 0)) {
                isSame = false;
//                isMultipleCurrSame = false;
            } else if (stageCurrency != null && stageCurrency.length > 0 &&
                    (actualCurrency == null || actualCurrency.length == 0)) {
                isSame = false;
//                isMultipleCurrSame = false;
            } else if (stageCurrency != null && actualCurrency != null) {
                if (stageCurrency.length != actualCurrency.length) {
                    isSame = false;
                } else {
                    for (int i = 0; isSame && i < stageCurrency.length; i++) {
                        if (!stageCurrency[i].equals(actualCurrency[i])) {
                            isSame = false;
                        }
                    }
                }
            }
        %>

        <tr class="even">
        <td class="<%=isMultipleCurrSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.multiple.currancy"/></td>
        <td colspan="3">
        <%  String ynValue = null;
            if (aForm.getAllowMultipleCurr() != null) {
                if (aForm.getAllowMultipleCurr().equals(ICMSConstant.TRUE_VALUE)) {
                    ynValue = "Yes";
                } else if (aForm.getAllowMultipleCurr().equals(ICMSConstant.FALSE_VALUE)) {
                    ynValue = "No";
                }
            }
        %>
        <integro:empty-if-null value="<%=ynValue%>"/>
        </td>
        </tr>
        <tr class="odd">
        <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.currency "/></td>
        <td>
            <html:select property="currency" disabled="true" style="width:100%" multiple="true" size="5">
            <%
                String[] currArr = aForm.getCurrency();
                if (currArr != null) {
                    for (int i = 0; i < currArr.length; i++) {
            %>
            <option value="<%=currArr[i]%>"><integro:empty-if-null value="<%=currArr[i]%>"/></option>
            <% } }%>
            </html:select>
        </td>
        <td valign="middle" style="border-left:0;border-right:0;text-align:center">
              <input name="Button" type="button" class="btnNormal" disabled style="width:80" onClick="moveDualList(currency,selectedCurrency, false )" value="Add&gt;&gt;"/>
                <br/> <br/>
              <input name="Button" type="button" class="btnNormal" disabled style="width:80" onClick="moveDualList(selectedCurrency,currency,false )" value="&lt;&lt;Remove"/>
        </td>
        <td>
            <html:select property="selectedCurrency" style="width:100%" multiple="true" disabled="true" size="5">
            <%
                String[] currArr = aForm.getSelectedCurrency();
                if (currArr != null) {
                    for (int i = 0; i < currArr.length; i++) {
            %>
            <option value="<%=currArr[i]%>"><integro:empty-if-null value="<%=currArr[i]%>"/></option>
            <% } }%>
            </html:select>
        </td>
        </tr>
        <%
            Amount actualAmt = null;
            Amount stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getGlobalAmount();
            }
            if (staging != null) {
                stageAmt = staging.getGlobalAmount();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.global.amount"/></td>
          <td><bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="globalAmountAmt"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "facilityType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.facilitytype.title"/></td>
          <td><integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(aForm.getFacilityType())%>"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "facilityCommitmentDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.facility.commitment.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facCommitmentDate"/>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "facilityEffectiveDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.facility.effective.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facEffectiveDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "facilityMaturityDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.facility.maturity.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facMaturityDate"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "facilityTerminationDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.facility.termination.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facTerminationDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "lastDateToIssueLC")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.last.date.issue.lc"/></td>
          <td><bean:write name="LoanAgencyForm" property="lastDateIssueLC"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "finalLCMaturityDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.final.lc.maturity.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="finalLCMaturityDate"/>&nbsp;</td>
          </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "typeOfTransaction")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.type.transaction"/></td>
          <td><integro:empty-if-null value="<%=TrxTypeList.getInstance().getTrxTypeItem(aForm.getTransactionType())%>"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "agentBankCounselName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.name.counsel.agent.bank"/></td>
          <td><integro:wrapper lineLength="40" value="<%=aForm.getCounselNameAgentBank()%>"/>&nbsp;
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td>
      <h3><bean:message key="label.security.sub.limit.details"/></h3>
    </td>
    <td valign="bottom">
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="4%"><bean:message key="label.global.sn"/></td>
          <td width="29%"><bean:message key="label.currency "/></td>
          <td width="38%"><bean:message key="label.isda.deal.amount"/></td>
          <td width="29%"><bean:message key="label.facilitytype.title"/></td>
        </tr>
        </thead>
        <tbody>
        <%
            ISubLimit[] actualSubLimit = null;
            ISubLimit[] stageSubLimit = null;
            if (actual != null) {
                actualSubLimit = actual.getSubLimits();
            }
            if (staging != null) {
                stageSubLimit = staging.getSubLimits();
            }
            ArrayList list = null;
            if (actualSubLimit != null || stageSubLimit != null) {
                List res = CompareOBUtil.compOBArray(stageSubLimit, actualSubLimit);
                list = new ArrayList(res);
                pageContext.setAttribute("subLimitList",list);
            }
            if (list == null || list.size() == 0) {
        %>
        <tr class="odd"><td colspan="4">There is no sub limit details.</td></tr>
        <%
            } else {
                int counter = 0;
        %>
		<logic:present name="subLimitList" >
        <logic:iterate id="compResult" name="subLimitList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ISubLimit subLimit = (ISubLimit)compResult.getObj();
            Amount subLimitAmt = subLimit.getAmount();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" style="text-align:center" width="4%"><%=counter + 1%></td>
          <td width="29%"><integro:empty-if-null value="<%=(subLimitAmt==null)?null:subLimitAmt.getCurrencyCode()%>"/>&nbsp;</td>
          <%
              String amtStr = null;
              if (subLimit.getAmount() != null) {
                amtStr = UIUtil.formatNumber(subLimit.getAmount().getAmountAsBigDecimal(), 2, locale);
              }
          %>
          <td width="38%"><integro:empty-if-null value="<%=amtStr%>"/>&nbsp;</td>
          <td width="29%"  align="center">
          <integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(subLimit.getFacilityType())%>"/>&nbsp;
          </td>
        </tr>
        <%
            counter++;
        %>
        </logic:iterate>
        </logic:present>
        <%
            }
        %>
        <tr class="total">
          <td class="total" style="text-align:center" width="4%">&nbsp;</td>
          <td width="29%" class="total"><bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;</td>
          <td width="38%" class="total"><bean:write name="LoanAgencyForm" property="totalSubLimit"/>&nbsp;
          </td>
          <td width="29%" class="total">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td>
      <h3><bean:message key="label.security.participant.detail"/></h3>
    </td>
    <td valign="bottom">
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="25%"><bean:message key="label.security.name.participant"/></td>
          <td width="23%"><bean:message key="label.security.allocate.amt.each.participant"/></td>
          <td width="20%"><bean:message key="label.security.percentage.amt"/></td>
          <td width="29%"><bean:message key="label.security.pricing"/></td>
        </tr>
        </thead>
        <tbody>
        <%
            IParticipant[] actualParticipant = null;
            IParticipant[] stageParticipant = null;
            if (actual != null) {
                actualParticipant = actual.getParticipants();
            }
            if (staging != null) {
                stageParticipant = staging.getParticipants();
            }
            list = null;
            if (actualParticipant != null || stageParticipant != null) {
                List res = CompareOBUtil.compOBArray(stageParticipant, actualParticipant);
                list = new ArrayList(res);
                pageContext.setAttribute("participantList",list);
            }
            if (list == null || list.size() == 0) {
        %>
        <tr class="odd"><td colspan="5"><bean:message key="label.security.none.participant"/></td></tr>
        <%
            } else {
                int counter = 0;
                BigDecimal totalAllocatedAmt = null;
        %>
		<logic:present name="participantList" >
        <logic:iterate id="compResult" name="participantList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IParticipant participant = (IParticipant)compResult.getObj();
            String key = compResult.getKey();
            boolean isDeleted = false;
            if (!key.equals(CompareOBUtil.OB_DELETED)) {
                if (participant.getAllocatedAmount() != null) {
                    if (totalAllocatedAmt == null) {
                        totalAllocatedAmt = participant.getAllocatedAmount().getAmountAsBigDecimal();
                    } else {
                        totalAllocatedAmt = totalAllocatedAmt.add(participant.getAllocatedAmount().getAmountAsBigDecimal());
                    }
                }
            } else {
                isDeleted = true;
            }
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" style="text-align:center" width="3%"><%=counter + 1%></td>
          <td width="25%"><integro:empty-if-null value="<%=participant.getName()%>"/>
          </td>
          <td width="23%">
          <%
              String strAmt = null;
              BigDecimal percentageAmt = null;
              if (participant.getAllocatedAmount() != null) {
                  strAmt = UIUtil.formatNumber(participant.getAllocatedAmount().getAmountAsBigDecimal(), 2, locale);
              }
              if (loanAgencyObj.getGlobalAmount() != null) {
                  percentageAmt = CommonUtil.calcPercentage(loanAgencyObj.getGlobalAmount().getAmountAsBigDecimal(), totalAllocatedAmt);
              }
          %>
            <bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;
            <integro:empty-if-null value="<%=strAmt%>"/>
          </td>
          <%
              strAmt = null;
              if (percentageAmt != null && !isDeleted) {
                  strAmt = UIUtil.formatNumber(percentageAmt, 2, locale);
              }
          %>
          <td  width="20%"><integro:empty-if-null value="<%=strAmt%>"/>&nbsp;
          </td>
          <td width="29%">
          <integro:wrapper lineLength="35" value="<%=participant.getRemarks()%>"/>&nbsp;
          </td>
        </tr>
        <%
            counter++;
        %>
        </logic:iterate>
        </logic:present>
        <%
            }
        %>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3><bean:message key="label.security.term.loan"/></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
  <%
      boolean isInstalmentTypeSame = CompareOBUtil.compOB(staging, actual, "isEqualInstalments");
  %>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      <tr class="odd">
      <td class="<%=isInstalmentTypeSame?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.security.instalment.type"/></td>
      <td colspan="4">
      <%
          boolean isEqual = true;
          ynValue = null;
          if (aForm.getInstalmentEqualType() != null) {
              if (aForm.getInstalmentEqualType().equals(ICMSConstant.TRUE_VALUE)) {
                  ynValue = "Equal Instalments";
              } else {
                  ynValue = "Non-Equal Instalments";
                  isEqual = false;
              }
          }
      %>
      <integro:empty-if-null value="<%=ynValue%>"/>
      </td>
      </tr>
      </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
        <tr class="odd">
          <td colspan="5"><bean:message key="label.security.equal.instalment"/></td>
        </tr>
        </thead>
        <tr class="odd">
        <%  isSame = true;
            if (isEqual) {
                actualAmt = null;
                stageAmt = null;
                if (actual != null) {
                    actualAmt = actual.getPrincipleAmount();
                }
                if (staging != null) {
                    stageAmt = staging.getPrincipleAmount();
                }
                isSame = isInstalmentTypeSame && CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
                if (isSame) {
                    isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
                }
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.security.principal.amt"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="equalPrinAmtVal"/>
          </td>
          <%
              if (isEqual) {
                  isSame = isInstalmentTypeSame && CompareOBUtil.compOB(staging, actual, "numberOfInstalments");
              }
          %>
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.num.instalment"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="equalNoInstalments"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%"><bean:message key="label.security.amt.instalment"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalAmtPerInstalments"/>&nbsp;
          </td>
          <%
              if (isEqual) {
                  isSame = isInstalmentTypeSame && CompareOBUtil.compOB(staging, actual, "frequencyOfPayment");
              }
          %>
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.pymt.freq"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td width="21%"><integro:empty-if-null value="<%=PaymentFreqList.getInstance().getPaymentFreqItem(aForm.getEqualPaymentFreq())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
        <%
            if (isEqual) {
                isSame = isInstalmentTypeSame && CompareOBUtil.compOB(staging, actual, "dateOfPayment");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.security.first.pymt.date"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalFirstPaymentDate"/>&nbsp;
          </td>
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="21%">&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">
            <p><bean:message key="label.security.pym.schedule"/></p>
            <%
                if (isEqual) {
            %>
            <p>
                <a href="#" onclick="viewPaymentSchedule()"><bean:message key="label.security.view.pymt.schedule"/></a>
            </p>
            <% } %>
          </td>
          <td width="19%"><b><bean:message key="label.security.pym.date"/></b><br>
          <%
              String[] paymentDate = aForm.getEqualPaymentDate();
              if (paymentDate != null) {
                  for (int i = 0;  i < 4 && i < paymentDate.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=paymentDate[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.principal.due"/></b><br>
          <%
              String[] principalDue = aForm.getEqualPrincipalAmt();
              if (principalDue != null) {
                  for (int i = 0;  i < 4 && i < principalDue.length; i++) {
          %>
          (<%=i + 1%>)<bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;<integro:empty-if-null value="<%=principalDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.interest.due"/></b><br>
          <%
              String[] interestDue = aForm.getEqualInterestAmt();
              if (interestDue != null) {
                  for (int i = 0;  i < 4 && i < interestDue.length; i++) {
          %>
          (<%=i + 1%>)<bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;<integro:empty-if-null value="<%=interestDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="21%"><b><bean:message key="label.security.total.payment.due"/></b><br>
          <%
              String[] totalPayment = aForm.getEqualTotalPayment();
              if (totalPayment != null) {
                  for (int i = 0;  i < 4 && i < totalPayment.length; i++) {
          %>
          (<%=i + 1%>)<bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;<integro:empty-if-null value="<%=totalPayment[i]%>"/><br/>
          <%  } } %>
          </td>
        </tr>
        <thead>
        <tr class="odd">
          <td class="fieldname" colspan="5"><bean:message key="label.security.non.equal.instalment"/></td>
        </tr>
        </thead>
        <tr class="odd">
        <%  isSame = true;
            if (!isEqual) {
                actualAmt = null;
                stageAmt = null;
                if (actual != null) {
                    actualAmt = actual.getPrincipleAmount();
                }
                if (staging != null) {
                    stageAmt = staging.getPrincipleAmount();
                }
                isSame = isInstalmentTypeSame && CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
                if (isSame) {
                    isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
                }
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.security.principal.amt"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="nonEqPrinAmtVal"/>
          </td>
          <%
              if (!isEqual) {
                  isSame = isInstalmentTypeSame && CompareOBUtil.compOB(staging, actual, "numberOfInstalments");
              }
          %>
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.num.instalment"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="nonEqNoInstalments"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <%
              if (!isEqual) {
                  isSame = isInstalmentTypeSame && CompareOBUtil.compOB(staging, actual, "frequencyOfPayment");
              }
          %>
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.pymt.freq"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td colspan="2"><integro:empty-if-null value="<%=PaymentFreqList.getInstance().getPaymentFreqItem(aForm.getNonEqPaymentFreq())%>"/>&nbsp;
          </td>
        <%
            if (!isEqual) {
                isSame = isInstalmentTypeSame && CompareOBUtil.compOB(staging, actual, "dateOfPayment");
            }
        %>
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.first.pymt.date"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%></td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="nonEqFirstPaymentDate"/>&nbsp;
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">
            <p>Payment Date(s)<br>
            </p>
            <% if (!isEqual) { %>
            <p>
                <a href="#" onclick="viewPaymentSchedule()"><bean:message key="label.security.view.pymt.schedule"/></a>
            </p>
            <% } %>
            </td>
          <td width="19%"><b><bean:message key="label.security.pym.date"/></b><br>
          <%
              paymentDate = aForm.getNonEqPaymentDate();
              if (paymentDate != null) {
                  for (int i = 0;  i < 4 && i < paymentDate.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=paymentDate[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.principal.due"/></b><br>
          <%
              principalDue = aForm.getNonEqPrincipalAmt();
              if (principalDue != null) {
                  for (int i = 0;  i < 4 && i < principalDue.length; i++) {
          %>
          (<%=i + 1%>)<bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;<integro:empty-if-null value="<%=principalDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.interest.due"/></b><br>
          <%
              interestDue = aForm.getNonEqInterestAmt();
              if (interestDue != null) {
                  for (int i = 0;  i < 4 && i < interestDue.length; i++) {
          %>
          (<%=i + 1%>)<bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;<integro:empty-if-null value="<%=interestDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="21%"><b><bean:message key="label.security.total.payment.due"/></b><br>
          <%
              totalPayment = aForm.getNonEqTotalPayment();
              if (totalPayment != null) {
                  for (int i = 0;  i < 4 && i < totalPayment.length; i++) {
          %>
          (<%=i + 1%>)<bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;<integro:empty-if-null value="<%=totalPayment[i]%>"/><br/>
          <%  } } %>
          </td>
        </tr>
        <thead>
        <tr class="odd">
          <td class="fieldname" colspan="5"><bean:message key="label.security.debt.rate"/></td>
        </tr>
        </thead>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "debtRate")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.security.debt.rate.percent"/>&nbsp;<font color="#0000FF">* </font></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="debtRate"/>&nbsp;
          </td>
          <td width="20%" class="<%=CompareOBUtil.compOB(staging, actual, "calculationBaseNumberOfDays")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.cal.base"/></td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="calculateBase"/>&nbsp;
            <bean:message key="label.security.day"/> </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">
            <p><bean:message key="label.security.total.interest.due"/></p>
          </td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="totalAmtInterest"/>&nbsp;
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.total.payment.due"/></td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="totalPayment"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "isTermOutOption")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.term.out.option"/></td>
          <td colspan="2">
          <%
            ynValue = null;
              if (aForm.getTermOutOption() != null) {
                  if (aForm.getTermOutOption().equals(ICMSConstant.TRUE_VALUE)) {
                      ynValue = "Yes";
                  } else if (aForm.getTermOutOption().equals(ICMSConstant.FALSE_VALUE)) {
                      ynValue = "No";
                  }
              }
          %>
          <integro:empty-if-null value="<%=ynValue%>"/>
          </td>
          <td width="20%" class="<%=CompareOBUtil.compOB(staging, actual, "isPrepaymentOption")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.prepymt.option"/></td>
          <td>
          <%
              ynValue = null;
              if (aForm.getPrePaymentOption() != null) {
                  if (aForm.getPrePaymentOption().equals(ICMSConstant.TRUE_VALUE)) {
                      ynValue = "Yes";
                  } else if (aForm.getPrePaymentOption().equals(ICMSConstant.FALSE_VALUE)) {
                      ynValue = "No";
                  }
              }
          %>
          <integro:empty-if-null value="<%=ynValue%>"/>
          </td>
        </tr>
        <tr class="even">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getPrepaymentMinAmount();
            }
            if (staging != null) {
                stageAmt = staging.getPrepaymentMinAmount();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.prepymt.min.amt"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="prePaymentMinCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="prePaymentMinAmt"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "isPrepaymentPenalty")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.prepymt.penality"/></td>
          <td>
          <%
              ynValue = null;
              if (aForm.getPrePaymentPenalty() != null) {
                  if (aForm.getPrePaymentPenalty().equals(ICMSConstant.TRUE_VALUE)) {
                      ynValue = "Yes";
                  } else if (aForm.getPrePaymentPenalty().equals(ICMSConstant.FALSE_VALUE)) {
                      ynValue = "No";
                  }
              }
          %>
          <integro:empty-if-null value="<%=ynValue%>"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "numberOfNoticeDays")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.num.day.notice"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="numDayNotice"/>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "governingLaw")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.govern.law"/></td>
          <td><bean:write name="LoanAgencyForm" property="governingLaw"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
        <%
            isSame = CompareOBUtil.compOB(staging, actual, "interestPeriodDuration");
            if (isSame) {
                isSame = CompareOBUtil.compOB(staging, actual, "interestPeriodDurationUnit");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.interest.period"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="interestDuration"/>&nbsp;
          <integro:empty-if-null value="<%=TimeFreqList.getInstance().getTimeFreqItem(aForm.getInterestDurationUnit())%>"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "maxNumberOfLoanOutstanding")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.max.num.loan.outstanding"/></td>
          <td><bean:write name="LoanAgencyForm" property="maxLoanOutstanding"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getMinDrawdownAmountAllowed();
            }
            if (staging != null) {
                stageAmt = staging.getMinDrawdownAmountAllowed();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.drawdwn.amt.allowed.min"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="minDrawdownAllowCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="minDrawdownAllowAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getMaxDrawdownAmountAllowed();
            }
            if (staging != null) {
                stageAmt = staging.getMaxDrawdownAmountAllowed();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.drawndwn.amt.allowed.max"/></td>
          <td><bean:write name="LoanAgencyForm" property="maxDrawdownAllowCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="maxDrawdownAllowAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "minNumberOfDrawdownsAllowed")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.num.drawdwn.allowed.min"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="minNumDrawdownAllow"/>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "maxNumberOfDrawdownsAllowed")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.num.drawdwn.allowed.max"/></td>
          <td><bean:write name="LoanAgencyForm" property="maxNumDrawdownAllow"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getMinAssignmentFees();
            }
            if (staging != null) {
                stageAmt = staging.getMinAssignmentFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.assignmnt.fee.min"/></td>
          <td colspan="2">
          <bean:write name="LoanAgencyForm" property="minAssignmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="minAssignmentFeeAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getMaxAssignmentFees();
            }
            if (staging != null) {
                stageAmt = staging.getMaxAssignmentFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.assignmnt.fee.max"/></td>
          <td valign="middle" >
          <bean:write name="LoanAgencyForm" property="maxAssignmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="maxAssignmentFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
      <%
          isSame = true;
          if (actual != null && staging != null){
              isSame = (actual.getIsConsentFromBorrower() == staging.getIsConsentFromBorrower());
          } else if (actual != null) {
              isSame = (actual.getIsConsentFromBorrower() == false);
          } else if (staging != null) {
              isSame = (staging.getIsConsentFromBorrower() == false);
          }
      %>
          <td  valign="middle" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.consent.frm.borrower"/></td>
          <td colspan="2">
          <%
              ynValue = null;
              if (aForm.getBorrowerConsent() != null) {
                  if (aForm.getBorrowerConsent().equals(ICMSConstant.TRUE_VALUE)) {
                      ynValue = "Yes";
                  } else if (aForm.getBorrowerConsent().equals(ICMSConstant.FALSE_VALUE)) {
                      ynValue = "No";
                  }
              }
          %>
          <integro:empty-if-null value="<%=ynValue%>"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "majorityLendersConsent")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.majority.lender.consent.percent"/></td>
          <td valign="middle" >
          <bean:write name="LoanAgencyForm" property="majorityLendConsent"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td  valign="middle" class="<%=CompareOBUtil.compOB(staging, actual, "defaultRate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.default.rate"/></td>
          <td colspan="2" valign="middle" >
          <bean:write name="LoanAgencyForm" property="defaultRate"/>&nbsp;
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3><bean:message key="label.security.fee"/></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getAgencyFees();
            }
            if (staging != null) {
                stageAmt = staging.getAgencyFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.agency.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="agencyFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="agencyFeeAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getClosingFees();
            }
            if (staging != null) {
                stageAmt = staging.getClosingFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.closing.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="closingFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="closingFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getCommitmentFees();
            }
            if (staging != null) {
                stageAmt = staging.getCommitmentFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.commitmnt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="commitmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="commitmentFeeAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getFacilityFees();
            }
            if (staging != null) {
                stageAmt = staging.getFacilityFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.facility.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="facilityFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="facilityFeeAmt"/>
          </td>
        </tr>
        <tr class="odd">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getUpfrontFees();
            }
            if (staging != null) {
                stageAmt = staging.getUpfrontFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.upfornt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="upfrontFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="upfrontFeeAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getLCFees();
            }
            if (staging != null) {
                stageAmt = staging.getLCFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.lc.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="lcFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="lcFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getAmendmentFees();
            }
            if (staging != null) {
                stageAmt = staging.getAmendmentFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.amendmnt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="amendmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="amendmentFeeAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getExtensionFees();
            }
            if (staging != null) {
                stageAmt = staging.getExtensionFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.extension.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="extensionFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="extensionFeeAmt"/>
          </td>
        </tr>
        <tr class="odd">
        <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getArrangementFees();
            }
            if (staging != null) {
                stageAmt = staging.getArrangementFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.arrangemnt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="arrangementFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="arrangementFeeAmt"/>
          </td>
          <%
            actualAmt = null;
            stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getOtherFees();
            }
            if (staging != null) {
                stageAmt = staging.getOtherFees();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
          %>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.other.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="otherFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="otherFeeAmt"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td width="77%">
      <h3><bean:message key="label.security.title.doc.list.completed"/></h3>
    </td>
    <td align="right" valign="bottom" width="23%">
      <input name="Submit4" type="button" class="btnNormal" value="View Security Documents" onclick="viewSecurityDoc()"/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2"><bean:message key="label.security.view.sec.doc"/></td>
  </tr>
  </thead> <tbody> </tbody>
</table>

<br>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
  </tr>
  <tr>
  <td>
<a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
</td>
</tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>