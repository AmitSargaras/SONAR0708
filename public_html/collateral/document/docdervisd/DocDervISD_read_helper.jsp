<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.ui.collateral.document.docdervisd.DocDervISDForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.document.subtype.fxisda.IFXISDA,
                 com.integrosys.cms.ui.collateral.document.docdervisd.ISDAProductList,
                 com.integrosys.cms.ui.collateral.document.docdervisd.IFEMAProductList,
                 com.integrosys.cms.ui.collateral.document.docdervisd.ICOMProductList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
				 java.text.SimpleDateFormat"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/document/docdervisd/DocDervISD_read_helper.jsp,v 1.45 2007/03/15 16:12:07 Jerlin Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Document, Subtype - FX-Derivative-ISDA_FEMA
*
* @author $Author: Jerlin $<br>
* @version $Revision: 1.45 $
* Date: $Date: 2007/03/15 16:12:07 $
* Tag: $Name:  $
*/
%>
<%
    IFXISDA oldCollateral = (IFXISDA)itrxValue.getCollateral();
    IFXISDA newCollateral = (IFXISDA)itrxValue.getStagingCollateral();
    String action = "docdervisd.DocDervISDAction";
	String formName = "DocDervISDForm";
    DocDervISDForm aForm = (DocDervISDForm)request.getAttribute(formName);
    String prefix = "Doc";
    String subtype = "DocDervISD";
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
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iSDADate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.isda.agree.date"/>&nbsp;
                  <span class="mandatory">*</span>&nbsp;</td>
              <td>
                <integro:date object="<%=iCol.getISDADate()%>" />&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iSDAProductDesc")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.isda.desc.product"/></td>
              <td><integro:empty-if-null value="<%=ISDAProductList.getInstance().getISDAProductItem(iCol.getISDAProductDesc())%>"/>
              </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iFEMADate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.ifema.agree.date"/>&nbsp;
                  <span class="mandatory">*</span></td>
              <td><integro:date object="<%=iCol.getIFEMADate()%>" />&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iFEMAProductDesc")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.ifema.desc.product"/></td>
              <td ><integro:empty-if-null value="<%=IFEMAProductList.getInstance().getIFEMAProductItem(iCol.getIFEMAProductDesc())%>"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iCOMDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.icom.doc.date"/>&nbsp;
					<span class="mandatory">*</span></td>
				<td><integro:date object="<%=iCol.getICOMDate()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iCOMProductDesc")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.icom.desc.product"/></td>
				<td ><integro:empty-if-null value="<%=ICOMProductList.getInstance().getICOMProductItem(iCol.getICOMProductDesc())%>"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"referenceNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.ref.no"/></td>
				<td><integro:empty-if-null value="<%=iCol.getReferenceNo()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDocumentAmount(),((oldCollateral==null)?null:oldCollateral.getDocumentAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.doc.amt"/>&nbsp;
                  	<span class="mandatory">*</span></td>
				<td><bean:write name="DocDervISDForm" property="amountLetter"/>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMinAmount(),((oldCollateral==null)?null:oldCollateral.getMinAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.amt.min"/>&nbsp;</td>
				<td><bean:write name="DocDervISDForm" property="minAmount"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMaxAmount(),((oldCollateral==null)?null:oldCollateral.getMaxAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.amt.max"/>&nbsp;</td>
				<td><bean:write name="DocDervISDForm" property="maxAmount"/>&nbsp;</td>
            </tr>

			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
				
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /></td>
				<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDesc")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
				<td colspan="3"><integro:wrapper value="<%=iCol.getDocumentDesc()%>" />&nbsp;</td>
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

<%--<%@ include file="/collateral/secapportion/view_apportion_summary.jsp" %> --%>
