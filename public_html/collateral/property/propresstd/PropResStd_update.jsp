<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resstandard.IResidentialStandard,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.property.RankList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.property.propresstd.PropResStdForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propresstd/PropResStd_update.jsp,v 1.84 2006/11/23 03:02:56 jzhan Exp $
    *
    * Purpose: Update Collateral
    * Description: Type - Property, Subtype - Residential Standard
    *
    * @author $Author: jzhan $<br>
    * @version $Revision: 1.84 $
    * Date: $Date: 2006/11/23 03:02:56 $
    * Tag: $Name: DEV_20061123_B286V1 $
    */
%>
<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj");
    IResidentialStandard iCol = (IResidentialStandard) itrxValue.getStagingCollateral();

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
      
    String subtype = "PropResStd";
    String prefix = "Property"; 
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	
    PropResStdForm colForm = (PropResStdForm) request.getAttribute(formName);
    String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.from");
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(num, index) {
	enableAllFormElements();
	/*selectAllOptions(document.forms[0].secInstrument);*/ //Modified by Grace;ABank CLIMS project;Description:remove field purpose

    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    if (num == 3) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 4) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 5) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 6) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";	    
    }
    if (num == 7) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 8) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    }
    document.forms[0].submit();

}

//-->
</script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="PropResStdCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="itemType"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="PropResStd"/>
<input type="hidden" name="subTypeCode" value="<%=subtypeCode%>"/>    
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
		<td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.property.title.create"/>
			<% } else { %>
				<bean:message key="label.security.property.title.edit"/>
			<% } %>
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  
<%@ include file="/collateral/property/update_common_property.jsp" %>   

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
</html:form>

<%-- <%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %> --%>

</body>
</html>
