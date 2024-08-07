<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.OBAssetBasedCollateral,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Date,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recspecnoa.IReceivableSpecificNoAgent,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% 
	String actionStr = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute(actionStr+".serviceColObj");
    IReceivableSpecificNoAgent iCol = (IReceivableSpecificNoAgent) itrxValue.getCollateral();
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
%>

<html>
<head>
</head>

<body>
<html:form action="AssetRecSpecNonAgentCollateral.do">
<%@ include file="/collateral/check_user.jsp" %>
<%@ include file="/collateral/checkIsSSC.jsp" %>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="AssetRecSpecNonAgent"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="50%" colspan="2"><h3><bean:message key="label.security.title.view.assetbased.receivable.assign.spec.invoice.not"/></h3></td>
            <td width="50%" align="right" valign="baseline">
				<%@ include file="/collateral/common/common_buttons.jsp"%>
			</td>
        </tr>
    </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3><bean:message key="label.security.general"/></h3></td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
    <%@ include file="assetRecSpecNonAgent_read_helper.jsp" %>
</table>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</html:form>

</body>
</html>
