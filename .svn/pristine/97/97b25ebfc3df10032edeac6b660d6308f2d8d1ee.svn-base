<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,                                  
                 com.integrosys.cms.ui.collateral.document.docdoa.DocDoAForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.deedassignment.IDeedAssignment,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
				 java.text.SimpleDateFormat"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/document/docdoa/docdoa_read_helper.jsp,v 1.2 2007/03/15 16:43:45 Jerlin Exp $
    *
    * Purpose: Helper page of read and process of the Collateral
    * Description: Type - Document, Subtype - Deed of Assignment
    *
    * @author $Author: Jerlin $<br>
    * @version $Revision: 1.2 $
    * Date: $Date: 2007/03/15 16:43:45 $
    * Tag: $Name:  $
    */
%>

<%
    IDeedAssignment oldCollateral = (IDeedAssignment)itrxValue.getCollateral();
    IDeedAssignment newCollateral = (IDeedAssignment)itrxValue.getStagingCollateral();

    String action = "docdoa.DocDoAAction";
    String formName = "DocDoAForm";
    DocDoAForm aForm = (DocDoAForm)request.getAttribute(formName);
    String prefix = "Doc";
    String subtype = "DocDoA";
    String formActionName = subtype + "Collateral.do";
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/locale.jsp"%> 
  <tbody>
    <tr>
      <td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
            <%
                ILimitCharge[] limit = iCol.getLimitCharges();
                ILimitCharge objLimit = null;
                if (limit != null && limit.length > 0) {
                    objLimit = limit[0];
                }
                ILimitCharge oldLimit = null;
                ILimitCharge newLimit = null;
                if (isProcess) {
                    if (oldCollateral != null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                        oldLimit = oldCollateral.getLimitCharges()[0];
                    }

                    if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                        newLimit = newCollateral.getLimitCharges()[0];
                    }
                }
                boolean isLimitNull = (objLimit == null);
            %>

           <%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /></td>
				<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
			</tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.charge.type"/>&nbsp;
                	<span class="mandatory">*</span></td>
				<td><% if (!isLimitNull) { %>
						<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
					<% } %>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"deedAssignmtTypeCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.type.assignment"/>&nbsp;</td>
				<td>
				<integro:common-code
					categoryCode="<%=CategoryCodeConstant.Type_Of_Assignment%>"
					entryCode="<%=iCol.getDeedAssignmtTypeCode()%>"
					display="true" />
				</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.maturity.date"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"issuer")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.issuing.bank"/></td>
                <td><integro:empty-if-null value="<%=iCol.getIssuer()%>"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"awardedDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.doa"/>&nbsp;<span class="mandatory">*</span></td>
				<td><integro:date object="<%=iCol.getAwardedDate()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.deed.assignment.date"/>&nbsp;
                	<span class="mandatory">*</span></td>
				<td><integro:date object="<%=iCol.getDocumentDate()%>" />&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"referenceNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.ref.no"/></td>
				<td><integro:empty-if-null value="<%=iCol.getReferenceNo()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDocumentAmount(),((oldCollateral==null)?null:oldCollateral.getDocumentAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.doc.amt"/>&nbsp;
                	<span class="mandatory">*</span></td>
				<td><bean:write name="DocDoAForm" property="amountLetter"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMinAmount(),((oldCollateral==null)?null:oldCollateral.getMinAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.amt.min"/>&nbsp;</td>
				<td><bean:write name="DocDoAForm" property="minAmount"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMaxAmount(),((oldCollateral==null)?null:oldCollateral.getMaxAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.amt.max"/>&nbsp;</td>
				<td><bean:write name="DocDoAForm" property="maxAmount"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLetterInstruct")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.irr.loi"/>&nbsp;</td>
				<td>
                <%
                  if (iCol.getIsLetterInstruct() == true) {
                %>
                Yes &nbsp;&nbsp;
                <%
                  } else if (iCol.getIsLetterInstruct() == false) {
                %>
                No &nbsp;&nbsp;
                <%
                  } else {
                %>
                &nbsp;&nbsp;
                <% } %> </td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLetterUndertake")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.lou"/>&nbsp;</td>
				<td>
                <%
                  if (iCol.getIsLetterUndertake() == true) {
                %>
					Yes &nbsp;&nbsp;
                <%
                  } else if (iCol.getIsLetterUndertake() == false) {
                %>
					No &nbsp;&nbsp;
                <%
                  } else {
                %>
					&nbsp;&nbsp;
                <% } %> </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"projectName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.prj.name"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=iCol.getProjectName()%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"blanketAssignment")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.blanket.assignment"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=iCol.getBlanketAssignment()%>"/>&nbsp;</td>
            </tr>

			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
				
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"projectName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.prj.name"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=iCol.getProjectName()%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"blanketAssignment")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.blanket.assignment"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=iCol.getBlanketAssignment()%>"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"contractNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.contract.number"/></span></td>
				<td><integro:wrapper value="<%=iCol.getContractNumber()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"contractName")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.contract.name"/></span></td>
				<td><integro:wrapper value="<%=iCol.getContractName()%>" />&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"contractAmt")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.contract.amount"/></span></td>
				<td><bean:write name="DocDoAForm" property="contractAmt"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"contractDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.contract.date"/></span></td>
				<td><%=(iCol.getContractDate()==null) ? "-" : (new SimpleDateFormat("dd/MMM/yyyy").format(iCol.getContractDate()))%></td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDesc")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
				<td colspan="3"><integro:wrapper value="<%=iCol.getDocumentDesc()%>" />&nbsp;</td>
            </tr>

          <%-- <%@ include file="/collateral/common/view_security_instrument.jsp" %> --%>

          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<br>
<%@ include file="/collateral/common/view_netRV.jsp" %>

<%--<%@ include file="/collateral/secapportion/view_apportion_summary.jsp" %>--%>
