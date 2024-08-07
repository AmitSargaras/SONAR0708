<%--Beatified and formatted by jj--%>
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
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargegold.ISpecificChargeGold,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecgold.AssetSpecGoldForm,
                 com.integrosys.cms.ui.dataprotection.DataProtectionConstants,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecgold.GoldUOMList,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"%>


<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header$
     *
     * Purpose: Update Collateral
     * Description: Asset Based - Gold Type
     *
     * @author $Author: shphoon $<br>
     * @version $Revision: 1.2 $
     * Date: $Date: 2007/03/15 02:44:12 $
     * Tag: $Name:$
     */
%>

<% 
    pageContext.setAttribute("strSubType", "AssetSpecGold");
	ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

    ISpecificChargeGold iCol = (ISpecificChargeGold) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    
    String subtype = "AssetSpecGold";
    String prefix = "Asset";
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
    AssetSpecGoldForm colForm = (AssetSpecGoldForm) request.getAttribute("AssetSpecGoldForm");
   
	String event = itrxValue.getCollateral()==null ? "create" : "update";

    //todo - need to check
    String collateralLocation = iCol.getCollateralLocation();

    String roleType = (String) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong (roleType);

	IDataProtectionProxy dpProxy = DataProtectionProxyFactory.getProxy();

    boolean updatableSecDetails = dpProxy.isFieldAccessAllowed(ICMSConstant.INSTANCE_COLLATERAL,subtypeCode, DataProtectionConstants.COL_PT_DTL,
		teamTypeMshipID, collateralLocation, IDataProtectionProxy.ANY_ORGANISATION);

	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
	
	String goldUnitPriceCurrency = colForm.getGoldUnitPriceCurrency()==null?"":colForm.getGoldUnitPriceCurrency();
	String goldUnitPrice = colForm.getGoldUnitPrice()==null?"":colForm.getGoldUnitPrice();
	String getStr = "";
	boolean isNull = false;
	if(goldUnitPriceCurrency.equals("")||goldUnitPrice.equals("")){
		isNull = true;
	}else{
		getStr = goldUnitPriceCurrency + " " + goldUnitPrice + " / ";
	}
	String prefix1 = "Asset";
	String insuranceCheck=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");

	String totalPolicyAmt = (String) session.getAttribute(AssetBasedAction.class.getName() +"."+CollateralConstant.SESSION_TOTAL_INSURANCE_POLICY_AMT);

    //todo - end
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
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
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
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "INSURANCE_INFO";	    
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
<%--    if (num == 6) {--%>
<%--        document.forms[0].event.value = "prepare";--%>
<%--        document.forms[0].indexID.value = "-1";--%>
<%--        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";--%>
<%--    }--%>
<%--    if (num == 7) {--%>
<%--        document.forms[0].event.value = "prepare_update_sub";--%>
<%--        document.forms[0].indexID.value = index;--%>
<%--        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";--%>
<%--    }--%>
<%--    if (num == 8) {--%>
<%--        document.forms[0].event.value = "itemDelete";--%>
<%--        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";--%>
<%--    }--%>
		if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
	    }

    document.forms[0].submit();

}
function call() {
alert(document.forms[0].goldUnitPrice.value);
}
//-->
</script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetSpecGoldCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetSpecGold"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>
<html:hidden property="goldUnitPriceCurrency" value="<%=itrxValue.getCollateral().getCurrencyCode() %>"/>
<%System.out.println("Collateral Currency:"+itrxValue.getCollateral().getCurrencyCode()); %>
<%--
<html:hidden property="goldUnitPrice" />
<html:hidden property="goldUnitPriceUOM" />
--%>

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
<!--Govind S: Commented as required for HDFC Dev 30/06/2011
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
 -->
<tbody>

<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">   
	        	
	            <td class="fieldname">
					<bean:message key="label.security.gold.type"/>&nbsp;</td>
	            <td>
	            <%-- 
	            	<html:select property="assetType">
	                    <option value=""><bean:message key="label.please.select"/></option>
	                    <html:options name="goldTypeValue" labelName="goldTypeLabel"/>
	                </html:select>&nbsp;
	                --%>
	                 <html:text property="assetType" maxlength="50"/>
	                <html:errors property="assetType"/></td>
	            <td class="fieldname">
					<bean:message key="label.security.gold.grade"/>&nbsp;</td>
	            <td>
	            <%--Govind S: Commented as required for HDFC Dev 30/06/2011
	            <html:select property="goldGrade">
	                    <option value=""><bean:message key="label.please.select"/></option>
	                    <html:options name="goldGradeValue" labelName="goldGradeLabel"/>
	           </html:select>&nbsp;
	           --%>
	           <html:text property="goldGrade" maxlength="50"/>
	           <html:errors property="goldGrade"/></td>
	        </tr>
	        
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	        <%--Govind S: Commented as required for HDFC Dev 30/06/2011
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.purchase.receipt.num"/></span></td>
	            <td><html:text property="purchaseReceiptNo" maxlength="40"/>&nbsp;
	                <html:errors property="purchaseReceiptNo"/></td>
	        --%>
	        
	        <%---****************************FOR TEST
	            <td class="fieldname">
					<span class=stp><bean:message key="label.predeal.unit.price.feed"/></span></td>
				<td><%if(isNull){ %>-
				<%}else{ %> <%=getStr %>
				<%if(colForm.getGoldUnitPriceUOM()!=null){ %>
				<integro:empty-if-null value="<%=GoldUOMList.getInstance().getGoldUOMItem(colForm.getGoldUnitPriceUOM().trim())%>"/> 
				<%}else{ %>-<%} } %> &nbsp;
				(<%=colForm.getFeedGoldUnitPrice()==null?"-":colForm.getFeedGoldUnitPrice() %>)
				</td>
				********************************--%>
			   <td class="fieldname">
					<bean:message key="label.predeal.unit.price.feed"/>&nbsp;</td>
	           <td><html:text property="goldUnitPrice" maxlength="10" size="16" styleId="goldUnitPrice" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
	                <html:errors property="goldUnitPrice"/>
	                <html:select property="goldUnitPriceUOM">
	                    <option value=""><bean:message key="label.please.select"/></option>
	                    <html:options name="goldUOMValue" labelName="goldUOMLabel"/>
	                </html:select>&nbsp;
	                <html:errors property="goldUnitPriceUOM"/></td>
			
				
<%--
	            <td><html:text property="goldUnitPrice" maxlength="15" readonly="true" />&nbsp;
	                <html:errors property="goldUnitPrice"/>/&nbsp;
	                <html:select property="goldUnitPriceUOM" disabled="true" >
	                    <option value=""><bean:message key="label.please.select"/></option>
	                    <html:options name="goldUOMValue" labelName="goldUOMLabel"/>
	                </html:select>&nbsp;
	                <html:errors property="goldUnitPriceUOM"/></td> 
--%>

 <%--Govind S: Commented as required for HDFC Dev 30/06/2011
	        </tr>
			
			
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	       
	            <td class="fieldname">
					<bean:message key="label.security.cert.expiry.date"/></td>
	            <td><html:text property="certExpiryDate" readonly="true" size="15" maxlength="11"/>
	                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('certExpiryDate', 'dd/mm/y')"
	                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                <html:errors property="certExpiryDate"/></td>
	            --%>
	            <td class="fieldname">
					<bean:message key="label.security.weight"/>&nbsp;</td>
	            <td><html:text property="goldWeight" maxlength="15"/>&nbsp;
	                <html:errors property="goldWeight"/>
	                <html:select property="goldUOM">
	                    <option value=""><bean:message key="label.please.select"/></option>
	                    <html:options name="goldUOMValue" labelName="goldUOMLabel"/>
	                </html:select>&nbsp;
	                <html:errors property="goldUOM"/></td>
	        </tr>
			
			<%--Govind S: Commented as required for HDFC Dev 30/06/2011 
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.purchase.value"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
	            <td><html:text property="purchasePrice" maxlength="15"/>&nbsp;
	                <html:errors property="purchasePrice"/></td>
				<td class="fieldname">
					<bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
				<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
					<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
						 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						 onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
	        </tr>
			
	        <%@ include file="/collateral/assetbased/asset_environment_risk_update.jsp" %>
	        <%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
		
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.auction.price"/></span></td>
	            <td><html:text property="auctionPrice" maxlength="15"/>&nbsp;
	                <html:errors property="auctionPrice"/></td>
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.auctioneer"/></span></td>
	            <td><html:text property="auctioneer" maxlength="80"/>&nbsp;
	                <html:errors property="auctioneer"/></td>
	        </tr>
			
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.sales.proceed"/></span></td>
	            <td><html:text property="salesProceed" maxlength="15"/>&nbsp;
	                <html:errors property="salesProceed"/></td>
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.auction.date"/></span></td>
	            <td><html:text property="auctionDate" readonly="true" size="15" maxlength="11"/>
	                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('auctionDate', 'dd/mm/y')"
	                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                <html:errors property="auctionDate"/></td>
	        </tr>
--%>
	        <%@ include file="/collateral/common/common_physical_inspection_update.jsp" %>
<%--
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
				<td class="fieldname">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp;
					<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
			</tr>


			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname"><bean:message key="label.security.maturity.date"/></td>
	            <td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
	                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
	                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                <html:errors property="collateralMaturityDate"/></td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
--%> 
<%--Govind S:Commented for HDFC 01/06/2011
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
	            <td colspan="3">
	                <html:textarea property="remarkEnvRisk" rows="5" cols="120" style="width:100%" /><br>
	                <html:errors property="remarkEnvRisk"/></td>
	        </tr>
--%>

	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<bean:message key="label.security.asset.description"/>&nbsp;</td>
	            <td colspan="3">
	                <html:textarea property="description" rows="5" cols="120" style="width:100%" /><br>
	                <html:errors property="description"/></td>
	        </tr>
        
        <%-- <%@ include file="/collateral/common/update_security_instrument.jsp" %> --%>

        </tbody>
		</table>
	</td>
</tr>
</tbody>
</table>
<%--Govind S: Commented as required for HDFC Dev 30/06/2011 
<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

<jsp:include page="/collateral/assetbased/update_charge_summary.jsp"/>

<!--Update two valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp" %>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
--%>
<%--Govind S: Commented as required for HDFC Dev 30/06/2011
<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>
--%>
<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %>

<%
if(!"no".equals(insuranceCheck))
{
%>

<%@ include file="/collateral/update_security_coverage.jsp" %>
<%
}
%>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>
<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>

</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>
</html>
