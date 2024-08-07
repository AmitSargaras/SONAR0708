<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>


<script type="text/javascript" language="javascript">
    <!--


      function setDateSecFlag(dropdown){
            if(dropdown.selectedIndex==0){
                document.getElementById("span_secEnvRisky").style.visibility = "hidden";
            }else if ('NA'==dropdown.options[dropdown.selectedIndex].value) {
                document.getElementById("span_secEnvRisky").style.visibility = "hidden";
            }else{
                document.getElementById("span_secEnvRisky").style.visibility = "visible";
            }
        }

    //-->
</script>


<%
    boolean isEditable = true;

%>


			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

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
			<%@ include file="/collateral/common/common_physical_inspection_update.jsp" %>
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="fieldname">
			        <bean:message key="label.security.maturity.date"/>&nbsp;
			        <span class="mandatoryPerfection">*</span></td>
			    <td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
			        <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
			             onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
			             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
			             onmouseout="MM_swapImgRestore()"/>
			        &nbsp;<html:errors property="collateralMaturityDate"/></td>
				<td class="fieldname">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp;
					<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp; </td>
			</tr>

			<%@ include file="/collateral/assetbased/asset_environment_risk_update.jsp" %>
			<%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
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
