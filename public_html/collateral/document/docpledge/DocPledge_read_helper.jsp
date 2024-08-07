<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.collateral.document.docpledge.DocPledgeForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.pledge.IPledge,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.YesNoList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 java.lang.reflect.Method,
                 java.lang.reflect.Proxy,
                 java.lang.reflect.InvocationHandler,
				 java.text.SimpleDateFormat"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    *
    * Purpose: Helper page of read and process of the Collateral
    * Description: Type - Document, Subtype - Negative Pledge
    *
    * @author $Author: jerlin $<br>
    * @version $Revision: 1.1 $
    * Date: $Date: 2007/March/15 $
    * Tag: $Name:  $
    */
%>
<%
    IPledge oldCollateral = (IPledge)itrxValue.getCollateral();
   	IPledge newCollateral = (IPledge)itrxValue.getStagingCollateral();

    String action = "docpledge.DocPledgeAction";
    String formName = "DocPledgeForm";
    String prefix = "Doc";
    String subtype = "DocPledge";
    String formActionName = subtype + "Collateral.do";

    DocPledgeForm aForm = (DocPledgeForm)request.getAttribute(formName);
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/locale.jsp"%>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
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
				<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.charge.type"/>&nbsp;
                  	<span class="mandatory">*</span></td>
				<td><% if (!isLimitNull) { %>
						<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
					<% } %>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
			</tr>
			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.maturity.date"/>&nbsp;
					<span class="mandatoryPerfection">*</span></td>
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
					<bean:message key="label.security.negative.pledge.date"/>&nbsp;
              		<span class="mandatory">*</span></td>
				<td><integro:date object="<%=iCol.getDocumentDate()%>" />&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"referenceNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.ref.no"/></td>
				<td><integro:empty-if-null value="<%=iCol.getReferenceNo()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDocumentAmount(),(oldCollateral==null?null:oldCollateral.getDocumentAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.doc.amt"/>&nbsp;
              		<span class="mandatory">*</span></td>
				<td><bean:write name="DocPledgeForm" property="amountLetter"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMinAmount(),(oldCollateral==null?null:oldCollateral.getMinAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.amt.min"/>&nbsp;</td>
				<td><bean:write name="DocPledgeForm" property="minAmount"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMaxAmount(),(oldCollateral==null?null:oldCollateral.getMaxAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.amt.max"/>&nbsp;</td>
				<td><bean:write name="DocPledgeForm" property="maxAmount"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLetterInstruct")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.irr.loi"/>&nbsp;</td>
				<td><%
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
					<% } %></td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLetterUndertake")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.lou"/>&nbsp;</td>
				<td><%
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
					<% } %></td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"projectName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.prj.name"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=iCol.getProjectName()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"blanketAssignment")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.prj.name.ba"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=iCol.getBlanketAssignment()%>" />&nbsp;</td>
            </tr>

			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
				
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /></td>
				<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
				<td class="fieldname"> &nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDesc")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
				<td colspan="3"><integro:wrapper value="<%=iCol.getDocumentDesc()%>" lineLength="60"/>&nbsp;</td>
            </tr>

           <%--<%@ include file="/collateral/common/view_security_instrument.jsp" %>--%>

          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>
<%@ include file="/collateral/common/view_netRV.jsp" %>

