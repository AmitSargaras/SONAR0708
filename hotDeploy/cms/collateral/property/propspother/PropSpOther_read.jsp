<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.specialothers.ISpecialPurposeOthers,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propspother/PropSpOther_read.jsp,v 1.22 2006/10/27 08:38:08 hmbao Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Property, Subtype - Special Purpose Other
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.22 $
    * Date: $Date: 2006/10/27 08:38:08 $
    * Tag: $Name:  $
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.property.PropertyAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    ISpecialPurposeOthers iCol = (ISpecialPurposeOthers) itrxValue.getCollateral();

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
<input type="hidden" name="subtype" value="PropSpOther"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.property.title.view"/></h3></td>
      <td width="50%" align="right" valign="baseline">
		<%

			/*IDataProtectionProxy dpProxy = DataProtectionProxyFactory.getProxy ();
			String roleType = ( String ) session.getAttribute ( ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID );
			long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong ( roleType );
			boolean isTeamTypeAccessible = dpProxy.isDataAccessAllowed ( ICMSConstant.INSTANCE_COLLATERAL, ICMSConstant.COLTYPE_PROP_SPEC_SERVICE_APT,
					teamTypeMshipID, new String[] { iCol.getCollateralLocation () }, new String[] { IDataProtectionProxy.ANY_ORGANISATION }, false );
			userAccess = userAccess&& isTeamTypeAccessible;
			*/		
			hasReminder = true;
		%>
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
	<%@ include file="PropSpOther_read_helper.jsp" %>
  </tbody>
</table>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
