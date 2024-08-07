<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.springframework.util.CollectionUtils"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockForm,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.businfra.LabelValue,
				java.util.HashMap,
				java.util.List,
				java.math.BigDecimal"%>

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

String iPin = AssetBasedAction.class.getName();

String event = form.getEvent();
String parentPageFrom = (String) session.getAttribute(iPin +".sessionParentPageFrom");
String selectedIndex = (String) request.getAttribute("selectedIndex");
String gcDetailId = (String) request.getAttribute("gcDetailId");
String collateralID = (String) session.getAttribute(iPin + ".collateralID");
ICollateralTrxValue serviceColObj = (ICollateralTrxValue) session.getAttribute(iPin + ".serviceColObj");
String trxID =  serviceColObj.getTransactionID();



Boolean isSecurityViewMode = (Boolean) session.getAttribute(iPin + ".isSecurityViewMode");

List<LabelValue> dueDateList = (List<LabelValue>) request.getAttribute("dueDateList");
pageContext.setAttribute("dueDateList", dueDateList);

List<LabelValue> locationList = (List<LabelValue>) request.getAttribute("locationList");
pageContext.setAttribute("locationList", locationList);

List<LabelValue> stockDocMonthList = (List<LabelValue>) request.getAttribute("stockDocMonth");
pageContext.setAttribute("stockDocMonthList", stockDocMonthList);

List<LabelValue> stockDocYearList = (List<LabelValue>) request.getAttribute("stockDocYear");
pageContext.setAttribute("stockDocYearList", stockDocYearList);
List<AssetGenChargeStockDetailsHelperForm> displayList 
= (List<AssetGenChargeStockDetailsHelperForm>) session.getAttribute(iPin + ".displayList");

HashMap<String,String> docCodeWithStocks = (HashMap<String,String>) session.getAttribute(
	iPin + ".docCodeWithStocks");

String docCode = form.getDocCode();

boolean addStockflag = false;
if(StringUtils.isNotBlank(docCode)) {
if(CollectionUtils.isEmpty(displayList) && !docCodeWithStocks.containsKey(docCode)){
	addStockflag = true;
}
}
System.out.println("addStockflag---------------------------->>----------------------------------"+addStockflag);


String dp = form.getDpAsPerStockStatement();
String dpShare = form.getDpShare();
String loanable = form.getTotalLoanableAmount();
String dpCalculateManually = form.getDpCalcManually();
String remarkByMaker = form.getRemarkByMaker();
String leadBankDp = form.getLeadBankDp();


/* String dp = "0";
String dpShare = "0";
String loanable = "0"; */
//String dpCalculateManually = form.getDpCalcManually();

%>

<script language="JavaScript" type="text/JavaScript">

var event = '<%=event%>';
var selectedIndex = '<%=selectedIndex==null ? "" : selectedIndex %>';
var collateralID = '<%=collateralID%>';
var gcDetailId = '<%=gcDetailId==null ? "" : gcDetailId %>';
var dp = '<%=dp%>';
var parentPageFrom = '<%=parentPageFrom%>';
var trxID = '<%=trxID%>';

function refreshLocation() {
	//console.log("dueDateAndStock.do?event="+event+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId);
	document.forms[0].action="dueDateAndStock.do?subEvent=refreshDueDate"+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId;
	document.forms[0].event.value=event;
	document.forms[0].submit();
}

function viewStocks() {
	//console.log("dueDateAndStock.do?event="+event+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId);
	document.forms[0].action="dueDateAndStock.do?subEvent=viewStocks"+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId;
	document.forms[0].event.value=event;
	document.forms[0].submit();
}

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

/* function viewStocks(num) {
    if (num == 11) {
         document.forms[0].event.value="view_stocks";
         document.forms[0].indexID.value="-1";
     }
    if (num == 12) {
        document.forms[0].event.value="view_stocks_track";
        document.forms[0].indexID.value="-1";
    }
    document.forms[0].submit();

} */


function goBack(){
	if(parentPageFrom === "ASSET_CLOSE")
    	document.forms[0].action="AssetGenChargeCollateral.do?event=prepare_close&collateralID="+collateralID+"&trxID="+trxID;
    else
    	document.forms[0].action="AssetGenChargeCollateral.do?event=read&collateralID="+collateralID+"&trxID="+trxID;
    //console.log("action: "+document.forms[0].action);
    document.forms[0].submit();
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
	var dpAsPerStockStatement = document.getElementById("dpAsPerStockStatement").value;
	dpAsPerStockStatement = removeCommas(dpAsPerStockStatement);

	return dpAsPerStockStatement ? dpAsPerStockStatement : 0;
}

function removeCommasFromAmountFields(){
	var amount = getDrawingPower();
	document.getElementById("dpAsPerStockStatement").value = removeCommas(amount);
	/* amount = document.getElementById("dpForCashFlowOrBudget").value;
	document.getElementById("dpForCashFlowOrBudget").value = removeCommas(amount); */
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
			<tbody>
				<tr class="even">
					<td class="fieldname">Due Date</td>
					<td> 
						<html:select name="DueDateAndStockForm" property="docCode" styleId="docCode" onchange="javascript:refreshLocation()">
							<html:option value="">Please Select</html:option>
							<logic:present name="dueDateList">
				            	<html:options collection="dueDateList" labelProperty="label" property="value"/>
				            </logic:present>
				        </html:select>
					</td>				
					<td class="fieldname">Location</td>
					<td>
						<html:select name="DueDateAndStockForm" property="location" styleId="location">
							<html:option value="">Please Select</html:option>
							<logic:present name="locationList">
				            	<html:options collection="locationList" labelProperty="label" property="value"/>
				            </logic:present>
				        </html:select>
				        <input onclick="javascript:viewStocks()" name="viewStockDetailSubmit1" type="button" 
				        	value="View Stocks" class="btnNormal" />
				    </td> 
				</tr>
				<tr class="odd">
					<td class="fieldname">Stock Doc Month</td>
					<td>
						<html:select name="DueDateAndStockForm" property="stockDocMonth" styleId="stockDocMonth" disabled = "true">
							<html:option value="">Please Select</html:option>
							<logic:present name="stockDocMonthList">
				            	<html:options collection="stockDocMonthList" labelProperty="label" property="value"/>
				            </logic:present>
				        </html:select>
					</td>
					<td class="fieldname">Stock Doc Year</td>
					<td>
						<html:select name="DueDateAndStockForm" property="stockDocYear" styleId="stockDocYear" disabled = "true">
							<html:option value="">Please Select</html:option>
							<logic:present name="stockDocYearList">
				            	<html:options collection="stockDocYearList" labelProperty="label" property="value"/>
				            </logic:present>
				        </html:select>
					</td>
				</tr>
				<tr class="even">
					<td class="fieldname">Statement Name</td>
					<td>&nbsp; <bean:write name="DueDateAndStockForm" property="statementName" /></td>
					<td class="fieldname">DP to be calculated manually</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpCalcManually" />
						<input type="hidden" id="dpCalcManuallyInd" name="dpCalcManuallyInd" value="<%=form.getDpCalcManually()%>" />
					</td>
				</tr>
				<tr class="odd">
					<td class="fieldname">DP Share</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpShare" />
					</td>
					<td class="fieldname" width="25%">Drawing Power (as per stock statement)</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpAsPerStockStatement" />
						<input type="hidden" id="dpAsPerStockStatement" name="dpAsPerStockStatement" value="<%=dp%>" />
					</td>
				</tr>
				<tr class="even">
					<td width="20%" class="fieldname">
									Remarks by maker
								</td>
								<td>
								<bean:write name="DueDateAndStockForm" property="remarkByMaker" />
						<input type="hidden" id="remarkByMaker" name="remarkByMaker" value="<%=form.getRemarkByMaker()%>" />
								</td>
								
					<%-- <td class="fieldname" width="25%">DP for Cash Flow / Cash Budget</td>
					<td>&nbsp;
						<bean:write name="DueDateAndStockForm" property="dpForCashFlowOrBudget" />
					</td> --%>
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
			
	<tr><td><br></td></tr>
	
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
		
	<tr> <td height="30" /> </tr>
	
		</tbody>
</table>	
</html:form>