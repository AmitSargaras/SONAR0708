<%	String from_event = "prepare_update";
	String valuer = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.oldValuer");
	
	String insuranceCheck =(String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCheck");
%>

<tbody>
<tr><td colspan="2">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>       
			<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
			

        </tbody>
    </table>
    </td></tr>
    <tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/update_common_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 <%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>
	
<%  boolean isProcess = false;
	String isProcessStr = isProcess ? "true" : "false"; 
%>
<jsp:include page="/collateral/property/update_property_general.jsp" >
	<jsp:param name="rowIdxInteger" value="<%=rowIdx %>" />
	<jsp:param name="isProcess" value="<%=isProcessStr %>" />
	<jsp:param name="subtype" value="<%=subtype%>" />
</jsp:include>

<%@ include file="/collateral/property/update_property_Additional_Doc_Facility_det.jsp" %>

<%@ include file="/collateral/property/update_property.jsp" %>         

<%-- <%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %> --%>

<%
if("on".equals(insuranceCheck))
{
%>
<%@ include file="/collateral/insurancepolicy/update_insurancestatus_summary.jsp" %>
<%
}
%>


<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>