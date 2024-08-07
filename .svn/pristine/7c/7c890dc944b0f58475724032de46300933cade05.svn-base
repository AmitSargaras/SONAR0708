<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 java.util.Collection,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 java.util.HashMap,
                 java.util.List,
                 java.util.ArrayList,
                 java.util.Iterator,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeAction,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm,
                 com.integrosys.cms.app.dataprotection.proxy.IDataProtectionProxy,
                 com.integrosys.cms.app.dataprotection.proxy.DataProtectionProxyFactory,
                 com.integrosys.cms.ui.dataprotection.DataProtectionConstants" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="org.apache.struts.util.LabelValueBean"%>

<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<% 
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String  isEditable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.isEditable");
String  insEdited = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insEdited");
BigDecimal  releasableAmount = (BigDecimal) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.releasableAmount");
String  statementName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.statementName");
//String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.fundedShare");

String  dpShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpShare");

String  fromPage = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
String  isStockDetailsAdded = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.isStockDetailsAdded");
String  alertRequired = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.alertRequired");
 

List insuranceList2 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceList");


//BigDecimal  loanable = (BigDecimal) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.loanable");
//BigDecimal  loanable = (BigDecimal) request.getAttribute("loanable");
BigDecimal loanable;
if(null!=request.getAttribute("loanable")) {
	loanable=new BigDecimal(request.getAttribute("loanable").toString());
}
else {
	loanable=new BigDecimal(0.0);
}

System.out.println("loanable:"+loanable);

if(loanable == null  || "".equals(loanable) || "null".equals(loanable)){
	loanable = new BigDecimal(0);	
}

String dp=  (String) request.getAttribute("calculatedDP");
System.out.println("dp is"+dp);

DecimalFormat dft = new DecimalFormat("#0.00");
boolean isProcess = false;   
if(dpShare == null  || "".equals(dpShare) || "null".equals(dpShare)){
	dpShare = "0";	
}
System.out.println("dpShare:"+dpShare);
if(dp == null || "".equals(dp) || "null".equals(dp)){
	dp = "0";
}
//if(fundedShare != null  && !"0".equals(fundedShare) && dp != null && !"0".equals(dp)){
//	dp= String.valueOf(((Integer.parseInt(dp))*(Integer.parseInt(fundedShare)/100)));	
//}


String msg="";

//Phase 3 CR:comma separated
String newdp=dp;
BigDecimal newreleasableAmount= releasableAmount;
newdp=UIUtil.formatWithCommaAndDecimal(newdp);
String newreleasableAmountStr=UIUtil.formatWithCommaAndDecimal(newreleasableAmount.toString());

 if(dp!=null && ! "0".equals(dp)){
	
	BigDecimal cal1= new BigDecimal(UIUtil.removeComma(dp));
	
	if(cal1.compareTo(releasableAmount)==-1){
		
		msg="Calculated drawing power ("+newdp+") is less than released amount("+newreleasableAmountStr+").";
	}else{
		msg="Calculated drawing power ("+newdp+") is greater than released amount("+newreleasableAmountStr+").";
	}
}else{
	msg="Calculated drawing power(0.00) is less than released amount("+newreleasableAmountStr+").";
}
 

if(isStockDetailsAdded!=null){
	//do Nothing
}else if("REJECTED".equals(itrxValue.getStatus())){
	isStockDetailsAdded="Y";
}
else{
	isStockDetailsAdded="N";
}
String parentPageFrom = "ASSET_UPDATE";
//List addedLocation = (ArrayList) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.addedLocations");
List displayList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.displayList");

System.out.println("displayList:"+displayList);
if(displayList==null){
	displayList= new ArrayList();
}
List dueDateList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDateList");
pageContext.setAttribute("dueDateList",dueDateList);
List filterLocationList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.filterLocationList");
if(filterLocationList==null)
	filterLocationList=new ArrayList();
pageContext.setAttribute("filterLocationList",filterLocationList);
String  dueDate = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate"); 
	IGeneralCharge oldCollateral = (IGeneralCharge) itrxValue.getCollateral();
	IGeneralCharge newCollateral = (IGeneralCharge) itrxValue.getStagingCollateral();
    IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
    
    
    
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

    AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");

   
    HashMap  docCodeWithStocks = (HashMap) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.docCodeWithStocks");
    String prefix = "Asset";
    String subtype = "AssetGenCharge";
    String formName = subtype + "Form";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	 event = "add_each_stock_and_date";
	
     //todo - need to check
    String collateralLocation = iCol.getCollateralLocation();

    String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong(roleType);

    IDataProtectionProxy dpProxy = DataProtectionProxyFactory.getProxy();

    boolean updatableSecDetails = true;
	if (collateralLocation!=null) dpProxy.isFieldAccessAllowed(ICMSConstant.INSTANCE_COLLATERAL, subtypeCode, DataProtectionConstants.COL_PT_DTL,
            teamTypeMshipID, collateralLocation, IDataProtectionProxy.ANY_ORGANISATION);

	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
    //todo - end
    String eventStr =request.getParameter("event");
    boolean disableAddEdit= false;
    /* if(eventStr!=null && "view_stocks".equals(eventStr)){
    	disableAddEdit=true;
    } */
    String prefix1 = "Asset";
    
    IGeneralChargeDetails oldChargeDetaills=null;
    IGeneralChargeStockDetails[] existingGeneralChargeStockDetails2;
    IGeneralChargeDetails[] existingGeneralChargeDetails2 = oldCollateral.getGeneralChargeDetails();
	IGeneralChargeDetails existingChargeDetails2;
	if(!"".equals(dueDate)){
    if(existingGeneralChargeDetails2!=null){
		for (int i = 0; i < existingGeneralChargeDetails2.length; i++) {
			 existingChargeDetails2 = existingGeneralChargeDetails2[i];		
			if(existingChargeDetails2!=null && existingChargeDetails2.getDocCode().equals(dueDate.split(",")[1])){
			System.out.println("************ "+existingChargeDetails2.getDueDate()+" "+existingChargeDetails2.getDocCode());
			oldChargeDetaills = existingChargeDetails2;
				break;
			}
		}
	}
	}
    IGeneralChargeDetails newChargeDetaills=null;
    IGeneralChargeStockDetails[] existingGeneralChargeStockDetails1;
    IGeneralChargeDetails[] existingGeneralChargeDetails1 = newCollateral.getGeneralChargeDetails();
	IGeneralChargeDetails existingChargeDetails1;
	if(!"".equals(dueDate)){
    if(existingGeneralChargeDetails1!=null){
		for (int i = 0; i < existingGeneralChargeDetails1.length; i++) {
			 existingChargeDetails1 = existingGeneralChargeDetails1[i];		
			if(existingChargeDetails1!=null && existingChargeDetails1.getDocCode().equals(dueDate.split(",")[1])){
			System.out.println("************ "+existingChargeDetails1.getDueDate()+" "+existingChargeDetails1.getDocCode());
			newChargeDetaills = existingChargeDetails1;
				break;
			}
		}
	}
	}
	//Santosh
	//System.out.println("????????>>>>>>"+newChargeDetaills.getDpCalculateManually());
	
	String dpCalculateManually=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
	System.out.println("????????<<<<<<"+dpCalculateManually);
	
	//end Santosh
	
	int insuranceLength = insuranceList2.size();
	
	//System.out.println("insuranceLength:"+insuranceLength);
	
	 String insuranceCheck=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");
	// System.out.println("insuranceCheck:"+insuranceCheck);
	
	Boolean checklistIsActive = (Boolean)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.checklistIsActive");
	
	
	List finalMonthList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.finalMonthList");
	List finalYearList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.finalYearList");
	System.out.println("finalMonthList=>"+finalMonthList+" finalYearList=>"+finalYearList);
	if(finalMonthList==null)
		finalMonthList=new ArrayList();
	pageContext.setAttribute("finalMonthList",finalMonthList);
	
	if(finalYearList==null)
		finalYearList=new ArrayList();
	pageContext.setAttribute("finalYearList",finalYearList);
	boolean flag = false;
	
	
	if(dueDate!=null && !"".equals(dueDate) && !"null".equals(dueDate) && ("NO".equals(dpCalculateManually)))
    {
		String[] split=dueDate.split(",");
			String docCode1=split[1];
    
    	if(!(displayList.size()>0) && !docCodeWithStocks.containsKey(docCode1)){
    		flag = true;
    	}
    }
	String  stockDocMonth = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocMonth"); 
	String  stockDocYear = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocYear"); 
	System.out.println("++++++++******************");
	System.out.println("colForm=>"+colForm);
	//System.out.println("colForm.getStockDocMonth=>"+colForm.getStockdocMonth()+"  colForm.getStockDocYear=>"+colForm.getStockdocYear());
	System.out.println("StockDocMonth=>"+stockDocMonth+"  StockDocYear=>"+stockDocYear);
	if(stockDocMonth == null){
		stockDocMonth = "";
		
	}
	if(stockDocYear == null){
		stockDocYear = "";
		
	}
	/* if(colForm != null){
		if(colForm.getStockdocMonth() != null && !"".equals(colForm.getStockdocMonth())){
			stockDocMonth = colForm.getStockdocMonth();
		}
		if(colForm.getStockdocYear() != null && !"".equals(colForm.getStockdocYear())){
			stockDocYear = colForm.getStockdocYear();
		}
		
	} */
	
%>
<head>
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
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script language="JavaScript" type="text/JavaScript">
function refreshLocation(dropdown)
{
	
var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }	
   var dep = 'stockLocation';
   var url = '/cms/AssetGenChargeStockDetails.do?event=get_filter_locations&dueDate='+curSel;

   var typeOfCharge = document.forms[0].typeOfCharge.value;
   //sendLoadDropdownReq(dep, url);
   
   document.forms[0].action="AssetGenChargeStockDetails.do?event=filter_locations&collateralID=<%=oldCollateral.getCollateralID()%>&parentPageFrom=<%=parentPageFrom%>&dueDate="+curSel;
   document.forms[0].submit();
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
}

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();
	
		
    	if (num == 1) {
    	var isAlertRequired='<%=alertRequired%>';
    	if("Y"==isAlertRequired){
	    	alert("<%=msg%>");
    	}
    	if(<%=insuranceCheck.equalsIgnoreCase("no")%>){
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	} else if( <%= insuranceLength %> > 0){
    		<% if(checklistIsActive){%>
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	    <%}else{%>
    		alert("Please approve the other checklist for given party.");
    	    <%}%>
    	}else{
    		alert("Please Add the Insurance Details");
    	}
    }
	if (num == 2) {
		var stockDocMonthVal = document.getElementById('stockmonth').value;
		var stockDocYearVal = document.getElementById('stockyear').value;
		//stockmonth
		document.forms[0].action="AssetGenChargeCollateral.do?event=update&stockdocMonth="+stockDocMonthVal+"&stockdocYear="+stockDocYearVal;
    	document.forms[0].event.value="update";
    	document.forms[0].submit();
		
    	/* document.forms[0].event.value="update";
    	document.forms[0].submit(); */
    }
    if (num == 3) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 4) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";   
        document.forms[0].submit();
    }
    if (num == 5) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.LIMIT_CHARGE%>";
        document.forms[0].submit();
    }
    if (num == 6) {
        document.forms[0].event.value="prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 7) {
        document.forms[0].event.value="prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
    if (num == 8) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value = "<%=CollateralConstant.INS_INFO%>";
        document.forms[0].submit();
    }
     if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    	document.forms[0].submit();
    }
    if (num == 10) {
         document.forms[0].event.value="prepare";
         document.forms[0].indexID.value="-1";
         document.forms[0].itemType.value = "STOCKDETAIL";
         document.forms[0].from_page.value="prepare_update";
         document.forms[0].submit();
     }     
    if (num == 11) {
         document.forms[0].event.value="view_stocks";
         document.forms[0].indexID.value="-1";
        // document.forms[0].itemType.value = "STOCKDETAIL";
        // document.forms[0].from_page.value="prepare_update";
         document.forms[0].submit();
     }

}

function calculateLonable() {
	var dpShare;
	var newDpShare; 
	var lonable='<%=loanable%>';
    <%--  var DP = '<%=dp%>'; --%>
    var DP = '0';
	newDpShare=document.forms[0].dpShare.value;
	if(isNaN(newDpShare) || ''==newDpShare){ 
    alert("Please enter numeric value in DP share!!!");
    document.getElementById("dpShare").value='<%=dpShare%>'; 
    document.getElementById("calculatedDP").value=DP;
    newDpShare='0';
	}
	else{
    if(isNaN(DP) || ''==DP){
	alert("DP is set to 0 and DP is not a number");
	DP='0';
	}

    if(lonable !== '0'){
		
	if(!isNaN(newDpShare)&& !isNaN(lonable)){
	//	alert("lonable dpShare:"+lonable+" "+newDpShare);
		  lonable=((lonable*newDpShare)/100);
	//	  alert("lonable :"+lonable);
	  }else{
		  alert("test3");
		  lonable=0;
	  }
	}else{
 //alert("inside else");

	dpShare='<%=dpShare%>'; 

	calculatedDP=DP;
    if(!isNaN(dpShare)&& !isNaN(calculatedDP) && !isNaN(newDpShare)){
	
	  lonable=((newDpShare*calculatedDP)/dpShare);

    }else{
	  lonable=0;
    }
    if(isNaN(lonable) || ''==lonable){
	  lonable='0';
    }
	}
  	  var l=Math.round(lonable*100)/100;
  	//  alert("loanable:"+l);
  	  l=formatAmountAsCommaSeparated1(l);
	  document.getElementById("calculatedDP").value= l;
	}
}


function editStockDetail(event,locationId,dueDate,fromPage,obIndex) {
	var event = event;

//	var fundedShare = document.forms[0].fundedShare.value;

	var dpShare = document.forms[0].dpShare.value;
	var calculatedDP = document.forms[0].calculatedDP.value;
	var action ;
	var locationId = locationId;
	var dueDate = dueDate;
	var fromPage = fromPage;
	var obIndex = obIndex;
	//document.forms[0].action ="AssetGenChargeStockDetails.do?event=edit_prepare_stock_details&locationId="+locationId+"&dueDate="+dueDate+"&from_page=update&obIndex="+obIndex+"&fundedShare="+fundedShare+"&calculatedDP"+calculatedDP;
	var typeOfCharge = document.forms[0].typeOfCharge.value;
    
	document.forms[0].action ="AssetGenChargeStockDetails.do?event=edit_prepare_stock_details&locationId="+locationId+"&dueDate="+dueDate+"&from_page=update&obIndex="+obIndex+"&dpShare="+dpShare+"&calculatedDP"+calculatedDP;
    document.forms[0].submit();
   return action;
}	
//Start Santosh
function dpCalculateChoice(choice) {
	 var DP = '<%=UIUtil.removeComma(dp)%>';
	
	if(choice.value=="YES" && <%=(dueDate!=null && !"".equals(dueDate) && !"null".equals(dueDate))%>) {
		if(<%="NO".equals(dpCalculateManually)%>) {
			document.getElementById("calculatedDP").value=0;
		}	
		else {
			document.getElementById("calculatedDP").value=DP;
		}
		<%-- document.getElementById("calculatedDP").value=<%=dp%>; --%>
		document.getElementById("calculatedDP").disabled=false;
		document.getElementById("stockDetailSubmit1").disabled=true;
	}	
	else {
		calculateLonable();
		document.getElementById("calculatedDP").disabled=true;
		document.getElementById("stockDetailSubmit1").disabled=false;
	}
}

function enabledStockAddNewButton() {
	var flag = <%=flag%>;
	var month = document.getElementById("stockmonth").value;
	var year = document.getElementById("stockyear").value;
	//alert("flag=>"+flag+" month=>"+month+" year=>"+year);
	if(flag == true){
		if(month != '' && month != null && year != '' && year != null ){
			document.getElementById('stockDetailSubmit1').disabled = false;
		}else{
			document.getElementById('stockDetailSubmit1').disabled = true;
		}
	
		}
	
	
}
</script>
</head>

<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm"%><script language="JavaScript" type="text/JavaScript">
function refreshLocation(dropdown)
{
	
var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }	
   //var dep = 'stockLocation';
   //var url = '/cms/AssetGenChargeStockDetails.do?event=get_filter_locations&dueDate='+curSel;

   document.forms[0].action="AssetGenChargeStockDetails.do?event=filter_locations&collateralID=<%=oldCollateral.getCollateralID()%>&parentPageFrom=<%=parentPageFrom%>&dueDate="+curSel;
   document.forms[0].submit();
}

function viewStocks(num, index) {
    if (num == 11) {
         document.forms[0].event.value="view_stocks";
         document.forms[0].indexID.value="-1";
        
     }
    if (num == 12) {
        document.forms[0].event.value="view_stocks_track";
        document.forms[0].indexID.value="-1";
        
    }
    document.forms[0].submit();

}

</script>
<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<html:form action="AssetGenChargeCollateral.do">
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tr>
      <h3>Add Due Date and Stock Details</h3>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
<tbody>

<tr class="even">
	<td class="fieldname">
		Due Date  
	
 </td>
 <td>
    	<html:select property="dueDate" onchange="javascript:refreshLocation(this)" value="<%=dueDate%>">
      		<option value="" style=>Please Select </option>	
      <!-- 	<logic:iterate id="ob" name="dueDateList" type="org.apache.struts.util.LabelValueBean" scope="page" >
	           	<html:option value="<%=ob.getValue()%>"><%=ob.getLabel()%></html:option>
           	</logic:iterate>  -->     
           	<%
           	for(int i=0;i<dueDateList.size();i++){
           		LabelValueBean bean= (LabelValueBean)dueDateList.get(i);           		
           		String withCode=bean.getValue();
           		String[] split=withCode.split(",");
           		String docCode=split[1];
           		if(docCodeWithStocks.containsKey(docCode)){  %>
           			<html:option  value="<%=bean.getValue()%>" style="background-color: CornflowerBlue" ><%=bean.getLabel()%></html:option>
           	<%	}else{   %>
           		<html:option value="<%=bean.getValue()%>"><%=bean.getLabel()%></html:option>
           		<%}
           	}
           	%>
    </html:select>
    <html:errors property="dueDateError"/>
	</td>
	
	<td class="fieldname">Location</td>
	<td>
	<html:select property="stockLocation" >
      		<option value=""> Please Select </option>	
           	<html:options collection="filterLocationList" property="value" labelProperty="label"/>
    </html:select>&nbsp;
    <input class="btnNormal" type="button" id="viewStockDetailSubmit1" name="viewStockDetailSubmit1" value="View stocks" onclick="javascript:submitPage(11, -1)"/>
    <html:errors property="stockLocationError"/>
</td>
	
	
	</tr>
	<tr>
	
	<td class="fieldname">
		Stock Doc Month <span class="mandatoryPerfection">*</span>
	
	<html:select property="stockdocMonth" styleId="stockmonth"  onchange="enabledStockAddNewButton();" value="<%=stockDocMonth%>">
      		<option value="">Please Select </option>	
      	 <html:options  name="finalMonthList" labelName="finalMonthList"></html:options> 
      		
      		</html:select><html:errors property="stockdocmonthError"/></td>
	
	<td class="fieldname">
		Stock Doc Year <span class="mandatoryPerfection">*</span>  
	<html:select property="stockdocYear" styleId="stockyear" onchange="enabledStockAddNewButton(); "  value="<%=stockDocYear%>">
      		<option value="">Please Select </option>	
      		 <html:options  name="finalYearList" labelName="finalYearList" ></html:options> 
      		</html:select><html:errors property="stockdocyearError"/></td> 
	
	
<td class="fieldname"></td>
<td>-</td>
</tr>



<tr class="odd">
	<td class="fieldname">
		Statement Name
	</td>
	<td>
	<integro:empty-if-null value="<%=statementName %>"/>
	</td>
	<!-- Start Santosh -->
	<td class="fieldname">
		DP to be calculated manually
	</td>
	<td><%if(dueDate!=null && !"".equals(dueDate) && !"null".equals(dueDate)) {%>
			<%if("YES".equals(dpCalculateManually)){ %>
				<input type="radio" name="dpCalculateManually" value="YES" checked="checked" onclick="dpCalculateChoice(this)">YES
			<%}
			else {%>
				<input type="radio" name="dpCalculateManually" value="YES" onclick="dpCalculateChoice(this)">YES
			<%} %>
		
			<%if("NO".equals(dpCalculateManually)){ %>
				<input type="radio" name="dpCalculateManually" value="NO" checked="checked"  onclick="dpCalculateChoice(this)" >NO
			<%}
			else {%>
				<input type="radio" name="dpCalculateManually" value="NO" onclick="dpCalculateChoice(this)">NO
			<%} %>
		<%} 
		else {%>
			<input type="radio" name="dpCalculateManually" value="YES" onclick="dpCalculateChoice(this)">YES	
			<input type="radio" name="dpCalculateManually" value="NO" checked="checked"  onclick="dpCalculateChoice(this)" >NO
		<%} %>	
	</td>
	<!--End Santosh  -->
</tr>
<tr class="even">
 
	<td width="20%"class="<%=true?(CompareOBUtil.compOB(newChargeDetaills,oldChargeDetaills,"dpShare")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.col.dpShare" /></td>
	<td>
	<%if(displayList.size()==0){ %>
	
	<html:text property="dpShare" styleId="dpShare"  size="15" maxlength="6"  value="<%=dft.format(new Double(dpShare))%>" onkeyup="javascript:calculateLonable()"/>
	<%}else{ %>
	<html:text property="dpShare" styleId="dpShare" size="15" maxlength="6" value="<%=dft.format(new Double(dpShare))%>" onkeyup="javascript:calculateLonable()"/>
	
	<%} %>
	 <html:errors property="dpSharePctError"/>
	</td>
	
	<td class="fieldname" width="25%">
	Drawing Power (as per stock statement) 
	</td>
	<td width="25%">
	<!--Start Santosh -->
	<%if((dueDate!=null && !"".equals(dueDate) && !"null".equals(dueDate))&&("YES".equals(dpCalculateManually))) {%>
		<%if(displayList.size()==0){ %>
			<html:text property="calculatedDP" styleId="calculatedDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="false"/>
		<%}else{ %>
			<html:text property="calculatedDP" styleId="calculatedDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="false"/>
		<%} 
	}else {%>
		<%if(displayList.size()==0){ %>
			<html:text property="calculatedDP" styleId="calculatedDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="true"/>
		<%}else{ %>
			<html:text property="calculatedDP" styleId="calculatedDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="true"/>
		<%} 
	} %>
	<!--End Santosh -->
	
	<%--<input type="hidden" name="calculatedDP" value="<%=dp%>">
	<integro:empty-if-null value='<%=dp%>'/>--%>
	 <html:errors property="calculatedDPError"/>
	</td>
</tr>

<tr class="odd">
 
	<td class="fieldname" width="25%"></td>
	<td></td>
	
	<%-- <td class="fieldname" width="25%">
	DP for Cash Flow / Cash Budget
	</td>
	<td width="25%">
	<%if((dueDate!=null && !"".equals(dueDate) && !"null".equals(dueDate))&&("YES".equals(dpCalculateManually))) {%>
		<%if(displayList.size()==0){ %>
			<html:text property="cashFlowBudgetDP" styleId="cashFlowBudgetDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="false"/>
		<%}else{ %>
			<html:text property="cashFlowBudgetDP" styleId="cashFlowBudgetDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="false"/>
		<%} 
	}else {%>
		<%if(displayList.size()==0){ %>
			<html:text property="cashFlowBudgetDP" styleId="cashFlowBudgetDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="true"/>
		<%}else{ %>
			<html:text property="cashFlowBudgetDP" styleId="cashFlowBudgetDP"  value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(dp) %>" disabled="true"/>
		<%} 
	} %>
	 <html:errors property="cashFlowBudgetDPError"/>
	</td> --%>
</tr>
<tr>
	<td colspan="4" align="left">
		<!--<html:errors property="fundedShareError"/> -->
		<html:errors property="dpShareError"/>
	</td>
</tr>
</tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td><h3>Stock Details  </h3>
        <html:errors property="stockDetailsError"/>
        </td>
        <%
        if(dueDate!=null && !"".equals(dueDate) && !"null".equals(dueDate) && ("NO".equals(dpCalculateManually)))
        {
    		String[] split=dueDate.split(",");
   			String docCode1=split[1];
        
        	if(!(displayList.size()>0) && !docCodeWithStocks.containsKey(docCode1)){ %>
        	<td width="50%" align="right">
				<input class="btnNormal" type="button" id="stockDetailSubmit1" name="stockDetailSubmit1" value="Add New" onclick="javascript:submitPage(10, -1)" disabled="true"/>
			</td>
			<%} %>
        <%} %>
        
        
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
          <%
           		int rowIdx1 = 0;
          
          if(displayList!=null && displayList.size()>0){
        	  AssetGenChargeStockDetailsHelperForm helperForm; 
        	  for (int cnt = 0; cnt < displayList.size(); cnt++) {
        		  helperForm=(AssetGenChargeStockDetailsHelperForm)displayList.get(cnt);
        	%>
        	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	        	<td> <%=cnt+1%></td>
          		<td width="30%" style="text-align: center;"><%=helperForm.getLocationName()%>  </td>
          		<td width="30%" style="text-align: center;"><%=UIUtil.formatWithCommaAndDecimal(helperForm.getTotalLonable())%>  </td>       		
          		<td width="30%">
          		<%--<select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <option value='AssetGenChargeStockDetails.do?event=view_stock_details&locationId=<%=helperForm.getLocationID()%>&dueDate=<%=helperForm.getDueDate()%>&obIndex=<%=cnt%>&parentPageFrom=<%=parentPageFrom%>'>View</option>
                  
                   <option  value='AssetGenChargeStockDetails.do?event=edit_prepare_stock_details&locationId=<%=helperForm.getLocationID()%>&dueDate=<%=helperForm.getDueDate()%>&from_page=update&obIndex=<%=cnt%>'>Edit</option>
                         <option  onclick= "javascript:editStockDetail('edit_prepare_stock_details','<%=helperForm.getLocationID()%>','<%=helperForm.getDueDate()%>','update','<%=cnt%>')" >Edit</option>
                 </select>--%>
                  <center> <a href="javascript:editStockDetail('edit_prepare_stock_details','<%=helperForm.getLocationID()%>','<%=helperForm.getDueDate()%>','update','<%=cnt%>')">View / Edit</a></center></td>
          		</td>
          	</tr> 
        		  
        <%}	  
          }	else{
            %>   
	        <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	        	<td colspan="4"> No records Found.</td>
          		<%-- <td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="30%">Location</td>
          		<td width="30%">Deficit/Loanable</td>
          		<td width="30%">Action</td> --%>
          	</tr>
          	<%} %>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
     <tr>    
   <%if(event.equals("add_each_stock_and_date")){ %>  
      <td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('update_return_onsave')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('prepare_update')"/></a>	        	
      </td>
      	<%}else if(event.equals("add_stocks_in_edit")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_stocks_in_edit')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('edit_summary_details')"/></a>	        	
      </td>
      	
      	 	<%}else if(event.equals("add_stocks_in_resubmit")){ %>
      	<td align="center">
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
     		<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveOtherSystem('save_stocks_in_resubmit')"/></a>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage('process_summary_details')"/></a>	        	
      </td>
      	
      	<%} %>
  </tr>
</table>
</html:form>
</body>
</html>