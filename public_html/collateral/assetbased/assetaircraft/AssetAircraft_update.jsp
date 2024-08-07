<%--This file is using for  Specific charge instead of Aircraft --%>

<%@page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,                 
                 com.integrosys.cms.app.limit.bus.ILimitProfile,                
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeaircraft.ISpecificChargeAircraft,
                 java.util.HashMap,
                 java.util.Iterator,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 java.util.GregorianCalendar,
				 java.util.Calendar,
                 com.integrosys.cms.ui.collateral.assetbased.assetaircraft.AssetAircraftForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

    ISpecificChargeAircraft iCol = (ISpecificChargeAircraft) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();

    int policiesLength = iCol.getInsurancePolicies().length;
    
    String prefix = "Asset";
    String subtype = "AssetAircraft";
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
    AssetAircraftForm colForm = (AssetAircraftForm) request.getAttribute(formName);
	String event = itrxValue.getCollateral()==null ? "create" : "update";	
	String prefix1 = "Asset";
	
	
	String insuranceCheck=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");
	
	Boolean checklistIsActive = (Boolean)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.checklistIsActive");
	
	String totalPolicyAmt = (String) session.getAttribute(AssetBasedAction.class.getName() +"."+CollateralConstant.SESSION_TOTAL_INSURANCE_POLICY_AMT);
%>

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
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--



function submitPage(num, index) {
    enableAllFormElements();
  

    if (num == 1) {
    	if(<%=insuranceCheck.equalsIgnoreCase("no")%>){
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	} else if(<%=policiesLength%> > 0){
    		<% if(checklistIsActive){%>
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	    <%}else{%>
    		alert("Please approve the other checklist for given party.");
    	    <%}%>
    	}else{
    		alert("Please Add the Insurance Details");
    	}
    }
    if (num == 2) {
        document.forms[0].event.value = "update";
        document.forms[0].submit();
    }
    if (num == 3) {
        document.forms[0].event.value = "prepare";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 4) {
        document.forms[0].event.value = "prepare_update_sub";
        document.forms[0].indexID.value = index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 5) {
        document.forms[0].event.value = "itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 6) {
      //  document.forms[0].event.value = "prepare";
        document.forms[0].event.value = "maker_add_insurance";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 7) {
        document.forms[0].event.value = "prepare_update_sub";
        document.forms[0].indexID.value = index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 8) {
        document.forms[0].event.value = "itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    	document.forms[0].submit();
    }

    

}

function YearCalculate()
{
  	var PD = document.getElementById("perfectionDate").value;

	var year = PD.substring(7,11)
	
	
	var YOM = document.getElementById("yearMfg").value;
		
	PD1=parseInt(year);
	YOM2=parseInt(YOM);
	
	var age = PD1 - YOM2;
	var FinalAnswer= age;
	if (isNaN(FinalAnswer)) {
	} else {

	}
	
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
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<html:form action="AssetAircraftCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetAircraft"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>

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
                <p class="deletedItem"> <bean:message key="label.deleted"/> </p>
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
				<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
	        </tbody>
	        </table>
	    </td>
	</tr>
<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
	<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/update_common_security_fields.jsp" %>
			 <%@ include file="/collateral/collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<!--End by Pramod Katkar-->
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
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
        
        	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
     		    <td class="fieldname">
					RAM ID</td>
				<td>
					<html:text name="AssetAircraftForm"   property="ramId" size="45"></html:text>
					<html:errors property="ramId"/>
		        </td>
		        <td class="fieldname">
					&nbsp;</td>
				<td>&nbsp;</td>

			</tr>
			<tr>
				<td class="fieldname">Start Date</td>
			    <td>
   
				   <html:text property="startDate"  readonly="true" size="15" maxlength="11" />
						<img src="img/calendara.gif"  name="Image724" border="0" id="Image7234" 
						onclick="showCalendar('startDate', 'dd/mm/y')"
						  onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	  			   <html:errors property="startDate"/>
	  		    </td>

				<td class="fieldname">Maturity Date</td>
			    <td>
   
				   <html:text property="maturityDate"  readonly="true" size="15" maxlength="11" />
						<img src="img/calendara.gif"  name="Image725" border="0" id="Image72345" 
						onclick="showCalendar('maturityDate', 'dd/mm/y')"
						  onmouseover="MM_swapImage('Image725','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	  			   <html:errors property="maturityDate"/>
	  		    </td>
	  		  </tr>
        
        
      <%@ include file="/collateral/common/aircraft_physical_inspection.jsp" %>
			<%@ include file="/collateral/assetbased/aircraft_asset_environment_risk_update.jsp" %>
            <jsp:include page="/collateral/assetbased/assetaircraft/AssetAircraft_update2.jsp">
                <jsp:param name="rowIdx" value="<%=rowIdx%>"/>
                <jsp:param name="formName" value="<%=formName%>"/>
            </jsp:include>
			<!-- <%@ include file="/collateral/common/update_security_instrument.jsp" %> -->
		</tbody>
		</table>
	</td>
</tr>
</tbody>
</table>




<%-- <%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %> --%>

<%
if(!"no".equals(insuranceCheck))
{
%>
<%@ include file="/collateral/insurancepolicy/update_insurancestatus_summary.jsp" %>

<%@ include file="/collateral/update_security_coverage.jsp" %>
<%
}
%>


<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>


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
<script language="javascript">
    <!--
    
//	document.getElementById("spanDocPerfectAge").innerText= '<%=colForm.getDocPerfectAge()%>' ;

    -->
</script>



</body>
</html>
