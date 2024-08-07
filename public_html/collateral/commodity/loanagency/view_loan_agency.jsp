<%@ page import="com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 java.util.HashMap,
                 com.integrosys.cms.ui.collateral.TimeFreqList,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.*"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/view_loan_agency.jsp,v 1.20 2006/10/27 08:31:13 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.20 $
* Date: $Date: 2006/10/27 08:31:13 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");

    String title = "View";
    if (from_event.equals(CommodityMainAction.EVENT_PREPARE_CLOSE)) {
        title = "Close";
    }
    LoanAgencyForm aForm = (LoanAgencyForm)request.getAttribute("LoanAgencyForm");
    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");
    HashMap limitMap = (HashMap)trxValueMap.get("stageLimit");
    HashMap limitList = (HashMap)trxValueMap.get("limitList");
    FacilityTypeList facTypeList = FacilityTypeList.getInstance();
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

<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.title.view.commodity"/></h3></td>
    </tr>
    <tr>
    <td>
      <h3><bean:message key="label.security.syndicate.facility "/> - <%=title%></h3>
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
        <td width="20%" class="fieldname"><bean:message key="label.security.id"/>&nbsp;<font color="#0000FF">* </font></td>
        <td colspan="3"><bean:write name="LoanAgencyForm" property="securityID"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.limit.id"/>/<br><bean:message key="label.limit.approved.limit"/>/<br><bean:message key="label.agreement.product.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>  <br>
          <%        String[] limitIDList = aForm.getLimitID();
                    String style = "";
          %>
            <html:select property="limitID" style="<%=style%>" multiple="true" size="5" disabled="true">
            <%  if (limitIDList != null) {
                for (int i = 0; i < limitIDList.length; i++) {
                	ICollateralLimitMap colLimitMap = (ICollateralLimitMap)limitMap.get(limitIDList[i]);
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
          %>
            <html:select disabled="true" property="selectedLimitID" style="<%=style%>" multiple="true" size="5">
            <%  if (selectedLimitIDList != null) {
                for (int i = 0; i < selectedLimitIDList.length; i++) {
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
          <td class="fieldname"><bean:message key="label.security.col.agent.name"/></td>
          <td><integro:wrapper value="<%=aForm.getColAgentName()%>" lineLength="40"/>&nbsp;</td>
          <td width="20%" class="fieldname"><bean:message key="label.security.admin.agent.name"/></td>
          <td width="30%"><integro:wrapper value="<%=aForm.getAdminAgentName()%>" lineLength="40"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.doc.agent"/></td>
          <td><integro:wrapper value="<%=aForm.getDocumentAgent()%>" lineLength="40"/>&nbsp;</td>
          <td  class="fieldname"><bean:message key="label.security.lc.issue.bank"/></td>
          <td><integro:wrapper value="<%=aForm.getLcIssuingBank()%>" lineLength="40"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td height="64" class="fieldname">
            <p><bean:message key="label.security.borrower.obligor"/></p>
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
        <tr class="odd">
          <td height="64" class="fieldname">
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
          <td style="border-left:0"><bean:message key="label.security.guarantor.list"/><br />
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
        <tr class="even">
        <td class="fieldname"><bean:message key="label.security.multiple.currancy"/></td>
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
        <td class="fieldname"><bean:message key="label.currency "/></td>
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
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.global.amount"/></td>
          <td><bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="globalAmountAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.facilitytype.title"/></td>
          <td><integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(aForm.getFacilityType())%>"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.facility.commitment.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facCommitmentDate"/>&nbsp;
          </td>
          <td class="fieldname"><bean:message key="label.security.facility.effective.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facEffectiveDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.facility.maturity.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facMaturityDate"/>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.security.facility.termination.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="facTerminationDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.last.date.issue.lc"/></td>
          <td><bean:write name="LoanAgencyForm" property="lastDateIssueLC"/>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.security.final.lc.maturity.date"/></td>
          <td><bean:write name="LoanAgencyForm" property="finalLCMaturityDate"/>&nbsp;</td>
          </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.type.transaction"/> </td>
          <td><integro:empty-if-null value="<%=TrxTypeList.getInstance().getTrxTypeItem(aForm.getTransactionType())%>"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.name.counsel.agent.bank"/></td>
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
      <h3><a name="Settlement" id="Settlement"></a><bean:message key="label.security.sub.limit.details"/></h3>
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
            String[] subLimitID = aForm.getSubLimitID();
            String[] subLimitCcy = aForm.getSubLimitCcy();
            String[] subLimitAmt = aForm.getSubLimitAmt();
            String[] subLimitFacType = aForm.getSubLimitFacType();
            if (subLimitID == null || subLimitID.length == 0) {
        %>
        <tr class="odd"><td colspan="4">There is no sub limit details.</td></tr>
        <%
            } else {
                for (int i = 0; i < subLimitID.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="4%"><%=i + 1%></td>
          <td width="29%"><integro:empty-if-null value="<%=subLimitCcy[i]%>"/>&nbsp;</td>
          <td width="38%"><integro:empty-if-null value="<%=subLimitAmt[i]%>"/>&nbsp;</td>
          <td width="29%"  align="center">
          <integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(subLimitFacType[i])%>"/>&nbsp;
          </td>
        </tr>
        <% } } %>
        <tr class="total">
          <td style="text-align:center" width="4%" class="total">&nbsp;</td>
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
      <h3><a name="Settlement" id="Settlement"></a><bean:message key="label.security.participant.detail"/></h3>
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
            String[] participantID = aForm.getParticipantID();
            String[] participant = aForm.getParticipant();
            String[] allocatedAmt = aForm.getAllocatedAmt();
            String[] percentageAmt = aForm.getPercentageAmt();
            String[] pricing = aForm.getPricing();
            if (participantID == null || participantID.length == 0) {
        %>
        <tr class="odd"><td colspan="5">There is no particpant.</td></tr>
        <%
            } else {
                for (int i = 0; i < participantID.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="3%"><%=i + 1%></td>
          <td width="25%"><integro:empty-if-null value="<%=participant[i]%>"/>
          </td>
          <td width="23%">
            <bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;
            <integro:empty-if-null value="<%=allocatedAmt[i]%>"/>
          </td>
          <td  width="20%"><integro:empty-if-null value="<%=percentageAmt[i]%>"/>&nbsp;
          </td>
          <td width="29%">
          <integro:wrapper lineLength="35" value="<%=pricing[i]%>"/>&nbsp;
          </td>
        </tr>
        <% } } %>
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
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      <tr class="odd">
      <td class="fieldname" width="20%"><bean:message key="label.security.instalment.type"/></td>
      <td colspan="4">
      <%
          ynValue = null;
          boolean isEqual = false;
          if (aForm.getInstalmentEqualType() != null) {
              if (aForm.getInstalmentEqualType().equals(ICMSConstant.TRUE_VALUE)) {
                  ynValue = "Equal Instalments";
                  isEqual = true;
              } else {
                  ynValue = "Non-Equal Instalments";
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
          <td class="fieldname" width="20%"><bean:message key="label.security.principal.amt"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="equalPrinAmtVal"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.num.instalment"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="equalNoInstalments"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%"><bean:message key="label.security.amt.instalment"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalAmtPerInstalments"/>&nbsp;
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.pymt.freq"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td width="21%"><integro:empty-if-null value="<%=PaymentFreqList.getInstance().getPaymentFreqItem(aForm.getEqualPaymentFreq())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.first.pymt.date"/>
          <%if(isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalFirstPaymentDate"/>&nbsp;
          </td>
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="21%">&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">
            <p><bean:message key="label.security.pymt.schedule"/></p>
            <%
                if(isEqual) {
            %>
            <p><a href="#" onclick="viewPaymentSchedule()"><bean:message key="label.security.view.pymt.schedule"/></a></p>
            <% } %>
          </td>
          <td width="19%"><b><bean:message key="label.security.pymt.date"/></b><br>
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
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=principalDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.interest.due"/></b><br>
          <%
              String[] interestDue = aForm.getEqualInterestAmt();
              if (interestDue != null) {
                  for (int i = 0;  i < 4 && i < interestDue.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=interestDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="21%"><b><bean:message key="label.security.total.payment.due"/></b><br>
          <%
              String[] totalPayment = aForm.getEqualTotalPayment();
              if (totalPayment != null) {
                  for (int i = 0;  i < 4 && i < totalPayment.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=totalPayment[i]%>"/><br/>
          <%  } } %>
          </td>
        </tr>
        <thead>
        <tr class="odd">
          <td class="fieldname" colspan="5"><bean:message key="label.security.non.equal.instalment"/></td>
        </tr>
        </thead>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.principal.amt"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="nonEqPrinAmtVal"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.num.instalment"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="nonEqNoInstalments"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.pymt.freq"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td colspan="2"><integro:empty-if-null value="<%=PaymentFreqList.getInstance().getPaymentFreqItem(aForm.getNonEqPaymentFreq())%>"/>&nbsp;
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.first.pymt.date"/>
          <%if(!isEqual){%>
          &nbsp;<font color="#0000FF">* </font>
          <%}%>
          </td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="nonEqFirstPaymentDate"/>&nbsp;
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">
            <p>Payment Date(s)<br>
            </p>
            <%
                if (!isEqual) {
            %>
            <p><a href="#" onclick="viewPaymentSchedule()"><bean:message key="label.security.view.pymt.schedule"/></a></p>
            <% } %>
            </td>
          <td width="19%"><b>Payment Dates</b><br>
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
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=principalDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="20%"><b>A<bean:message key="label.security.amount.interest.due"/></b><br>
          <%
              interestDue = aForm.getNonEqInterestAmt();
              if (interestDue != null) {
                  for (int i = 0;  i < 4 && i < interestDue.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=interestDue[i]%>"/><br/>
          <%  } } %>
          </td>
          <td width="21%"><b><bean:message key="label.security.total.payment.due"/></b><br>
          <%
              totalPayment = aForm.getNonEqTotalPayment();
              if (totalPayment != null) {
                  for (int i = 0;  i < 4 && i < totalPayment.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=totalPayment[i]%>"/><br/>
          <%  } } %>
          </td>
        </tr>
        <thead>
        <tr class="odd">
          <td class="fieldname" colspan="5"><bean:message key="label.security.debt.rate"/></td>
        </tr>
        </thead>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.debt.rate.percent"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="debtRate"/>&nbsp;
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.cal.base"/></td>
          <td width="21%"><bean:write name="LoanAgencyForm" property="calculateBase"/>&nbsp;
            Days </td>
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
          <td class="fieldname"><bean:message key="label.security.term.out.option"/></td>
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
          <td width="20%" class="fieldname">Prepayment Option</td>
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
          <td class="fieldname"><bean:message key="label.security.prepymt.min.amt"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="prePaymentMinCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="prePaymentMinAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.prepymt.penality"/></td>
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
          <td class="fieldname"><bean:message key="label.security.num.day.notice"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="numDayNotice"/>&nbsp;
          </td>
          <td class="fieldname"><bean:message key="label.security.govern.law"/></td>
          <td><bean:write name="LoanAgencyForm" property="governingLaw"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.interest.period"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="interestDuration"/>&nbsp;
          <integro:empty-if-null value="<%=TimeFreqList.getInstance().getTimeFreqItem(aForm.getInterestDurationUnit())%>"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.max.num.loan.outstanding"/></td>
          <td><bean:write name="LoanAgencyForm" property="maxLoanOutstanding"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.drawdwn.amt.allowed"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="minDrawdownAllowCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="minDrawdownAllowAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.drawndwn.amt.allowed.max"/></td>
          <td><bean:write name="LoanAgencyForm" property="maxDrawdownAllowCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="maxDrawdownAllowAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.num.drawdwn.allowed.min"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="minNumDrawdownAllow"/>&nbsp;
          </td>
          <td class="fieldname"><bean:message key="label.security.num.drawdwn.allowed.max"/></td>
          <td><bean:write name="LoanAgencyForm" property="maxNumDrawdownAllow"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">A<bean:message key="label.security.assignmnt.fee.min"/></td>
          <td valign="middle" colspan="2">
          <bean:write name="LoanAgencyForm" property="minAssignmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="minAssignmentFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.assignmnt.fee.max "/></td>
          <td valign="middle" >
          <bean:write name="LoanAgencyForm" property="maxAssignmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="maxAssignmentFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td  valign="middle" class="fieldname"><bean:message key="label.security.consent.frm.borrower"/></td>
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
          <td class="fieldname"><bean:message key="label.security.majority.lender.consent.percent"/></td>
          <td valign="middle"  >
          <bean:write name="LoanAgencyForm" property="majorityLendConsent"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td  valign="middle" class="fieldname"><bean:message key="label.security.default.rate"/></td>
          <td valign="middle" colspan="2">
          <bean:write name="LoanAgencyForm" property="defaultRate"/>&nbsp;
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tbody> </tbody>
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
          <td class="fieldname"><bean:message key="label.security.agency.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="agencyFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="agencyFeeAmt"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.closing.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="closingFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="closingFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.commitmnt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="commitmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="commitmentFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.facility.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="facilityFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="facilityFeeAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.upfornt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="upfrontFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="upfrontFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.lc.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="lcFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="lcFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.amendmnt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="amendmentFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="amendmentFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.extension.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="extensionFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="extensionFeeAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.arrangemnt.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="arrangementFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="arrangementFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.other.fee"/></td>
          <td><bean:write name="LoanAgencyForm" property="otherFeeCcy"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="otherFeeAmt"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br/>
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