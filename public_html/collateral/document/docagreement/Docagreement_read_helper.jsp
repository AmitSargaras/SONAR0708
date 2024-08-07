<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,                                  
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
  				 com.integrosys.cms.app.collateral.bus.type.document.subtype.leaseagreement.ILeaseAgreement,
				 com.integrosys.cms.ui.collateral.document.docagreement.DocAgreementForm,
				 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    *
    * Purpose: Helper page of read and process of the Collateral
    * Description: Type - Document, Subtype - Letter of Comfort
    *
    * @author $Author: jerlin $<br>
    * @version $Revision: 1.2 $
    * Date: $Date: 2007/March/15 $
    * Tag: $Name:  $
    */
%>
<%
    ILeaseAgreement oldCollateral = (ILeaseAgreement)itrxValue.getCollateral();
	ILeaseAgreement newCollateral = (ILeaseAgreement)itrxValue.getStagingCollateral();

    String prefix = "Doc";
    String subtype = "DocAgreement";
    String formName = "DocAgreementForm";
    String action = "docagreement.DocAgreementAction";
    String formActionName = subtype + "Collateral.do";
    
    DocAgreementForm aForm = (DocAgreementForm)request.getAttribute(formName);

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
                    if (oldCollateral !=null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                        oldLimit = oldCollateral.getLimitCharges()[0];
                    }

                    if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                        newLimit = newCollateral.getLimitCharges()[0];
                    }
                }
                boolean isLimitNull = (objLimit == null);
            %>

            
            <%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
            

            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.charge.type"/>&nbsp;
                  	<span class="mandatory">*</span>&nbsp;</span></td>
              <td><% if (!isLimitNull) { %>
                <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
                <% } %>&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td><bean:write name="DocAgreementForm" property="securityPerfectionDate"/>&nbsp;
            </tr>

            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              	<bean:message key="label.security.maturity.date"/>&nbsp;
              	<span class="mandatoryPerfection">*</span></td>
              <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"issuer")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.issurer"/>&nbsp;</td>
           	    <td><% if (!isLimitNull) { %>
                <integro:empty-if-null value="<%=aForm.getIssuer()%>"/>
                <% } %>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"referenceNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.ref.no"/></td>
              <td><integro:empty-if-null value="<%=iCol.getReferenceNo()%>" />&nbsp;</td>              
              <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getDocumentAmount(),((oldCollateral==null)?null:oldCollateral.getDocumentAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.doc.amt"/>&nbsp;
              	<span class="mandatory">*</span>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="amountLetter"/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMinAmount(),((oldCollateral==null)?null:oldCollateral.getMinAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.amt.min"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="minAmount"/>&nbsp;</td>
              <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getMaxAmount(),((oldCollateral==null)?null:oldCollateral.getMaxAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.amt.max"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="maxAmount"/>&nbsp;</td>
            </tr>
            <!-- added by thurein -->
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
			 <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"leaseRentalAgreement")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.lease.rental.agreement"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="leaseRentalAgreement"/>&nbsp;</td> 
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"leaseLimitation")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.lease.limitation"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="limitationOfLease"/>&nbsp;</td>
            </tr>
             <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"propertyType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.property.type"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="propertyType"/>&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"lotsLocation")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.lots.location"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="locationOfLots"/>&nbsp;</td>
            </tr>
             <tr class="even">
               <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"titleNumberValue")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.tile.number"/>&nbsp;</td>
              <td>
				<integro:common-code categoryCode="<%=ICMSConstant.TITLE_TYPE %>" display="true" entryCode="<%=iCol.getTitleNumberType() %>" descWithCode="false"/>              
              <bean:write name="DocAgreementForm" property="titleNumberValue"/>&nbsp;
              </td>
               <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"buybackValue")?"fieldname":"fieldnamediff"):"fieldname"%>"><span class = stp> <bean:message key="label.security.leaseAgreement.buyback.value"/></span><span class="mandatory">*</span>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="buybackValue"/>&nbsp;</td>
            </tr>
            <tr class="odd">
               <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"isBorrowerDependency")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.leaseAgreement.borrower.dependency"/>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="borrowerDependencyOnCollateral"/>&nbsp;</td>
               <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"guranteeAmount")?"fieldname":"fieldnamediff"):"fieldname"%>"><span class = stp><bean:message key="label.security.leaseAgreement.gurantee.amount"/></span>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="guranteeAmount"/>&nbsp;</td>
            </tr>
             <tr class="odd">
               <td class="fieldname"><bean:message key="label.security.leaseAgreement.lease.type"/>&nbsp;</td>
              <td>
              <integro:common-code categoryCode="<%=ICMSConstant.LEASE_TYPE %>" display="true" entryCode="<%=iCol.getLeaseType() %>" descWithCode="true"/></td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral ,oldCollateral ,"documentDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><span class = stp><bean:message key="label.security.lease.agree.date"/></span>&nbsp;</td>
              <td><bean:write name="DocAgreementForm" property="documentDate"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentDesc")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
              <td colspan="3"><integro:wrapper value="<%=iCol.getDocumentDesc()%>" lineLength="60"/>&nbsp;</td>
            </tr>

        </table></td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<br>
<%@ include file="/collateral/common/view_netRV.jsp" %>

