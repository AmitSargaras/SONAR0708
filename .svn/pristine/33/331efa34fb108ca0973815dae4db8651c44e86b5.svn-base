<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.insurance.subtype.keymaninsurance.IKeymanInsurance"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insprotection/inskeyman/InsKeyman_read.jsp,v 1.16 2006/10/27 08:34:17 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Insurance, Subtype - Keyman Insurance
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.16 $
* Date: $Date: 2006/10/27 08:34:17 $
* Tag: $Name:  $
*/
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    IKeymanInsurance iCol = (IKeymanInsurance) itrxValue.getCollateral();

    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
    String prefix1 = "Ins";
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

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.title.view.insurance.protection"/></h3></td>
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
</table>
<%@ include file="InsKeyman_read_helper.jsp" %>


<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
