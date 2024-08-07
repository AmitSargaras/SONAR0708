<%@page import="com.integrosys.cms.app.collateral.bus.type.property.IPropertyValuation3"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comgeneral.ICommercialGeneral,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propcommgeneral/PropCommGeneral_read.jsp,v 1.22 2006/10/27 08:37:06 hmbao Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Property, Subtype - General Commercial
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.22 $
    * Date: $Date: 2006/10/27 08:37:06 $
    * Tag: $Name:  $
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.property.PropertyAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	IPropertyValuation3 propertyValuation3=(IPropertyValuation3)session.getAttribute(actionStr+".propertyValuation3");
	System.out.println("propertyValuation3: "+propertyValuation3);
   // ICommercialGeneral iCol = (ICommercialGeneral) itrxValue.getCollateral();

   // pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
    String prefix1 = "Property";
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
<input type="hidden" name="subtype" value="PropAgri"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="50%"><h3><bean:message key="label.security.property.title.view"/></h3></td>
      <td width="50%" >
        <%     
			hasReminder = true;										
        %>

      </td>
    </tr>
	</thead>
</table>

<%-- <%@ include file="/collateral/common/common_theme_tab.jsp"%> --%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
	</thead>

	<%@ include file="PropReadPrevValuation3.jsp" %>

  </tbody>
</table>

<%@ include file="common_read_button_val3.jsp" %>

</body>
</html>
