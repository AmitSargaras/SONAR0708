<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.vessel.IVessel,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetvessel.AssetVesselForm" %>
<%@ page import="java.util.*"%>
<%@ page import="com.integrosys.cms.ui.common.CountryList"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    IVessel iCol = (IVessel) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    String subtype = "AssetVessel";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
    AssetVesselForm colForm = (AssetVesselForm) request.getAttribute(formName);
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");

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
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
<!--

/*function selectLists(){
    List = document.forms[0].secInstrument;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
    }
}*/

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();

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


function YearCalculate()
{  
  	var PD = document.getElementById("perfectionDate").value;

	var year = PD.substring(7,11);
	
	var VBY = document.getElementById("vesselBuildYear").value;
		
	PD1=parseInt(year);
	VBY2=parseInt(VBY);
	
	var age = PD1 - VBY2;
	var FinalAnswer= age;
	/*if (isNaN(FinalAnswer)) {
		document.getElementById("vesselDocPerfectAge").value= '' ;
		document.getElementById("spanVesselDocPerfectAge").innerText= '' ;
	} else {
		document.getElementById("vesselDocPerfectAge").value= FinalAnswer ;
		document.getElementById("spanVesselDocPerfectAge").innerText= FinalAnswer ;
	}*/
}



function closeHandler(cal) {
  cal.hide();   // hide the calendar
 
  YearCalculate();
	
  // don't check mousedown on document anymore (used to be able to hide the
  // calendar when someone clicks outside it, see the showCalendar function).
  Calendar.removeEvent(document, "mousedown", checkCalendar);

  Calendar.removeEvent(document, "scroll", checkCalendar);
  Calendar.removeEvent(document, "mousewheel", checkCalendar);
  Calendar.removeEvent(document, "keydown", checkCalendar);

}

//-->
</script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetVesselCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetVessel"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.asset.title.create"/>
			<% } else { %>
				<bean:message key="label.security.asset.title.edit"/>
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
            <% if (isDeleting) { %>
            <p class="deletedItem"> DELETED</p>
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>

<%@ include file="/collateral/assetbased/update_common_asset.jsp" %>

<jsp:include page="/collateral/assetbased/assetvessel/AssetVessel_update_2.jsp">
	<jsp:param name="rowIdx" value="<%=rowIdx%>" />
	<jsp:param name="formName" value="<%=formName%>" />
</jsp:include>

</tbody>
</table>
</td>
</tr>

<tr><td colspan="2">&nbsp;</td></tr>

<jsp:include page="/collateral/assetbased/assetvessel/AssetVessel_update_3.jsp">
	<jsp:param name="rowIdx" value="<%=rowIdx%>" />
</jsp:include>
<% rowIdx+=21; %>

<tr><td colspan="2">&nbsp;</td></tr>

</tbody>
</table>

<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

<!-- <%@ include file="/collateral/secapportion/update_apportion_summary.jsp" %> -->

<jsp:include page="/collateral/assetbased/update_charge_summary.jsp"/>

<!--Update three valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %>

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

<script language="javascript">
	<!--
	//document.getElementById("spanVesselDocPerfectAge").innerText= '<%=colForm.getVesselDocPerfectAge()%>' ;
	-->
</script>

</body>
</html>
