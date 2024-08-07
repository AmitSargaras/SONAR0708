<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.cash.subtype.repo.IRepo,
                 com.integrosys.cms.ui.collateral.CheckEditable"%>

<%
    /**
    *
    * Purpose: Read Collateral
    * Description: Type - Cash, Subtype - Repo
    *
    * @author $Author: Naveen $<br>
    * @version $Revision: 1.23 $
    * Date: $Date: 2006/10/27 08:26:42 $
    * Tag: $Name:  $
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.cash.CashAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    IRepo iCol = (IRepo) itrxValue.getCollateral();

    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");

%>

<%@ include file="/collateral/checkIsSSC.jsp"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="CashRepo"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
		<td colspan="2"><h3><bean:message key="label.security.title.deposit.view"/></h3></td>
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
		<td colspan="2"> <hr/> </td>
    </tr>
  </thead>
 <%@ include file="CashRepo_read_helper.jsp" %>
</table>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
