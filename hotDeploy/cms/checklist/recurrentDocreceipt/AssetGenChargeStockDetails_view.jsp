<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.geography.city.proxy.ICityProxyManager"%>
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
<%  ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.serviceColObj");
	String parentPageFrom=(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.parentPageFrom");
	String insEditable=(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.insEditable");
	String dueDate=(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dueDate");
	List filterLocationList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.filterLocationList");
    if(filterLocationList==null)
    	filterLocationList=new ArrayList();
    pageContext.setAttribute("filterLocationList",filterLocationList);
	if(dueDate==null){
		dueDate="";
	}
	System.out.println("$$$$$$$$$$$$$$dueDate$$$$$$$$$$$$$$$"+dueDate);
	    IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
	    IGeneralCharge iColActual = (IGeneralCharge) itrxValue.getCollateral();
	    DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		System.out.println("$$$$$$$$$$$$$$iColActual.getCollateralID()$$$$$$$$$$$$$$$"+iColActual.getCollateralID());
		String	viewPath =	"RecurrentDocReceipt.do?event=read&dueDate=" + dueDate + "&collateralID=" + iColActual.getCollateralID() + "&from=" + CollateralAction.READ_SECURITIES_2;
	String assetsFixedMarginValue= (String)request.getAttribute("assetsFixedMarginValue");
	String assetsMarginType= (String)request.getAttribute("assetsMarginType");
	String trxID= (String)request.getAttribute("trxID");
	String liabilityFixedMarginValue= (String)request.getAttribute("liabilityFixedMarginValue");
	String liabilityMarginType= (String)request.getAttribute("liabilityMarginType");

    
    List stockDetailsList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.serviceStockDetailsList");
    System.out.println("$$$$$$$$$$$$$$stockDetailsList$$$$$$$$$$$$$$$"+stockDetailsList.size());
    IGeneralChargeDetails chargeDetaills=null;
    // if(iCol.getGeneralChargeDetails()!=null){
    // 	chargeDetaills=(IGeneralChargeDetails)iCol.getGeneralChargeDetails()[0];
 	//}    
 	IGeneralChargeStockDetails[] existingGeneralChargeStockDetails;
     IGeneralChargeDetails[] existingGeneralChargeDetails = iCol.getGeneralChargeDetails();
 	IGeneralChargeDetails existingChargeDetails;
     if(existingGeneralChargeDetails!=null){
 		for (int i = 0; i < existingGeneralChargeDetails.length; i++) {
 			 existingChargeDetails = existingGeneralChargeDetails[i];
// 			if(existingChargeDetails!=null && existingChargeDetails.getDueDate().equals(dueDate)){
 			if(existingChargeDetails!=null && null != existingChargeDetails.getDocCode()  && existingChargeDetails.getDocCode().equals(dueDate.split(",")[1])){
 				chargeDetaills = existingChargeDetails;
 				break;
 			}
 		}
 	}   
    
    
    
    
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

    AssetGenChargeForm colForm = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
	List  locationList = (List) request.getAttribute("locationList");
	pageContext.setAttribute("locationList", locationList);
	
   // String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.fundedShare");
   
   String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dpShare");
    String calculatedDP=  (String) request.getAttribute("calculatedDP");
	
	
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

	String from = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.from");
	String prev_event = (String)request.getParameter("event");
    //todo - end
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>

<%@page import="java.text.SimpleDateFormat"%><html>
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
function cancelPage(){
	
    document.forms[0].action="<%=viewPath%>";
    
    document.forms[0].submit();
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
<!-- <input type="hidden" name="fundedShare" value="<%=fundedShare %>"/> -->

<input type="hidden" name="dpShare" value="<%=fundedShare %>"/>
<input type="hidden" name="calculatedDP" value="<%=calculatedDP%>"/>
<input type="hidden" name="trxID" value="<%=trxID%>"/>
<input type="hidden" name="obIndex"/>
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="userAccess" value="true"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page" value="view_stock_detail"/>
<html:hidden property="dueDateStatus"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
        	View Stock Details    <%=dueDate.split(",")[0] %>
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
	
      		<%
      		for(int i=0;i<filterLocationList.size();i++){
      		LabelValueBean bean=(LabelValueBean)filterLocationList.get(i);
      		%>
      		
      		<%=bean.getLabel() %>
      		<%} %>
    &nbsp;
    
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
        <td colspan="2"><h3>Current Asset   </h3></td>
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
          		<td align="left"><%=chargeStockDetails.getComponentAmount()%></td>
          		<td>  
					<%=chargeStockDetails.getMargin() %>          		
          		</td>
          		<td>
					<%=chargeStockDetails.getLonable() %>
					<% 
						totalLonableAssets=totalLonableAssets.add(new BigDecimal(chargeStockDetails.getLonable()));
					%>
          		</td>
          		<td>
          		
					 <a href='RecurrentDocReceipt.do?event=view_current_asset&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>'>View</a> 
				
				
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
                    <td colspan="6">There is no current asset detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Loanable Current Asset 
				</td>
				<td colspan="5">
				<%=totalLonableAssets %>
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
        <td colspan="4"><h3>Current Liabilities</h3></td>
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
          			<%=chargeStockDetails.getComponentAmount()%>
          		</td>
          		<td>
					<%=chargeStockDetails.getMargin() %>          		
          		</td>
          		<td>
					<%=chargeStockDetails.getLonable() %>
					<%
					totalLonableLiabilities=totalLonableLiabilities.add(new BigDecimal(chargeStockDetails.getLonable()));
					%>          		
          		</td>
          		<td>
          		
				 <a href='RecurrentDocReceipt.do?event=view_current_liabilities&from_page=view_stock_detail&obIndex=<%=counter%>&trxID=<%=trxID%>'>View</a> 
			
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
                    <td colspan="6">There is no current liabilities detail.</td>
                </tr>
                <% }%>
          	<tr class="even">
				<td class="fieldname"  width="30%">
					Total Loanable Current Liabilities 
				</td>
				<td colspan="5">
				<%=totalLonableLiabilities %>
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


<br></br>
<table width="98%" border="0" align="center"  cellspacing="0" cellpadding="0"
								class="tblInfo">
								<tbody>
													<tr class="odd">													
																																				
										<td class="fieldname" width="20%">Last Edited/Created By</td>
										
										
										<td width="30%">	
							<integro:empty-if-null value="<%=chargeDetaills.getLastUpdatedBy() %>"/>
											</td>
											
										
                                       
										<td class="fieldname" width="20%">Last Approved By</td>
									
										<td width="30%">
										<integro:empty-if-null value="<%=chargeDetaills.getLastApprovedBy() %>"/>
											</td>
									</tr>
									<tr class="even">
									
												
										<td class="fieldname" width="20%">Last Edited On</td>
										
										
										<td width="30%">
										<%
										
										SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										if(chargeDetaills.getLastUpdatedOn()!=null){ %>
										<%=sdf2.format(chargeDetaills.getLastUpdatedOn()) %>
										<%}else{ %>-
										<%} %>
									
											</td>
											
										<td class="fieldname" width="20%">Last Approved On </td>
									
										<td width="30%">
											<%if(chargeDetaills.getLastApprovedOn()!=null){ %>
										<%=sdf2.format(chargeDetaills.getLastApprovedOn()) %>
										<%}else{ %>-
										<%} %>
									
											</td>
									</tr>
								</tbody>
							</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    <tr class="even">
				<td class="fieldname"  width="30%">
					Total Loanable 
				</td>
				<td colspan="5">
				<%=totalLonableAssets.subtract(totalLonableLiabilities)%>
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
            <a href="javascript:cancelPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
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
<br>

</html:form>
</body>
</html>
	