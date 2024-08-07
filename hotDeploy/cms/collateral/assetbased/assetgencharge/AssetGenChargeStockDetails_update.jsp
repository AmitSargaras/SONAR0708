<%@page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.geography.city.proxy.ICityProxyManager"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
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
                 com.integrosys.cms.ui.dataprotection.DataProtectionConstants,
				 java.util.Locale" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction" %>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"/>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"/>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>
<%  ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate");
	if(dueDate==null){
		dueDate="";
	}
	String stockdocMonth=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocMonth");
	String stockdocYear=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocYear");
	/* String remarkByMaker=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.remarkByMaker");
	if(null ==remarkByMaker){
		remarkByMaker="";
	}
	
	String  totalLonableAmt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
	if(null == totalLonableAmt){
		totalLonableAmt = "";	
	}
	System.out.println("totalLonableAmt==in AssetGenChargeStockDetails_edit.jsp ======================:"+totalLonableAmt);

	String migrationFlag=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
	
	if(null == migrationFlag){
		migrationFlag = "";	
	}
	
    System.out.println(">>>>>migrationFlag in UpdatebJSP >>>>"+migrationFlag);
 */
    
    IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
String assetsFixedMarginValue= (String)request.getAttribute("assetsFixedMarginValue");
String assetsMarginType= (String)request.getAttribute("assetsMarginType");

String assetsFixedMarginValueNew= (String)request.getAttribute("assetsFixedMarginValueNew");
String assetsMarginTypeNew= (String)request.getAttribute("assetsMarginTypeNew");


String liabilityFixedMarginValueAdv= (String)request.getAttribute("liabilityFixedMarginValueAdv");
String liabilityMarginTypeAdv= (String)request.getAttribute("liabilityMarginTypeAdv");


String liabilityFixedMarginValue= (String)request.getAttribute("liabilityFixedMarginValue");
String liabilityMarginType= (String)request.getAttribute("liabilityMarginType");

DecimalFormat dft = new DecimalFormat("#0.00");
    List stockDetailsList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceStockDetailsList");
    
  //  IGeneralChargeDetails chargeDetaills=null;
  //  if(iCol.getGeneralChargeDetails()!=null){
  //  	chargeDetaills=(IGeneralChargeDetails)iCol.getGeneralChargeDetails()[0];
	//}    
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

   // AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
	List  locationList = (List) request.getAttribute("locationList");
	pageContext.setAttribute("locationList", locationList);
	
    String remarks = (String) request.getAttribute("remarks");
    if (remarks == null || remarks.trim().length() == 0) {
        remarks = request.getParameter("remarks");
    }
    String classtype ="";
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
    AssetGenChargeStockDetailsForm colForm = (AssetGenChargeStockDetailsForm) request.getAttribute("AssetGenChargeStockDetailsForm");
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
    //todo - end
    System.out.println(">>>>>>>>>"+colForm.getDpCalculateManually());
    
 //   String remarkByMaker=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.remarkByMaker");
 String remarkByMaker=colForm.getRemarkByMaker();
   if(null ==remarkByMaker){
		remarkByMaker="";
	}
	
//	String  totalLonableAmt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
	String  totalLonableAmt =colForm.getTotalLoanable();
	if(null == totalLonableAmt){
		totalLonableAmt = "";	
	}
	System.out.println("totalLonableAmt==in AssetGenChargeStockDetails_edit.jsp ======================:"+totalLonableAmt);

	//String migrationFlag=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
	String migrationFlag=colForm.getMigrationFlag_DP_CR();
	if(null == migrationFlag){
		migrationFlag = "";	
	}
	/* if(null != migrationFlag &&  "Y".equalsIgnoreCase(migrationFlag.trim()) ){
		totalLonableAmt="";
	} */
	
    System.out.println(">>>>>migrationFlag in UpdatebJSP >>>>"+migrationFlag);

	
    
    String insuranceCoverageAmount = UIUtil.removeComma(colForm.getCoverageAmount());
    String totalPolicyAmt = (String) session.getAttribute(AssetBasedAction.class.getName() +"."+CollateralConstant.SESSION_TOTAL_INSURANCE_POLICY_AMT);
   if(null == assetsFixedMarginValue && "".equalsIgnoreCase(assetsFixedMarginValue)){
    	assetsFixedMarginValue= "0";
    }

    if(null == assetsFixedMarginValueNew && "".equalsIgnoreCase(assetsFixedMarginValueNew)){
    	assetsFixedMarginValueNew= "0";
    }

    if(null == liabilityFixedMarginValue && "".equals(liabilityFixedMarginValue)){
    	liabilityFixedMarginValue="0";
    	}

    if(null == liabilityFixedMarginValueAdv && "".equals(liabilityFixedMarginValueAdv)){
    		liabilityFixedMarginValueAdv="0";
    		}
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsForm"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
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

function showCalculatePopup ()
{
	var url = "<%=request.getContextPath()%>/collateral/assetbased/assetgencharge/calculation_popup_detail.jsp";
	/* stackTrace = document.getElementById("stackTraceId");
	message = document.getElementById("messageId");
	rootCause = document.getElementById("rootCauseId");	 */	

	var scrwidth = 1000;
	if (screen.width < scrwidth) scrwidth = screen.width;
	var scrheight = 600;
	if (screen.height < scrheight) scrheight = screen.height;

	var LeftPosition = (screen.width)?(screen.width-scrwidth-10)/2:100;
	if (LeftPosition < 0) LeftPosition = 0;
	var TopPosition = (screen.height)?(screen.height-scrheight-100)/2:100;
	if (TopPosition < 0) TopPosition = 0;

	popupWindow = window.open(url, "errorLog", "height=" + scrheight + ", width=" + scrwidth + ", scrollbars=yes, toolbar=no, location=no, titlebar=no, directories=no, status=no, menubar=no, resizable=yes, channelmode=no" + ", top=" + TopPosition + ", left=" + LeftPosition);

	if (window.focus) 
	{
		popupWindow.focus();
	}

}
function MM_jumpMenu(targ,selObj,restore,index){ //v3.0
	enableAllFormElements();
	var opValue=selObj.options[selObj.selectedIndex].value;
	if(opValue=='viewAsset'){
		 document.forms[0].event.value="view_current_asset";
	}else if(opValue=='editAsset'){
		 document.forms[0].event.value="edit_prepare_current_asset";
	}else if(opValue=='viewLiabilities'){
		 document.forms[0].event.value="view_current_liabilities";
	}else if(opValue=='editLiabilities'){
		 document.forms[0].event.value="edit_prepare_current_liabilities";
	}
	else if(opValue=='viewValueDebtors'){
		 document.forms[0].event.value="view_value_debtors";
	}else if(opValue=='editValueDebtors'){
		 document.forms[0].event.value="edit_prepare_value_debtors";
	}
	else if(opValue=='viewLessValueAdvances'){
		 document.forms[0].event.value="view_less_value_advances";
	}else if(opValue=='editLessValueAdvances'){
		 document.forms[0].event.value="edit_prepare_less_value_advances";
	}
	 document.forms[0].obIndex.value=index;
	 document.forms[0].submit();
}
	
function toggleAssetsFixedMarginValue(obj){
    if(obj.value=='FIXED'){
    	document.forms[0].assetsFixedMarginValue.disabled=false;
    	if("" == document.forms[0].assetsFixedMarginValue.value){
        	document.forms[0].assetsFixedMarginValue.value='0';
        	}
    }else{
    	document.forms[0].assetsFixedMarginValue.disabled=true;
    	document.forms[0].assetsFixedMarginValue.value='';
    }
}



function setFIxedZero(obj){        	
    	if("" == document.forms[0].assetsFixedMarginValue.value){
    	document.forms[0].assetsFixedMarginValue.value='0';
    	}
}

function setFIxedZeroCreditors(obj){        	
	if("" == document.forms[0].liabilityFixedMarginValue.value){
	document.forms[0].liabilityFixedMarginValue.value='0';
	}
}

function setFIxedZeroDebtors(obj){        	
	if("" == document.forms[0].assetsFixedMarginValueNew.value){
	document.forms[0].assetsFixedMarginValueNew.value='0';
	}
}

function setFIxedZeroAdvances(obj){        	
	if("" == document.forms[0].liabilityFixedMarginValueAdv.value){
	document.forms[0].liabilityFixedMarginValueAdv.value='0';
	}
}

	// debtors
function toggleAssetsFixedMarginValueNew(obj){
    if(obj.value=='FIXED'){
    	document.forms[0].assetsFixedMarginValueNew.disabled=false;
       	document.forms[0].assetsFixedMarginValueNew.value='0';
   
    }else{
    	document.forms[0].assetsFixedMarginValueNew.disabled=true;
    	document.forms[0].assetsFixedMarginValueNew.value='';
    }
}

	

 
 //old creditors
 function toggleLiabilityFixedMarginValue(obj){
	    if(obj.value=='FIXED'){
	    	document.forms[0].liabilityFixedMarginValue.disabled=false;
	   	    	document.forms[0].liabilityFixedMarginValue.value='0';
	   
	    }else{
	    	document.forms[0].liabilityFixedMarginValue.disabled=true;
	    	document.forms[0].liabilityFixedMarginValue.value='';

	    }
	}
 
  //new creditors
  
  
  function toggleLiabilityFixedMarginValueNew(obj){
    if(obj.value=='FIXED'){
    	document.forms[0].liabilityFixedMarginValue.disabled=false;
    	document.forms[0].liabilityFixedMarginValue.disabled=true; // DP calculation
    	document.forms[0].liabilityFixedMarginValue.value='0'
    }else{
    	document.forms[0].liabilityFixedMarginValue.disabled=true;
    	document.forms[0].liabilityFixedMarginValue.value=''
    }
 } 
  
  
  //Old Advacnes
  function toggleLiabilityFixedMarginValueAdvOld(obj){
 	    if(obj.value=='FIXED'){
 	    	document.forms[0].liabilityFixedMarginValueAdv.disabled=false;
 	   	    	document.forms[0].liabilityFixedMarginValueAdv.value='0';
 	  
 	    }else{
 	    	document.forms[0].liabilityFixedMarginValueAdv.disabled=true;
	    	document.forms[0].liabilityFixedMarginValueAdv.value='';

 	    }
 	}
  
  // new Advances 
 function toggleLiabilityFixedMarginValueAdv(obj){
	    if(obj.value=='FIXED'){
	    	document.forms[0].liabilityFixedMarginValueAdv.disabled=false;
	    	document.forms[0].liabilityFixedMarginValueAdv.disabled=true; // DP calculation
	    	document.forms[0].liabilityFixedMarginValueAdv.value='0'
	    }else{
	    	document.forms[0].liabilityFixedMarginValueAdv.disabled=true;
	    	document.forms[0].liabilityFixedMarginValueAdv.value=''
	    }
	} 


function submitPage(num) {
    enableAllFormElements();

    if (num == 1) {
        document.forms[0].event.value="create_current_asset";
    }
    if (num == 2) {
        document.forms[0].event.value="update";
    }
    if (num == 3) {
        document.forms[0].event.value="cancel";
    }
    document.forms[0].submit();
}

function submitPage(num, index) {

	if( ( "3" == num  ||  "4" == num )&&  "" ==  document.forms[0].totalLonable1.value &&   "Y" != document.forms[0].migrationFlag.value  ) {

		alert("Please Click on Calculate Button for Total Loanable Amount")
	}else{
	
    enableAllFormElements();
 	
    if (num == 1) {
    document.forms[0].action='AssetGenChargeStockDetails.do';
    document.forms[0].event.value="prepare_create_current_asset";
    document.forms[0].indexID.value="-1";
    document.forms[0].itemType.value = "CURRENTASSET";
    }
	if (num == 2) {
	document.forms[0].action='AssetGenChargeStockDetails.do';
    document.forms[0].event.value="prepare_create_current_liabilities";
    document.forms[0].indexID.value="-1";
    document.forms[0].itemType.value = "CURRENTLIABILITIES";
    }
	if (num == 3) {
    document.forms[0].event.value="create_stock_detail";
    }
	if (num == 4) {
    document.forms[0].action="dueDateAndStock.do?event=edit_due_date_and_stock";
    }
    //console.log(document.forms[0].action); 
	 if (num == 5) {
		    document.forms[0].action='AssetGenChargeStockDetails.do';
		    document.forms[0].event.value="prepare_create_value_debtors";
		    document.forms[0].indexID.value="-1";
		    document.forms[0].itemType.value = "VALUEDEBTORS";
	 }
	 
	 if (num == 6) {
		    document.forms[0].action='AssetGenChargeStockDetails.do';
		    document.forms[0].event.value="prepare_create_less_value_advances";
		    document.forms[0].indexID.value="-1";
		    document.forms[0].itemType.value = "LESSVALUEADVANCES";
	 }
	 document.forms[0].totalLonable.disabled=false;

    document.forms[0].submit();
	}

}
function toggeleAddButton() {
	var stockLocation=document.forms[0].stockLocation.value;
	alert("stockLocation"+stockLocation);
	if(stockLocation!=null && stockLocation != ""){
		alert("Inside if");
		document.getElementByName("currentAssetSubmit1").enabled =true;
	}else{
		alert("Inside else");
		document.getElementByName("currentAssetSubmit1").disabled=true;
	}
	
}



function refreshCoveragePercentage(){
	var insuranceCoverageAmount = '<%=insuranceCoverageAmount%>';
	var adhocCoverageAmount = removeComma(document.getElementById("adHocCoverageAmount").value);
	
	var totalCoverageAmount = parseFloat(insuranceCoverageAmount)
	if(parseFloat(adhocCoverageAmount)>0){
		totalCoverageAmount = parseFloat(insuranceCoverageAmount)+ parseFloat(adhocCoverageAmount);
	}
	
	var totalPolicyAmt = '<%=totalPolicyAmt%>';
	
	var coveragePercent = (totalPolicyAmt>0 && totalCoverageAmount>0)? parseFloat((totalPolicyAmt/totalCoverageAmount)*100).toFixed(2):0;
	
	document.getElementById("coveragePercentage").value = coveragePercent;
}


</script>
</head>

<body>

<html:form action="AssetGenChargeStockDetails.do">
<input type="hidden" name="event" >
<input type="hidden" name="indexID"/>
<input type="hidden" name="obIndex"/>
<%-- <input type="hidden" name="fundedShare" value="<%=colForm.getFundedShare() %>"/> --%>
<!-- Santosh -->
<input type="hidden" name="dpCalculateManually" value="<%=colForm.getDpCalculateManually() %>"/>
<input type="hidden" name="dpShare" value="<%=colForm.getDpShare() %>"/>
<input type="hidden" name="remarkByMaker" value="<%=remarkByMaker %>"/>
<%-- <input type="hidden" name="totalLoanable" value="<%=totalLonableAmt %>"/> --%>
<input type="hidden" id = "migrationFlag"  name="migrationFlag" value="<%=migrationFlag %>"/>

<input type="hidden" name="calculatedDP" value="<%=colForm.getCalculatedDP() %>"/>
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="userAccess" value="true"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page" value=""/>
<html:hidden property="dueDateStatus" value="<%=IGeneralChargeDetails.STATUS_PENDING %>"/>
<input type="hidden" name="collateralCurrency" value="<%=iCol.getCurrencyCode()%>"/>
<input type="hidden" name="securityOrganization" value="<%=iCol.getSecurityOrganization()%>"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
        	Add Stock Details  
		</h3></td>
    </tr>
  </thead>
</table>
<br>&nbsp;<html:errors property="stockDetailsError"/>
<%@ include file="/collateral/common/common_theme_tab.jsp"%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr class="even">
	<td class="fieldname">
		Due Date
	</td>
	<td colspan="3">
		<%=dueDate.split(",")[0]%>
		<html:hidden property="dueDate" value="<%=dueDate%>"/>
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">Location</td>
	<td>
	<html:select name="AssetGenChargeStockDetailsForm" property="stockLocation">
		<%--<option value="stockLocation">Please Select</option>
		<option value="MUM">Mumbai</option>
		<option value="KOL">Kolkata</option>
		<option value="ALL">All</option>
		--%><option value="">Please Select </option>	
		<html:options collection="locationList" property="value" labelProperty="label"/>
	</html:select>&nbsp;<html:errors property="locationError"/>
	</td>
	<td class="fieldname">
		Location Description
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="stockLocationDetail"  maxlength="20" />
	&nbsp;<html:errors property="locationDetailError"/>
	</td>
</tr>
</tbody>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="2"><h3>Value of Stock</h3></td>
        <!-- <td width="50%" align="right" colspan="2">
			<input class="btnNormal" type="button" name="currentAssetSubmit1" value="Add New" onclick="javascript:submitPage(1, -1)"/>
        </td> -->
    </tr>
    <tr>
    <td colspan="4">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
	<tr class="even">
	<td class="fieldname">
        Asset's Margin Type</td>
        <td colspan="2">
        <%if("FIXED".equals(assetsMarginType)) {%>
        	<input type="radio" name="assetsMarginType" value="FIXED" onclick="toggleAssetsFixedMarginValue(this)" checked="checked">Fixed</input>
			<input type="radio" name="assetsMarginType" value="VARIABLE" onclick="toggleAssetsFixedMarginValue(this)">Variable</input>
			<input type="text" name="assetsFixedMarginValue"  value="<%=assetsFixedMarginValue%>"  maxlength="6" onblur="setFIxedZero(this)" />
		<%}else{ %>
			<input type="radio" name="assetsMarginType" value="FIXED" onclick="toggleAssetsFixedMarginValue(this)">Fixed</input>
			<input type="radio" name="assetsMarginType" value="VARIABLE" onclick="toggleAssetsFixedMarginValue(this)" checked="checked">Variable</input>
			<input type="text" name="assetsFixedMarginValue"  disabled="disabled" maxlength="6" onblur="setFIxedZero(this)"/>
		<%} %>
		&nbsp;<html:errors property="marginErrorAsset"/>
        </td>
        <td align="right" >
			<input class="btnNormal" type="button" name="currentAssetSubmit1" value="Add New" onclick="javascript:submitPage(1, -1)"/>
        </td>
    </tr>
    </tbody></table></td>
    <tr>
        <td colspan="4"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
     <td colspan="4">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
          	<tr>
          		<td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="20%">Component</td>
          		<td width="20%" align="center">Amount</td>
          		<td width="20%">Margin</td>
          		<!-- Start Santosh -->
          		<td width="20%">Application for DP</td>
          		<!-- End Santosh -->
          		<td width="20%">Loanable</td>
          		<td width="15%">Action</td>
          	</tr>
          </thead> 
            <tbody>
             <%
             BigDecimal totalLonableAssets= new BigDecimal("0");
             if(stockDetailsList!=null && stockDetailsList.size()>0){
            	 IGeneralChargeStockDetails chargeStockDetails=null; 
                  classtype = "odd";
                 int index=0;
                 for (int counter = 0; counter < stockDetailsList.size(); counter++) {
                	 
                   	chargeStockDetails=(IGeneralChargeStockDetails)stockDetailsList.get(counter);
                    if (chargeStockDetails != null && "CurrentAsset".equals(chargeStockDetails.getStockType())){
                    	index++;
                %>
              <tr class="<%=classtype%>">
	        	 <td class="index"><%=index%></td>
          		<td>
					          		<integro:common-code-single categoryCode="CURRENT_ASSET" entryCode="<%=chargeStockDetails.getComponent()%>" display="true" descWithCode="false"  />    		
          		</td>
          		<td align="left"><%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getComponentAmount())%></td>
          		<td>
					<%=chargeStockDetails.getMargin() %>          		
          		</td>
          		<!-- Start Santosh -->
          		<%if(null!=chargeStockDetails.getApplicableForDp()) {%>
						<td><%=chargeStockDetails.getApplicableForDp()%></td>
				<%}else {%>	          		
          			<td>-</td>
          		<%} %>	
          		<!-- End Santosh -->
          		<td>
					<!-- <%=dft.format(new Double(chargeStockDetails.getLonable())) %>  -->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<% if("YES".equals(chargeStockDetails.getApplicableForDp())){
						totalLonableAssets=totalLonableAssets.add(new BigDecimal(chargeStockDetails.getLonable()));
					}
					%>
          		</td>
          		<td>
					<select name="menu1" onchange="MM_jumpMenu('self',this,0,<%=counter%>)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <%-- <option value='AssetGenChargeStockDetails.do?event=view_current_asset&obIndex=<%=counter%>'>View</option>
                      <option value='AssetGenChargeStockDetails.do?event=edit_prepare_current_asset&from_page=update_stock_detail&obIndex=<%=counter%>'>Edit</option> --%>
                      <option value='viewAsset'>View</option>
                      <option value='editAsset'>Edit</option>
                    </select>
          		</td>
          	 </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                }        
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="6">There is no value of stock detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Value of Stock  
				</td>
				<td colspan="5">
				<!-- <%=dft.format(totalLonableAssets) %> -->
				<%=UIUtil.formatWithCommaAndDecimal(totalLonableAssets.toString()) %>
				</td>
			</tr>
            </tbody>
        </table>
    </td>
</tr>

</tbody>
<tr>
    <td colspan="4">&nbsp;</td>
</tr>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="4"><h3>Less: Value of Creditors</h3></td>
        <!-- <td width="50%" align="right" colspan="2">
			<input class="btnNormal" type="button" name="currentAssetSubmit1" value="Add New" onclick="javascript:submitPage(2, -1)"/>
        </td> -->
    </tr>
    <tr>
    <td colspan="4">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    <tr class="even">
	<td class="fieldname">
        Liabilities's Margin Type</td>
        <td colspan="2">
        
         <%if(!"Y".equals(migrationFlag.trim())) {%>
    
    
      <%if("FIXED".equals(liabilityMarginType)) {%>
        	<input type="radio" name="liabilityMarginType" disabled="disabled" value="FIXED" onclick="toggleLiabilityFixedMarginValueNew(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginType" disabled="disabled" value="VARIABLE" onclick="toggleLiabilityFixedMarginValueNew(this)">Variable</input>
			<%-- <input type="text" name="liabilityFixedMarginValue"  value="<%=liabilityFixedMarginValue%>"  maxlength="6"/> --%>
			<input type="text" name="liabilityFixedMarginValue"  disabled="disabled"  value="0"  maxlength="6"/>
			
		<%}else{ %>
			<input type="radio" name="liabilityMarginType" disabled="disabled" value="FIXED" onclick="toggleLiabilityFixedMarginValueNew(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginType" disabled="disabled" value="VARIABLE" onclick="toggleLiabilityFixedMarginValueNew(this)">Variable</input>
			<input type="text" name="liabilityFixedMarginValue"  disabled="disabled" value="0" maxlength="6"/>
		<%} %>
		 
		
	<%} else{ %>
		        <% System.out.println("liabilityMarginType INSIDE OLD LOGIC"+liabilityMarginType) ; %>
		
		  <%if("FIXED".equals(liabilityMarginType)) {%>
        	<input type="radio" name="liabilityMarginType" value="FIXED" onclick="toggleLiabilityFixedMarginValue(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginType" value="VARIABLE" onclick="toggleLiabilityFixedMarginValue(this)">Variable</input>
			<input type="text" name="liabilityFixedMarginValue"  value="<%=liabilityFixedMarginValue%>"  maxlength="6" onblur="setFIxedZeroCreditors(this)"/>
		<%}else{ %>
			<input type="radio" name="liabilityMarginType" value="FIXED" onclick="toggleLiabilityFixedMarginValue(this)">Fixed</input>
			<input type="radio" name="liabilityMarginType" value="VARIABLE" onclick="toggleLiabilityFixedMarginValue(this)" checked="checked">Variable</input>
			<input type="text" name="liabilityFixedMarginValue"  disabled="disabled" maxlength="6" value="" onblur="setFIxedZeroCreditors(this)"/>
		<%} %>
		<%} %>
		&nbsp;<html:errors property="marginErrorLiability"/>
        </td>
        <td align="right" >
				<input class="btnNormal" type="button" name="currentLiabilitySubmit1" value="Add New" onclick="javascript:submitPage(2, -1)"/>
        </td>
    </tr></tbody></table></td></tr>
    <tr>
        <td colspan="4"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
     <td colspan="4">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
          	<tr>
          		<td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="20%">Component</td>
          		<td width="20%">Amount</td>
          		<td width="20%">Margin</td>
          		<!-- Start Santosh -->
          		<td width="20%">Application for DP</td>
          		<!-- End Santosh -->
          		<td width="20%">Loanable</td>
          		<td width="15%">Action</td>
          	</tr>
          </thead> 
	        <tbody>
<%
BigDecimal totalLonableLiabilities= new BigDecimal("0");
             if(stockDetailsList!=null && stockDetailsList.size()>0){
            	 IGeneralChargeStockDetails chargeStockDetails=null; 
                  classtype = "odd";
                 int index1=0;
                 
                 for (int counter = 0; counter < stockDetailsList.size(); counter++) {
                   	chargeStockDetails=(IGeneralChargeStockDetails)stockDetailsList.get(counter);
                    if (chargeStockDetails != null && "CurrentLiabilities".equals(chargeStockDetails.getStockType())){
                    	index1++;
                %>
              <tr class="<%=classtype%>">
	        	 <td class="index"><%=index1%></td>
          		<td>
          		<integro:common-code-single categoryCode="CURRENT_LIABILITIES" entryCode="<%=chargeStockDetails.getComponent()%>" display="true" descWithCode="false"  />
          		</td>
          		<td align="right">
          			<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getComponentAmount())%>
          		</td>
          		<td>
					<%=chargeStockDetails.getMargin() %>          		
          		</td>
          		<!-- Start Santosh -->
          		<%if(null!=chargeStockDetails.getApplicableForDp()) {%>
						<td><%=chargeStockDetails.getApplicableForDp()%></td>
				<%}else {%>	          		
          			<td>-</td>
          		<%} %>
          		<!-- End Santosh -->
          		<td>
					<!--  <%=dft.format(new Double(chargeStockDetails.getLonable())) %>-->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<%if("YES".equals(chargeStockDetails.getApplicableForDp())) {
						totalLonableLiabilities=totalLonableLiabilities.add(new BigDecimal(chargeStockDetails.getLonable()));
					}
					%>          		
          		</td>
          		<td>
					<select name="menu1" onchange="MM_jumpMenu('self',this,0,<%=counter%>)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <%-- <option value='AssetGenChargeStockDetails.do?event=view_current_liabilities&obIndex=<%=counter%>'>View</option>
                      <option value='AssetGenChargeStockDetails.do?event=edit_prepare_current_liabilities&from_page=update_stock_detail&obIndex=<%=counter%>'>Edit</option> --%>
                      <option value='viewLiabilities'>View</option>
                      <option value='editLiabilities'>Edit</option>
                    </select>
          		</td>
          	 </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                }        
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="6">There is no value of creditors detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Value of Creditors 
				</td>
				<td colspan="5">
				<!-- <%=dft.format(totalLonableLiabilities) %> -->
				<%=UIUtil.formatWithCommaAndDecimal(totalLonableLiabilities.toString()) %>
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

<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
         <td colspan="2"><h3>Value of Debtors</h3></td>
    </tr>
    <tr>
    <td colspan="4">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
	<tr class="even">
	<td class="fieldname">
        Asset's Margin Type</td>
        <td colspan="2">
        <%if("FIXED".equals(assetsMarginTypeNew)) {%>
        	<input type="radio" name="assetsMarginTypeNew" value="FIXED" onclick="toggleAssetsFixedMarginValueNew(this)" checked="checked">Fixed</input>
			<input type="radio" name="assetsMarginTypeNew" value="VARIABLE" onclick="toggleAssetsFixedMarginValueNew(this)">Variable</input>
			<input type="text" name="assetsFixedMarginValueNew"  value="<%=assetsFixedMarginValueNew%>"  maxlength="6" onblur="setFIxedZeroDebtors(this)" />
		<%}else{ %>
			<input type="radio" name="assetsMarginTypeNew" value="FIXED" onclick="toggleAssetsFixedMarginValueNew(this)">Fixed</input>
			<input type="radio" name="assetsMarginTypeNew" value="VARIABLE" onclick="toggleAssetsFixedMarginValueNew(this)" checked="checked">Variable</input>
			<input type="text" name="assetsFixedMarginValueNew"  disabled="disabled" maxlength="6" onblur="setFIxedZeroDebtors(this)"/>
		<%} %>
		&nbsp;<html:errors property="marginErrorAssetNew"/>
        </td>
        <td align="right" >
			<input class="btnNormal" type="button" name="currentAssetSubmit1New" value="Add New" onclick="javascript:submitPage(5, -1)"/>
        </td>
    </tr>
    </tbody></table></td>
    <tr>
        <td colspan="4"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
     <td colspan="4">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
          	<tr>
          		<td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="20%">Component</td>
          		<td width="20%" align="center">Amount</td>
          		<td width="20%">Margin</td>
          		<td width="20%">Application for DP</td>
          		<td width="20%">Loanable</td>
          		<td width="15%">Action</td>
          	</tr>
          </thead> 
            <tbody>
             <%
             BigDecimal totalLonableAssetsNew= new BigDecimal("0");
             if(stockDetailsList!=null && stockDetailsList.size()>0){
            	 IGeneralChargeStockDetails chargeStockDetailsNew=null; 
                  classtype = "odd";
                 int index=0;
                 for (int counter = 0; counter < stockDetailsList.size(); counter++) {
                	 
                	 chargeStockDetailsNew=(IGeneralChargeStockDetails)stockDetailsList.get(counter);
                    if (chargeStockDetailsNew != null && "ValueDebtors".equals(chargeStockDetailsNew.getStockType())){
                    	index++;
                %>
              <tr class="<%=classtype%>">
	        	 <td class="index"><%=index%></td>
          		<td>
					          		<integro:common-code-single categoryCode="CURRENT_ASSET" entryCode="<%=chargeStockDetailsNew.getComponent()%>" display="true" descWithCode="false"  />    		
          		</td>
          		<td align="left"><%=UIUtil.formatWithCommaAndDecimal(chargeStockDetailsNew.getComponentAmount())%></td>
          		<td>
					<%=chargeStockDetailsNew.getMargin() %>          		
          		</td>
          		<%if(null!=chargeStockDetailsNew.getApplicableForDp()) {%>
						<td><%=chargeStockDetailsNew.getApplicableForDp()%></td>
				<%}else {%>	          		
          			<td>-</td>
          		<%} %>	
          		<td>
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetailsNew.getLonable()) %>
					<% if("YES".equals(chargeStockDetailsNew.getApplicableForDp()))
					totalLonableAssetsNew=totalLonableAssetsNew.add(new BigDecimal(chargeStockDetailsNew.getLonable()));
					%>
          		</td>
		          <td>
					<select name="menu1" onchange="MM_jumpMenu('self',this,0,<%=counter%>)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <%-- <option value='AssetGenChargeStockDetails.do?event=view_current_asset&obIndex=<%=counter%>'>View</option>
                      <option value='AssetGenChargeStockDetails.do?event=edit_prepare_current_asset&from_page=update_stock_detail&obIndex=<%=counter%>'>Edit</option> --%>
                      <option value='viewValueDebtors'>View</option>
                      <option value='editValueDebtors'>Edit</option>
                    </select>
          		</td>
          	 </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                }        
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="6">There is no value of Debitors detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Value of Debitors  
				</td>
				<td colspan="5">
				<%=UIUtil.formatWithCommaAndDecimal(totalLonableAssetsNew.toString()) %>
				</td>
			</tr>
            </tbody>
        </table>
    </td>
</tr>

</tbody>
<tr>
    <td colspan="4">&nbsp;</td>
</tr>
</table>
<br>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="4"><h3>Less: Value of Advances</h3></td>
    </tr>
    <tr>
    <td colspan="4">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    <tr class="even">
	<td class="fieldname">
        Liabilities's Margin Type</td>
        <td colspan="2">
       
		  <%if(!"Y".equals(migrationFlag.trim())) {%>
         
         <%if("FIXED".equals(liabilityMarginTypeAdv)) {%>
        	<input type="radio" name="liabilityMarginTypeAdv" disabled="disabled" value="FIXED" onclick="toggleLiabilityFixedMarginValueAdv(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginTypeAdv"  disabled="disabled" value="VARIABLE" onclick="toggleLiabilityFixedMarginValueAdv(this)">Variable</input>
			<input type="text" name="liabilityFixedMarginValueAdv"  disabled="disabled"  value="0"  maxlength="6"/>
			
		<%}else{ %>
			<input type="radio" name="liabilityMarginTypeAdv" disabled="disabled" value="FIXED" onclick="toggleLiabilityFixedMarginValueAdv(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginTypeAdv" disabled="disabled" value="VARIABLE" onclick="toggleLiabilityFixedMarginValueAdv(this)">Variable</input>
			<input type="text" name="liabilityFixedMarginValueAdv"  disabled="disabled"  value="0" maxlength="6"/>
		<%} %> 
		
		<%} else{ %>
		
		  <%if("FIXED".equals(liabilityMarginTypeAdv)) {%>
        	<input type="radio" name="liabilityMarginTypeAdv" value="FIXED" onclick="toggleLiabilityFixedMarginValueAdvOld(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginTypeAdv" value="VARIABLE" onclick="toggleLiabilityFixedMarginValueAdvOld(this)">Variable</input>
			<input type="text" name="liabilityFixedMarginValueAdv"  value="<%=liabilityFixedMarginValueAdv%>"  maxlength="6"  onblur="setFIxedZeroAdvances(this)"/>
		<%}else{ %>
			<input type="radio" name="liabilityMarginTypeAdv" value="FIXED" onclick="toggleLiabilityFixedMarginValueAdvOld(this)">Fixed</input>
			<input type="radio" name="liabilityMarginTypeAdv" value="VARIABLE" onclick="toggleLiabilityFixedMarginValueAdvOld(this)" checked="checked">Variable</input>
			<input type="text" name="liabilityFixedMarginValueAdv"  disabled="disabled" maxlength="6"  onblur="setFIxedZeroAdvances(this)"/>
		<%} %>
		<%} %>
		
		
		&nbsp;<html:errors property="marginErrorLiabilityAdv"/>
        </td>
        <td align="right" >
				<input class="btnNormal" type="button" name="currentLiabilitySubmit1" value="Add New" onclick="javascript:submitPage(6, -1)"/>
        </td>
    </tr></tbody></table></td></tr>
    <tr>
        <td colspan="4"><hr/></td>
    </tr>
</thead>

<tbody>
<tr>
     <td colspan="4">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
          	<tr>
          		<td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="20%">Component</td>
          		<td width="20%">Amount</td>
          		<td width="20%">Margin</td>
          		<td width="20%">Application for DP</td>
          		<td width="20%">Loanable</td>
          		<td width="15%">Action</td>
          	</tr>
          </thead> 
	        <tbody>
<%
BigDecimal totalLonableLiabilitiesNew= new BigDecimal("0");
             if(stockDetailsList!=null && stockDetailsList.size()>0){
            	 IGeneralChargeStockDetails chargeStockDetails=null; 
                  classtype = "odd";
                 int index1=0;
                 
                 for (int counter = 0; counter < stockDetailsList.size(); counter++) {
                   	chargeStockDetails=(IGeneralChargeStockDetails)stockDetailsList.get(counter);
                    if (chargeStockDetails != null && "LessAdvances".equals(chargeStockDetails.getStockType())){
                    	index1++;
                %>
              <tr class="<%=classtype%>">
	        	 <td class="index"><%=index1%></td>
          		<td>
          		<integro:common-code-single categoryCode="CURRENT_LIABILITIES" entryCode="<%=chargeStockDetails.getComponent()%>" display="true" descWithCode="false"  />
          		</td>
          		<td align="right">
          			<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getComponentAmount())%>
          		</td>
          		<td>
					<%=chargeStockDetails.getMargin() %>          		
          		</td>
          		<%if(null!=chargeStockDetails.getApplicableForDp()) {%>
						<td><%=chargeStockDetails.getApplicableForDp()%></td>
				<%}else {%>	          		
          			<td>-</td>
          		<%} %>
          		<td>
					<!--  <%=dft.format(new Double(chargeStockDetails.getLonable())) %>-->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<%if("YES".equals(chargeStockDetails.getApplicableForDp())) {
						totalLonableLiabilitiesNew=totalLonableLiabilitiesNew.add(new BigDecimal(chargeStockDetails.getLonable()));
					}
					%>          		
          		</td>
          		<td>
					<select name="menu1" onchange="MM_jumpMenu('self',this,0,<%=counter%>)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <option value='viewLessValueAdvances'>View</option>
                      <option value='editLessValueAdvances'>Edit</option>
                    </select>
          		</td>
          	 </tr>
                <% if (classtype.equals("odd")) {
                    classtype = "even";
                } else {
                    classtype = "odd";
                }
                }
                }        
                } else { %>
                <tr class="<%=classtype%>">
                    <td colspan="6">There is no value of Advances detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Value of Advances  
				</td>
				<td colspan="5">
				<!-- <%=dft.format(totalLonableLiabilitiesNew) %> -->
				<%=UIUtil.formatWithCommaAndDecimal(totalLonableLiabilitiesNew.toString()) %>
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
<br>
<!-- Calculation showCalculatePopup() -->
</br>
 <%
if(null != migrationFlag &&  !"Y".equalsIgnoreCase(migrationFlag.trim()) ){	 
	 %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        
        <td width="100" valign="baseline" align="center">               
              <input class="btnNormal" type="button" name="currentAssetSubmit1" value="Calculate DP" onclick="javascript:showCalculatePopup()"/>
         </td>
                
    </tr>
  
	<tr><td height="70">&nbsp;</td></tr>
</table>
 <% }	 %>
<br>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    <tr class="even">
				<td class="fieldname"  width="30%">
					Total Loanable 
				</td>
				<td colspan="5">
				<%-- <!-- <%=dft.format(totalLonableAssets.subtract(totalLonableLiabilities))%> -->
				<%=UIUtil.formatWithCommaAndDecimal((totalLonableAssets.subtract(totalLonableLiabilities)).toString())%> --%>
				<input type="text" name="totalLonable" id="totalLonable" disabled="disabled"  value="<%=totalLonableAmt%>">
				<input type="hidden" id="totalLonable1"  name="totalLonable"  value="<%=totalLonableAmt%>">

				</td>
	</tr>
	</tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
		<tr>
			<td><h3>Security Coverage</h3></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><hr /></td>
		</tr>
		<tr>
			<td>
				<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td width="20%" class="fieldname">Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<input type="text" name="coverageAmount" value="<%=colForm.getCoverageAmount()%>"  disabled="disabled"
									onblur="formatAmountAsCommaSeparated(this)" />
								<html:hidden name="AssetGenChargeStockDetailsForm" property="coverageAmount" />
								<html:errors property="coverageAmountError" />
							</td>
							<td width="20%" class="fieldname">Ad Hoc Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<input type="text" id="adHocCoverageAmount" name="adHocCoverageAmount" value="<%=colForm.getAdHocCoverageAmount() %>" 
									onblur="formatAmountAsCommaSeparated(this)" onchange="javascript:refreshCoveragePercentage();"/>
								<html:hidden name="AssetGenChargeStockDetailsForm" property="adHocCoverageAmount" />
								<html:errors property="adHocCoverageAmountError" />
							</td>
						</tr>
						<tr>	
							<%-- <td width="20%" class="fieldname">Insurance Coverage %</td>
							<td width="30%" class="even">
								<input type="text" id="coveragePercentage" name="coveragePercentage" value="<%=colForm.getCoveragePercentage() %>" disabled="disabled"
									onblur="formatAmountAsCommaSeparated(this)"/>
								<html:hidden name="AssetGenChargeStockDetailsForm" property="coveragePercentage" />
								<html:errors property="coveragePercentageError" />
							</td> --%>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>



<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(4,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
	<tr><td height="70">&nbsp;</td></tr>
</table>
<br>

</html:form>
</body>
</html>
