<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeaircraft.ISpecificChargeAircraft,
                 com.integrosys.cms.ui.collateral.assetbased.assetaircraft.ExportCrdtAgencyList,
                 com.integrosys.cms.ui.collateral.assetbased.assetaircraft.InsurerList,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Arrays,                 
                 java.util.Comparator,
				 java.text.SimpleDateFormat"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
    ISpecificChargeAircraft oldCollateral = (ISpecificChargeAircraft) itrxValue.getCollateral();
    ISpecificChargeAircraft newCollateral = (ISpecificChargeAircraft) itrxValue.getStagingCollateral();
    String prefix = "Asset";
    String subtype = "AssetAircraft";    
	String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
	AssetAircraftForm colForm = (AssetAircraftForm) request.getAttribute(formName);
	
	
	String insuranceCheck=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");
	//System.out.println("insuranceCheck:"+insuranceCheck);
%>

  
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetaircraft.AssetAircraftForm"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><tbody>
    <tr>
      <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
        <tbody>
             <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
<%if("process".equals(from_event)){ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%} %>
<!--End by Pramod Katkar-->
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

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
	           	
	           	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ramId")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    RAM ID</td>
	                <td><bean:write name="AssetAircraftForm" property="ramId"/>&nbsp;</td>
	                
	                
				 <td class="fieldname">
					&nbsp;</td>
				    <td>&nbsp;</td>
			   </tr>
			   
			   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	           	
	           	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"startDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    Start Date</td>
	                <td><bean:write name="AssetAircraftForm" property="startDate"/>&nbsp;</td>
	                
	                
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"maturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    Maturity Date</td>
	                <td><bean:write name="AssetAircraftForm" property="maturityDate"/>&nbsp;</td>
			   </tr>
	        
	            <%@ include file="/collateral/common/common_physical_inspection_read.jsp" %>
				<%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp" %>
		
							
	          
	           
	           	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	           	
	           	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getScrapValue(),(oldCollateral == null? null : oldCollateral.getScrapValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <span class=stp><bean:message key="label.security.asset.residual.scrap.value"/></span></td>
	                <td><!--<bean:write name="AssetAircraftForm" property="scrapValue"/>-->
	                 <%if(null!=iCol.getScrapValue() && !"".equals(iCol.getScrapValue())){ %>
	                <%=UIUtil.formatWithCommaAndDecimal(iCol.getScrapValue().getAmountAsBigDecimal().toPlainString()) %>
	                 <%} %>&nbsp;</td>
	                
	                
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					Good Status</td>
				    <td><integro:common-code categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>" entryCode="<%=iCol.getGoodStatus()%>" descWithCode="false"  display="true"/>&nbsp;</td>
			   </tr>
			   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
						Description of Asset</td>
	                <td colspan="3"><integro:wrapper value="<%=iCol.getRemarks()%>"/>&nbsp;</td>
	            </tr>
			
				
			
			
			</tbody>
			</table>
		</td>
    </tr>
  </tbody>
</table>




<%-- <%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp"%> --%>

<%
if(!"no".equals(insuranceCheck))
{
%>
<%@ include file="/collateral/insurancepolicy/view_insurancestatus_summary.jsp"%>

<jsp:include page="/collateral/view_security_coverage.jsp" />
<%
}
%>


<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
