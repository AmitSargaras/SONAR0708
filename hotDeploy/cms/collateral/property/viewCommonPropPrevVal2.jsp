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
			<%@ include file="/collateral/common/viewBasicSecPrevVal2.jsp" %>
			</tbody>
        </table></td>
	</tr>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/viewCommonSecurityPrevVal2.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
	</tbody>
</table>

<%
	String isProcessStr = isProcess ? "true" : "false"; 

%>
	<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/viewCersaiPrevVal2.jsp" %>

<jsp:include page="/collateral/property/viewPropValComPrevVal2.jsp" >
	<jsp:param name="rowIdxInteger" value="<%=rowIdx %>" />
	<jsp:param name="isProcess" value="<%=isProcessStr %>" />
	<jsp:param name="subtype" value="<%=subtype%>" />
	<jsp:param name="fromEvent" value="<%=from_event %>"/>
</jsp:include>

<jsp:include page="/collateral/property/viewPropValUncomPrevVal2.jsp" >
	<jsp:param name="rowIdxInteger" value="<%=rowIdx %>" />
	<jsp:param name="isProcess" value="<%=isProcessStr %>" />
	<jsp:param name="subtype" value="<%=subtype%>" />
	<jsp:param name="fromEvent" value="<%=from_event %>"/>
	
</jsp:include>