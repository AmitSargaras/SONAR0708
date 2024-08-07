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


<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String trxID = (String)request.getAttribute("trxID");
String event = (String)request.getParameter("event");
String parentPageFrom = "ASSET_READ";
String calculatedDP=  (String) request.getAttribute("calculatedDP");

if(calculatedDP==null){
	calculatedDP = "0";
}
AssetGenChargeStockDetailsHelperForm helperForm =null; 
//String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.fundedShare");

String  fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.dpShare");
List displayList = (ArrayList) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.displayList");
if(displayList!=null && displayList.size()>0){
  helperForm=(AssetGenChargeStockDetailsHelperForm)displayList.get(0);
}
IGeneralChargeStockDetails generalChargeStockDetails = (IGeneralChargeStockDetails) session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.generalChargeStockDetails");
//String returnPath="RecurrentDocReceipt.do?event=view_stock_details&locationId="+helperForm.getLocationID()+"&dueDate="+helperForm.getDueDate()+"&obIndex="+0+"&parentPageFrom="+parentPageFrom+"&fundedShare="+fundedShare+"&calculatedDP="+calculatedDP+"&trxID="+trxID;

String returnPath="RecurrentDocReceipt.do?event=view_stock_details&locationId="+helperForm.getLocationID()+"&dueDate="+helperForm.getDueDate()+"&obIndex="+0+"&parentPageFrom="+parentPageFrom+"&dpShare="+fundedShare+"&calculatedDP="+calculatedDP+"&trxID="+trxID;
%>

<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm"%><html>
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
  function submitPage(num) {
            //enableAllFormElements();
            if (num == 3) {
                document.forms[0].event.value="cancel_current_asset_liabilities";
               
            }
            if (num == 4) {
                document.forms[0].event.value="cancel_current_asset_liabilities_close";
               
            }
            if (num == 5) {
                document.forms[0].event.value="cancel_current_asset_liabilities_check";
               
            }
            document.forms[0].submit();
  }
function cancelPage(){
	
    document.forms[0].action="<%=returnPath%>";
    
    document.forms[0].submit();
}
//-->
</script>
</head>

<body>

<html:form action="AssetGenChargeStockDetails.do">
<input type="hidden" name="event">
<html:hidden property="stockLocation" />
<html:hidden property="stockLocationDetail"/>
<html:hidden property="dueDateStatus"/>
<html:hidden property="components" />
<html:hidden property="amount"/>
<html:hidden property="marginType"/>
<html:hidden property="margin" />
<html:hidden property="lonable"/>
<!-- <html:hidden property="fundedShare" /> -->

<html:hidden property="dpShare" />
<html:hidden property="calculatedDP"/>
<html:hidden property="trxID" value="<%=trxID%>"/>
<html:hidden property="hasInsurance" />
<html:hidden property="insuranceCompanyName" />
<html:hidden property="insuranceCompanyCategory" />
<html:hidden property="insuredAmount" />
<html:hidden property="insuranceDescription" />
<html:hidden property="effectiveDateOfInsurance"/>
<html:hidden property="expiryDate"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
        	View Current Asset Details   
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>
<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr class="even">
	<td class="fieldname" width="25%">
		Component
	</td>
	<td width="25%">
	<integro:common-code-single  entryCode="<%=generalChargeStockDetails.getComponent() %>" categoryCode="CURRENT_ASSET" display="true" descWithCode="false" />
	&nbsp;
	</td>
	<td class="fieldname" width="25%">
		Amount
	</td>
	<td width="25%">
	<%=generalChargeStockDetails.getComponentAmount() %>&nbsp;
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">Margin Type</td>
	<td>
	<%=generalChargeStockDetails.getMarginType() %>&nbsp;
	</td>
	<td class="fieldname">
		Margin
	</td>
	<td>
		<%=generalChargeStockDetails.getMargin() %>&nbsp;
	</td>
</tr>
<tr class="even">
	<td class="fieldname">Loanable</td>
	<td colspan="3">
		<%=generalChargeStockDetails.getLonable() %>&nbsp;
	</td>
</tr>
<!--<tr class="odd">
	<td class="fieldname">Has Insurance</td>
	<td colspan="3">
	<html:checkbox name="AssetGenChargeStockDetailsForm" property="hasInsurance"  disabled="true"/>&nbsp;
	</td>
</tr>
--><%-- <tr class="even">
	<td class="fieldname">
		Insurance Company Name
	</td>
	<td>
	<html:select name="AssetGenChargeStockDetailsForm" property="insuranceCompanyName" disabled="true">	
		<option value="">Please Select </option>	
		<html:options collection="insuranceCompanyList" property="value" labelProperty="label" />
	</html:select>&nbsp;<html:errors property="insuranceCompanyNameError"/>
	</td>
	<td class="fieldname">
		Insurance Company Category
	</td>
	<td>
	<html:select name="AssetGenChargeStockDetailsForm" property="insuranceCompanyCategory" disabled="true">	
		<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
	</html:select>&nbsp;
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Insured Amount
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="insuredAmount" />&nbsp;
	</td>
	<td class="fieldname">
		Effective Date Of Insurance
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="effectiveDateOfInsurance" />&nbsp;
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Insurance Description
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="insuranceDescription" />&nbsp;
	</td>
	<td class="fieldname">
		Expiry Date
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="expiryDate" />&nbsp;
	</td> --%>
	<!--<tr class="even">
		<td class="fieldname">
			Insurance Policy No
		</td>
		<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="insurancePolicyNo" />&nbsp;
		</td>
		<td class="fieldname">
			Cover Note Number
		</td>
		<td>
			<bean:write name="AssetGenChargeStockDetailsForm" property="insuranceCoverNote" />&nbsp;
		</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Insurance Company Name
	</td>
	<td>
	<html:select name="AssetGenChargeStockDetailsForm" property="insuranceCompanyName" disabled="true">	
		<option value="">Please Select </option>	
		<html:options collection="insuranceCompanyList" property="value" labelProperty="label"/>
	</html:select>&nbsp;<html:errors property="insuranceCompanyNameError"/>
	</td>
	<td class="fieldname">
		Insurance Policy Currency
	</td>
	<td>
		INR
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Insurance Coverage Type
	</td>
	<td colspan="3">
	<html:select name="AssetGenChargeStockDetailsForm" property="insuranceCompanyCategory" disabled="true">	
		<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
	</html:select>
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Total Policy Amount
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="totalPolicyAmount" />&nbsp;
	</td>
	<td class="fieldname">
		Insured Amount
	</td>
	<td>
	<bean:write name="AssetGenChargeStockDetailsForm" property="insuredAmount" />&nbsp;
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Received Date
	</td>
	<td colspan="3">
		<bean:write name="AssetGenChargeStockDetailsForm" property="insuranceRecivedDate" />&nbsp;
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Effective Date Of Insurance
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="effectiveDateOfInsurance" />&nbsp;
	</td>
	<td class="fieldname">
	  Insurance Expiry Date
	</td>
	<td>
	<bean:write name="AssetGenChargeStockDetailsForm" property="expiryDate" />&nbsp;
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Insurance Defaulted
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="insuranceDefaulted" />&nbsp;
    </td>
	<td class="fieldname">
	  Insurance Premium
	</td>
	<td>
		<bean:write name="AssetGenChargeStockDetailsForm" property="insurancePremium" />&nbsp;
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Remark
	</td>
	<td colspan="3">
		<bean:write name="AssetGenChargeStockDetailsForm" property="insuranceDescription" />&nbsp;
	</td>
</tr>
	
-->
</tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
    
    <%if(event!=null && event.equalsIgnoreCase("view_current_asset_close")){ %>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(4)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a>
         </td>
         <%}else if(event!=null && event.equalsIgnoreCase("view_current_asset_check")){ %>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(5)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a>
         </td>
       <%}else{ %>
          <td width="100" valign="baseline" align="center">
            <a href="javascript:cancelPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image4411" border="0" id="Image4411"/></a>
         </td>
         <%} %>
         
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
	<tr><td height="70">&nbsp;</td></tr>
</table>
<br>
<input type="hidden" name="from_page" value="<%=request.getParameter("from_page")%>"/>
</html:form>
</body>
</html>
