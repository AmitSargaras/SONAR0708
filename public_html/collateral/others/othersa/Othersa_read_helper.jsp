<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.type.others.subtype.othersa.IOthersa,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
                 com.integrosys.cms.app.collateral.bus.*,
                 java.util.ArrayList,
                 java.util.List,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.others.*,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.ui.collateral.InsuranceTypeList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Arrays,
                 java.util.Comparator" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList,com.integrosys.cms.ui.collateral.others.othersa.OthersaForm" %>
<%@page import="com.integrosys.cms.ui.collateral.others.othersa.OthersaAction"%>




<%
    IOthersa oldCollateral = (IOthersa) itrxValue.getCollateral();
    IOthersa newCollateral = (IOthersa) itrxValue.getStagingCollateral();
    String prefix = "Other";
    String subtype = "Othersa";
    String valuationDate = null;
    String formName = subtype + "Form";
    String formActionName = subtype + "Collateral.do";
    
    OthersaForm colForm = (OthersaForm) request.getAttribute(formName);
    String insuranceCheck = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.othersa.OthersaAction.insuranceCheck");

%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<tbody>
    <tr>
		 <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
        <tbody>
             <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
	</tr>
<!--  Added by Pramod Katkar for New Filed CR on 22-08-2013-->
<%if("process".equals(from_event)){ %>
<tr>
    <td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %>
<tr>
    <td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%} %>
<!--End by Pramod Katkar-->
</tbody>
</table>

 <!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
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
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isPhysicalInspection")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%><span class="mandatoryPerfection">*</span></td>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol.getIsPhysicalInspection()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        if (isProcess) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreq")||(iCol.getPhysicalInspectionFreq() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreqUnit");
        }
    %>
    <td class="<%=isProcess?(physicalUpdated?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
       
    </td>
    
        <% if (iCol.getPhysicalInspectionFreqUnit()!=null){ %>
        <td>
        <integro:common-code-single entryCode="<%=iCol.getPhysicalInspectionFreqUnit()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% }else{ %>
        <td>-&nbsp;</td>
        <%} %>
        &nbsp;
    
</tr>
  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <% if (iCol.getIsPhysicalInspection()) { %>
	                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                        <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% } else { %>
	                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% }%>
	            <%if( iCol.getLastPhysicalInspectDate()!=null){%>
	            <td><integro:date object="<%=iCol.getLastPhysicalInspectDate() %>"/>&nbsp;</td>
	            <%}else {%>
	            <td>-&nbsp;</td>
	            <%} %>
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol.getNextPhysicalInspectDate()!=null){ %>
	            <td><integro:date object="<%=iCol.getNextPhysicalInspectDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	        </tr>

           
			 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getFSVBalance(),((oldCollateral==null)?null:oldCollateral.getFSVBalance()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.asset.value.collat.booking"/>
        </td>
    <td><!--<bean:write name="<%=formName %>" property="FSVBalance"/>-->
    <%if((null!=newCollateral.getFSVBalance() && !"".equals(newCollateral.getFSVBalance()))) {%>
    	<%=UIUtil.formatWithCommaAndDecimal(newCollateral.getFSVBalance().getAmountAsBigDecimal().toPlainString()) %>
    <%}else{ %>-
    <%} %>&nbsp;</td>
    
      <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getReservePrice(),((oldCollateral==null)?null:oldCollateral.getReservePrice()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.residual.scrap.value.new"/></td>
    <td><!--<bean:write name="<%=formName %>" property="reservePrice"/>-->
      <%if((null!=newCollateral.getReservePrice() && !"".equals(newCollateral.getReservePrice()))) {%>
    	<%=UIUtil.formatWithCommaAndDecimal(newCollateral.getReservePrice().getAmountAsBigDecimal().toPlainString()) %>
   <%}else{ %>-
    <%} %>&nbsp;</td>
   
            </tr>
			<tr>
			      
				 <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					Good Status</td>
				    <td><integro:common-code categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>" entryCode="<%=iCol.getGoodStatus()%>" descWithCode="false"  display="true"/>&nbsp;</td>
				  
	        <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getReservePrice(),((oldCollateral==null)?null:oldCollateral.getReservePrice()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        </td>
    <td>&nbsp;</td>
   
				
				
				</tr>
          
            <tr>
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"description")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                <bean:message key="label.security.collateral.description"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <td colspan="3"><integro:wrapper value="<%=iCol.getDescription()%>"/>&nbsp;</td>
	        </tr>

           

        </tbody>
        </table>
    </td>
    </tr>
</tbody>
</table>

<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>

<%
if(!"no".equals(insuranceCheck)) {
%>

<jsp:include page="/collateral/view_security_coverage.jsp" />
<%
}
%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>

