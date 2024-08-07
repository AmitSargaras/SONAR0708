<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.nocollateral.INoCollateral" %>


<%
	String actionStr = "com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction";
    ICollateralTrxValue itrxValue = null;
	INoCollateral iCol = null;
	itrxValue = (ICollateralTrxValue) session.getAttribute(actionStr+".serviceColObj");
	String eventVal = itrxValue.getCollateral()==null ? "create" : "update";
	
	if (itrxValue!=null) iCol = (INoCollateral) itrxValue.getCollateral();
	if (iCol!=null) pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String prefix1 = "NoCollateral";
    String liquidationIsNPL = null;	liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
%>
<%@ include file="/collateral/checkIsSSC.jsp" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>    
    
</head>

<body>
<%@ include file="/collateral/check_user.jsp" %>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="NoCollateral"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td colspan="2"><h3><bean:message key="label.security.title.view.no.col"/></h3></td>
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
    <%@ include file="NoCollatera_read_helper.jsp" %>

<% if (eventVal.equals("create")) { %>
<table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="96">&nbsp;</td>
        <td width="96">&nbsp;</td>
        <td width="96">&nbsp;</td>
    </tr>
    <tr>
		<td>
        <a href="CollateralRedirect.do?event=prepare"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1"/>
		</a></td>
    </tr>
<% } else { %>
<%@ include file="/collateral/common/common_read_button.jsp" %>
<% } %>

</body>
</html>
