
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				   com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails,
				org.apache.struts.util.LabelValueBean"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<%
AssetGenChargeForm form = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
pageContext.setAttribute("AssetGenChargeForm", form);

String parentPageFrom = (String)request.getParameter("parentPageFrom");
ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
IGeneralCharge newCollateral = (IGeneralCharge) itrxValue.getStagingCollateral();
IGeneralChargeDetails[] existingGeneralChargeDetails1 = newCollateral.getGeneralChargeDetails();
/*  for(int m=0;m<existingGeneralChargeDetails1.length;m++){
System.out.println("newCollateral.getGeneralChargeDetails()["+m+"].getStatus()===>"+existingGeneralChargeDetails1[m].getStatus()+", DueDate() : "+form.getDueDateAndStock().get(m).getDueDate());
 }  */
	
%>

<script language="JavaScript" type="text/JavaScript">

function dueDateAndStock(index,dueDates) {
	document.forms[0].action = "dueDateAndStock.do?subEvent=view&index=" + index+"&duedate1="+dueDates;
	document.forms[0].event.value = "checker_due_date_and_stock";
	document.forms[0].submit();
}

</script>

<html>
<input type="hidden" name="dueDateAndStockRemovableIndexes"/>
<input type="hidden" name="parentPageFrom" value="<%=parentPageFrom%>" />

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
		<tr>
			<td><h3>Due Date and Stock Details</h3></td>
			<td valign="bottom" align="right" class="makerOnly">

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
						</tr>
					</thead>
					<tbody>
						<logic:present name="AssetGenChargeForm" property="dueDateAndStock">
							<logic:iterate id="dueDateAndStock" name="AssetGenChargeForm"
								property="dueDateAndStock" indexId="dueDateAndStockIndex"
								type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockSummaryForm">
								<tr class="<%=(dueDateAndStockIndex++)%2 == 0 ? "even" : "odd" %>">
									<% 
									String status = existingGeneralChargeDetails1[dueDateAndStockIndex-1].getStatus();
									System.out.println(" Index : "+dueDateAndStockIndex+" details : "+form.getDueDateAndStock().get(dueDateAndStockIndex-1).getDueDate()+", status : "+status);
									if(status.equalsIgnoreCase("PENDING")){%>
										<tr class="<%=(dueDateAndStockIndex++)%2 == 0 ? "even" : "odd" %>" style="background-color: CornflowerBlue">
										<%}%>
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
										<a href="javascript:dueDateAndStock('<%=dueDateAndStockIndex%>','<%=dueDateAndStock.getDueDate()%>')">View</a> </center>
									</td>
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
