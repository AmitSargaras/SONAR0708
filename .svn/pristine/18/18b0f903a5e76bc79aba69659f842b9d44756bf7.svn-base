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
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.HashMap,
                 java.util.Iterator,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeothers.ISpecificChargeOthers,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecother.AssetSpecOtherForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetspecother/AssetSpecOther_update.jsp,v 1.60 2006/11/23 02:43:50 jzhan Exp $
    *
    * Purpose: Update Collateral
    * Description: Asset Based
    *
    * @author $Author: jzhan $<br>
    * @version $Revision: 1.60 $
    * Date: $Date: 2006/11/23 02:43:50 $
    * Tag: $Name: DEV_20061123_B286V1 $
    */
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

    ISpecificChargeOthers iCol = (ISpecificChargeOthers) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();    
    
    String subtype = "AssetSpecOther";
    String prefix = "Asset";
    String formName = subtype+"Form";
    String from_event="prepare_update" ;
    String formActionName = subtype+"Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	String prefix1 = "Asset";
    AssetSpecOtherForm colForm = (AssetSpecOtherForm) request.getAttribute(formName);
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");	
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="org.apache.struts.action.ActionMessage"%>

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

//-->
</script>


</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="AssetSpecOtherCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="AssetSpecOther"/>
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
      <td> <h3><bean:message key="label.security.general"/></h3></td>
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
					<span ><bean:message key="label.security.asset.goods.status" /></td>
	            <td colspan="3">
	            <html:select property="goodStatus">
					<integro:common-code
						categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>" />
				</html:select><html:errors property="goodStatus"/>
	        </td>
			</tr>
    <tr>
			<%@ include file="/collateral/assetbased/asset_environment_risk_update.jsp" %>
			<%--<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>

			--%>

			<%--<%@ include file="/collateral/common/common_fields_update.jsp" %>
			--%><%@ include file="/collateral/common/common_physical_inspection_update.jsp" %>
			<%--<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
				
	       --%>
	      
	      <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<%--use Exchange Ctrl Date as a start date by sachin patil--%>		
						<td class="fieldname">
				<bean:message key="label.security.asset.start.date" />&nbsp;
				<%--<span class="mandatoryPerfection" id="exchangeControlDateID" >*</span>
				--%></td>
			<td><html:text property="exchangeControlDate" readonly="true" size="15" maxlength="11" />
				<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
					 onclick="showCalendar('exchangeControlDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
					 onmouseout="MM_swapImgRestore()"/>
				<html:errors property="exchangeControlDate"/>
			</td>
				<td class="fieldname">
					<bean:message key="label.security.perfection.date"/></td>
				<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
					<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
						 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						 onmouseout="MM_swapImgRestore()"/><html:errors property="perfectionDate"/>&nbsp;</td>
				
				<%--<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
			--%></tr>
	      
	       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<bean:message key="label.security.maturity.date" /></td>
	            <td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
	                <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
	                     onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y');"
	                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                <html:errors property="collateralMaturityDate"/></td>
	                <td>&nbsp;</td>
	                <td>&nbsp;</td>
<%--reserve price is used as residual scrap value--%>
	                 <%--<td class="fieldname"><span class=stp><bean:message key="label.security.asset.purchase.price"/></span> &nbsp;
            </td>
    <td><html:text property="netRealisableSecValue" maxlength="18"/>&nbsp;
         &nbsp; <html:errors property="netRealisableSecValue"/></td>
         
         
--%>

    
<!--	    		<td class="tooltips"><bean:message key="label.security.asset.other.type"/><span class="style2">&nbsp;<bean:message key="label.mandatory"/>
					<a href="#"><font color="#0000FF" style="text-decoration:none">Host Ref.<span class="Float"><integro:empty-if-null value="<%=iCol.getAssetTypeHostRef()%>"/></span></a></td>-->
				<%--<td class="fieldname"><bean:message key="label.security.asset.other.type"/>&nbsp;<bean:message key="label.mandatory"/></td>
				<td><html:select property="assetType" >
	                    <option value=""><bean:message key="label.please.select"/></option>
						<html:options name="otherTypeID" labelName="otherTypeValue"/>
	                </html:select>&nbsp;
	                <html:errors property="assetType"/></td>
	        --%></tr><%--

	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp;
					<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
	            <td class ="fieldname">&nbsp;</td>
	            <td>&nbsp;</td>
	        </tr>

            --%><%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk"/> </td>
				<td colspan="3">
					<html:textarea property="remarkEnvRisk" rows="5" cols="120" style="width:100%" onkeyup="limitTextInput(this,250,'Remarks for Security Environmentally Risky ')"/>
					&nbsp; <html:errors property="remarkEnvRisk" /></td>
            </tr>
			
            --%>
            <%-- assetValue field is used for asset value at the time of collateral booking  by Scahin Patil
--%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--use registration Fee as a Residual scrap value by sachin patil--%>
<td class="fieldname"><bean:message key="label.security.asset.residual.scrap.value.new"/></td>
    <td><html:text property="scrapValue" maxlength="23" size="34" styleId="scrapValue" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
        &nbsp;<html:errors property="scrapValue"/></td>
            
				 <td class="fieldname"><bean:message key="label.security.asset.asset.value.collat.booking"/>
		<!--<span id="spanASSETVALUE" >   <bean:message key="label.mandatory"/></span>--></td>
    <td><html:text property="assetValue" maxlength="15" size="23" styleId="assetValue" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
        <html:errors property="assetValue"  /></td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.desc.asset"/></span></td>
				<td colspan="3">
					<html:textarea property="description" rows="5" cols="120"style="width:100%" onkeyup="limitTextInput(this,200,'Description of Asset ')"/>
					&nbsp;<html:errors property="description"/></td>
            </tr>
			
             <%--<%@ include file="/collateral/common/update_security_instrument.jsp" %>--%>
        </tbody>
        </table></td>
    </tr>
  </tbody>
</table>


<%--<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

<jsp:include page="/collateral/assetbased/update_charge_summary.jsp"/>

--%><!--Update two valuation details-->
<%--<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
--%><%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<%--<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp"%>

--%><jsp:include page="/collateral/common/common_maker_remarks.jsp" >
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
