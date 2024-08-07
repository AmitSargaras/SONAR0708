<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 java.util.*,
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

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

String assetsFixedMarginValue= (String)request.getAttribute("assetsFixedMarginValue");
String assetsMarginType= (String)request.getAttribute("assetsMarginType");

String assetsFixedMarginValueNew= (String)request.getAttribute("assetsFixedMarginValueNew");
String assetsMarginTypeNew= (String)request.getAttribute("assetsMarginTypeNew");

String liabilityFixedMarginValue= (String)request.getAttribute("liabilityFixedMarginValue");
String liabilityMarginType= (String)request.getAttribute("liabilityMarginType");


String liabilityFixedMarginValueAdv= (String)request.getAttribute("liabilityFixedMarginValueAdv");
String liabilityMarginTypeAdv= (String)request.getAttribute("liabilityMarginTypeAdv");

Long cmsRefId= (Long)request.getAttribute("cmsRefId");

 List  insuranceCompanyList = (List) request.getAttribute("insuranceCompanyList");
pageContext.setAttribute("insuranceCompanyList", insuranceCompanyList);
 

    IGeneralCharge iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    pageContext.setAttribute("obj", iCol);

    //AssetGenChargeForm colForm1 = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
    AssetGenChargeStockDetailsForm colForm = (AssetGenChargeStockDetailsForm) request.getAttribute("AssetGenChargeStockDetailsForm");
    String remarks = (String) request.getAttribute("remarks");
    if (remarks == null || remarks.trim().length() == 0) {
        remarks = request.getParameter("remarks");
    }

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
     String fromPage=(String)request.getAttribute("from_page");
    //Start Santosh
    List applicableForDpList=(List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.applicableForDpList");
    List compoList=(List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.compoList");
	 if(null != compoList){
	        pageContext.setAttribute("compoList",compoList);
	 }
    String dpCalculateManually=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
	System.out.println("????????<<<<<<prepare cuurent asset update: "+dpCalculateManually);
  
	String remarkByMaker=(String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.remarkByMaker");
	if(null ==remarkByMaker){
		remarkByMaker="";
	}
	
	String  migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
	String  totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");
	if(null != migrationFlag &&  !"Y".equalsIgnoreCase(migrationFlag.trim()) ){
		totalLonable="";
	}
	//end Santosh
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsForm"%><html>
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

function refreshApplicableForDp(dropdown)
{
	var item = "";
	 for(i=0; i<dropdown.options.length; i++) {
		if (dropdown.options[i].selected == true) {
		    item = dropdown.options[i].value;	
		}
	}	
	 
	var list="<%=applicableForDpList%>";
	list=list.replace(/ /g,'');
	var array;
	array=list.substring(1,list.length-1);
	list=array.split(',');

	for(var i=0;i<list.length;i++) {
		if(list[i]==item) {
			document.getElementsByName("applicableForDp")[0].value="YES";
			
			
			break;
		}
		else {
			document.getElementsByName("applicableForDp")[0].value="NO";
			
		}
	}
	
	var appForDp=document.getElementsByName("applicableForDp")[0].value;
 	 
	if("YES" == appForDp ){
		document.getElementById('applicableForDpYes').checked = true;
		document.getElementById('applicableForDpNo').checked = false;
		
	}else{
		document.getElementById('applicableForDpNo').checked = true;
		document.getElementById('applicableForDpYes').checked =false;
		
	}
	 
}

function toggleApplicableForDp(obj){

	  if("YES" == obj.value ){
			document.getElementById('applicableForDpYes').checked = true;
			document.getElementById('applicableForDpNo').checked = false;
			document.getElementsByName("applicableForDp")[0].value="YES";


		}else{
			document.getElementById('applicableForDpNo').checked = true;
			document.getElementById('applicableForDpYes').checked =false;
			document.getElementsByName("applicableForDp")[0].value="NO";

		}
}


	function submitPage(num) {

		if (num == 1) {
			document.forms[0].action="AssetGenChargeStockDetails.do?event=create_current_asset";
		} else if (num == 2) {
		    document.forms[0].action="AssetGenChargeStockDetails.do?event=edit_current_asset";
		} else if (num == 3) {
		    document.forms[0].action="AssetGenChargeStockDetails.do?event=cancel_current_asset_liabilities";
		}
		//console.log("Action: "+document.forms[0].action+", num: "+num);
		document.forms[0].submit();
	}
  
  function calculateLonable() {
	var amount;
	var margin;
	var lonable;
	amount=document.forms[0].amount.value;
	margin=document.forms[0].margin.value;

	//Phase 3 CR:comma separated
	amount=amount.replace(/,/g,'');
	
	  if(!isNaN(amount)&& !isNaN(margin)){
		  lonable=amount-((amount*margin)/100);
	  }else{
		  lonable=0;
	  }
	  lonable=formatAmountAsCommaSeparated1(lonable.toFixed(2));
  document.getElementById("lonable").value=lonable;
}	

  function getCodeValueEdit() {    
	    
	         document.forms[0].action="AssetGenChargeStockDetails.do?event=prepare_create_current_asset_insurence";
		
		document.forms[0].submit();
	} 

</script>
</head>

<body>

<html:form action="AssetGenChargeStockDetails.do">
<!--start Santosh  -->
<input type="hidden" name="dpCalculateManually" value="<%=dpCalculateManually%>">
 <!--end Santosh  -->
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="userAccess" value="true"/>
<input type="hidden" name="itemType"/>

<%-- <input type="hidden" name="fundedShare" value="<%=colForm.getFundedShare()%>"/> --%>

<input type="hidden" name="dpShare" value="<%=colForm.getDpShare()%>"/>
<input type="hidden" name="calculatedDP" value="<%=colForm.getCalculatedDP()%>"/>

<input type="hidden" name="migrationFlag" value="<%=migrationFlag%>"/>
<input type="hidden" name="remarkByMaker" value="<%=remarkByMaker %>"/>

<input type="hidden" name="totalLonable" value="<%=totalLonable%>"/>

<%-- <input type="hidden" name="dpCalculateManually" value="<%=colForm.getDpCalculateManually()%>"> --%>

<input type="hidden" name="assetsFixedMarginValue" value="<%=assetsFixedMarginValue%>"/>
<input type="hidden" name="assetsMarginType" value="<%=assetsMarginType%>"/>
<input type="hidden" name="cmsRefId" value="<%=cmsRefId%>"/>

<input type="hidden" name="assetsFixedMarginValueNew" value="<%=assetsFixedMarginValueNew%>"/>
<input type="hidden" name="assetsMarginTypeNew" value="<%=assetsMarginTypeNew%>"/>

<input type="hidden" name="liabilityFixedMarginValue" value="<%=request.getAttribute("liabilityFixedMarginValue")%>"/>
<input type="hidden" name="liabilityMarginType" value="<%=request.getAttribute("liabilityMarginType")%>"/>

<input type="hidden" name="liabilityFixedMarginValueAdv" value="<%=request.getAttribute("liabilityFixedMarginValueAdv")%>"/>
<input type="hidden" name="liabilityMarginTypeAdv" value="<%=request.getAttribute("liabilityMarginTypeAdv")%>"/>


<input type="hidden" name="obIndex" value="<%=request.getParameter("obIndex")%>"/>
<html:hidden property="stockLocation" />
<html:hidden property="stockLocationDetail"/>
<html:hidden property="dueDateStatus"/>
<% int index = 2;

    if ("prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))) {
        index = 1;
    }

%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
        	Stock Details 
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr class="even">
	<td class="fieldname" width="25%">
		Component&nbsp;&nbsp;<font color="#FF0000" size="1">*</font>
	</td>
	<td width="25%">
	<html:select property="components" onchange="javascript:refreshApplicableForDp(this)">
	
	<%if(fromPage==null && !"update_stock_detail".equals(fromPage) ) {%>
 		<option value="" >Please Select </option>
	   <%} %>
	<%-- <integro:common-code categoryCode="CURRENT_ASSET" descWithCode="false" /> --%>
	<html:options collection="compoList" property="value" labelProperty="label"/>
	</html:select>&nbsp;<html:errors property="componentsError"/>
	
	</td>
	<td class="fieldname" width="25%">
		Amount&nbsp;&nbsp;<font color="#FF0000" size="1">*</font>
	</td>
	<td width="25%">
	<html:text name="AssetGenChargeStockDetailsForm" property="amount" onkeyup="javascript:calculateLonable()" maxlength="21" size="31" styleId="amount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
	&nbsp;<html:errors property="componentAmountError"/>
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">Margin Type</td>
	<td>
	<%if(fromPage!=null && "update_stock_detail".equals(fromPage) ) {%>
	<bean:write name="AssetGenChargeStockDetailsForm" property="marginType" />
	<%}else{ %>
		<%=assetsMarginType %>
	<%} %>
	
	<%if("FIXED".equals(assetsMarginType)) {%>
	<html:hidden property="marginType" value="FIXED"/>
	<%}else if("VARIABLE".equals(assetsMarginType)) { %>
	<html:hidden property="marginType" value="VARIABLE"/>
	<%}else{ %>
	<html:hidden property="marginType"/>
	<%} %>
	
	<html:hidden property="marginType"/>
	</td>
	<td class="fieldname">
		Margin&nbsp;&nbsp;<font color="#FF0000" size="1">*</font>
	</td>
	<td>
	<%if("FIXED".equals(assetsMarginType)) {%>
	<html:text name="AssetGenChargeStockDetailsForm" property="margin" value="<%=assetsFixedMarginValue%>" readonly="true" onkeyup="javascript:calculateLonable()" />
	<%}else{ %>
	<html:text name="AssetGenChargeStockDetailsForm" property="margin"  onkeyup="javascript:calculateLonable()" maxlength="6"/>
	<%} %>
	&nbsp;<html:errors property="marginError"/>
	</td>
</tr>
<tr class="even">
	<td class="fieldname">Loanable</td>
	<td>
		<html:text name="AssetGenChargeStockDetailsForm" property="lonable" styleId="lonable"  readonly="true"/>
	</td>
	<!-- Start Santosh -->
	<td class="fieldname">Application for DP</td>
	<td>
		
		
        			
<%  
System.out.println("##############getApplicableForDp in prepare cuurent asset update: "+colForm.getApplicableForDp());
if(!"".equals(colForm.getApplicableForDp()) && null !=  colForm.getApplicableForDp()) { %>

<%if("YES".equals(colForm.getApplicableForDp())) {    %>
	<input type="radio" id="applicableForDpYes" value="YES" onclick="toggleApplicableForDp(this)" checked="checked">Yes</input>
			<input type="radio" id="applicableForDpNo" value="NO" onclick="toggleApplicableForDp(this)">No</input>
<%}else{  %>
         	<input type="radio" id="applicableForDpYes" value="YES" onclick="toggleApplicableForDp(this)">Yes</input>
	 		<input type="radio" id="applicableForDpNo" value="NO" onclick="toggleApplicableForDp(this)" checked="checked">No</input>

<%} %>


<%}else{ %>
	<input type="radio" id="applicableForDpYes" value="YES" onclick="toggleApplicableForDp(this)">Yes</input>
			<input type="radio" id="applicableForDpNo" value="NO" onclick="toggleApplicableForDp(this)">No</input>
	
<%} %>	
		    <html:hidden name="AssetGenChargeStockDetailsForm" property="applicableForDp"  styleId="applicableForDp"/>
		
		 <input type="hidden" name="AssetGenChargeStockDetailsForm" property="cmsRefId"  value="<%=cmsRefId %>" readonly="readonly" styleId="cmsRefId"/>
		 
	</td>
	<!-- End Santosh -->
</tr>
<!--<tr class="odd">
	<td class="fieldname">Has Insurance</td>
	<td colspan="3">
		<html:checkbox name="AssetGenChargeStockDetailsForm" property="hasInsurance" />
		&nbsp;&nbsp;&nbsp;
		<input type="Button" name="btnCode" value="Fetch Insurance" onclick="getCodeValueEdit();"/>
	</td>
	
</tr>
<tr class="even">
	<td class="fieldname">
		Insurance Policy No
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="insurancePolicyNo" maxlength="30"/>
	&nbsp;<html:errors property="insurancePolicyNoError"/>
	
	</td>
	<td class="fieldname">
		Cover Note Number
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="insuranceCoverNote" maxlength="30"/>
	&nbsp;<html:errors property="insuranceCoverNoteError"/>
	
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Insurance Company Name
	</td>
	<td>
	<html:select name="AssetGenChargeStockDetailsForm" property="insuranceCompanyName">	
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
	<html:select name="AssetGenChargeStockDetailsForm" property="insuranceCompanyCategory">	
		<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
	</html:select>
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Total Policy Amount
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="totalPolicyAmount"  maxlength="21"/>
	&nbsp;<html:errors property="totalPolicyAmountError"/>
	</td>
	<td class="fieldname">
		Insured Amount
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="insuredAmount"  maxlength="21"/>
	&nbsp;<html:errors property="insuredAmountError"/>
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Received Date
	</td>
	<td colspan="3">
	<html:text name="AssetGenChargeStockDetailsForm" property="insuranceRecivedDate" readonly="true" size="15" maxlength="11"/>
     <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('insuranceRecivedDate', 'dd/mm/y');"
          onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
     &nbsp;<html:errors property="insuranceRecivedDateError"/>
	</td>
</tr>
<tr class="odd">
	<td class="fieldname">
		Effective Date Of Insurance
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="effectiveDateOfInsurance" readonly="true" size="15" maxlength="11"/>
     <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('effectiveDateOfInsurance', 'dd/mm/y');"
          onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
     <html:errors property="effectiveDateOfInsurance"/>
     &nbsp;<html:errors property="effectiveDateOfInsuranceError"/>
	</td>
	<td class="fieldname">
	  Insurance Expiry Date
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="expiryDate"  readonly="true" size="15" maxlength="11"/>
     <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('expiryDate', 'dd/mm/y');"
          onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
     <html:errors property="expiryDate"/>
     &nbsp;<html:errors property="expiryDateError"/>
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Insurance Defaulted
	</td>
	<td>
		 Yes<html:radio  property="insuranceDefaulted" value="Yes" />&nbsp;
	      No<html:radio  property="insuranceDefaulted" value="No" />&nbsp;
    </td>
	<td class="fieldname">
	  Insurance Premium
	</td>
	<td>
	<html:text name="AssetGenChargeStockDetailsForm" property="insurancePremium"  maxlength="21"/>
	&nbsp;<html:errors property="insurancePremiumError"/>
	</td>
</tr>
<tr class="even">
	<td class="fieldname">
		Remark
	</td>
	<td colspan="3">
	<html:text name="AssetGenChargeStockDetailsForm" property="insuranceDescription" maxlength="200" />
	&nbsp;<html:errors property="insuranceDescriptionError"/>
	</td>
</tr>
--></tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
        <%String evnt=(String)request.getAttribute("event"); %>
        <%if(evnt!=null && "edit_prepare_current_asset".equals(evnt) ) {%>
		<a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/>
         </a>
		<%}else{ %>
		<a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/>
        </a>
		<%} %>
            
         
         </td>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
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
