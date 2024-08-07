<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.OBAssetBasedCollateral,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Date,
				 java.text.SimpleDateFormat,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recgenagent.IReceivableGeneralAgent,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.assetbased.NatureOfAssignmentList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.common.CommonCodeList" %>


<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetrecopen/assetRecOpen_read.jsp
     * Purpose: Read Collateral
     * Description: Type - AssetBased, Subtype - Assetrecopen
     *
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.49 $
     * Date: $Date: 2006/07/26 10:26:53 $
     * Tag: $Name:  $
     */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

    String natureOfAssignment = null;
    String amt1 = null;
    pageContext.setAttribute("obj", iCol);
    ILimitCharge ilimitcharge[] = iCol.getLimitCharges();

    Date dateLegallyAssigned = null;
    if (ilimitcharge.length > 0) {
        natureOfAssignment = ilimitcharge[0].getNatureOfCharge();
        Amount amountOfAssignment = ilimitcharge[0].getChargeAmount();
        if (amountOfAssignment != null && amountOfAssignment.getCurrencyCode() != null) {
            amt1 = CurrencyManager.convertToString(request.getLocale(), amountOfAssignment);
        } else {
            amt1 = "-";
        }
        dateLegallyAssigned = ilimitcharge[0].getLegalChargeDate();
        // dtlegallyassigned =  DateUtil.convertToDisplayDate(dateLegallyAssigned);

    } else {
        natureOfAssignment = "-";
        amt1 = "-";
        // dtlegallyassigned="-";

    }

    IReceivableGeneralAgent oldCollateral = (IReceivableGeneralAgent) itrxValue.getCollateral();
    IReceivableGeneralAgent newCollateral = (IReceivableGeneralAgent) itrxValue.getStagingCollateral();
    boolean isOnlyOneNull = false;
    boolean isBothNull = false;
    ILimitCharge oldLimit = null;
    if (oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
        oldLimit = oldCollateral.getLimitCharges()[0];
    }

    ILimitCharge newLimit = null;
    if (newCollateral != null) {
        if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
            newLimit = newCollateral.getLimitCharges()[0];
        }
    }
    boolean isOldNewLimitNull = (oldLimit == null) && (newLimit == null);
    ILimitCharge[] limit = iCol.getLimitCharges();
    ILimitCharge objLimit = null;
    if (limit != null && limit.length > 0) {
        objLimit = limit[0];
    }
    boolean isLimitNull = (objLimit == null);
    boolean isOldNewColNull = false;
    isOnlyOneNull = (oldLimit == null) ^ (newLimit == null);
    isOldNewColNull = (oldLimit == null) && (newLimit == null);
    Amount newChargeAmt = null;
    Amount oldChargeAmt = null;
    if (newLimit != null)
        newChargeAmt = newLimit.getChargeAmount();
    if (oldLimit != null)
        oldChargeAmt = oldLimit.getChargeAmount();
    Amount amt;

    String subtype = "AssetRecGenAgent";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";
   
%>


<!-- InstanceBeginEditable name="Content" -->

<tbody>
    <tr>
        <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>

                <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>

                <tr class="odd">
                    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLE")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.legal.enforceability"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
                    <td width="30%">
                        <% if (!(iCol == null)) { %>
                            <integro:empty-if-null value="<%=LEList.getInstance().getLEItem(iCol.getIsLE())%>"/>
                        <% } %> &nbsp;</td>
                    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lEDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.legal.enforceability.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
                    <td width="30%">
                        <% if (!(iCol == null)) { %>
                        <integro:date object="<%=iCol.getLEDate()%>"/> <% } %>&nbsp;</td>
                </tr>
                <%@ include file="/collateral/common/common_fields_read.jsp" %>

                <tr class="even">
                    <td class="<%=(isProcess?((CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount"))?"fieldname":"fieldnamediff"):"fieldname")%>"><bean:message key="label.security.asset.amountdesc.assignment"/> &nbsp;
                        <span class="mandatoryPerfection">*</span></td>
                    <td><%=amt1%>&nbsp;</td>
                    <td class="<%=(isProcess?((CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge"))?"fieldname":"fieldnamediff"):"fieldname")%>"><bean:message key="label.security.asset.nature.assignment"/> &nbsp;
                        <span class="mandatoryPerfection">*</span></td>
                    <td><integro:empty-if-null value="<%=NatureOfAssignmentList.getInstance().getNatureOfAssignmentItem(natureOfAssignment)%>"/>&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.charge.type"/>&nbsp;
                        <bean:message key="label.mandatory"/></td>
                    <td><% if (!isLimitNull) { %>
                        <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
                        <% } %>&nbsp;</td>
                    <td class="<%=(isProcess?((CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate"))?"fieldname":"fieldnamediff"):"fieldname")%>"><bean:message key="label.security.asset.date.legally"/></td>
                    <td><integro:date object="<%=dateLegallyAssigned%>"/>&nbsp;</td>
                </tr>

                <tr class="even">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.maturity.date"/></td>
                    <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/>&nbsp;</td>
                    <td class="fieldname">&nbsp;</td>
                    <td width="30%">&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isOwnProceedsOfReceivables")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.proceeds.receivables.control"/></td>
                    <td><% if (iCol.getIsOwnProceedsOfReceivables()) { %>
                        <bean:message key="label.common.yes"/> <% } else { %> <bean:message key="label.common.no"/> <% } %>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.exchange.ctr.app"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
                    <td><integro:empty-if-null  value="<%=ExchangeControlList.getInstance().getExchangeControlItem(iCol.getIsExchangeCtrlObtained())%>"/>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ownAccNoLocation")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.location.bank"/></td>
                    <td><integro:empty-if-null value="<%=BookingLocationList.getInstance().getBookingLocationItem(iCol.getOwnAccNoLocation())%>"/>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ownAccNo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.proceeds.receivables.credit"/></td>
                    <td><integro:empty-if-null value="<%=iCol.getOwnAccNo()%>"/>&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"invoiceType")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.types.invoices"/></td>
                    <td><integro:empty-if-null value="<%=iCol.getInvoiceType()%>"/>&nbsp;</td>
                    <td class="fieldname">&nbsp;</td>
                    <td>&nbsp; </td>
                </tr>

                <!--added  for gcms-->

                <tr class="even">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"projectName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.prj.name"/></td>
                    <td><bean:write property="projectName"name="AssetRecGenAgentForm" />&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"dateAwarded")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.doa"/> </td>
                    <td><integro:empty-if-null value="<%=iCol.getDateAwarded()%>"/>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"letterInstructFlag")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.irr.loi"/></td>
                    <td> <% if (iCol.getLetterInstructFlag()) { %>
                            <bean:message key="label.common.yes"/>
                        <% } else { %>
                            <bean:message key="label.common.no"/>
                       <% } %> &nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"letterUndertakeFlag")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.lou"/> </td>
                    <td><% if (iCol.getLetterUndertakeFlag()) { %>
                            <bean:message key="label.common.yes"/>
                        <% } else { %>
                            <bean:message key="label.common.no"/>
                        <% } %>&nbsp;</td>
                </tr>
                <tr class="odd">
                     <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"blanketAssignment")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.prj.name.ba"/> </td>
                     <td><bean:write property="blanketAssignment" name="AssetRecGenAgentForm" />&nbsp;</td>
                     <td class="fieldname">&nbsp;</td>
                     <td>&nbsp; </td>
                 </tr>
                <!--end  for gcms-->

                 <%--<tr class="odd">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"agentBankLocation")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.loc.agent.bank"/></td>
                    <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getAgentBankLocation())%>"/>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"agentBankReceivables")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.proceed.receiveable.control.agent.bank"/></td>
                    <td><integro:empty-if-null value="<%=iCol.getAgentBankReceivables()%>"/>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"agentLocation")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.loc.agent"/></td>
                    <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getAgentLocation())%>"/>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"agentName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.agent.name"/></td>
                    <td><integro:empty-if-null value="<%=iCol.getAgentName()%>"/>&nbsp;</td>
                </tr>--%>
                <!--<%@ include file="/collateral/common/view_security_instrument.jsp" %>-->
            </tbody>
        </table></td>
    </tr>
</tbody>
</table>
<%@ include file="/collateral/view_pledgor.jsp" %>

<!-- <%@ include file="/collateral/secapportion/view_apportion_summary.jsp" %> -->
  <!--View three valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>

<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>
