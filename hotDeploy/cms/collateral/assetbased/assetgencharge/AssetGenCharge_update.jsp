<%@page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"%>
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


<% 
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String  isEditable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.isEditable");
String  insEdited = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insEdited");
BigDecimal  releasableAmount = (BigDecimal) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.releasableAmount");
String  statementName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.statementName");
//String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.fundedShare");

String  dpShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpShare");
String  remarkByMaker = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.remarkByMaker");
String  totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");

String  alertFlg = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.alertFlg");
//System.out.println("alertFlg1 in jsp=======================:"+alertFlg);


String  fromPage = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
String  isStockDetailsAdded = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.isStockDetailsAdded");
String  alertRequired = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.alertRequired");
 
//String  migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");

String  hdnPreviousDueDate = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.hdnPreviousDueDate");
System.out.println("hdnPreviousDueDate=======================:"+hdnPreviousDueDate);

/* if(null == migrationFlag ||  "".equals(migrationFlag)){
	migrationFlag = "N";	
} */
//System.out.println("migrationFlag= IN migrationFlag.jsp=======================:"+migrationFlag);


String  totalLonableAmt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");


if(null == totalLonableAmt){
	totalLonableAmt = "0.00";	
}
totalLonableAmt=UIUtil.removeComma(totalLonableAmt);
System.out.println("totalLonableAmt= IN AssetGenCharge_update.jsp=======================:"+totalLonableAmt);


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

/*if(fundedShare == null  || "".equals(fundedShare)){
	fundedShare = "0";	
}*/

if(dpShare == null  || "".equals(dpShare) || "null".equals(dpShare)){
	dpShare = "0";	
}

if(null == remarkByMaker){
	remarkByMaker = "";	
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
/* String newreleasableAmountStr=UIUtil.formatWithCommaAndDecimal(newreleasableAmount.toString());

 if(dp!=null && ! "0".equals(dp)){
	
	BigDecimal cal1= new BigDecimal(UIUtil.removeComma(dp));
	
	if(cal1.compareTo(releasableAmount)==-1){
		
		msg="Calculated drawing power ("+newdp+") is less than released amount("+newreleasableAmountStr+").";
	}else{
		msg="Calculated drawing power ("+newdp+") is greater than released amount("+newreleasableAmountStr+").";
	}
}else{
	msg="Calculated drawing power(0.00) is less than released amount("+newreleasableAmountStr+").";
} */
 

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
System.out.println("dueDate : "+dueDate);
	IGeneralCharge oldCollateral = (IGeneralCharge) itrxValue.getCollateral();
	IGeneralCharge newCollateral = (IGeneralCharge) itrxValue.getStagingCollateral();
    IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
    
    
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

    AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");

    String remarks = (String) request.getAttribute("remarks");
    if (remarks == null || remarks.trim().length() == 0) {
    	
        remarks = request.getParameter("remarks");
    }
    HashMap  docCodeWithStocks = (HashMap) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.docCodeWithStocks");
    String prefix = "Asset";
    String subtype = "AssetGenCharge";
    String formName = subtype + "Form";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
	
	
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
/*	if(!"".equals(dueDate)){
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
	} */
    IGeneralChargeDetails newChargeDetaills=null;
    IGeneralChargeStockDetails[] existingGeneralChargeStockDetails1;
    IGeneralChargeDetails[] existingGeneralChargeDetails1 = newCollateral.getGeneralChargeDetails();
	IGeneralChargeDetails existingChargeDetails1;
/* 	if(!"".equals(dueDate)){
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
	} */
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
	String otherChecklistCountPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.otherChecklistCountPartyName");
	 System.out.println("/collateral/assetbased/assetgencharge/AssetGenCharge_update.jsp=>otherChecklistCountPartyName======>>>>>"+otherChecklistCountPartyName);
	

	String warningInsuredAmtLessThanDp =  (String) session.getAttribute(AssetBasedAction.class.getName()+"."+CollateralConstant.SESSION_ASSET_GC_INSURED_AMT_WARNING);
	boolean isWarningInsuredAmtLessThanDp = ICMSConstant.YES.equals(warningInsuredAmtLessThanDp);

	String drawingPowerLessThanReleasedAmtAlert =  (String) session.getAttribute(AssetBasedAction.class.getName()+"."+CollateralConstant.SESSION_ASSET_GC_DRAWING_POWER_MSG);
	boolean isDrawingPowerLessThanReleasedAmtAlert = ICMSConstant.YES.equals(drawingPowerLessThanReleasedAmtAlert);
	
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="java.sql.Timestamp"%>
<%@page import="org.apache.commons.lang.time.DateFormatUtils"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
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
<!--

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

var isWarningInsuredAmtLessThanDp = <%=isWarningInsuredAmtLessThanDp%>;
var isDrawingPowerLessThanReleasedAmtAlert = <%=isDrawingPowerLessThanReleasedAmtAlert%>;

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();
	
		var  otherChecklistCountPartyName1 = '<%=otherChecklistCountPartyName%>';
    	if (num == 1) {
    	var isAlertRequired='<%=alertRequired%>';
    	if("Y"==isAlertRequired){
	    	alert("<%=msg%>");
    	}
    	
    	if(isWarningInsuredAmtLessThanDp){
    		var confirmed=  confirm("Sum of all Insured amount is less than the Recent DP value.");
    		if(!confirmed){
    			return;
    		}
    	}
    
    	/* if(isDrawingPowerLessThanReleasedAmtAlert){
    	
    		alert("<bean:message key="error.dp.cannot.be.less.released.amt"/>");
    		 document.getElementById("alertFlg").value='true'; 
    	//	return;
    	} */
    	
    	if(isDrawingPowerLessThanReleasedAmtAlert){
    		 var confirmed=  confirm("<bean:message key="error.dp.cannot.be.less.released.amt"/>");
    		 document.getElementById("alertFlg").value='true'; 
     		if(!confirmed){
     			return;
     		}
    	}
    	
    	if(<%="true".equalsIgnoreCase(alertFlg)%>){
    		alert('<bean:message key="error.dp.value.increased"/>');
    	}
    	
    	if(<%=insuranceCheck.equalsIgnoreCase("no")%>){
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	} else if( <%= insuranceLength %> > 0){
    		<% if(checklistIsActive){%>
    		document.forms[0].event.value = "submit";
    		document.forms[0].submit();
    	    <%}else{%>
    		alert("Please approve the other checklist for given party.Party Pending for checker authorization=>"+otherChecklistCountPartyName1);
    	    <%}%>
    	}else{
    		alert("Please Add the Insurance Details");
    	}
    }
	if (num == 2) {
		if(isWarningInsuredAmtLessThanDp){
    		alert("Sum of all Insured amount is less than the Recent DP value.");
    	}
		
    	document.forms[0].event.value="update";
    	document.forms[0].submit();
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

<%-- function calculateLonable() {
	var fundedShare;
	var newFundedShare;
	var calculatedDP;
	var lonable;
    var DP = '<%=dp%>';

	newFundedShare=document.forms[0].fundedShare.value;
	if(isNaN(newFundedShare) || ''==newFundedShare){
    alert("Please enter numeric value in HDFC Bank share!!!");
    document.getElementById("fundedShare").value='<%=fundedShare%>';
    document.getElementById("calculatedDP").value=DP;
    newFundedShare='0';
	}
	else{
    if(isNaN(DP) || ''==DP){
	alert("DP is set to 0 and DP is not a number");
	DP='0';
	}
	//alert("new FundedShare value"+newFundedShare);
	fundedShare='<%=fundedShare%>';
	//alert("previous fundedShare value"+fundedShare);
	calculatedDP=DP;
	

	  if(!isNaN(fundedShare)&& !isNaN(calculatedDP) && !isNaN(newFundedShare)){
		
		  lonable=((newFundedShare*calculatedDP)/fundedShare);
	
	  }else{
		  lonable=0;
	  }
	  if(isNaN(lonable) || ''==lonable){
		  lonable='0';
	  }
	
  	  var l=Math.round(lonable*100)/100;
  	 // alert("loanable:"+l);
  	 l=formatAmountAsCommaSeparated1(l);
	  document.getElementById("calculatedDP").value= l;
	}
}	--%>

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

function validateRecbyClient() {

	var recByClientEdited='00.00'; 
	
	recByClientEdited= document.forms[0].recvGivenByClient.value;
	
	var newtermLoanOutstdAmt='00.00'; 
	var newmarginAssetCover='00.00'; 
     var temp= '00.00';
	 var multi = '00.00';
	 
    var recvGivenByClient = '00.00';
    
	newtermLoanOutstdAmt=document.forms[0].termLoanOutstdAmt.value;
	newmarginAssetCover=document.forms[0].marginAssetCover.value;
	
	
	 if(!isNaN(newtermLoanOutstdAmt) && !isNaN(newmarginAssetCover)){
			//alert("newtermLoanOutstdAmt"+newtermLoanOutstdAmt+" * NewmarginAssetCover"+newmarginAssetCover)
		     temp = newmarginAssetCover / 100 ; 
			multi= newtermLoanOutstdAmt * temp ;
		  
		    recvGivenByClient= Number(newtermLoanOutstdAmt) + Number(multi); 
	 }
	 

	    Number.prototype.noExponents = function() {
	  	  var data = String(this).split(/[eE]/);
	  	  if (data.length == 1) return data[0];

	  	  var z = '',
	  	    sign = this < 0 ? '-' : '',
	  	    str = data[0].replace('.', ''),
	  	    mag = Number(data[1]) + 1;

	  	  if (mag < 0) {
	  	    z = sign + '0.';
	  	    while (mag++) z += '0';
	  	    return z + str.replace(/^\-/, '');
	  	  }
	  	  mag -= str.length;
	  	  while (mag--) z += '0';
	  	  return str + z;
	  	}
	  	var newRecvd = recvGivenByClient.noExponents();
	  	
		 if(recByClientEdited < newRecvd ){
			 alert("Entered Value in Receivables given by Client Should not be less than Calculated Value: "+newRecvd);
			 document.getElementById("recvGivenByClient").value= newRecvd;
		 }
	
}
function calReceivablebyClient() {

	var newtermLoanOutstdAmt='00.00'; 
	var newmarginAssetCover='00.00'; 
	
     var temp= '00.00';
	 var multi = '00.00';
	 
    var recvGivenByClient = '00.00';
    
	newtermLoanOutstdAmt=document.forms[0].termLoanOutstdAmt.value;
	
	newmarginAssetCover=document.forms[0].marginAssetCover.value;
	
		if(isNaN(newtermLoanOutstdAmt) || ''==newtermLoanOutstdAmt){ 
	    alert("Please enter numeric value in Term Loan Outstanding Amount !!!");
	    document.getElementById("termLoanOutstdAmt").value='0.00'; 
	    document.getElementById("recvGivenByClient").value=recvGivenByClient;
	    recvGivenByClient='0.00';
		}
	
	 	if(isNaN(newmarginAssetCover) || ''==newmarginAssetCover){ 
	    alert("Please enter numeric value in Margin Asset Cover!!!");
	    document.getElementById("marginAssetCover").value='0.00'; 
	    document.getElementById("recvGivenByClient").value=recvGivenByClient;
	    recvGivenByClient='0.00';
		}

	 	if(  newmarginAssetCover > 100 ){
		 	alert("Margin Asset Cover should be less than 100");
		 	 document.getElementById("marginAssetCover").value='0.00'; 
		 	}
	 	

    if(!isNaN(newtermLoanOutstdAmt) && !isNaN(newmarginAssetCover)){
	//alert("newtermLoanOutstdAmt"+newtermLoanOutstdAmt+" * NewmarginAssetCover"+newmarginAssetCover)
     temp = newmarginAssetCover / 100 ; 
	
	multi= newtermLoanOutstdAmt * temp ;
  
	
    recvGivenByClient= Number(newtermLoanOutstdAmt) + Number(multi); 
    }else{
    	recvGivenByClient="00.00";
    }
   
    Number.prototype.noExponents = function() {
  	  var data = String(this).split(/[eE]/);
  	  if (data.length == 1) return data[0];

  	  var z = '',
  	    sign = this < 0 ? '-' : '',
  	    str = data[0].replace('.', ''),
  	    mag = Number(data[1]) + 1;

  	  if (mag < 0) {
  	    z = sign + '0.';
  	    while (mag++) z += '0';
  	    return z + str.replace(/^\-/, '');
  	  }
  	  mag -= str.length;
  	  while (mag--) z += '0';
  	  return str + z;
  	}
  	var newRecvd = recvGivenByClient.noExponents();
  
 
  	  document.getElementById("recvGivenByClient").value=newRecvd;
	 
}
//end Santosh
//-->
</script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<html:form action="AssetGenChargeCollateral.do">
<input type="hidden" name="event" value="<%=AssetGenChargeAction.EVENT_EDIT%>">
<input type="hidden" name="loanable" value="<%=loanable%>">
<input type="hidden" name="totalLonable" value="<%=totalLonableAmt%>">
<%-- <input type="hidden" name="migrationFlag" value="<%=migrationFlag%>"> --%>

<input type="hidden" id="hdnPreviousDueDate" name="hdnPreviousDueDate" value="<%=hdnPreviousDueDate%>"> 

  <input type="hidden"  id="alertFlg" name="alertFlg" value="<%=alertFlg%>" />  
  
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="userAccess" value="true"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>
<%if(displayList.size()==0){ %>
	
	<html:hidden property="isStockDetailsAdded"   value="N"/>
	<%}else{ %>
	<html:hidden property="isStockDetailsAdded"  value="Y"/>
	<%} %>

<input type="hidden" name="parentPageFrom" value="<%=parentPageFrom%>">
     
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.asset.title.create"/>
			<% } else { %>
				<bean:message key="label.security.asset.title.edit"/>
			<% } %>
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td><h3><bean:message key="label.security.general"/></h3></td>
        <td width="50%" align="right">
            <% if (isDeleting) { %>
            <p class="deletedItem"><bean:message key="label.deleted"/></p>
            <% } %>
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
	        <tbody>
				<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
 <%@ include file="/collateral/collateral_general_common_field.jsp" %> 

</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
 <jsp:include page="due_date_and_stock_listing.jsp" >
 	<jsp:param name="parentPageFrom" value="<%=parentPageFrom%>"/>
 </jsp:include>	
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<%
if(!("no".equals(insuranceCheck)))
{
%>
	<%@ include file="/collateral/assetbased/assetgencharge/gcInsurance/maker_list_insurance.jsp"%>
<%
}
%>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td colspan="2">&nbsp;</td>
</tr>
    <tr>
        <td><h3>Term Loan Asset Cover <%-- <bean:message key="label.security.general"/> --%></h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
	   <td colspan="2">
		<table width="50%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<tbody>
				  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						    <td width="20%" class="fieldname">Term Loan Outstanding Amount<%-- <bean:message key="label.cms.host.security.id"/>  --%></td>
							<td width="30%">
						<%if(null == iCol.getTermLoanOutstdAmt() || "".equals(iCol.getTermLoanOutstdAmt())  ){ %>
							<html:text property="termLoanOutstdAmt" styleId="termLoanOutstdAmt"  size="50" maxlength="26"  
							value="0.00" onkeyup="javascript:calReceivablebyClient()" />
							 
							 <%}else{ %> 
							 <html:text property="termLoanOutstdAmt" styleId="termLoanOutstdAmt"  size="50" maxlength="26"  
							value="<%=dft.format(new BigDecimal(iCol.getTermLoanOutstdAmt()))%>" onkeyup="javascript:calReceivablebyClient()" />
							<%} %>
							  &nbsp;
							   <html:errors property="termLoanOutstdAmtErr"/>
							</td>
				   </tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							 <td width="20%" class="fieldname">Margin/ Asset Cover (%)<%-- <bean:message key="label.security.type"/> --%>     </td>
							 <td width="30%">
						
				 <%if(null == iCol.getMarginAssetCover() || "".equals(iCol.getMarginAssetCover())  ){ %>
				 <html:text property="marginAssetCover" styleId="marginAssetCover"  size="50" maxlength="6"  
									 value="0.0" onkeyup="javascript:calReceivablebyClient()"/>
				<%}else{ %>
				 <html:text property="marginAssetCover" styleId="marginAssetCover"  size="50" maxlength="6"  
									 value="<%=dft.format(new Double(iCol.getMarginAssetCover()))%>" onkeyup="javascript:calReceivablebyClient()"/>
				<%} %>
					 				  &nbsp; <html:errors property="marginAssetCoverErr"/>
					     	</td>
					</tr>     
        
					 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							 <td width="20%" class="fieldname">	 Receivables given by Client	 <%-- <bean:message key="label.security.type"/> --%>	 </td>
							 <td width="30%">
							 <%if(null == iCol.getRecvGivenByClient() || "".equals(iCol.getRecvGivenByClient())  ){ %>
								 <html:text property="recvGivenByClient" styleId="recvGivenByClient"  size="50" maxlength="26" 
								  value="0.00"  onblur="validateRecbyClient()"/>
								   <%}else{ %> 
								    <html:text property="recvGivenByClient" styleId="recvGivenByClient" onblur="validateRecbyClient()" size="50" maxlength="26" 
								  value="<%=dft.format(new BigDecimal(iCol.getRecvGivenByClient()))%>"   />
								   <%} %>
								   &nbsp; <html:errors property="recvGivenByClientErr"/>
					     	</td>
					  </tr>                  
            </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>	
			
					
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
</table>
<%--<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>
	        <%@ include file="/collateral/assetbased/asset_environment_risk_update.jsp" %>
	        <%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>

	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
				<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
					<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
						 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						 onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /> </td>
				<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio> &nbsp; 
					<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio> &nbsp;  </td>
			</tr>
			
	        <%@ include file="/collateral/common/common_fields_update.jsp" %>
	        <%@ include file="/collateral/common/common_physical_inspection_update.jsp" %>
			
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname"><bean:message key="label.security.maturity.date" />&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <td><html:text property="collateralMaturityDate" readonly="true" size="15" maxlength="11"/>
	                <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
	                     onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y');"
	                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
	                <html:errors property="collateralMaturityDate"/></td>
				<td class="fieldname">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio> &nbsp;
					<html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio> &nbsp; </td>
	        </tr>

	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
	            <td colspan="3">
	                <html:textarea property="remarkEnvRisk" rows="5" cols="120" style="width:100%" />
	                &nbsp; <html:errors property="remarkEnvRisk"/>
	            </td>
	        </tr>
			
	        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.description"/></span></td>
	            <td colspan="3">
	                <html:textarea property="description" rows="5" cols="120" style="width:100%" />&nbsp;
	                <html:errors property="description"/></td>
	        </tr>

        <!--<%@ include file="/collateral/common/update_security_instrument.jsp" %>-->
        </tbody>
        </table>
        </td>
     </tr>
</tbody>
</table> --%>

<%-- <%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

<jsp:include page="/collateral/assetbased/update_charge_summary.jsp"/>

<!--Update two valuation details-->
<%@ include file="/collateral/common/view_valuation_from_los.jsp" %>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

<%@ include file="/collateral/insurancepolicy/update_insurance_summary.jsp" %> --%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <tbody>
        <tr><td>&nbsp;</td></tr>
		<% if (ICMSConstant.STATE_REJECTED.equals(itrxValue.getStatus()) || ICMSConstant.STATE_REJECTED_CREATE.equals(itrxValue.getStatus())) { %>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr>
                            <td class="fieldname"><bean:message key="label.remarks"/></td>
                            <td class="odd"><html:textarea property="remarks" rows="3" cols="120" style="width:100%" value="<%=remarks%>"/>&nbsp;
                                <html:errors property="remarks"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                            <td class="even"><%=itrxValue.getUserInfo()==null ? "" : itrxValue.getUserInfo()%>&nbsp;</td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                            <td><integro:wrapper value='<%=itrxValue.getRemarks()==null ? "" : itrxValue.getRemarks()%>'/>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <% } %>

    </tbody>
    <tr align="center"><td colspan="2">
        <html:errors property="drawingpowerErr"/><br>
        <html:errors property="totalgrossErr"/>
        <html:errors property="totalAppliedLimitErr"/>
        <html:errors property="totalReleasedLimitErr"/>
    </td></tr>
</table>
<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>
</html:form>
<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>
</html>
