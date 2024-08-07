<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetpostdatedchqs/AssetPostDatedChqs_read.jsp,v 1.17 2006/10/27 08:24:49 hmbao Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Asset Based
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.17 $
    * Date: $Date: 2006/10/27 08:24:49 $
    * Tag: $Name:  $
    */
%>

<%	

	String actionStr = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
    IAssetPostDatedCheque iCol = (IAssetPostDatedCheque) itrxValue.getCollateral();
    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;     
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
    
    DateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    String trxID= (String)request.getAttribute("trxID");
    String forward_event = (String)request.getParameter("event");
    String userName=(String)request.getParameter("userName");
    String collateralID=(String)request.getParameter("collateralID");
    String prefix1 = "Asset";
    
%>
<%@ include file="/collateral/checkIsSSC.jsp"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="java.text.DateFormat"%><html>
<head>
</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

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

<%@ include file="AssetPostDatedChqs_read_maker__helper.jsp" %>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
