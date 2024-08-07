<%@page import="com.integrosys.cms.app.common.constant.PropertiesConstantHelper"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer" %>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster" %>

<%@ include file="/template/charset_template.jsp" %>

<%
	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
		.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
%>
<html>
	<head>
		<title>Log Report</title>
		<%@ include file="/template/stylesheet_template.jsp" %>
	    <script type="text/javascript">
			function loadData()
			{
				load_DynamicStyleSheet(false);

				if (window.opener == null || window.opener =="undefined")
				{
					document.body.innerHTML = "";
					return;
				}
				
				if (window.opener.rootCause != null && window.opener.message != null && window.opener.stackTrace != null)
				{
					/* document.getElementById("rootCauseId").innerHTML = window.opener.rootCause.innerHTML;
					document.getElementById("errorMessageId").innerHTML = window.opener.message.innerHTML;
					document.getElementById("stackTraceId").innerHTML = window.opener.stackTrace.innerHTML; */
					document.getElementById("rootCauseId").innerHTML = " ";
					document.getElementById("errorMessageId").innerHTML = "Please go to the Logs for error.";
					document.getElementById("stackTraceId").innerHTML = " ";
				}
				
				if (document.getElementById("rootCauseId").innerHTML == '' && 
						document.getElementById("errorMessageId").innerHTML == '')
				{
					document.getElementById("rootCauseId").innerHTML = "Error 500--Internal Server Error";
					document.getElementById("errorMessageId").innerHTML = "Please go to the Logs for error.";
					document.getElementById("stackTraceId").innerHTML = " ";
				}

				if (window.opener.collateralId != null)
				{
					if (window.opener.collateralId.innerHTML != null &&
							window.opener.collateralId.innerHTML != "null") {
						document.getElementById("collateralId").innerHTML = window.opener.collateralId.innerHTML;
						document.getElementById("collateralId").parentNode.style.display="inline";
					}
				}
			}
		</script>
		
	</head>
	<body style="overflow:auto; font-family : Verdana;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="loadData()">
		<div>
			<div style="text-align:right;padding-right:50px;padding-top:25px;">				 
				<input type="button" name="printLog" value=" Print Log " class="btnNormal" onclick="javascript:window.print()"/>
				&nbsp;&nbsp;&nbsp;
				<input type="button" name="logClose" value=" Close " class="btnNormal" onclick="javascript:window.close();"/>
			</div>			
			<table width="97%" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				<thead>
					<tr>
						<td colspan="2" align="center">
							<b>Log Report for Application</b>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr class="even">
						<td width="5%" class="fieldname"><b>Build Number</b></td>
						<td width="95%" align="left" id="buildNumberId" valign="top">
							<%=PropertiesConstantHelper.getBuildNumber()%>
						</td>
					</tr>
					<%
						if (customer != null) {
					%>
					<tr class="even">
						<td class="fieldname"><b>Customer Info</b></td>
						<td align="left" id="customerId" valign="top">
							<%=customer.getCMSLegalEntity().getLEReference() %>&nbsp;
							(<%=customer.getCMSLegalEntity().getLegalIDSource() %>)
						</td>		
					</tr>
					<% } %>
					<% if (profile != null) { %>
					<tr class="even">
						<td class="fieldname"><b>AA Info</b></td>
						<td align="left" id="limitProfileId" valign="top">
							<%=profile.getLosLimitProfileReference() %>&nbsp;
							(<%=profile.getSourceID() %>)		
						</td>		
					</tr>				
					<% } %>
					<% if(facilityMasterObj != null && 
							facilityMasterObj.getLimit() != null) { %>
					<tr class="even">
						<td class="fieldname"><b>Facility Info</b></td>
						<td align="left" id="facilityId" valign="top">
							<%=facilityMasterObj.getLimit().getLimitID() %>		
						</td>		
					</tr>			
					<% } %>
					<tr class="even" style="display:none">
						<td class="fieldname"><b>Collateral Info</b></td>
						<td align="left" id="collateralId" valign="top"></td>		
					</tr>							
					<tr class="even">
						<td class="fieldname"><b>Root Cause:</b></td>
						<td align="left" id="rootCauseId" valign="top"></td>
					</tr>
					<tr class="even">
						<td class="fieldname"><b>Error Message:</b></td>
						<td align="left" id="errorMessageId" valign="top"></td>
					</tr>
					<tr class="even">
						<td class="fieldname"><b>Stack Trace:</b></td>
						<td align="left" id="stackTraceId" valign="top"></td>
					</tr>	
				</tbody>
			</table>
		</div>
		<br />
		<div style="text-align: center;">
				<input type="button" name="printLog" value=" Print Log " class="btnNormal" onclick="javascript:window.print()"/>
				&nbsp;&nbsp;&nbsp;
				<input type="button" name="logClose" value=" Close " class="btnNormal" onclick="javascript:window.close();"/>
		</div>		
		<br />
	</body>
</html>