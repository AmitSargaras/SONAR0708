<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.LeadBankStockForm" %>
<%
LeadBankStockForm form = (LeadBankStockForm) request.getAttribute("LeadBankStockForm");
String event =  (String) request.getAttribute("event");
String referrerEvent = (String) request.getAttribute("referrerEvent");
String selectedLNBStockIndex = (String) request.getAttribute("selectedLNBStockIndex");
String action =  (String) request.getAttribute(CollateralConstant.LEAD_BANK_STOCK_ACTION);
%>

<script type="text/javascript">
var referrerEvent = '<%=referrerEvent%>';
var event = '<%=event%>'
var selectedLNBStockIndex = '<%=selectedLNBStockIndex%>';

function saveInSession(){
	//console.log("event: "+event+", referrerEvent: "+referrerEvent);
    document.forms[0].action="leadBankStock.do?referrerEvent="+referrerEvent;
    if(event==="prepare_add_lead_bank_stock"){
    	document.forms[0].event.value="add_lead_bank_stock";
    }else if(event==="prepare_edit_lead_bank_stock"){
    	document.forms[0].event.value="edit_lead_bank_stock";
    	document.forms[0].selectedLNBStockIndex.value=selectedLNBStockIndex;
    }	
    document.forms[0].submit();
}

function goBack(referrerEvent){
    document.forms[0].action="dueDateAndStock.do?event=edit_due_date_and_stock";
    document.forms[0].submit();
}

</script>

<html:form method="post" action="leadBankStock.do">
<input type="hidden" name="event" />
<input type="hidden" name="selectedLNBStockIndex" />
<input type="hidden" name="assetId" value="<%=request.getAttribute("assetId") %>" />

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	<tr>
		<td><h3><%=action %> Stock Details as per Lead Bank/Nodal Bank</h3><br></td>
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
								<input type="text" name="drawingPowerAsPerLeadBank" value="<%=form.getDrawingPowerAsPerLeadBank()%>" />
								<html:errors property="drawingPowerAsPerLeadBankError" />
							</td>
							<td class="fieldname">Allocation (%)</td>
							<td class="even">
								<input type="text" name="bankSharePercentage" value="<%=form.getBankSharePercentage()%>" />
								<html:errors property="bankSharePercentageError" />
							</td>
						</tr>
						<tr>	
							<td class="fieldname">Stock Amount</td>
							<td class="odd">
								<input type="text" name="stockAmount" value="<%=form.getStockAmount()%>" />
								<html:errors property="stockAmountError" />
							</td>
							<td class="fieldname">Creditors Amount</td>
							<td class="odd">
								<input type="text" name="creditorsAmount" value="<%=form.getCreditorsAmount()%>" />
								<html:errors property="creditorsAmountError" />
							</td>
						</tr>	
							<td class="fieldname">Debtor Amount</td>
							<td class="even">
								<input type="text" name="debtorAmount" value="<%=form.getDebtorAmount()%>" />
								<html:errors property="debtorAmountError" />
							</td>
							<td class="fieldname">Margin on Stock</td>
							<td class="even">
								<input type="text" name="marginOnStock" value="<%=form.getMarginOnStock()%>" />
								<html:errors property="marginOnStockError" />
							</td>
						</tr>
						<tr>
							<td class="fieldname">Margin on Debtor</td>
							<td class="odd">
								<input type="text" name="marginOnCreditors" value="<%=form.getMarginOnCreditors()%>" />
								<html:errors property="marginOnCreditorsError" />
							</td>
							<td class="fieldname">Margin on Creditors</td>
							<td class="odd">
								<input type="text" name="marginOnDebtor" value="<%=form.getMarginOnDebtor()%>" />
								<html:errors property="marginOnDebtorError" />
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
						<td><a href="javascript:saveInSession();" onmouseout="MM_swapImgRestore()" 
								onmouseover="MM_swapImage('img_ok','','img/ok2.gif',1)">
								<img src="img/ok1.gif" name="img_ok" border="0" /> </a>
						</td>
						<td>	
							<a href="javascript:goBack('<%=referrerEvent%>');" onmouseout="MM_swapImgRestore()" 
								onmouseover="MM_swapImage('img_cancel','','img/cancel2.gif',1)">
								<img src="img/cancel1.gif" name="img_cancel" border="0" /> </a>
						</td>
					</tr>
				</table>
			</td>
		</tr>	
	</tbody>
</table>

<html:hidden property="isLeadBankStockBankingArr"/>

</html:form>
