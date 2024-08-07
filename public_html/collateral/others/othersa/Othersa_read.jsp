<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.others.subtype.othersa.IOthersa,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/others/othersa/Othersa_read.jsp,v 1.6 2006/10/27 08:36:40 hmbao Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Others, Subtype - Othersa
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.6 $
    * Date: $Date: 2006/10/27 08:36:40 $
    * Tag: $Name:  $ 
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.others.OthersAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    IOthersa iCol = (IOthersa) itrxValue.getCollateral();

    pageContext.setAttribute("obj", iCol);
    String from_event = "read";

    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
    String prefix1 = "Other";
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
<input type="hidden" name="subtype" value="Othersa"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.title.view.others"/></h3></td>
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
<%@ include file="Othersa_read_helper.jsp" %>
  </tbody>
</table>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
