<%@ page import="com.integrosys.cms.ui.collateral.property.CategoryLandUseList,
				com.integrosys.cms.ui.collateral.property.LandAreaUOMList,
				com.integrosys.cms.ui.collateral.property.PropertyTypeList,
				com.integrosys.cms.ui.collateral.property.PropertyUsageList,
				com.integrosys.cms.ui.collateral.property.PropertyCompletionStatusList,
				com.integrosys.cms.ui.collateral.property.RealEstateUsageList,
				com.integrosys.cms.ui.common.CommonCodeList,	
				com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%
String insuranceCheck =(String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCheck");
%>
	<tbody>
    <tr>
		<td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
			<tbody> 
			<%@ include file="/collateral/common/viewBasicSecPrevVal3.jsp" %>
			</tbody>
        </table></td>
	</tr>
<%-- <%if("process".equals(from_event)){ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %> --%>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/viewCommonSecurityPrevVal3.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%-- <%} %> --%>
	</tbody>
</table>

<%
	String isProcessStr = isProcess ? "true" : "false"; 

%>
	<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/viewCersaiPrevVal3.jsp" %>

<jsp:include page="/collateral/property/viewPropValComPrevVal3.jsp" >
	<jsp:param name="rowIdxInteger" value="<%=rowIdx %>" />
	<jsp:param name="isProcess" value="<%=isProcessStr %>" />
	<jsp:param name="subtype" value="<%=subtype%>" />
	<jsp:param name="fromEvent" value="<%=from_event %>"/>
</jsp:include>

<jsp:include page="/collateral/property/viewPropValUncomPrevVal3.jsp" >
	<jsp:param name="rowIdxInteger" value="<%=rowIdx %>" />
	<jsp:param name="isProcess" value="<%=isProcessStr %>" />
	<jsp:param name="subtype" value="<%=subtype%>" />
	<jsp:param name="fromEvent" value="<%=from_event %>"/>
	
</jsp:include>

 
<%-- <%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %> --%>
<%-- <%
if("on".equals(insuranceCheck))
{
%>
<%@ include file="/collateral/insurancepolicy/view_insurancestatus_summary.jsp"%>
<%
}
%>
 --%>

