<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.AssetSpecVehiclesForm,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%

	String actionStr = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    ISpecificChargeVehicle iCol = (ISpecificChargeVehicle) itrxValue.getCollateral();
    pageContext.setAttribute("obj",iCol);
    
    AssetSpecVehiclesForm aForm = (AssetSpecVehiclesForm) request.getAttribute("AssetSpecVehiclesForm");
    String prefix1 = "Asset";
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
%>

<html>
<head>
<script language="JavaScript" type="text/JavaScript">
<!--
function setGoodStaus(val){
    if (val == 'N' || val =='') {
        document.getElementById("spanASSETLIFE").style.visibility = "hidden";
        document.getElementById("spanSCRAPVALUE").style.visibility = "hidden";
        document.getElementById("spanASSETVALUE").style.visibility = "hidden";
    }  else{
        document.getElementById("spanASSETLIFE").style.visibility = "visible";
        document.getElementById("spanSCRAPVALUE").style.visibility = "visible";
        document.getElementById("spanASSETVALUE").style.visibility = "visible";
    }
}


//-->
</script>
</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/checkIsSSC.jsp" %>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="AssetSpecVehicles"/>
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
</table>
<%@ include file="AssetSpecVehicles_read_helper.jsp" %>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
