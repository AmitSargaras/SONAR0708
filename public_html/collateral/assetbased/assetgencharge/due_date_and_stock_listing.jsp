<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockSummaryForm"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				org.apache.struts.util.LabelValueBean"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%
Boolean isSecurityViewMode = (Boolean) session.getAttribute(AssetBasedAction.class.getName() + ".isSecurityViewMode");
AssetGenChargeForm form = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
List<DueDateAndStockSummaryForm> dueDateStockList = (List<DueDateAndStockSummaryForm>) form.getDueDateAndStock();

if(dueDateStockList == null){
	List<DueDateAndStockSummaryForm> requestDueDateStockList =
			(List<DueDateAndStockSummaryForm>) request.getAttribute(CollateralConstant.REQUEST_DUE_DATE_AND_STOCK_FORM_LIST);
	
	if(requestDueDateStockList != null)
		form.setDueDateAndStock(requestDueDateStockList);
}



pageContext.setAttribute("AssetGenChargeForm", form);
pageContext.setAttribute("isSecurityViewMode", isSecurityViewMode.toString());
String parentPageFrom = request.getParameter("parentPageFrom");
String context = request.getContextPath() + "/";
%>
<script type="text/javascript" src="<%=context%>js/common.js"></script>
<script language="JavaScript" type="text/JavaScript">

var isSecurityViewMode  = <%=isSecurityViewMode%>;
var parentPageFrom = "<%=parentPageFrom%>";

function dueDateAndStock(index) {
	//console.log("dueDateAndStock.do?selectedIndex: " + index+", isSecurityViewMode: "+isSecurityViewMode+", parentPageFrom: "+parentPageFrom);
	if(isSecurityViewMode){
		document.forms[0].action = "dueDateAndStock.do?subEvent=view&index=" + index;
		document.forms[0].event.value = "view_due_date_and_stock";
	}else{
		document.forms[0].action = "AssetGenChargeCollateral.do?subEvent=edit&index=" + index;
		document.forms[0].event.value = "update_session_edit_due_date_and_stock";
	}
	document.forms[0].parentPageFrom.value = parentPageFrom;
	document.forms[0].submit();
}

function addDueDateAndStock() {
	document.forms[0].action = "AssetGenChargeCollateral.do?subEvent=new";
	document.forms[0].event.value = "update_session_add_due_date_and_stock";
	document.forms[0].parentPageFrom.value = parentPageFrom;
	document.forms[0].submit();
}

function removeDueDateAndStock() {
	if (isAnyChkBoxSelected("dueDateAndStockRemove")) {   	
		var selValuesStr = createStrFromArray("dueDateAndStockRemove");
	    document.forms[0].action="AssetGenChargeCollateral.do?event=update_session_remove_due_date_and_stock";
	    document.forms[0].dueDateAndStockRemovableIndexes.value=selValuesStr;
	    document.forms[0].parentPageFrom.value = parentPageFrom;
	    document.forms[0].submit();
	}else{
    	alert('Please select item(s) to remove.');
    }
}

</script>

<html>
<input type="hidden" name="dueDateAndStockRemovableIndexes"/>
<input type="hidden" name="parentPageFrom"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
		<tr>
			<td><h3>Due Date and Stock Details</h3></td>
			<td valign="bottom" align="right" class="makerOnly">
				<logic:equal name="isSecurityViewMode"  value="false">
					<input onclick="addDueDateAndStock()" type="button" name="Submit" value="Add New" class="btnNormal" />&nbsp;
					<input onclick="removeDueDateAndStock()" type="button" name="Submit" value="Remove" class="btnNormal" />
				</logic:equal>
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr /></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2"><table width="100%" border="0" cellspacing="0"
					cellpadding="0" class="tblInfo">
					<thead>
						<tr>
							<td width="5%"><bean:message key="label.global.sn"/></td>
							<td width="10%">Due Date</td>
							<td width="20%">Statement Name</td>
							<td width="10%">DP to be calculated Manually</td>
							<td width="10%">DP Share</td>
							<td width="16%">Drawing Power(as per stock statement)</td>
							<td width="16%">DP for Cash Flow/Cash Budget</td>
							<td width="8%">Action</td>
							<logic:equal name="isSecurityViewMode"  value="false">
								<td width="5%">Delete 
									&nbsp; <input type="checkbox" id="dueDateAndStockRemoveAll" 
												onclick="javascript:changeAllChildCheckBoxes('dueDateAndStockRemoveAll','dueDateAndStockRemove')" 
												value="0" />
								</td>
							</logic:equal>
						</tr>
					</thead>
					<tbody>
						<logic:present name="AssetGenChargeForm" property="dueDateAndStock">
							<logic:iterate id="dueDateAndStock" name="AssetGenChargeForm"
								property="dueDateAndStock" indexId="dueDateAndStockIndex"
								type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockSummaryForm">
								<tr class="<%=(dueDateAndStockIndex++)%2 == 0 ? "even" : "odd" %>">
									<td class="index"><%=dueDateAndStockIndex%></td>
									<td>
										<center> <bean:write name="dueDateAndStock" property="dueDate" /> </center> 
									</td>
									<td>
										<center> <bean:write name="dueDateAndStock" property="statementName" /> </center> 
									</td>
									<td>
										<center> <bean:write name="dueDateAndStock" property="dpCalcManually" /> </center> 
									</td>
									<td>
										<center> <bean:write name="dueDateAndStock" property="dpShare" /> </center> 
									</td>
									<td>
										<center> <bean:write name="dueDateAndStock" property="dpAsPerStockStatement" /> </center> 
									</td>
									<td> 
										<center> <bean:write name="dueDateAndStock" property="dpForCashFlowOrBudget" /> </center> 
									</td>
									<td> <center>
										<a href="javascript:dueDateAndStock('<%=dueDateAndStockIndex%>')">View/Edit</a> </center>
									</td>
									<logic:equal name="isSecurityViewMode"  value="false">
										<td>
											<center> <input type="checkbox" name="dueDateAndStockRemove" value="<%=dueDateAndStockIndex%>" /> </center> 
										</td>
									</logic:equal>
								</tr>
							</logic:iterate>
						</logic:present>
						<logic:notPresent name="AssetGenChargeForm" property="dueDateAndStock">
								<tr class="odd">
									<td colspan="10"><bean:message key="label.global.not.found" /></td>
								</tr>
						</logic:notPresent>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
</html>
