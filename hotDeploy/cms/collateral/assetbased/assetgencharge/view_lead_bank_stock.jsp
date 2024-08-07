<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.LeadBankStockForm,
                com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction" %>
<%
LeadBankStockForm form = (LeadBankStockForm) request.getAttribute("LeadBankStockForm");
String event = form.getEvent();
String referrerEvent = (String) request.getAttribute("referrerEvent");
String parentPageFrom = (String) session.getAttribute(AssetBasedAction.class.getName()+".sessionParentPageFrom");
pageContext.setAttribute("LeadBankStockForm", form);

%>

<script type="text/javascript">
var referrerEvent = '<%=referrerEvent%>';
var event = '<%=event%>';
var parentPageFrom = '<%=parentPageFrom%>';

function goBack(referrerEvent){
	if("ASSET_READ" === parentPageFrom)
    	document.forms[0].action="dueDateAndStock.do?event=view_due_date_and_stock";
    else if("ASSET_PROCESS" === parentPageFrom)	
    	document.forms[0].action="dueDateAndStock.do?event=checker_due_date_and_stock";
    else
    	document.forms[0].action="dueDateAndStock.do?event=view_due_date_and_stock";	
    console.log("parentPageFrom: "+parentPageFrom);	
    document.forms[0].submit();
}

</script>

<html:form method="post" action="leadBankStock.do">
<input type="hidden" name="event" />
<input type="hidden" name="assetId" value="<%=request.getAttribute("assetId") %>" />

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	<tr>
		<td><h3>Stock Details as per Lead Bank/Nodal Bank</h3><br></td>
	</tr>
	<tr> <td><hr/></td> </tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
						<tr>
							<td class="fieldname">Drawing Power as per Lead Bank</td>
							<td class="even">
								<bean:write name="LeadBankStockForm" property="drawingPowerAsPerLeadBank" />
							</td>
							<td class="fieldname">Allocation (%)</td>
							<td class="even">
								<bean:write name="LeadBankStockForm" property="bankSharePercentage" />
							</td>
						</tr>
						<tr>	
							<td class="fieldname">Stock Amount</td>
							<td class="odd">
								<bean:write name="LeadBankStockForm" property="stockAmount" />
							</td>
							<td class="fieldname">Creditors Amount</td>
							<td class="odd">
								<bean:write name="LeadBankStockForm" property="creditorsAmount" />
							</td>
						</tr>	
							<td class="fieldname">Debtor Amount</td>
							<td class="even">
								<bean:write name="LeadBankStockForm" property="debtorAmount" />
							</td>
							<td class="fieldname">Margin on Stock</td>
							<td class="even">
								<bean:write name="LeadBankStockForm" property="marginOnStock" />
							</td>
						</tr>
						<tr>
							<td class="fieldname">Margin on Debtor</td>
							<td class="odd">
								<bean:write name="LeadBankStockForm" property="marginOnCreditors" />
							</td>
							<td class="fieldname">Margin on Creditors</td>
							<td class="odd">
								<bean:write name="LeadBankStockForm" property="marginOnDebtor" />
							</td>
						</tr>
				</table>
			</td>
		</tr>
		<tr> <td height="30" /> </tr>
		<tr>
			<td align="center">
				<table>
					<tr>
						<td>	
							<a href="javascript:goBack('<%=referrerEvent%>');" onmouseout="MM_swapImgRestore()" 
								onmouseover="MM_swapImage('img_return','','img/return2.gif',1)">
								<img src="img/return1.gif" name="img_return" border="0" /> </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>	
	</tbody>
</table>
</html:form>
