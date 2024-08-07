<%@page import="java.util.Arrays"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm,
				com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockForm,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				com.integrosys.cms.businfra.LabelValue,
				org.springframework.util.CollectionUtils,
				org.apache.commons.lang.StringUtils,
				java.math.BigDecimal,
				java.util.HashMap,
				java.util.List"%>
				<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				org.apache.struts.util.LabelValueBean"%>
				
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"/>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"/>				

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

		String iPin = AssetBasedAction.class.getName();
		Boolean isSecurityViewMode = (Boolean) session.getAttribute(iPin + ".isSecurityViewMode");

		String sessionDueDateSubAction = (String) session.getAttribute(iPin + "."+CollateralConstant.SESSION_DUE_DATE_AND_STOCK_SUB_ACTION);

		List<LabelValue> dueDateList = (List<LabelValue>) request.getAttribute(CollateralConstant.DUE_DATE_LIST);
		pageContext.setAttribute("dueDateList", dueDateList);

		List<LabelValue> locationList = (List<LabelValue>) request.getAttribute(CollateralConstant.LOCATION_LIST);
		pageContext.setAttribute("locationList", locationList);

		List<LabelValue> stockDocMonthList = (List<LabelValue>) request.getAttribute("stockDocMonth");
		pageContext.setAttribute("stockDocMonthList", stockDocMonthList);

		List<LabelValue> stockDocYearList = (List<LabelValue>) request.getAttribute("stockDocYear");
		pageContext.setAttribute("stockDocYearList", stockDocYearList);

		List<AssetGenChargeStockDetailsHelperForm> displayList 
			= (List<AssetGenChargeStockDetailsHelperForm>) session.getAttribute(iPin + ".displayList");

		HashMap<String,String> docCodeWithStocks = (HashMap<String,String>) session.getAttribute(
		iPin + ".docCodeWithStocks");
		
		String facLinePendingMsg = (String) session.getAttribute(iPin + "."+CollateralConstant.SESSION_DUE_DATE_AND_STOCK_FAC_LINE_PENDING_MSG);
		boolean isFacLinePendingMsg = StringUtils.isNotBlank(facLinePendingMsg);
		
		String totalReleasedAmount = (String) session.getAttribute(iPin + "."+CollateralConstant.SESSION_DUE_DATE_AND_STOCK_TOTAL_RELEASED_AMT);

		String docCode = form.getDocCode();

		boolean addStockflag = false;
		if(StringUtils.isNotBlank(docCode)) {
			//if(CollectionUtils.isEmpty(displayList) && !docCodeWithStocks.containsKey(docCode)){
			if( !docCodeWithStocks.containsKey(docCode)){
		addStockflag = true;
			}
		}
		
		System.out.println("addStockflag---------------------------->>----------------------------------"+addStockflag);
		System.out.println("form.getDpCalcManually()---------------------------->>----------------------------------"+form.getDpCalcManually());
		String dp = form.getDpAsPerStockStatement();
		String dpShare = form.getDpShare();

		String loanable = form.getTotalLoanableAmount();

		String dpCalculateManually = form.getDpCalcManually();
		
		String remarkByMaker = form.getRemarkByMaker();
		
	    IGeneralChargeDetails chargeDetaills = (IGeneralChargeDetails)session.getAttribute(AssetBasedAction.class.getName()+".sessionDueDateAndStockDetails"); 
	    String  totalLonableAmt_session = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
	
	    String  alertFlg = (String) request.getAttribute("alertFlg");
	    if(null != chargeDetaills){
	    	System.out.println("due_date_and_stock.jsp=>chargeDetaills.getTotalLoanable()====>"+chargeDetaills.getTotalLoanable()+"***form.getTotalLoanable()=>"+form.getTotalLoanable());
	    }
	    System.out.println("***103=>totalLonableAmt_session@@@@@@@@@@@@==========*********"+totalLonableAmt_session);
	 //   System.out.println("***alertFlg@@@@@@@@@@@@==========********* "+alertFlg);
		 String totalLonableAmt ="";
		 if(null == totalLonableAmt_session || "".equals(totalLonableAmt_session) || "0".equals(totalLonableAmt_session)){   
	    		System.out.println("********110******due_date_and_stock.jsp=====> form.getTotalLoanable()  : "+form.getTotalLoanable());	
	    		 if(null!=form && (null==form.getTotalLoanable() || "".equals(form.getTotalLoanable()) || "0".equals(form.getTotalLoanable())) && null!=form.getStockSummaryForm()){
		    	for(int i=0;i<form.getStockSummaryForm().size();i++) {
		    		AssetGenChargeStockDetailsHelperForm stock = form.getStockSummaryForm().get(i);
		    		System.out.println("due_date_and_stock.jsp=====> stock.getTotalLonable() : "+stock.getTotalLonable());
		    		form.setTotalLoanable(stock.getTotalLonable());
		    	}}
		    	totalLonableAmt = StringUtils.isBlank(form.getTotalLoanable()) ? "0" : form.getTotalLoanable();
		    	System.out.println("***118=>totalLonableAmt@@@@@@@@@@@@==========*********"+totalLonableAmt);
	    }else{
	    	if(!"0".equals(totalLonableAmt_session) ){
	    		totalLonableAmt=totalLonableAmt_session;
	    		System.out.println("***122=>totalLonableAmt@@@@@@@@@@@@==========*********"+totalLonableAmt+"***totalLonableAmt_session=>"+totalLonableAmt_session+"**");
	    	}else{
	    		totalLonableAmt= chargeDetaills.getTotalLoanable();	 
	    		System.out.println("***125=>totalLonableAmt@@@@@@@@@@@@==========*********"+totalLonableAmt+"***totalLonableAmt_session=>"+totalLonableAmt_session+"**");
	    	}
	    }
		System.out.println("***totalLoanable@@@@@@@@@@@@==========*********"+totalLonableAmt);
		
		
		

		System.out.println("remarkByMaker=============================="+remarkByMaker);
		
		/* String  totalLonableAmt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
		DecimalFormat dft = new DecimalFormat("#0.00");

		if(null == totalLonableAmt){
			totalLonableAmt = "0.00";	
		}
		totalLonableAmt=UIUtil.removeComma(totalLonableAmt); */
		System.out.println("totalLonableAmt= IN due_date_and_stock.jsp=======================:"+totalLonableAmt);
		
		String  dueDate = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate"); 
		System.out.println("dueDate from session : "+dueDate);
		if(form.getStockSummaryForm()!=null){
		System.out.println("dueDate from form : "+form.getStockSummaryForm().get(form.getStockSummaryForm().size()-1).getDueDate());
		}



		/* String dp = "0";
		String dpShare = "0";
		String loanable = "0";
		String dpCalculateManually = form.getDpCalcManually(); */
		String leadBankDp = form.getLeadBankDp();
		
		String sessionDueDateSubEvent = (String) session.getAttribute(iPin + "."+CollateralConstant.SESSION_DUE_DATE_ACTION);
		boolean isEditSessionDueDateSubAction = "Edit".equalsIgnoreCase(sessionDueDateSubAction);
		
		Set sessionHighlightedDueDateSet = (Set) session.getAttribute(iPin + "."+CollateralConstant.SESSION_HIGHLIGHTED_DUE_DATE_SET);
		String dpAsPerStockStatement11 = form.getDpAsPerStockStatement();
		
		int cnt = 0;
		if(null != form.getLeadBankStockSummary() && !form.getLeadBankStockSummary().isEmpty()){
			 for(int i=0;i<form.getLeadBankStockSummary().size();i++){
				cnt= cnt + 1;
				System.out.println("count===>"+cnt);
			} 
			form.setLeadBankStockSummary(form.getLeadBankStockSummary());
			form.setLeadBankStockSummaryCount(cnt);
			}
		form.setDueDateActionPage(sessionDueDateSubAction);
		System.out.println("--------==========>>>>>due_date_and_stock.jsp=>1111111 cnt=>"+cnt);
		String bankingArrangementVal = form.getBankingArrangementVal();
		System.out.println("--------==========>>>>>due_date_and_stock.jsp=>33333 form111.getStatementNameActual()=>bankingArrangementVal=>"+bankingArrangementVal);
	%>

<script language="JavaScript" type="text/JavaScript">

window.onload = function(){
	enabledStockAddNewButton();
	setDPCalcManually();
	refreshActualDrawingPower();
	disableDueDate();
	calculateLonable();
	var dpCalcuManual = '<%=dpCalculateManually%>';
	//dpCalculateChoiceNew(dpCalcuManual);
}
 
var event = '<%=event%>';
var sessionDueDateSubEvent = '<%=sessionDueDateSubEvent%>';
var selectedIndex = '<%=selectedIndex==null ? "" : selectedIndex %>';
var gcDetailId = '<%=gcDetailId==null ? "" : gcDetailId %>';
var dp = '<%=dp%>';
var leadBankDp = '<%=leadBankDp%>';
var isEditSessionDueDateSubAction = <%=isEditSessionDueDateSubAction%>;

function setDPCalcManually(){
	var dpCalcInd = document.getElementById("dpCalcManually").value;
	toggleDPCalcInd(dpCalcInd);
}

function setDrawingPower(dp){
	document.getElementById("dpAsPerStockStatement").value=dp;
}

function getDrawingPower(){
	var dpAsPerStockStatement = document.getElementById("dpAsPerStockStatement").value;
	dpAsPerStockStatement = removeCommas(dpAsPerStockStatement);

	return dpAsPerStockStatement ? dpAsPerStockStatement : 0;
}


function disableDueDate(){
	if(isEditSessionDueDateSubAction){
		document.getElementById("docCode").disabled=true;
	}
}

function calculateLonable() {
	var dpShare = '<%=dpShare%>';
	var newDpShare = document.getElementById("dpShare").value;
	//alert("newDpShare::"+newDpShare)
	var totalLonableAmt = '<%=totalLonableAmt%>';
	totalLonableAmt= removeCommas(totalLonableAmt);
//	alert("lonable"+totalLonableAmt)
    var DP = '0';
    
	if(isNaN(newDpShare) || ''==newDpShare){
//	    alert("Please enter numeric value in DP share!!!");
	    document.getElementById("dpShare").value = dpShare; 
	    setDrawingPower('0');
	}else {
	    if(totalLonableAmt !== '0'){
			if(!isNaN(newDpShare) && !isNaN(totalLonableAmt)){
				totalLonableAmt=((totalLonableAmt*newDpShare)/100);
				
			}else{
				totalLonableAmt=0;
			}
		}
		var calculatedDp = Math.round(totalLonableAmt*100)/100;
		calculatedDp = formatAmountAsCommaSeparated1(calculatedDp);
		setDrawingPower(calculatedDp);
	}
}

function toggleDPCalcInd(val){
	if(val === "YES") {
		document.getElementById("dpCalcManuallyYes").checked=true;
		document.getElementById("dpCalcManuallyNo").checked=false;
		document.getElementById("dpCalcManually").value="YES";
	} else {
		document.getElementById("dpCalcManuallyYes").checked=false;
		document.getElementById("dpCalcManuallyNo").checked=true;
		document.getElementById("dpCalcManually").value="NO";
	}
}

function dpCalculateChoice(choice) {
	var dueDateDdl = document.getElementById("docCode"); 
	var dueDate = dueDateDdl.options[dueDateDdl.selectedIndex].text;
	var val = choice.value;
	toggleDPCalcInd(val);
	if(val === "YES" && dueDate) {
		setDrawingPower(dp);
		document.getElementById("dpAsPerStockStatement").disabled = false;
		/* document.getElementById("dpForCashFlowOrBudget").disabled = false; */
	} else {
		calculateLonable();
		document.getElementById("dpAsPerStockStatement").disabled = true;
		/* document.getElementById("dpForCashFlowOrBudget").disabled = true; */
	}
	//console.log("dueDate: "+dueDate+", ");
}

function dpCalculateChoiceNew(dpcalculatedmanuallyVal) {
	var dueDateDdl = document.getElementById("docCode"); 
	var dueDate = dueDateDdl.options[dueDateDdl.selectedIndex].text;
	var val = dpcalculatedmanuallyVal;
	toggleDPCalcInd(val);
	if(val === "YES" && dueDate) {
		setDrawingPower(dp);
		document.getElementById("dpAsPerStockStatement").disabled = false;
		/* document.getElementById("dpForCashFlowOrBudget").disabled = false; */
	} else {
		calculateLonable();
		document.getElementById("dpAsPerStockStatement").disabled = true;
		/* document.getElementById("dpForCashFlowOrBudget").disabled = true; */
	}
	//console.log("dueDate: "+dueDate+", ");
}

function getDpAsPerLeadBank(){
	var rowCount = document.getElementsByName("stocksAsPerleadBank").length;
	var leadBankDp=0;
	for(i=0; i<rowCount; i++){
		var dp = document.getElementsByName("leadBankDp")[i].innerHTML;
	  	var pct = document.getElementsByName("leadBankDpSharePct")[i].innerHTML;
	  	dp = removeCommas(dp);
	  	leadBankDp += dp * (pct/100);
	}
	return leadBankDp;
}

function refreshActualDrawingPower(){
//	calculateLonable();
	var dpAsPerStockStatement = getDrawingPower();
	
	//console.log("dpAsPerStockStatement: "+dpAsPerStockStatement);
	dpAsPerStockStatement = removeCommas(dpAsPerStockStatement);

	var dpAsPerLeadBank = leadBankDp;
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
		document.getElementById("actualDp_hidden").value = temp_dpAsPerStockStatement;
	}else{
		dpAsPerLeadBank = setDecimalPlaces(dpAsPerLeadBank, 2);
		//console.log("dpAsPerLeadBank: "+dpAsPerLeadBank);
		document.getElementById("actualDrawingPower").innerHTML = addCommas(temp_dpAsPerLeadBank);
		document.getElementById("actualDp_hidden").value = temp_dpAsPerLeadBank;
	}
}

function disableDpAsPerStockStatement()
{
	document.getElementById("dpAsPerStockStatement").value='';
	document.getElementById("dpAsPerStockStatement").disabled = true;
}

/* function disableDpForCashFlowOrBudget()
{
	document.getElementById("dpForCashFlowOrBudget").value='';
	document.getElementById("dpForCashFlowOrBudget").disabled = true;
} */

function enabledStockAddNewButton() {
	var flag = <%=addStockflag%>;
	var dpCalcManually = document.getElementById("dpCalcManuallyYes").checked
	var month = document.getElementById("stockDocMonth").value;
	var year = document.getElementById("stockDocYear").value;
	//console.log("flag: "+flag+", month: "+month+", year: "+year+", dpCalcManually: "+dpCalcManually);
	if(flag == true){
		if(month=='' || year=='' || dpCalcManually){
			document.getElementById('addNewStock').disabled = true;
		}else{
			document.getElementById('addNewStock').disabled = false;
		}
	}
}

function refreshLocation() {
	//console.log("dueDateAndStock.do?event="+event+"subEvent=refreshDueDate&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId);
	document.forms[0].action="dueDateAndStock.do?subEvent=refreshDueDate"+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId;
	document.forms[0].event.value="add_due_date_and_stock";
	document.forms[0].submit();
}

function viewStocks() {
	//console.log("dueDateAndStock.do?event="+event+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId);
	document.forms[0].action="dueDateAndStock.do?subEvent=viewStocks"+"&selectedIndex="+selectedIndex+"&gcDetailId="+gcDetailId;
	document.forms[0].event.value=event;
	document.forms[0].submit();
}

function addStock() {
	document.forms[0].action ="dueDateAndStock.do?indexID=-1&itemType=STOCKDETAIL&from_page=prepare_update";
    document.forms[0].event.value="update_session_add_stock_detail";
    //console.log(document.forms[0].action);
    document.forms[0].submit();
}

function editStockDetail(locationId,dueDate,fromPage,obIndex) {
	var calculatedDP = getDrawingPower();
	var locationId = locationId;
	var dueDate = dueDate;
	var fromPage = fromPage;
	var obIndex = obIndex;
    //console.log("locationId="+locationId+", dueDate="+dueDate+", obIndex="+obIndex+", calculatedDP="+calculatedDP);
	document.forms[0].action ="dueDateAndStock.do?locationId="+locationId+"&dueDate="+dueDate+"&obIndex="+obIndex+"&calculatedDP="+calculatedDP;
	document.forms[0].event.value="update_session_edit_stock_detail";
    document.forms[0].submit();
	return action;
}

function viewStockStatement() {
	document.forms[0].action ="dueDateAndStock.do?event=update_session_view_stock_statement";
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

function removeCommasFromAmountFields(){
	var amount = getDrawingPower();
	document.getElementById("dpAsPerStockStatement").value = removeCommas(amount);
	/* amount = document.getElementById("dpForCashFlowOrBudget").value;
	document.getElementById("dpForCashFlowOrBudget").value = removeCommas(amount); */
}

function saveInSession(){
	
	var isFacLinePendingMsg = <%=isFacLinePendingMsg%>;
	var facLinePendingMsg = '<%=facLinePendingMsg%>';
	
	if(isFacLinePendingMsg){
		alert(facLinePendingMsg);
		return;
	}
	
	var totalReleasedAmountStr = '<%=totalReleasedAmount%>';
	var totalReleasedAmount = parseFloat(totalReleasedAmountStr);
	var drawingPowerAmount = parseFloat(getDrawingPower());
	
	/* if(totalReleasedAmount>drawingPowerAmount){ 
		alert('<bean:message key="error.dp.cannot.be.less.released.amt"/>');
	} */
	
	if(totalReleasedAmount>drawingPowerAmount){ 
		 var confirmed=  confirm('<bean:message key="error.dp.cannot.be.less.released.amt"/>');
 		if(!confirmed){
 			return;
 		}
	//	return;
	}
	
	/* document.getElementById("dpForCashFlowOrBudget").disabled=false; */
	document.getElementById("dpAsPerStockStatement").disabled=false;
	
	removeCommasFromAmountFields();
	
	
	var cnt1 = <%=cnt%>;
	
    document.forms[0].action="dueDateAndStock.do?event=save_due_date_and_stock&referrerEvent="+sessionDueDateSubEvent+"&selectedIndex="+selectedIndex;
    var bankingArrangeVal = '<%=bankingArrangementVal%>';
    
    /* if((bankingArrangeVal == 'MULTIPLE' || bankingArrangeVal == 'CONSORTIUM') && cnt1 == 0){
    	alert('Stock Details as per Lead Bank/Nodal Bank is Mandatory as Banking ArrangeMent Value is '+bankingArrangeVal);
    }else{
    	document.forms[0].submit();
    } */
    
    document.forms[0].submit();
}

function goBack(){
    document.forms[0].action="AssetGenChargeCollateral.do?event=return_from_due_date_and_stock";
    document.forms[0].submit();
}

</script>
<html:form action="dueDateAndStock.do">
<input type="hidden" name="event"/>
<input type="hidden" id="actualDp_hidden" name="actualDp" value="<%=form.getActualDp() %>" />
  <input type="hidden"  id="alertFlg" name="alertFlg" value="<%=alertFlg%>" />  
<input type="hidden" name="dueDateAlreadyReceived" value="<%=form.getDueDateAlreadyReceived()%>"/>
<input type="hidden" name="dueDateActionPage" value="<%=sessionDueDateSubAction%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td><h3><%=sessionDueDateSubAction %> Due Date and Stock Details</h3><html:errors property="stockDetailsAsPerLeadNodalBankError" /></td>
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
				            
				            <%
				            if(dueDateList!=null){
           	for(int i=0;i<dueDateList.size();i++){
           		LabelValue bean= (LabelValue)dueDateList.get(i);           		
           		String withCode=bean.getValue();
           		if(sessionHighlightedDueDateSet!=null && sessionHighlightedDueDateSet.contains(withCode) && !isEditSessionDueDateSubAction){
	           		 %>
           			<html:option  value="<%=bean.getValue()%>" style="background-color: CornflowerBlue" ><%=bean.getLabel()%></html:option>
           	<%	}else{   %>
           		<html:option value="<%=bean.getValue()%>"><%=bean.getLabel()%></html:option>
           		<%}
           	}
				            }
           	%>
				            
				        </html:select><html:errors property="dueDateMandatoryerror" />
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
						<html:select name="DueDateAndStockForm" property="stockDocMonth" styleId="stockDocMonth" 
							onchange="enabledStockAddNewButton();">
							<html:option value="">Please Select</html:option>
							<logic:present name="stockDocMonthList">
				            	<html:options collection="stockDocMonthList" labelProperty="label" property="value"/>
				            </logic:present>
				        </html:select><html:errors property="stockDocMonthMandatoryerror" />
					</td>
					<td class="fieldname">Stock Doc Year</td>
					<td>
						<html:select name="DueDateAndStockForm" property="stockDocYear" styleId="stockDocYear" 
							onchange="enabledStockAddNewButton();">
							<html:option value="">Please Select</html:option>
							<logic:present name="stockDocYearList">
				            	<html:options collection="stockDocYearList" labelProperty="label" property="value"/>
				            </logic:present>
				        </html:select><html:errors property="stockDocYearMandatoryerror" />
					</td>
				</tr>
				<tr class="even">
					<td class="fieldname">Statement Name</td>
					<td> <bean:write name="DueDateAndStockForm" property="statementName" /> </td>
					<td class="fieldname">DP to be calculated manually</td>
					<td> 
						<input type="radio" id="dpCalcManuallyYes" 
							onclick="dpCalculateChoice(this);enabledStockAddNewButton()" value="YES" />YES
						<input type="radio" id="dpCalcManuallyNo" 
							onclick="dpCalculateChoice(this);enabledStockAddNewButton()" value="NO" />NO
						<input type="hidden" id="dpCalcManually" name="dpCalcManually" value="<%=form.getDpCalcManually()%>" />
					</td>
				</tr>
				<tr class="odd">
					<td class="fieldname">DP Share</td>
					<td> 
						<input type="text" name="dpShare" id="dpShare" value="<%=form.getDpShare()%>"  onkeyup="javascript:calculateLonable()"/>
						<br> 
						<html:errors property="dpShareError" />
					</td>
					<td class="fieldname" width="25%">Drawing Power (as per stock statement)</td>
					<td><input type="text" name="dpAsPerStockStatement" id="dpAsPerStockStatement" 
							value="<%=form.getDpAsPerStockStatement()%>"
							onclick="removeCommaOnFocus(this);"
							onselect="removeCommaOnFocus(this);"
							onblur="addCommaOnBlur(this);refreshActualDrawingPower();" />
							<br>
						<html:errors property="dpAsPerStockStatementError" />
					</td>
				</tr>
				<tr class="even">

								<td width="20%" class="fieldname">
									Remarks by maker
								</td>
								<td><html:text property="remarkByMaker"
										styleId="remarkByMaker" value="<%=form.getRemarkByMaker()%>"  maxlength="4000"  style="width:100%" />
								</td>


								<%-- <td class="fieldname" width="25%">DP for Cash Flow / Cash Budget</td>
					<td><input type="text" name="dpForCashFlowOrBudget" id="dpForCashFlowOrBudget"
							value="<%=form.getDpForCashFlowOrBudget()%>"
							onclick="removeCommaOnFocus(this);"
							onselect="removeCommaOnFocus(this);"
							onblur="addCommaOnBlur(this);refreshActualDrawingPower();disableDpAsPerStockStatement();" />
							<br>
						<html:errors property="dpForCashFlowOrBudgetError" />			
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
						<input type="button" id="addNewStock" value="Add New" class="btnNormal" 
							disabled="disabled" onclick="addStock()" />
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
					          		<%-- <td width="30%" style="text-align: center;">
					          			<bean:write name="stockSummaryForm" property="totalLonable"/>
					          		</td>
					          		<input type="hidden" name="totalLoanable" value="<%=UIUtil.formatWithCommaAndDecimal(dft.format(new Double(totalLonableAmt))) %>"/> 
					          		 --%>
					          		 
					          		 <td width="30%" style="text-align: center;"><%=UIUtil.formatWithCommaAndDecimal(totalLonableAmt)%>  </td>
          							<input type="hidden" name="totalLoanable" value="<%=totalLonableAmt%>"/> 
          		
          		
					          		<td width="30%" style="text-align: center;">
					          			<a href="javascript:editStockDetail(
					          				'<bean:write name="stockSummaryForm" property="locationID"/>',
					          				'<bean:write name="stockSummaryForm" property="dueDate"/>',
					          				'update',
					          				'<%=stockIndex%>')">View/Edit</a> 
					          			&nbsp;
					          			
					          			<a href="javascript:viewStockStatement()">View Stock Statement</a> 
					          			
					          				
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
		<tr>
			<td>
				<jsp:include page="lead_bank_stock_listing.jsp"/>
			</td>
		</tr>
	
	<tr>
		<td><br><br>
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
	
	<!-- Hidden fields -->
	<html:hidden property="docCode"/>
	<html:hidden property="location"/>
	<html:hidden property="stockDocMonth"/>
	<html:hidden property="stockDocYear"/>
	<html:hidden property="statementName"/>
	<html:hidden property="dpShare"/>
	<html:hidden property="remarkByMaker"/>
	
	
	<%-- <html:hidden property="dpForCashFlowOrBudget"/> --%>
	<html:hidden property="leadBankStockInd"/>
	<html:hidden property="coverageAmount"/>
	<html:hidden property="coveragePercentage"/>
	<html:hidden property="adHocCoverageAmount"/>
	<html:hidden property="totalReleasedAmount" value="<%=totalReleasedAmount%>" />
	
	
	<tr>
		<td align="center">
			<table >
				<tr >
					<td class="makerOnly"><a href="javascript:saveInSession();" onmouseout="MM_swapImgRestore()" 
							onmouseover="MM_swapImage('img_ok','','img/ok2.gif',1)">
							<img src="img/ok1.gif" name="img_ok" border="0" /> </a>
					</td>
					<td class="makerOnly">	
						<a href="javascript:goBack();" 
							onmouseout="MM_swapImgRestore()" 
							onmouseover="MM_swapImage('img_cancel','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="img_cancel" border="0" /> </a>
					</td>							
				</tr>
			</table>
		</td>
	</tr>
		</tbody>
</table>	
</html:form>