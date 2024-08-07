<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockForm,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				com.integrosys.cms.businfra.LabelValue,
				java.math.BigDecimal,
				java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
	<script type="text/javascript" src="js/ajaxDropdown.js"></script>
	<script type="text/javascript" src="js/emulation.js"></script>
	<script type="JavaScript" src="js/itgPrjConfigSetup.js"></script>
	<script type="JavaScript" src="js/itgCheckForm.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	<script type="text/javascript" src="js/dateext.js"></script>
	<script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/imageNavigation.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	
<%

DueDateAndStockForm form = (DueDateAndStockForm) request.getAttribute("DueDateAndStockForm");
pageContext.setAttribute("DueDateAndStockForm", form);
String event = form.getEvent();
String selectedIndex = (String) request.getAttribute("selectedIndex");
String gcDetailId = (String) request.getAttribute("gcDetailId");
String collateralID = (String) session.getAttribute(AssetBasedAction.class.getName() + ".collateralID");
ICollateralTrxValue serviceColObj = (ICollateralTrxValue) session.getAttribute(AssetBasedAction.class.getName() + ".serviceColObj");
String trxID =  serviceColObj.getTransactionID();
Boolean isSecurityViewMode = (Boolean) session.getAttribute(AssetBasedAction.class.getName() + ".isSecurityViewMode");
List<LabelValue> dueDateList = (List<LabelValue>) request.getAttribute("dueDateList");
pageContext.setAttribute("dueDateList", dueDateList);

List<LabelValue> locationList = (List<LabelValue>) request.getAttribute("locationList");
pageContext.setAttribute("locationList", locationList);

List<LabelValue> stockDocMonthList = (List<LabelValue>) request.getAttribute("stockDocMonth");
pageContext.setAttribute("stockDocMonthList", stockDocMonthList);

List<LabelValue> stockDocYearList = (List<LabelValue>) request.getAttribute("stockDocYear");
pageContext.setAttribute("stockDocYearList", stockDocYearList);

boolean flag = false;
String leadBankDp = form.getLeadBankDp();


%>

<script language="JavaScript" type="text/JavaScript">


var event = '<%=event%>';
var selectedIndex = '<%=selectedIndex==null ? "" : selectedIndex %>';
var collateralID = '<%=collateralID%>';
var trxID = '<%=trxID%>';
var gcDetailId = '<%=gcDetailId==null ? "" : gcDetailId %>';

function goBack(){
    document.forms[0].action="AssetGenChargeCollateral.do?event=process&collateralID="+collateralID+"&trxID="+trxID;
    //console.log("action: "+document.forms[0].action);
    document.forms[0].submit();
}

//Stock limit DP
function viewStockDetail(locationId,dueDate,obIndex) {
	var locationId = locationId;
	var dueDate = dueDate;
	var obIndex = obIndex;
    //console.log("locationId="+locationId+", dueDate="+dueDate+", from_page=view, obIndex="+obIndex);
	document.forms[0].action ="AssetGenChargeStockDetails.do?locationId="+locationId+"&dueDate="+dueDate+"&obIndex="+obIndex;
	document.forms[0].event.value="view_stock_details";
    document.forms[0].submit();
	return action;
}

window.onload = function(){
	
	refreshActualDrawingPower();
}

function refreshActualDrawingPower(){
//	calculateLonable();
	var dpAsPerStockStatement = getDrawingPower();
	
	//console.log("dpAsPerStockStatement: "+dpAsPerStockStatement);
	dpAsPerStockStatement = removeCommas(dpAsPerStockStatement);

	var dpAsPerLeadBank = '<%=leadBankDp%>';
	//console.log("isNaN dpAsPerStockStatement: "+isNaN(dpAsPerStockStatement));
	//console.log("parseInt dpAsPerStockStatement: "+parseInt(dpAsPerStockStatement));
	//console.log("Check: "+(isNaN(dpAsPerStockStatement) ? 0 : parseInt(dpAsPerStockStatement)));
	var temp_dpAsPerStockStatement= dpAsPerStockStatement;
	var temp_dpAsPerLeadBank= dpAsPerLeadBank;
	dpAsPerStockStatement = isNaN(dpAsPerStockStatement) ? 0 : parseInt(dpAsPerStockStatement);

	dpAsPerLeadBank = isNaN(dpAsPerLeadBank) ? 0 : parseInt(dpAsPerLeadBank);

	//console.log("dpAsPerStockStatement<=dpAsPerLeadBank : "+dpAsPerStockStatement+" <= "+dpAsPerLeadBank);
	if((dpAsPerStockStatement<=dpAsPerLeadBank && dpAsPerStockStatement != 0) || dpAsPerLeadBank === 0){
		dpAsPerStockStatement = setDecimalPlaces(dpAsPerStockStatement, 2);
		//console.log("dpAsPerStockStatement: "+dpAsPerStockStatement);
		document.getElementById("actualDrawingPower").innerHTML = addCommas(temp_dpAsPerStockStatement);
		//document.getElementById("actualDp_hidden").value = temp_dpAsPerStockStatement;
	}else{
		dpAsPerLeadBank = setDecimalPlaces(dpAsPerLeadBank, 2);
		//console.log("dpAsPerLeadBank: "+dpAsPerLeadBank);
		document.getElementById("actualDrawingPower").innerHTML = addCommas(temp_dpAsPerLeadBank);
		//document.getElementById("actualDp_hidden").value = temp_dpAsPerLeadBank;
	}
}

function getDrawingPower(){
	var dpAsPerStockStatement = '<%=form.getDpAsPerStockStatement()%>';
	dpAsPerStockStatement = removeCommas(dpAsPerStockStatement);

	return dpAsPerStockStatement ? dpAsPerStockStatement : 0;
}


</script>

<html:form action="dueDateAndStock.do">
<input type="hidden" name="event"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td><h3>Due Date and Stock Details</h3></td>
 	</tr>
	<tr><td>&nbsp;<html:errors property="dueDateAndStockCommonError" /></td></tr>
 	<tr>
   		<td><hr/></td>
 	</tr>
</thead>		
<tbody>	
	<tr>
		<td>
			<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
					<td width="20%"></td>
					<td width="15%" align="center" >Old Value</td>
					<td width="15%" align="center" >New Value</td>
					<td width="20%"></td>
					<td width="15%" align="center" >Old Value</td>
					<td width="15%" align="center" >New Value</td>
				</tr>
			</thead>			
			<tbody>
				<tr class="even">
					<td class="fieldname">Due Date</td>
					<td>&nbsp; 
				        <bean:write name="DueDateAndStockForm" property="dueDateActual"/>
					</td>
					<td>&nbsp; 
				        <bean:write name="DueDateAndStockForm" property="dueDate"/>
					</td>
					<td class="fieldname">&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>				
				</tr>
				<tr class="odd">
					<td class="fieldname">Stock Doc Month</td>
				    <td>&nbsp; 
				        <bean:write name="DueDateAndStockForm" property="stockDocMonthActual"/>
					</td>
					<td>&nbsp; 
				        <bean:write name="DueDateAndStockForm" property="stockDocMonth"/>
					</td>					
					<td class="fieldname">Stock Doc Year</td>
				    <td>&nbsp; 
				        <bean:write name="DueDateAndStockForm" property="stockDocYearActual"/>
					</td>
					<td>&nbsp; 
				        <bean:write name="DueDateAndStockForm" property="stockDocYear"/>
					</td>								
				</tr>
				<tr class="even">
					<td class="fieldname">Statement Name</td>
					<td>&nbsp; <bean:write name="DueDateAndStockForm" property="statementNameActual" /></td>
					<td>&nbsp; <bean:write name="DueDateAndStockForm" property="statementName" /></td>
					<td class="fieldname">DP to be calculated manually</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpCalcManuallyActual" />
					</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpCalcManually" />
					</td>
				</tr>
				<tr class="odd">
					<td class="fieldname">DP Share</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpShareActual" />
					</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpShare" />
					</td>
					<td class="fieldname" width="25%">Drawing Power (as per stock statement)</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpAsPerStockStatementActual" />
					</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpAsPerStockStatement" />
					</td>
				</tr>
				<tr class="even">
				<td class="fieldname" width="25%">Remarks by maker</td>
					<%-- <td><html:text property="remarkByMaker"
						styleId="remarkByMaker" value="<%=form.getRemarkByMaker()%>"  maxlength="4000"  style="width:100%" />
					</td> --%>

					<td>&nbsp;</td>
					<%-- 	<td>&nbsp; <bean:write name="DueDateAndStockForm" property="remarkByMakeractual" /></td> --%>
						<td>&nbsp; <bean:write name="DueDateAndStockForm" property="remarkByMaker" /></td>
					
				
					<%-- <td class="fieldname" width="25%">DP for Cash Flow / Cash Budget</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpForCashFlowOrBudget" />
					</td> --%>
					<td>&nbsp;</td>
				</tr>
			</tbody>
			</table>
		</td>
	</tr>			
	<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
				    <td><h3>Stock Details </h3></td>
				    <td valign="bottom" align="right">
						
					</td>
				</tr>
				<tr>
				    <td colspan="2"><hr/></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
				        <thead>
				          	<tr>
				          		<td width="5%"><bean:message key="label.global.sn"/></td>
				          		<td width="30%">Location</td>
				          		<td width="30%">Deficit/Loanable</td>
				          		<td width="30%">Action</td>
				          	</tr>
				        </thead> 
				        <tbody>
							<logic:present name="DueDateAndStockForm" property="stockSummaryForm">
							<logic:iterate id="stockSummaryForm" name="DueDateAndStockForm" 
								property="stockSummaryForm" indexId="stockIndex"
								type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm">
				        		<tr class="<%=(stockIndex++)%2 == 0 ? "even" : "odd"%>" >
						        	<td class="index"> <%=stockIndex%></td>
					          		<td width="30%" style="text-align: center;">
					          			<bean:write name="stockSummaryForm" property="locationName"/>
					          		</td>
					          		<td width="30%" style="text-align: center;">
					          			<bean:write name="stockSummaryForm" property="totalLonable"/>
					          		</td>
					          		<td width="30%" style="text-align: center;">
					          			<a href="javascript:viewStockDetail(
					          				'<bean:write name="stockSummaryForm" property="locationID"/>',
					          				'<bean:write name="stockSummaryForm" property="dueDate"/>',
					          				'<%=stockIndex%>')">View</a> 
					          		</td>
				          		</tr> 
				          	</logic:iterate>
				          	</logic:present>
				        	<logic:notPresent name="DueDateAndStockForm" property="stockSummaryForm">
						        <tr>
						        	<td colspan="4"><bean:message key="label.global.not.found" /></td>
					          	</tr>
				          	</logic:notPresent>
				        </tbody>
				        </table>
				    </td>
				</tr>
			</tbody>
			</table>
		</td>
	</tr>
	<logic:equal name="DueDateAndStockForm" property="leadBankStockInd" value="Y" >	
		<tr>
			<td>
				<jsp:include page="view_lead_bank_stock_listing.jsp"/>
			</td>
		</tr>
	</logic:equal>

	<tr>
		<td>	
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">		
				<tr>
					<td class="fieldname">Actual Drawing Power</td>
					<td class="even" id="actualDrawingPower">
						<bean:write name="DueDateAndStockForm" property="actualDp" />
					</td>
				</tr>
			</table>		
		</td>
	</tr>
			
	<tr> <td height="30" /> </tr>
	
	<tr>
		<td align="center">
			<table >
				<tr >
					<td>	
						<a href="javascript:goBack();" 
							onmouseout="MM_swapImgRestore()" 
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