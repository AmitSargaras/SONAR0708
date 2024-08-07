<%@ page
	import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,com.integrosys.cms.ui.dataprotection.DataProtectionUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.app.collateral.bus.ICollateralPledgor,com.integrosys.base.businfra.currency.Amount,com.integrosys.cms.app.collateral.bus.ILimitCharge,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.businfra.currency.CurrencyManager,com.integrosys.cms.ui.collateral.nocollateral.NoCollateralForm,com.integrosys.cms.app.collateral.bus.type.nocollateral.INoCollateral"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction"%>

<%
	ICollateralTrxValue itrxValue = null;
	INoCollateral iCol = null;

	itrxValue = (ICollateralTrxValue) session
			.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.serviceColObj");
	if (itrxValue != null)
		iCol = (INoCollateral) itrxValue.getStagingCollateral();

	pageContext.setAttribute("obj", iCol);
	String subtypeCode = "";
	if (iCol != null && iCol.getCollateralSubType() != null)
		subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

	String prefix = "NoCollateral";
	String subtype = "NoCollateral";
	String formName = subtype + "Form";
	String from_event = "prepare_update";
	String formActionName = subtype + ".do";
	NoCollateralForm colForm = (NoCollateralForm) request
			.getAttribute(formName);
	String event = itrxValue.getCollateral() == null
			? "create"
			: "update";
	boolean isProcess = false;
	String prefix1 = "NoCollateral";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
<!--

function updateInternal() {
    document.forms[0].secCustodianExt.value = '';
    document.forms[0].secCustodianExt.disabled = true;
    document.forms[0].secCustodianInt.disabled = false;
}

function updateExternal() {
    document.forms[0].secCustodianInt.value = '';
    document.forms[0].secCustodianInt.disabled = true;
    document.forms[0].secCustodianExt.disabled = false;
}

function manda11(obj) {
	if (obj == "Y")
    {
		if (document.getElementById('span11') != null)
			document.getElementById('span11').innerText = "* ";
    }
    else {
		if (document.getElementById('span11') != null)
			document.getElementById('span11').innerText = " ";
    }
}

/*function selectLists(){
    List = document.forms[0].secInstrument;
    for (i=0;i<List.length;i++){
	List.options[i].selected = true;
    }
}*/

function submitPage(num) {
    enableAllFormElements();
    //selectLists();

    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    document.forms[0].submit();

}
//-->
</script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="NoCollateral.do">
	<input type="hidden" name="event" />
	<input type="hidden" name="itemType" />
	<input type="hidden" name="indexID" />
	<input type="hidden" name="subtype" value="NoCollateral" />

	<%@ include file="/collateral/common/mandatory_flag.jsp"%>

	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td colspan="2">
				<h3>
				<%
					if (event.equals("create")) {
				%> <bean:message
					key="label.security.title.create.no.col" /> <%
 	} else {
 %> <bean:message
					key="label.security.title.edit.no.col" /> <%
 	}
 %>
				</h3>
				</td>
			</tr>
		</thead>
	</table>

	<%@ include file="/collateral/common/common_theme_tab.jsp"%>

	<table width="98%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3><bean:message key="label.security.general" /></h3>
				</td>
				<td width="50%" align="right">
				<%
					if (isDeleting) {
				%>
				<p class="deletedItem">DELETED</p>
				<%
					}
				%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<tbody>
						<%@ include
							file="/collateral/common/update_basic_security_fields.jsp"%>
						<%@ include
							file="/collateral/common/common_legal_enforceability_update.jsp"%>
					</tbody>
				</table>
				</td>
			</tr>
			<%@ include file="/collateral/collateral_general_common_field.jsp" %>
		</tbody>
	</table>

	<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>
	

	<%@ include file="/collateral/view_pledge.jsp"%>
	<%@ include
		file="/collateral/common/update_valuation_input_into_gcms.jsp"%>
	<jsp:include page="/collateral/common/common_maker_remarks.jsp">
		<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>" />
		<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>" />
		<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>" />
	</jsp:include>

	<jsp:include page="/collateral/common/common_maker_update_button.jsp">
		<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>" />
		<jsp:param name="actionName" value="<%=formActionName%>" />
		<jsp:param name="collateralID"
			value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
	</jsp:include>
</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp"%>



</body>
</html>
