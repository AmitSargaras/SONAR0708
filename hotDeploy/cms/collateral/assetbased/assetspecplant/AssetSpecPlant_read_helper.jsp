<%--Beatified and formatted by jj--%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeplant.ISpecificChargePlant,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecplant.PlantEquipTypeList,
                 java.util.List,
                 java.util.ArrayList,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Arrays,
                 java.util.Comparator,
				 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.ui.common.CountryList,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.ui.common.FrequencyList,
				 com.integrosys.cms.ui.common.FrequencyList"%>
				     
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@page
	import="com.integrosys.cms.ui.collateral.assetbased.assetspecplant.AssetSpecPlantForm"%><script
	type="text/javascript">

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%ISpecificChargePlant oldCollateral = (ISpecificChargePlant) itrxValue.getCollateral();
    ISpecificChargePlant newCollateral = (ISpecificChargePlant) itrxValue.getStagingCollateral();
    String subtype = "AssetSpecPlant";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";
	
	AssetSpecPlantForm colForm = (AssetSpecPlantForm) request.getAttribute(formName);
	
String insuranceCheck = (String) session
					.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");%>


<!--//-->
function dispNonMandatoryField(){
		document.getElementById('disp1').style.display="";
}
function hideNonMandatoryField(){
		document.getElementById('disp1').style.display = 'none';
}
</script>


<tbody>
<tr>
    <td colspan="2">
	<table width="98%" border="0" cellpadding="0" cellspacing="0"
				class="tblInfo" align="center">
				<tbody>           
					<%@ include 
					file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
<%
if("process".equals(from_event)){ 
%>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" 
		class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%
}else{ 
%>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" 
		class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%
} 
%>
<!--End by Pramod Katkar-->
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" 
cellspacing="0" class="tblFormSection">
<thead>
	<tr>
	<td colspan="2"><h3>
	<bean:message key="label.security.additional.information"/>
	</h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" 
	class="tblInfo">
        <tbody>
        	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td 
		class="<%=isProcess
		?(CompareOBUtil.compOB(newCollateral,oldCollateral,"goodStatus")?"fieldname":"fieldnamediff")
		:"fieldname"%>">
		<span ><bean:message 
		key="label.security.asset.security.status"/></span>
		</td>
                <td >
                <integro:common-code
								categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>"
								entryCode="<%=iCol.getGoodStatus()%>" display="true" />&nbsp;</td>
		<td 
			class="<%=isProcess
			?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ramId")?"fieldname":"fieldnamediff")
			:"fieldname"%>">
                   RAM ID </td>
                <td ><integro:wrapper value="<%=iCol.getRamId()%>"/>&nbsp;</td>
            </tr>
            <%--@ include file="/collateral/common/common_physical_inspection_read.jsp" --%>
<!-- ---------------------physical_inspection_read--------------------------------- -->

<!-- ------------------------------------------------------- -->
             <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<%--use invice date as a start date by sachin patil--%>
    
    
    <td 
	    class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"invoiceDate")?"fieldname"
	    :"fieldnamediff"):"fieldname"%>">
        <span><bean:message key="label.security.asset.start.date"/></span> 
	</td>
    <td><integro:date object="<%=iCol.getInvoiceDate()%>"/>&nbsp;</td>
    
    <td 
    class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.maturity.date"/></td>
				<td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/>&nbsp;</td>
               
                <%--<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"inspectionStatusEntryCode")?"fieldname":"fieldnamediff"):"fieldname"%>" >
                <bean:message key="label.security.physical.inspection.status" />&nbsp;</td>
                <td >
                 <integro:common-code
					categoryCode="<%=CategoryCodeConstant.PHYSICAL_INSPECTION_STATUS%>"
					entryCode="<%=iCol.getInspectionStatusEntryCode()%>"
					display="true" /></td>
            --%></tr>
			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="<%=isProcess?((CompareOBUtil.compOB(newCollateral,oldCollateral,"plist")||
	            (iCol.getPlist()!=null && iCol.getPlist().getAmountAsDouble()==ICMSConstant.DOUBLE_INVALID_VALUE))?"fieldname":"fieldnamediff"):"fieldname"%>">
	                <bean:message key="label.security.asset.price.list"/>&nbsp;<span><bean:message key="label.mandatory"/></span>
	            </td>
	            <td>
					<integro:amount param="amount" amount="<%=iCol.getPlist()%>" decimal="2"/>&nbsp;
				</td>
			    <td class="fieldname">&nbsp;</td>
			    <td>&nbsp;</td>
			</tr>

			--%>
            <%--<%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp" %>
            --%>
            <%--<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
            <%@ include file="/collateral/common/common_fields_read.jsp" %>--%>
            <tr>
                        
							<td class="amount" colspan="4"><input onclick="javascript : dispNonMandatoryField()"
								name="AddNew12" type="button" id="AddNew12" value="Additional Details"
								class="btnNormal" />&nbsp;<input onclick="javascript : hideNonMandatoryField()"
								name="AddNew13" type="button" id="AddNew13" value="Hide Additional Details"
								class="btnNormal" /></td>
								
           </tr>
           <tbody id="disp1" style="display: none;">
            <%@ include file="AssetSpecPlant_extra_read.jsp" %><%--


            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
                   <bean:message key="label.security.asset.remarks.sec.env.risk"/> </td>
                <td colspan="3"><integro:wrapper value="<%=iCol.getEnvRiskyRemarks()%>"/>&nbsp;</td>
            </tr>
            --%>
            <%-- remarkEnvRisk field is used as Purpose field by sachin patil --%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <span><bean:message key="label.security.asset.purpose"/></span>&nbsp; </td>
                <td colspan="3"><integro:wrapper value="<%=iCol.getEnvRiskyRemarks()%>"/>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	    <td 
	    class="<%=isProcess
	    ?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff")
		:"fieldname"%>">
			<span><bean:message
			 key="label.security.asset.description"/></span>&nbsp; 
			 </td>
			 <td colspan="3"><integro:wrapper 
			 value="<%=iCol.getRemarks()%>"/>&nbsp;</td>
            </tr>
</tbody>
            <%--<%@ include file="/collateral/common/view_security_instrument.jsp" %>--%>
        </tbody>
		</table>
	</td>
</tr>
</tbody>
</table>

<%--<%@ include file="/collateral/assetbased/trade_in_info_view.jsp" %>

<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>

--%><%--<%@ include file="/collateral/secapportion/view_apportion_summary.jsp" %> --%>

<%--<%@ include file="/collateral/assetbased/view_charge_summary.jsp" %>
 --%><!--View three valuation details-->
<%--<%@ include file="/collateral/common/view_system_valuation.jsp"%>
--%><%--<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
--%>
<%-- <%@ include	file="/collateral/insurancepolicy/view_insurance_summary.jsp"%> --%>

<%
if(!"no".equals(insuranceCheck)) {
%>
<%@ include 
	file="/collateral/insurancepolicy/view_insurancestatus_summary.jsp"%>

<jsp:include page="/collateral/view_security_coverage.jsp" />
<%
}
%>



<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
