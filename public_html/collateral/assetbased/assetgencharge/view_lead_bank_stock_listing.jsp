<%@page import="org.apache.commons.collections.ListUtils"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page import="org.springframework.util.CollectionUtils,
				com.integrosys.base.uiinfra.common.ICommonEventConstant,
				com.integrosys.cms.ui.collateral.assetbased.assetgencharge.LeadBankStockSummaryForm,
				com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockForm" %>

<% 
String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
Boolean isSecurityViewMode = (Boolean) session.getAttribute(ipinPath + ".isSecurityViewMode");
DueDateAndStockForm form = (DueDateAndStockForm) request.getAttribute("DueDateAndStockForm");
pageContext.setAttribute("DueDateAndStockForm", form);

%>
				
<script type="text/javascript">

var event = '<%=form.getEvent()%>';
var isSecurityViewMode = '<%=isSecurityViewMode%>';

function executeLeadBankStockAction(index) {
	console.log("View index: "+index);
	document.forms[0].action="leadBankStock.do?event=view_lead_bank_stock&selectedLNBStockIndex="+index;
	document.forms[0].submit();
}

</script>

<input type="hidden" name="assetId" value="<%=request.getAttribute("assetId") %>" />
<input type="hidden" name="referrerEvent" value="<%=form.getEvent() %>"/>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	<tr>
		<td colspan="2"><h3>Stock Details as per Lead Bank/Nodal Bank</h3></td>
		<td valign="bottom" align="right">
		</td>
	</tr>
	<tr> <td colspan="3"><hr/></td> </tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="3">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<thead>
						<tr>
							<td width="5%"><bean:message key="label.global.sn"/></td>
							<td width="29%">Drawing Power as per Lead Bank</td>
							<td width="29%">Stock Amount</td>
							<td width="24%">Allocation (%)</td>
							<td width="13%">Action</td>
						</tr>
					</thead>
					<tbody>
						<logic:present name="DueDateAndStockForm" property="leadBankStockSummary">
							<logic:iterate id="bankStockForm" indexId="lnbStockIndex" name="DueDateAndStockForm" property="leadBankStockSummary"
								type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.LeadBankStockSummaryForm">
								<tr name="stocksAsPerleadBank" class="<%=(lnbStockIndex++)%2 == 0 ? "even" : "odd" %>">
									<td class="index"><%=lnbStockIndex%></td>
									<td name="leadBankDp" style="text-align: center;">
										<bean:write name="bankStockForm" property="drawingPowerAsPerLeadBank"/></td>
									<td style="text-align: center;">
										<bean:write name="bankStockForm" property="stockAmount"/></td>
									<td name="leadBankDpSharePct" style="text-align: center;">
										<bean:write name="bankStockForm" property="bankSharePercentage"/></td>
									<td style="text-align: center;">
										<a href="javascript:executeLeadBankStockAction('<%=lnbStockIndex%>')">View</a> 
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
						<logic:notPresent name="DueDateAndStockForm" property="leadBankStockSummary">
							<tr>
								<td colspan="6">&nbsp;<bean:message key="label.global.not.found" /></td>
							</tr>
						</logic:notPresent>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>

<br>	
