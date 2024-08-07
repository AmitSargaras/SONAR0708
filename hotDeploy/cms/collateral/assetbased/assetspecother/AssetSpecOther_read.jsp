<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeothers.ISpecificChargeOthers,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.IValuationFromLOS"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.OBValuationFromLOS"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetspecother/AssetSpecOther_read.jsp,v 1.15 2006/10/27 08:25:27 hmbao Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Asset Based
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.15 $
    * Date: $Date: 2006/10/27 08:25:27 $
    * Tag: $Name:  $
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    ISpecificChargeOthers iCol = (ISpecificChargeOthers) itrxValue.getCollateral();

    pageContext.setAttribute("obj", iCol);
    String from_event = "read"; 
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
    String prefix1 = "Asset";
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
<input type="hidden" name="subtype" value="AssetSpecOther"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.asset.title.view"/></h3></td>
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
<%@ include file="AssetSpecOther_read_helper.jsp" %>
 </table>
 
<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
