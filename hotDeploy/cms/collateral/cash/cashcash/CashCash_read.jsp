<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashcash.ICashCash,
                 com.integrosys.cms.ui.collateral.CheckEditable" %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>


<% String actionStr = "com.integrosys.cms.ui.collateral.cash.CashAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute(actionStr+".serviceColObj");

    ICashCash iCol = (ICashCash) itrxValue.getCollateral();

    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String) session.getAttribute(actionStr+".liquidationIsNPL");

%>

<%@ include file="/collateral/checkIsSSC.jsp" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>    
    <script type="text/javascript" src="js/collateral_checker_process.js"></script> <!-- sbmPage can be found here -->
</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="CashCash"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td colspan="2"><h3><bean:message key="label.security.title.deposit.view"/></h3></td>
            <td width="50%" align="right" valign="baseline">
                <%@ include file="/collateral/common/common_buttons.jsp" %>
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
    <%@ include file="CashCash_read_helper.jsp" %>


<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
