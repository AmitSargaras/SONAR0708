<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
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
String sessionDueDateSubEvent = (String) session.getAttribute(ipinPath + "."+CollateralConstant.SESSION_DUE_DATE_ACTION);

%>
				
<script type="text/javascript">

var event = '<%=form.getEvent()%>';
var sessionDueDateSubEvent = '<%=sessionDueDateSubEvent%>';
var isSecurityViewMode = '<%=isSecurityViewMode%>';

function addLeadBankStock() {
	document.forms[0].action="dueDateAndStock.do?event=update_session_add_lead_bank_stock&referrerEvent="+sessionDueDateSubEvent;
    
   // document.forms[0].action="leadBankStock.do?event=prepare_add_lead_bank_stock&referrerEvent="+sessionDueDateSubEvent;
    document.forms[0].submit();
}

function removeLeadBankStock() {
	if (isAnyChkBoxSelected("lnbStockRemove")) {   	
		var selValuesStr = createStrFromArray("lnbStockRemove");
	    document.forms[0].action="leadBankStock.do?event=remove_lead_bank_stock&leadBankStockRemovableIndexes="+selValuesStr;
	    document.forms[0].submit();
	}else{
    	alert('Please select item(s) to remove.');
    }
}

function executeLeadBankStockAction(index) {
	//console.log("isSecurityViewMode: "+isSecurityViewMode);
	if(isSecurityViewMode === "true") {
		//console.log("View index: "+index);
		document.forms[0].action="leadBankStock.do?event=view_lead_bank_stock&selectedLNBStockIndex="+index;
		document.forms[0].submit();
	}else {
		//console.log("Edit index: "+index);
		document.forms[0].action="leadBankStock.do?event=prepare_edit_lead_bank_stock&selectedLNBStockIndex="+index;
		document.forms[0].submit();
	}
}

</script>

<input type="hidden" name="assetId" value="<%=request.getAttribute("assetId") %>" />
<input type="hidden" name="referrerEvent" value="<%=sessionDueDateSubEvent %>"/>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	<tr>
		<td colspan="2"><h3>Stock Details as per Lead Bank/Nodal Bank</h3></td>
		<td valign="bottom" align="right">
			<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addLeadBankStock()" />
			<input type="button" name="Submit" value="Remove" class="btnNormal" onclick="removeLeadBankStock()" />
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
							<td width="25%">Drawing Power as per Lead Bank</td>
							<td width="25%">Stock Amount</td>
							<td width="20%">Allocation (%)</td>
							<td width="13%">Action</td>
							<td width="12%" style="text-align: center;">Delete &nbsp; <input type="checkbox" name="lnbStockRemoveAll" /></td>
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
										<a href="javascript:executeLeadBankStockAction('<%=lnbStockIndex%>')">View/Edit</a> 
									</td>
									<td style="text-align: center;"><input type="checkbox" name="lnbStockRemove" value="<%=lnbStockIndex%>" /></td>
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

