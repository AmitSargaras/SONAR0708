<%@page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"%>
<%@ page import="	com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                    com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                    com.integrosys.cms.app.collateral.bus.IValuation,
                    com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle,				    
                    com.integrosys.cms.app.common.constant.ICMSConstant,
                    com.integrosys.cms.app.limit.bus.ILimitProfile,
                    com.integrosys.base.businfra.currency.Amount,
                    com.integrosys.base.techinfra.util.DateUtil,
                    com.integrosys.base.uiinfra.common.ICommonEventConstant,
                    com.integrosys.component.commondata.app.CommonDataSingleton,
                    com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.AssetSpecVehiclesForm,                    
                    com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                    com.integrosys.cms.ui.collateral.CollateralConstant,
                    com.integrosys.cms.ui.collateral.InsurerNameList,
                    com.integrosys.cms.ui.common.constant.IGlobalConstant,
                    com.integrosys.cms.ui.dataprotection.DataProtectionUtil"%>
<%@ page import="java.util.*,
                 com.integrosys.cms.ui.common.CountryList"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    ISpecificChargeVehicle iCol = (ISpecificChargeVehicle) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    AssetSpecVehiclesForm colForm = (AssetSpecVehiclesForm) request.getAttribute("AssetSpecVehiclesForm");

    String subtype = "AssetSpecVehicles";
    String prefix = "Asset";
    String formName = "AssetSpecVehiclesForm";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";   
	String event = itrxValue.getCollateral()==null ? "create" : "update";

    String classtype=null;
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
	
	List branchList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.branchList");
	
	 
	    
     if (branchList != null) {
    //   List branchList = new ArrayList(sr.getResultList());
       
   
       pageContext.setAttribute("branchList",branchList);
      }
     String prefix1 = "Asset";
     
     String totalPolicyAmt = (String) session.getAttribute(AssetBasedAction.class.getName() +"."+CollateralConstant.SESSION_TOTAL_INSURANCE_POLICY_AMT);
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.base.businfra.search.SearchResult"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script type="text/javascript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
//function selectLists(){
//    List = document.forms[0].secInstrument;
//    for (i=0;i<List.length;i++){
//        List.options[i].selected = true;
//    }
//}

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();
    if (num == 1) {
        document.forms[0].event.value = "submit";
    }
    if (num == 2) {
        document.forms[0].event.value = "update";
    }
    if (num == 3) {
        document.forms[0].event.value = "prepare";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "prepare_update_sub";
        document.forms[0].indexID.value = index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 5) {
        document.forms[0].event.value = "itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
    }
    if (num == 6) {
        document.forms[0].event.value = "prepare";
        document.forms[0].indexID.value = "-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 7) {
        document.forms[0].event.value = "prepare_update_sub";
        document.forms[0].indexID.value = index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 8) {
        document.forms[0].event.value = "itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    }

    document.forms[0].submit();
}

	function setTradeInDepositValue(){
		var valueStr =document.getElementById('dptradein').value;
		document.getElementById('tradeInDeposit').value = valueStr;
		setMandatory();
	}
function dispNonMandatoryField(){
		document.getElementById('disp1').style.display = 'inline';
}
function hideNonMandatoryField(){
		document.getElementById('disp1').style.display = 'none'; 
}

function dispNonMandatoryField2(){
		document.getElementById('disp2').style.display = 'inline';
}
function hideNonMandatoryField2(){
		document.getElementById('disp2').style.display = 'none'; 
}
//-->
</script>
</head>

<body >
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetSpecVehiclesCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetSpecVehicles"/>
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
                <p class="deletedItem">DELETED</p>
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
</table></td>
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
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

<%String eHakMilikNumber = (iCol.getEHakMilikNumber()==null?"":iCol.getEHakMilikNumber());%>
<jsp:include page="/collateral/assetbased/assetspecvehicles/AssetSpecVehicles_update2.jsp">
	<jsp:param name="rowIdx" value="<%=rowIdx%>" />
	<jsp:param name="formName" value="<%=formName%>" />
	<jsp:param name="EHakMilikNumber" value="<%=eHakMilikNumber%>" />
</jsp:include>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="title.other.vehicle.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
		<tr><td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">	
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname">
				        <bean:message key="label.security.maturity.date"/></td>
				      <td colspan="3"><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
				        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
				             onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
				             onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="collateralMaturityDateError"/>&nbsp;&nbsp;<br><html:errors property="collateralMaturityDateStartDateError"/></td>
			</tr>	
		
		 <tr class="odd">
							<td colspan="4" align="right" class="amount"><input onclick="javascript : dispNonMandatoryField2()"
								name="AddNew22" type="button" id="AddNew22" value="Additional Details"
								class="btnNormal" />&nbsp;<input onclick="javascript : hideNonMandatoryField2()"
								name="AddNew23" type="button" id="AddNew23" value="Hide Additional Details"
								class="btnNormal" /></td>
	     </tr>
	    
		<tbody id="disp2" style="display: none;">
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				 <td width="20%" class="fieldname">
						<span class="fieldname"><bean:message key="label.security.asset.residual.scrap.value"/></span>
				        </td>
				    <td width="30%"><html:text property="scrapValue" maxlength="15" size="23" styleId="scrapValue" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
				        <html:errors property="scrapValue"/></td>
				         <td width="20%" class="fieldname">&nbsp;</td>
				         <td  width="30%">&nbsp;</td>
			   </tr>
				<%@ include file="/collateral/common/common_physical_inspection_update.jsp" %>
			<%-- 	<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>   --%>
				
				
				
				<%@ include file="/collateral/assetbased/asset_environment_risk_update.jsp" %>
				
				
			<%-- 	<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>  --%>
				
				<!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname">
				        <bean:message key="label.security.asset.road.tax.amount"/></td>
					<td><html:radio property="roadTaxAmtType" value="H" onclick="fnChooseRoadTaxType('halfYearly')">Half-Yearly</html:radio>&nbsp;
					        <html:text property="halfYearlyRoadTaxAmt" size="25" maxlength="20"/>&nbsp;<html:errors property="halfYearlyRoadTaxAmt"/><br>
				        <html:radio property="roadTaxAmtType" value="Y" onclick="fnChooseRoadTaxType('yearly')">Yearly</html:radio>&nbsp;
							<html:text property="yearlyRoadTaxAmt" size="25" maxlength="20"/>&nbsp;<html:errors property="yearlyRoadTaxAmt"/></td>
					<td class="fieldname">
				        <span class=stp><bean:message key="label.security.asset.road.tax.expiry.date"/></span></td>
				    <td><html:text property="roadTaxExpiryDate" readonly="true" size="15" maxlength="11"/>
				        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
				             onclick="showCalendar('roadTaxExpiryDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
				             onmouseout="MM_swapImgRestore()"/>&nbsp;</td>
				</tr>
				
				--><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				    <td class="fieldname"><bean:message key="label.security.asset.residual.asset.life"/>
				    <td><bean:write name="<%=formName%>" property="residualAssetLife"/>&nbsp;
						<bean:write name="<%=formName%>" property="residualAssetLifeUOM"/></td>
				     Mandatory if goodstatus is not New. Defaulted to 0.
				     
				     <td class="fieldname">
				        <bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
				    <td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
				        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
				             onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
				             onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
				
				   
				</tr>
				
				--%><!--Mandatory if goodstatus is not New-->
				<html:hidden property="assetValue"/>
				<html:hidden property="docPerfectAge"/><%--
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>"
				    <td class="fieldname">
						<span class=stp><bean:message key="label.security.asset.repossession.date"/></span> </td>
				    <td><html:text property="repossessionDate" readonly="true" size="15" maxlength="11"/>
				        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
				             onclick="showCalendar('repossessionDate', 'dd/mm/y')"
				             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
				             onmouseout="MM_swapImgRestore()"/>&nbsp;
				        <html:errors property="repossessionDate"/></td>
				    <td class="fieldname"><bean:message key="label.security.asset.ageofvehicle.repossession.date"/></td>
				    <td><bean:write name="<%=formName%>" property="repossessionAge"/>&nbsp;Year(s)</td>
				</tr>
				
				--%>
				<!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				    <td class="fieldname">
						<span class=stp><bean:message key="label.security.asset.sales.proceed"/></span></td>
				    <td><html:text property="salesProceed" maxlength="15"/>&nbsp;
				        <html:errors property="salesProceed"/></td>
					<td class="fieldname">
						<bean:message key="label.security.borrower.collateral" /> </td>
					<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
						<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
				</tr>
				
				--><!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname">
				        <bean:message key="label.security.asset.cgc.pledged"/> </td>
					<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp;
						<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
					<td class="fieldname">
				        <bean:message key="label.security.asset.freight.charges"/>&nbsp;</td>
				    <td><html:text property="fcharges"/>&nbsp;<html:errors property="fcharges"/></td>
				</tr>
				
				--><!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk" /></td>
		            <td colspan="3">
		                <html:textarea property="remarkEnvRisk" rows="5" cols="120" style="width:100%" />&nbsp;
		                <html:errors property="remarkEnvRisk"/></td>
		        </tr>

		        -->
		        
		        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
        Asset value at the time of collateral booking
        
    </td>
    
      <td>
        <html:text property="assetCollateralBookingVal"  maxlength="20" size="29" styleId="assetCollateralBookingVal" onblur="javascript:formatAmountAsCommaSeparatedWithoutDefaultDecimal(this)"/>
         <html:errors property="assetCollateralBookingVal"/>
    </td>
   
    <td class="fieldname">
       Description of assets
    </td>
    <td>
        
        <html:textarea property="descriptionAssets" rows="5" cols="200" style="width:100%" />&nbsp;
    </td>
</tr>
		        
		        
		        
		        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname">
						<span class="fieldname"><bean:message key="label.security.asset.description" /></span> </td>
		            <td colspan="3">
		                <html:textarea property="description" rows="5" cols="120" style="width:100%" />&nbsp;
		                <html:errors property="description"/></td>		                
		        </tr>
</tbody>
			</table>
		</td></tr>
	</tbody>
</table>

<%-- <%@ include file="/collateral/assetbased/trade_in_info_update.jsp"%>   --%>

<%-->
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<tbody>
         <%@ include file="/collateral/common/update_security_instrument.jsp" %>
</tbody>
</table>
</td>
</tr>

</tbody>
</table>--%>
<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %>

<%@ include file="/collateral/update_security_coverage.jsp" %>

<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<%--<%@ include file="/collateral/view_pledgor.jsp"

<%@ include file="/collateral/view_pledge.jsp" %> --%>

<%--<jsp:include page="/collateral/assetbased/update_charge_summary.jsp"/> --%>

<!--Update three valuation details-->
<%-- <%@ include file="/collateral/common/view_system_valuation.jsp"%> --%>                       
<%--<%@ include file="/collateral/common/view_valuation_from_los.jsp"%> --%>
<%-- <%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>--%> 



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

 
<html:hidden property="collateralLoc"/>

</html:form>

<script language="JavaScript" type="text/JavaScript">
<!--
	function fnChooseRoadTaxType(str){
		if (str == 'halfYearly') {
			document.forms[0].yearlyRoadTaxAmt.value=''
			document.forms[0].halfYearlyRoadTaxAmt.disabled=false;
			document.forms[0].yearlyRoadTaxAmt.disabled=true;
		} else if (str == 'yearly') {
			document.forms[0].halfYearlyRoadTaxAmt.value=''
			document.forms[0].halfYearlyRoadTaxAmt.disabled=true;
			document.forms[0].yearlyRoadTaxAmt.disabled=false;
		}
	}

function YearCalculate()
{
       
  	var PD = document.getElementById("perfectionDate").value;

	var year = PD.substring(7,11)
	//alert(year);
	
	var YOM = document.getElementById("yearMfg").value;
		
	PD1=parseInt(year);
	YOM2=parseInt(YOM);
	
	var age = PD1 - YOM2;
	var FinalAnswer= age;
	if (isNaN(FinalAnswer)) {
		document.getElementById("docPerfectAge").value= '' ;
		//document.getElementById("spanDocPerfectAge").innerText= '' ;
	} else {
		document.getElementById("docPerfectAge").value= FinalAnswer ;
		//document.getElementById("spanDocPerfectAge").innerText= FinalAnswer ;
	}
	
/*	document.forms[0].docPerfectAge.value=FinalAnswer;*/
}

function closeHandler(cal) {
  cal.hide();   // hide the calendar
  //YearCalculate();
  // don't check mousedown on document anymore (used to be able to hide the
  // calendar when someone clicks outside it, see the showCalendar function).
  Calendar.removeEvent(document, "mousedown", checkCalendar);

  Calendar.removeEvent(document, "scroll", checkCalendar);
  Calendar.removeEvent(document, "mousewheel", checkCalendar);
  Calendar.removeEvent(document, "keydown", checkCalendar);


}
    function setGoodStatus(val){
            /*if (val == 'N') {
                document.getElementById("spanASSETLIFE").style.visibility = "hidden";
                document.getElementById("spanSCRAPVALUE").style.visibility = "hidden";
                document.getElementById("spanASSETVALUE").style.visibility = "hidden";
             }else {
                document.getElementById("spanASSETLIFE").style.visibility = "visible";
                document.getElementById("spanSCRAPVALUE").style.visibility = "visible";
                document.getElementById("spanASSETVALUE").style.visibility = "visible";
            }*/
    }

    var goodStatus = "<%=colForm.getGoodStatus()%>";
    setGoodStatus(goodStatus);
//	document.getElementById("spanDocPerfectAge").innerText= '<%=colForm.getDocPerfectAge()%>' ;

//	checkTradein(document.forms[0].dptradein);
	
-->
</script>

 <%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>
</html>
