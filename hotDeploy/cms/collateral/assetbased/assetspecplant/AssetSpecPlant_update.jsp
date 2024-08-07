<%--Beatified and formatted by jj--%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 
                 java.util.HashMap,
                 java.util.Iterator,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecplant.AssetSpecPlantForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

    ISpecificChargePlant iCol = (ISpecificChargePlant) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
	int policiesLength = iCol.getInsurancePolicies().length;
    String subtype = "AssetSpecPlant";
    String prefix = "Asset";
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
    AssetSpecPlantForm colForm = (AssetSpecPlantForm) request.getAttribute(formName);
    String prefix1 = "Asset";
    String dptradein = colForm.getDptradein();

	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
	
	System.out.println("LEngth::::::::::::::::::"+policiesLength);
	
	
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
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();

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
    	 
        //document.forms[0].event.value = "prepare";
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
  	alert("pd "+PD);
	var RD = document.getElementById("repossessionDate").value;

	var year = PD.substring(7,11);
	var year2 = RD.substring(7,11);
	//alert(year);
	
	var YOM = document.getElementById("yearOfManufacture").value;
		
	PD1=parseInt(year);
	RD1=parseInt(year2);
	YOM2=parseInt(YOM);
	
	
	var age = PD1 - YOM2;
	var FinalAnswer= age;
	/*if (isNaN(FinalAnswer)) {
		document.getElementById("spanDocPerfectAge").innerText= '' ;
		document.getElementById("docPerfectAge").value='';
	} else {
		document.getElementById("spanDocPerfectAge").innerText= FinalAnswer ;
		document.getElementById("docPerfectAge").value=FinalAnswer;
	}*/
	
	age = RD1 - YOM2;
	FinalAnswer= age;
	if (isNaN(FinalAnswer)) {
		document.getElementById("spanRepossessionAge").innerText= '' ;
		document.getElementById("repossessionAge").innerText= '' ;
	} else {
		document.getElementById("spanRepossessionAge").innerText= FinalAnswer ;
		document.getElementById("repossessionAge").innerText= FinalAnswer ;
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

	months = new Array();
	months['Jan'] = 0;
	months['Feb'] = 1;
	months['Mar'] = 2;
	months['Apr'] = 3;
	months['May'] = 4;
	months['Jun'] = 5;
	months['Jul'] = 6;
	months['Aug'] = 7;
	months['Sep'] = 8;
	months['Oct'] = 9;
	months['Nov'] = 10;
	months['Dec'] = 11;
	
	month = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');
	
	function getNextPhyDate(cal, date) {
	    if (cal != "" && date != "") {
	        cal.sel.value = date;
	    }
	    lastPhyDateValue = document.forms[0].datePhyInspec.value;
	    frequency = document.forms[0].physInspFreq.value;
	    frequencyUOM = document.forms[0].physInspFreqUOM.value;
	
	    if(!isInt(frequency))
	    {
	    if(document.forms[0].isPhysInsp[0].checked){
	    alert("Physical Inspection Frequency should be a Integer!");
	    }
	    document.forms[0].nextPhysInspDate.value = "";
	    return;
	    }
	
	    if (lastPhyDateValue != "" && frequency != "" && frequencyUOM != "") {
	        frequency = parseFloat(frequency.split(' ').join(''));
	        lastDate = new Date();
	        lastDate.setDate(lastPhyDateValue.substring(0, 2));
	        lastDate.setMonth(months[lastPhyDateValue.substring(3, 6)]);
	        lastDate.setFullYear(lastPhyDateValue.substring(7, 11));
	        nextDate = new Date();
	        if (frequencyUOM == 'D') {
	            nextDate = lastDate.add(Date.DAY, frequency);
	        }
	        if (frequencyUOM == 'W') {
	            nextDate = lastDate.add(Date.DAY, (frequency * 7));
	        }
	        if (frequencyUOM == 'M') {
	            nextDate = lastDate.add(Date.MONTH, frequency);
	        }
	        if (frequencyUOM == 'Y') {
	            nextDate = lastDate.add(Date.YEAR, frequency);
	        }
	        nextDateStr = "";
	        if (nextDate.getDate() < 10) {
	            nextDateStr = "0";
	        }
	        nextDateStr = nextDateStr + nextDate.getDate() + "/" + month[nextDate.getMonth()] + "/" + nextDate.getFullYear();
	        document.forms[0].nextPhysInspDate.value = nextDateStr;
	    }
	}
	
	function setPhysInsp(val){
	    if (val == '1') {
	        document.getElementById("spanPIF").style.visibility = "visible";
	        document.getElementById("spanPID").style.visibility = "visible";
	    } else if (val == '0') {
	        document.getElementById("spanPIF").style.visibility = "hidden";
	        document.getElementById("spanPID").style.visibility = "hidden";
	        document.getElementById("physInspFreqUOM").value = "";
	    }
	}
	
	function checkTradein(dptradein) {
		var dpTradein = dptradein.value;
		if (dpTradein == '') {
			document.getElementById("spanTrade").style.visibility = "hidden";
		} else {
			document.getElementById("spanTrade").style.visibility = "visible";
		}
		document.getElementById('tradeInDeposit').value = dpTradein;
		setMandatory();
	}
function dispNonMandatoryField(){
		document.getElementById('disp1').style.display = "";
}
function hideNonMandatoryField(){
		document.getElementById('disp1').style.display = 'none';
}
-->
</script>


</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetSpecPlantCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetSpecPlant"/>
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
                <p class="deletedItem"> DELETED </p>
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

<tbody>
    <tr>
    <!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	        <tbody>
				<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
<!--End by Pramod Katkar-->
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
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<span ><bean:message key="label.security.asset.security.status" /></span></td>
	            <td>
	            <html:select property="goodStatus">
					<integro:common-code
						categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>" />
				</html:select><html:errors property="goodStatus"/>
	        </td>
	        <td class="fieldname">
                  <span class="fieldname">RAM ID</span>&nbsp;</td>
                  <td><html:text property="ramId" maxlength="15"/>&nbsp;<html:errors property="ramIdError"/></td>
			</tr>

<%--<jsp:include page="/collateral/assetbased/assetspecplant/AssetSpecPlant_update2.jsp">
	<jsp:param name="rowIdx" value="<%=rowIdx%>" />
</jsp:include>--%>

<% //rowIdx++; %>

			
			<%--use invice date as a start date by sachin patil--%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    
    <td class="fieldname" width="20%">
        <span ><bean:message key="label.security.asset.start.date"/></span></td>
    <td width="30%"><html:text property="invoiceDate" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
             onclick="showCalendar('invoiceDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
             onmouseout="MM_swapImgRestore()"/>&nbsp;
    <html:errors property="invoiceDate"/></td>
    <td class="fieldname" width="20%"><bean:message
		key="label.maturity.date" /></td>
	<td width="30%"><html:text property="collateralMaturityDate" readonly="true"
		size="15" maxlength="11" /> <img src="img/calendara.gif"
		name="Image723" border="0" id="Image723"
		onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
		onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
		onmouseout="MM_swapImgRestore()" /> <html:errors property="collateralMaturityDate" />
		<html:errors property="collateralMaturityDate1" /></br>
		
		<html:errors property="collateralMaturityDate2" />
		
		</td>

</tr>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname">
			        <bean:message key="label.security.last.phy.insp.date"/>&nbsp;
			        <span id="spanPID" style="visibility:hidden"><bean:message key="label.mandatory"/></span></td>
			    <td><html:text property="datePhyInspec" readonly="true" size="15" maxlength="11"/>
			        <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
			             onclick="showCalendarWithCustomHandling('datePhyInspec', 'dd/mm/y', getNextPhyDate)"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
			        <html:errors property="datePhyInspec"/></td>
			    <td class="fieldname"><bean:message key="label.security.next.phy.insp.date"/></td>
			    <td><html:text property="nextPhysInspDate" size="15" maxlength="11" disabled="true"/></td>
			</tr>

			--%><%--<%@ include file="/collateral/assetbased/asset_environment_risk_update.jsp" %>
			--%>
			<%--<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>

	        --%>
	        <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
				<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
					<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
						 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						 onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
			</tr>
			
			--%>
			<jsp:include page="AssetSpecPlant_extra_update.jsp">			
				<jsp:param name="rowIdx" value="<%=rowIdx%>" />
				<jsp:param name="formName" value="<%=formName%>" />
				<jsp:param name="goodStatus" value="<%=colForm.getGoodStatus()%>" />
			</jsp:include>

	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	                <td class="fieldname">
						<span><bean:message key="label.security.asset.description"/></span>&nbsp; </td>
	                <td colspan="3">
	                    <html:textarea  property="description" rows="3" style="width:100%"  onkeyup="limitTextInput(this,200,'Description of Asset ')"/>
	                    <html:errors property="description"/></td>
	        </tr>
</tbody>	            
	       <%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>
	       
		</table>
	</td>
</tr>
</tbody>
</table>

<%--<%@ include file="/collateral/assetbased/trade_in_info_update.jsp" %>--%>

<%--<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %>--%>

<%--<%@ include file="/collateral/view_pledgor.jsp" %>--%>

<%--<%@ include file="/collateral/view_pledge.jsp" %>--%>

<%--<jsp:include page="/collateral/assetbased/update_charge_summary.jsp"/>--%>

<!--Update three valuation details-->
<%--<%@ include file="/collateral/common/view_system_valuation.jsp"%>
--%><%--<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>--%>


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


<%-- <%@ include file="/collateral/secapportion/praExceednConfirm.jsp"%> --%>

</body>
</html>
