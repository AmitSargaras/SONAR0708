<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.geography.city.proxy.ICityProxyManager"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsForm,
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
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"/>
<jsp:directive.page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"/>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>
<%  ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	String parentPageFrom=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.parentPageFrom");
	String insEditable=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insEditable");
	String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate");
	if(dueDate==null){
		dueDate="";
	}
	String remarkByMaker=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.remarkByMaker");
	if(null ==remarkByMaker){
		remarkByMaker="";
	}
	
	String migrationFlag=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
	if(null == migrationFlag){
		migrationFlag = "";	
	}
	System.out.println("***migrationFlag==========********* "+migrationFlag);
	
	 String totalLonableAmt=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
	if(null ==totalLonableAmt){
		totalLonableAmt="0";
	} 
	pageContext.setAttribute("totalLonable", totalLonableAmt);
	
	AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
	 AssetGenChargeStockDetailsForm colForm1 = (AssetGenChargeStockDetailsForm) request.getAttribute("AssetGenChargeStockDetailsForm");
	
	 /*
	 String  totalLonableAmt_session = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLoanable");
	System.out.println("***totalLonableAmt_session@@@@@@@@@@@@==========********* "+totalLonableAmt_session+"*****colForm.getTotalLoanable()=>"+colForm1.getTotalLoanable());
	 
     if(null == totalLonableAmt_session || "".equals(totalLonableAmt_session) ){
     totalLonableAmt = StringUtils.isBlank(colForm1.getTotalLoanable()) ? "0" : colForm1.getTotalLoanable();
    }else{
    		totalLonableAmt= totalLonableAmt_session;
    }
	 */ 
	String dpCalculateManually=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
	if(null ==dpCalculateManually){
		dpCalculateManually="";
	}
	
	
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
	System.out.println("************ from is "+from);
	 IGeneralCharge iCol = (IGeneralCharge) itrxValue.getCollateral();
  if(from==null){
		 iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
  } 
	String assetsFixedMarginValue= (String)request.getAttribute("assetsFixedMarginValue");
	String assetsMarginType= (String)request.getAttribute("assetsMarginType");
	
	String assetsFixedMarginValueNew= (String)request.getAttribute("assetsFixedMarginValueNew");
	String assetsMarginTypeNew= (String)request.getAttribute("assetsMarginTypeNew");
	
	String liabilityFixedMarginValueAdv= (String)request.getAttribute("liabilityFixedMarginValueAdv");
	String liabilityMarginTypeAdv= (String)request.getAttribute("liabilityMarginTypeAdv");

	
	String trxID= (String)request.getAttribute("trxID");
	String assetId = (String) request.getAttribute("assetId");
	String liabilityFixedMarginValue= (String)request.getAttribute("liabilityFixedMarginValue");
	String liabilityMarginType= (String)request.getAttribute("liabilityMarginType");
	DecimalFormat dft = new DecimalFormat("#0.00");
    
    List stockDetailsList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceStockDetailsList");
    IGeneralChargeDetails chargeDetaills=null;
   // if(iCol.getGeneralChargeDetails()!=null){
    //	chargeDetaills=(IGeneralChargeDetails)iCol.getGeneralChargeDetails()[0];
	//}  
   
   IGeneralChargeStockDetails[] existingGeneralChargeStockDetails;
     IGeneralChargeDetails[] existingGeneralChargeDetails = iCol.getGeneralChargeDetails();
 	IGeneralChargeDetails existingChargeDetails;
     if(existingGeneralChargeDetails!=null){
 		for (int i = 0; i < existingGeneralChargeDetails.length; i++) {
 			 existingChargeDetails = existingGeneralChargeDetails[i];
// 			if(existingChargeDetails!=null && existingChargeDetails.getDueDate().equals(dueDate)){
 			if(existingChargeDetails!=null && StringUtils.isNotBlank(existingChargeDetails.getDocCode()) && existingChargeDetails.getDocCode().equals(dueDate.split(",")[1])){
 			System.out.println("************ "+existingChargeDetails.getDueDate()+" "+existingChargeDetails.getDocCode());
 				chargeDetaills = existingChargeDetails;
 				System.out.println("************ "+existingChargeDetails.getLastUpdatedBy());
 				if(migrationFlag.isEmpty()){
 					migrationFlag = existingChargeDetails.getMigrationFlag_DP_CR();
 					System.out.println("***migrationFlag==========********* "+migrationFlag);
 					if(null == migrationFlag){
 						migrationFlag = "";	
 					}
 				}
 				
 				break;
 			}
 		}
 	}   
   
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

    
	List  locationList = (List) request.getAttribute("locationList");
	pageContext.setAttribute("locationList", locationList);
	
  //  String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.fundedShare");
  
    String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpShare");
    String calculatedDP=  (String)  session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.calculatedDP");
    System.out.println("<<<<calculatedDP on view page>>>"+calculatedDP);
	
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

	//String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from");
	String prev_event = (String)request.getParameter("event");
	
    //todo - end
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="java.text.SimpleDateFormat"%>
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

<!--
function MM_jumpMenu(targ,selObj,restore,index){ //v3.0
	var opValue=selObj.options[selObj.selectedIndex].value;
	if(opValue=='viewAsset'){
		 document.forms[0].event.value="view_current_asset";
	}else if(opValue=='editAssetInsurance'){
		 document.forms[0].event.value="edit_prepare_current_asset_ins";
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
	 document.forms[0].obIndex.value=index;
	 document.forms[0].submit();
}
	
function toggleAssetsFixedMarginValue(obj){
    if(obj.value=='FIXED'){
    	document.forms[0].assetsFixedMarginValue.disabled=false;
    }else{
    	document.forms[0].assetsFixedMarginValue.disabled=true;
    }
}
function toggleLiabilityFixedMarginValue(obj){
    if(obj.value=='FIXED'){
    	document.forms[0].liabilityFixedMarginValue.disabled=false;
    }else{
    	document.forms[0].liabilityFixedMarginValue.disabled=true;
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

	if("3" == num && "" ==  document.forms[0].totalLonable.value){

		alert("Please Click on Calculate Button for Total Loanable Amount")
	}else{
	
    enableAllFormElements();
 	
    if (num == 1) {
    document.forms[0].action='AssetGenChargeCollateral.do';
    document.forms[0].event.value="prepare";
    document.forms[0].indexID.value="-1";
    document.forms[0].itemType.value = "CURRENTASSET";
    }
	if (num == 2) {
	document.forms[0].action='AssetGenChargeCollateral.do';
    document.forms[0].event.value="prepare";
    document.forms[0].indexID.value="-1";
    document.forms[0].itemType.value = "CURRENTLIABILITIES";
    }
	if (num == 3) {
    document.forms[0].event.value="edit_stock_details_ins";
    }
	if (num == 4) {
    document.forms[0].event.value="cancle_stock_detail";
    }
	if (num == 5) {
	document.forms[0].event.value="cancle_stock_detail_close";
	}
	if (num == 6) {
		document.forms[0].event.value="cancle_stock_detail_check";
		}
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

//-->
</script>
</head>

<body>

<html:form action="AssetGenChargeStockDetails.do">
<input type="hidden" name="event" value="<%=AssetGenChargeAction.EVENT_EDIT%>">
<input type="hidden" name="indexID"/>
<!-- <input type="hidden" name="fundedShare" value="<%=fundedShare %>"/>  -->
<input type="hidden" name="dpShare" value="<%=fundedShare %>"/>
<input type="hidden" name="remarkByMaker" value="<%=remarkByMaker %>"/>
<input type="hidden" name="totalLonable" value="<%=totalLonableAmt %>"/>
<input type="hidden" name="calculatedDP" value="<%=calculatedDP%>"/>

<input type="hidden" name="dpCalculateManually" value="<%=dpCalculateManually%>"/>
<input type="hidden" name="trxID" value="<%=trxID%>"/>
<input type="hidden" name="obIndex"/>
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="userAccess" value="true"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page" value="view_stock_detail"/>
<input type="hidden" name="assetId" value="<%=assetId%>"/>
<html:hidden property="dueDateStatus"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
        	View Stock Details 
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
	<td class="fieldname" width="25%">Location</td>
	<td width="25%">
	<html:select name="AssetGenChargeStockDetailsForm" property="stockLocation" disabled="true">
		<option value="">Please Select </option>	
		<html:options collection="locationList" property="value" labelProperty="label"/>
	</html:select>
	<html:hidden property="stockLocation"/>
	</td>
	<td class="fieldname" width="25%">
		Location Description
	</td>
	<td width="25%">
	<bean:write name="AssetGenChargeStockDetailsForm" property="stockLocationDetail" />
	<html:hidden  property="stockLocationDetail"/>
	</td>
</tr>
</tbody>
</table>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="2"><h3>Value Of Stock  </h3></td>
        <!-- <td width="50%" align="right" colspan="2">
			<input class="btnNormal" type="button" name="currentAssetSubmit1" value="Add New" onclick="javascript:submitPage(1, -1)"/>
        </td> -->
    </tr>
    <%-- <tr>
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
			<input type="text" name="assetsFixedMarginValue"  value="<%=assetsFixedMarginValue%>" />
		<%}else{ %>
			<input type="radio" name="assetsMarginType" value="FIXED" onclick="toggleAssetsFixedMarginValue(this)">Fixed</input>
			<input type="radio" name="assetsMarginType" value="VARIABLE" onclick="toggleAssetsFixedMarginValue(this)" checked="checked">Variable</input>
			<input type="text" name="assetsFixedMarginValue"  disabled="disabled"/>
		<%} %>
        </td>
        <td align="right" >
			<input class="btnNormal" type="button" name="currentAssetSubmit1" value="Add New" onclick="javascript:submitPage(1, -1)"/>
        </td>
    </tr>
    </tbody></table></td> 
    </tr>--%>
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
             boolean insEdit=false;
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
				<%}else { %>	          		
          				<td>-</td> 
          		<%} %>	 
          		<!-- End Santosh -->
          		<td>
					<!-- <%=dft.format(new Double(chargeStockDetails.getLonable())) %> -->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<% if("YES".equals(chargeStockDetails.getApplicableForDp()))
						totalLonableAssets=totalLonableAssets.add(new BigDecimal(chargeStockDetails.getLonable()));
					%>
          		</td>
          		<td>
          		 <%if(prev_event!=null && "view_stock_details_close".equals(prev_event) ||  ("cancel_current_asset_liabilities_close".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_current_asset_close&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
					<%}else if(prev_event!=null && "view_stock_details_check".equals(prev_event) ||  ("cancel_current_asset_liabilities_check".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_current_asset_check&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
					<%}else{ %>
					 <a href='AssetGenChargeStockDetails.do?event=view_current_asset&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				
					<%} %>
					<%--<select name="menu1" onchange="MM_jumpMenu('self',this,0,<%=counter%>)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <option value='viewAsset'>View</option>
                      <%if("ASSET_UPDATE".equals(parentPageFrom)&& 
                    		  ((!"REJECTED".equals(itrxValue.getStatus()) && ICMSConstant.LONG_INVALID_VALUE!=chargeStockDetails.getGeneralChargeStockDetailsID())
                    		  ||("REJECTED".equals(itrxValue.getStatus())&& "Y".equals(insEditable))
                    		  )){ 
                    	  insEdit=true;
                      %>
                      	<!--<option value='editAssetInsurance'>Edit Insurance</option>
                      --><%}%>
                    </select>--%>
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
                    <td colspan="6">There is no vlue of Stock detail.</td>
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
    <%-- <tr>
    <td colspan="4">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    <tr class="even">
	<td class="fieldname">
        Liabilities's Margin Type</td>
        <td colspan="2">
        <%if("FIXED".equals(liabilityMarginType)) {%>
        	<input type="radio" name="liabilityMarginType" value="FIXED" onclick="toggleLiabilityFixedMarginValue(this)" checked="checked">Fixed</input>
			<input type="radio" name="liabilityMarginType" value="VARIABLE" onclick="toggleLiabilityFixedMarginValue(this)">Variable</input>
			<input type="text" name="liabilityFixedMarginValue"  value="<%=liabilityFixedMarginValue%>" />
		<%}else{ %>
			<input type="radio" name="liabilityMarginType" value="FIXED" onclick="toggleLiabilityFixedMarginValue(this)">Fixed</input>
			<input type="radio" name="liabilityMarginType" value="VARIABLE" onclick="toggleLiabilityFixedMarginValue(this)" checked="checked">Variable</input>
			<input type="text" name="liabilityFixedMarginValue"  disabled="disabled"/>
		<%} %>
        </td>
        <td align="right" >
				<input class="btnNormal" type="button" name="currentLiabilitySubmit1" value="Add New" onclick="javascript:submitPage(2, -1)"/>
        </td>
    </tr></tbody></table></td></tr> --%>
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
				<%}else { %>	          		
          				<td>-</td> 
          		<%} %>	 
          		<!-- End Santosh -->
          		<td>
					<!-- <%=dft.format(new Double(chargeStockDetails.getLonable())) %> -->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<%
					if("YES".equals(chargeStockDetails.getApplicableForDp()))
					totalLonableLiabilities=totalLonableLiabilities.add(new BigDecimal(chargeStockDetails.getLonable()));
					%>          		
          		</td>
          		<td>
          		<%if(prev_event!=null && ("view_stock_details_close".equals(prev_event)) ||  ("cancel_current_asset_liabilities_close".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_current_liabilities_close&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				<%}else if(prev_event!=null && ("view_stock_details_check".equals(prev_event)) ||  ("cancel_current_asset_liabilities_check".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_current_liabilities_check&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				<%}else{ %>
				 <a href='AssetGenChargeStockDetails.do?event=view_current_liabilities&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				
				<%} %>
					<%--<select name="menu1" onchange="MM_jumpMenu('self',this,0,<%=counter%>)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <option value='viewLiabilities'>View</option>
                    </select>--%>
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
                    <td colspan="6">There is no value of Creditors detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Value of Creditors 
				</td>
				<td colspan="5">
				<!-- <%=dft.format(totalLonableLiabilities) %>  -->
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
        <td colspan="2"><h3>Value of Debtors </h3></td>
    </tr>
    
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
             BigDecimal totalLonableAssetsNew= new BigDecimal("0");
             boolean insEditNew=false;
             if(stockDetailsList!=null && stockDetailsList.size()>0){
            	 IGeneralChargeStockDetails chargeStockDetails=null; 
                  classtype = "odd";
                 int index=0;
                 for (int counter = 0; counter < stockDetailsList.size(); counter++) {
                	 
                   	chargeStockDetails=(IGeneralChargeStockDetails)stockDetailsList.get(counter);
                    if (chargeStockDetails != null && "ValueDebtors".equals(chargeStockDetails.getStockType())){
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
          		<%if(null!=chargeStockDetails.getApplicableForDp()) {%>
						<td><%=chargeStockDetails.getApplicableForDp()%></td>
				<%}else { %>	          		
          				<td>-</td> 
          		<%} %>	 
          		<td>
					<!-- <%=dft.format(new Double(chargeStockDetails.getLonable())) %> -->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<% if("YES".equals(chargeStockDetails.getApplicableForDp()))
						totalLonableAssetsNew=totalLonableAssetsNew.add(new BigDecimal(chargeStockDetails.getLonable()));
					%>
          		</td>
          		<td>
          		 <%if(prev_event!=null && "view_stock_details_close".equals(prev_event) ||  ("cancel_current_asset_liabilities_close".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_value_debtors_close&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
					<%}else if(prev_event!=null && "view_stock_details_check".equals(prev_event) ||  ("cancel_current_asset_liabilities_check".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_value_debtors_check&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
					<%}else{ %>
					 <a href='AssetGenChargeStockDetails.do?event=view_value_debtors&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				
					<%} %>
					
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
				<!-- <%=dft.format(totalLonableAssetsNew) %> -->
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
				<%}else { %>	          		
          				<td>-</td> 
          		<%} %>	 
          		<td>
					<!-- <%=dft.format(new Double(chargeStockDetails.getLonable())) %> -->
					<%=UIUtil.formatWithCommaAndDecimal(chargeStockDetails.getLonable()) %>
					<%
					if("YES".equals(chargeStockDetails.getApplicableForDp()))
						totalLonableLiabilitiesNew=totalLonableLiabilitiesNew.add(new BigDecimal(chargeStockDetails.getLonable()));
					%>          		
          		</td>
          		<td>
          		<%if(prev_event!=null && ("view_stock_details_close".equals(prev_event)) ||  ("cancel_current_asset_liabilities_close".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_less_value_advances_close&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				<%}else if(prev_event!=null && ("view_stock_details_check".equals(prev_event)) ||  ("cancel_current_asset_liabilities_check".equals(prev_event))){ %>
          		 <a href='AssetGenChargeStockDetails.do?event=view_less_value_advances_check&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				<%}else{ %>
				 <a href='AssetGenChargeStockDetails.do?event=view_less_value_advances&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>&calculatedDP=<%=calculatedDP%>'>View</a> 
				
				<%} %>
					
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
				<!-- <%=dft.format(totalLonableLiabilitiesNew) %>  -->
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
<%--  <% if ( (!roleType.equals("1007")) && (!roleType.equals("1002")) && (!"Y".equals(migrationFlag)) ) {   %> --%>
   <% 
   
   System.out.println("********AssetGenChargeStockDetails_view.jsp=>migrationFlag=>"+migrationFlag+"***");
   if(null != migrationFlag &&  !"Y".equalsIgnoreCase(migrationFlag.trim()) ){  %>
   
</br>
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
<br>
 <% }%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    <tr class="even">
				<td class="fieldname"  width="30%">
					Total Loanable 
				</td>
				<td colspan="5">
				<%-- <!--  <%=dft.format(totalLonableAssets.subtract(totalLonableLiabilities))%> -->
					<%=UIUtil.formatWithCommaAndDecimal(totalLonableAssets.subtract(totalLonableLiabilities).toString()) %> --%>
				<input type="text" id="totalLonable" disabled="disabled" value="<%= totalLonableAmt%>">
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
									<bean:write name="AssetGenChargeStockDetailsForm" property="coverageAmount" />
	                                <html:hidden  property="coverageAmount"/>
							</td>
							<td width="20%" class="fieldname">Ad Hoc Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
									<bean:write name="AssetGenChargeStockDetailsForm" property="adHocCoverageAmount" />
	                                <html:hidden  property="adHocCoverageAmount"/>
							</td>
						</tr>
						
						<tr>
							<%-- <td width="20%" class="fieldname">Insurance Coverage %</td>
							<td width="30%" class="even">
									<bean:write name="AssetGenChargeStockDetailsForm" property="coveragePercentage" />
	                                <html:hidden  property="coveragePercentage"/>
							</td> --%>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		
	
	</tbody>
</table> 

<br></br>
<table width="98%" border="0" align="center"  cellspacing="0" cellpadding="0"
								class="tblInfo">
								<tbody>
													<tr class="odd">													
																																				
										<td class="fieldname" width="20%">Last Edited By</td>
										
										
										<td width="30%">	
										<%if(chargeDetaills!=null){ %>
							<integro:empty-if-null value="<%=chargeDetaills.getLastUpdatedBy()%>"/>
							<%}else{ %>
							-
							<%} %>
											</td>
											
										
                                       
										<td class="fieldname" width="20%">Last Approved By</td>
									
										<td width="30%">
										<%if(chargeDetaills!=null){ %>
										<integro:empty-if-null value="<%=chargeDetaills.getLastApprovedBy()%>"/>
										<%}else{ %>
							-
							<%} %>
											</td>
									</tr>
									<tr class="even">
									
												
										<td class="fieldname" width="20%">Last Edited On</td>
										
										
										<td width="30%">
										<%
										SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										
										
										
										if(chargeDetaills!=null && chargeDetaills.getLastUpdatedOn()!=null){ %>
										<%=sdf2.format(chargeDetaills.getLastUpdatedOn()) %>
										<%}else{ %>-
										<%} %>
											</td>
											
										<td class="fieldname" width="20%">Last Approved On </td>
									
										<td width="30%">
											<%if(chargeDetaills!=null && chargeDetaills.getLastApprovedOn()!=null){ %>
										<%=sdf2.format(chargeDetaills.getLastApprovedOn()) %>
										<%}else{ %>-
										<%} %>
											</td>
									</tr>
								</tbody>
							</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <%if(insEdit) {%>
    <tr>
		<!--<td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/save2.gif',1)">
                <img src="img/save1.gif" name="Image142" border="0" id="Image142"/></a></td>
                
         --><td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(4,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
    </tr>
    <%}else{ %>
    <tr>

    <%if(prev_event!=null && "view_stock_details_close".equals(prev_event) ||  ("cancel_current_asset_liabilities_close".equals(prev_event))){ %>
         <td width="100" valign="baseline" align="center" colspan="2">
            <a href="javascript:submitPage(5,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
             <%}else if(prev_event!=null && "view_stock_details_check".equals(prev_event) ||  ("cancel_current_asset_liabilities_check".equals(prev_event))){ %>
         <td width="100" valign="baseline" align="center" colspan="2">
            <a href="javascript:submitPage(6,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
            
            
            <%}else{ %>   
            <td width="100" valign="baseline" align="center" colspan="2">
            <a href="javascript:submitPage(4,-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
            <%} %> 
                
    </tr>
    
        <%} %>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
	<tr><td height="70">&nbsp;</td></tr>
</table>
	<input type="hidden" name="migrationFlag" id="migrationFlag" value=<%= migrationFlag %> >

<br>

</html:form>
</body>
</html>
	