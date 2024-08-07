<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,                                  
                 com.integrosys.cms.ui.collateral.document.doclou.DocLoUForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.undertaking.IUndertaking,
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
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/document/doclou/DocLoU_read_helper.jsp,v 1.42 2007/03/15 17:07:45 Jerlin Exp $
    *
    * Purpose: Helper page of read and process of the Collateral
    * Description: Type - Document, Subtype - Letter of Undertaking
    *
    * @author $Author: Jerlin $<br>
    * @version $Revision: 1.42 $
    * Date: $Date: 2007/03/15 17:07:45 $
    * Tag: $Name:  $
    */
%>
<%
    IUndertaking oldCollateral = (IUndertaking)itrxValue.getCollateral();
    IUndertaking newCollateral = (IUndertaking)itrxValue.getStagingCollateral();
    String action = "doclou.DocLoUAction";
    String formName = "DocLoUForm";
    DocLoUForm aForm = (DocLoUForm)request.getAttribute(formName);
    String prefix = "Doc";
    String subtype = "DocLoU";
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
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /></td>
				<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.letter.undertaking.date"/>&nbsp;
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
              <td><bean:write name="DocLoUForm" property="amountLetter"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMinAmount(),((oldCollateral==null)?null:oldCollateral.getMinAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.amt.min"/>&nbsp;</td>
              <td><bean:write name="DocLoUForm" property="minAmount"/>&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMaxAmount(),((oldCollateral==null)?null:oldCollateral.getMaxAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.amt.max"/>&nbsp;</td>
              <td><bean:write name="DocLoUForm" property="maxAmount"/>&nbsp;</td>
            </tr>

			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
				
            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDesc")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.spec.undertaking"/></td>
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

<%-- <%@ include file="/collateral/secapportion/view_apportion_summary.jsp" %>--%>
