<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.marketable.subtype.bondslocal.IBondsLocal"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/marketablesec/marksecbondlocal/MarksecBondLocal_read.jsp,v 1.14 2006/10/27 08:35:11 hmbao Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Marketable Securities, Subtype - Bonds - Local
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.14 $
    * Date: $Date: 2006/10/27 08:35:11 $
    * Tag: $Name:  $
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    IBondsLocal iCol = (IBondsLocal) itrxValue.getCollateral();
    String prefix1 = "Mark";
    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/checkIsSSC.jsp" %>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="MarksecBondLocal"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
		<td colspan="2"><h3><bean:message key="label.security.title.view.marketable"/></h3></td>
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
<%@ include file="MarksecBondLocal_read_helper.jsp" %>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
