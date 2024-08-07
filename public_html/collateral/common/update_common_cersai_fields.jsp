<!-- @Required actionPathName from update_basic_security_fields jsp and prefix varaiable -->
<%@page import="com.integrosys.cms.ui.collateral.CollateralForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.ICollateral"%>
<%@page import="com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%
	//@Required actionPathName and prefix for proper functioning which are referenced from update_basic_security_fields
	List thirdPartyStateList = new ArrayList();
	List thirdPartyCityList = new ArrayList();
	List securityOwnershipList  = new ArrayList();
	String statePinCodeString = "";
	String collateralCategory = "";
	String customerEntity = "";
	String customerPartyName = "";
	String mandatoryThirdPartyEntitiesStr = "";
	String cersaiApplicableInd = null;
	Boolean isCersaiNotApplicable = true;
	Boolean isCersaiThirdPartyFieldsDisabled = false;
	
	if ("Other".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.mandatoryThirdPartyEntitiesStr");

	} else if ("Asset".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Ins".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Mark".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Cash".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Gte".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.mandatoryThirdPartyEntitiesStr");
	} else if ("NoCollateral".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Property".equals(prefix)) {
		thirdPartyStateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.thirdPartyStateList");
		thirdPartyCityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.thirdPartyCityList");
		securityOwnershipList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.securityOwnership");
		statePinCodeString = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.pincodesString");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.collateralCategory");
		customerEntity = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.customerEntity");
		customerPartyName = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.customerPartyName");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.mandatoryThirdPartyEntitiesStr");
	}
	customerPartyName =  customerPartyName == null ? "" : customerPartyName;
	customerEntity =  customerEntity == null ? "" : customerEntity;
	pageContext.setAttribute("thirdPartyStateList", thirdPartyStateList);
	pageContext.setAttribute("thirdPartyCityList", thirdPartyCityList);
	pageContext.setAttribute("securityOwnershipList", securityOwnershipList); 
	
	if(ICMSConstant.YES.equals(cersaiApplicableInd)){
		isCersaiNotApplicable = false;
	}
	
	if(isCersaiNotApplicable || 
			(!isCersaiNotApplicable && CommonCodeEntryConstant.CollateralCategoryCodes.MOVABLE.equals(collateralCategory)) ){
		isCersaiThirdPartyFieldsDisabled = true;
	}
	
	ICollateralTrxValue itrxValue7 = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	Locale locale1 = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	//System.out.println("<<<<<<<<<<<CERSAI TEST>>>>>>>>>>>"+itrxValue7.getStagingCollateral().getCersaiId());
	
	CollateralForm aForm = (CollateralForm) request.getAttribute(formName);
	if(itrxValue7!=null && itrxValue7.getStagingCollateral()!=null && aForm != null){

		ICollateral objICol = itrxValue7.getStagingCollateral();
		if (StringUtils.isNotBlank(objICol.getCersaiTransactionRefNumber())) {
			aForm.setCersaiTransactionRefNumber(objICol.getCersaiTransactionRefNumber());
		}
		if (StringUtils.isNotBlank(objICol.getCersaiSecurityInterestId())) {
			aForm.setCersaiSecurityInterestId(objICol.getCersaiSecurityInterestId());
		}
		if (StringUtils.isNotBlank(objICol.getCersaiAssetId())) {
			aForm.setCersaiAssetId(objICol.getCersaiAssetId());
		}
		if (StringUtils.isNotBlank(objICol.getCersaiId())) {
			aForm.setCersaiId(objICol.getCersaiId());
		}

		if (null != objICol.getDateOfCersaiRegisteration()) {
			aForm.setDateOfCersaiRegisteration(UIUtil.mapOBDate_FormString(locale1, objICol.getDateOfCersaiRegisteration()));
		}
		if (null != objICol.getSaleDeedPurchaseDate()) {
			aForm.setSaleDeedPurchaseDate(UIUtil.mapOBDate_FormString(locale1, objICol.getSaleDeedPurchaseDate()));
		}

		if (StringUtils.isNotBlank(objICol.getSecurityOwnership())) {
			aForm.setSecurityOwnership(objICol.getSecurityOwnership());
		}
		if(null != objICol.getOwnerOfProperty() && StringUtils.isNotBlank(objICol.getOwnerOfProperty())){
			if (StringUtils.isBlank(objICol.getOwnerOfProperty())
					&& CommonCodeEntryConstant.SecurityOwnershipCodes.BORROWER.equals(objICol.getSecurityOwnership())) {
				aForm.setOwnerOfProperty(customerPartyName);
			} else {
				aForm.setOwnerOfProperty(objICol.getOwnerOfProperty());
			}
		}
		if(null != objICol.getThirdPartyEntity() && StringUtils.isNotBlank(objICol.getThirdPartyEntity())){
			if (StringUtils.isBlank(objICol.getThirdPartyEntity())
					&& CommonCodeEntryConstant.SecurityOwnershipCodes.BORROWER.equals(objICol.getSecurityOwnership())) {
				aForm.setThirdPartyEntity(customerEntity);
			} else {
				aForm.setThirdPartyEntity(objICol.getThirdPartyEntity());
			}
		}
		if (StringUtils.isNotBlank(objICol.getCinForThirdParty())) {
			aForm.setCinForThirdParty(objICol.getCinForThirdParty());
		}
		if (CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY.equals(objICol.getSecurityOwnership())
				&& StringUtils.isNotBlank(objICol.getThirdPartyState())) {
			aForm.setThirdPartyState(objICol.getThirdPartyState());
		}
		if (CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY.equals(objICol.getSecurityOwnership())
				&& StringUtils.isNotBlank(objICol.getThirdPartyCity())) {
			aForm.setThirdPartyCity(objICol.getThirdPartyCity());
		}
		if (CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY.equals(objICol.getSecurityOwnership())
				&& StringUtils.isNotBlank(objICol.getThirdPartyAddress())) {
			aForm.setThirdPartyAddress(objICol.getThirdPartyAddress());
		}
		if (CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY.equals(objICol.getSecurityOwnership())
				&& StringUtils.isNotBlank(objICol.getThirdPartyPincode())) {
			aForm.setThirdPartyPincode(objICol.getThirdPartyPincode());
		}
	}
%>

<script>
function refreshThirdPartyCityId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'thirdPartyCity';
 var url = '<%=request.getContextPath()%>/<%=actionPathName%>' + '?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function validateThirdPartyPinCode(){
	var state = document.getElementById("thirdPartyState").value;
	var	pincode = document.getElementById("thirdPartyPincode").value;
	var statePinCodeString = '<%=statePinCodeString%>';
	var splittedPins = statePinCodeString.split(",");
	
	var statePinCodeMappingMap = new Map();
	for (index = 0; index < splittedPins.length; ++index) {
		var subSplittedPins = splittedPins[index].split("=");
		statePinCodeMappingMap.set(subSplittedPins[0],subSplittedPins[1]);
	}
	
	if(statePinCodeMappingMap.get(state) != undefined && statePinCodeMappingMap.get(state) != pincode.charAt(0) && pincode != "" && state != ""){
		alert("Please enter correct pin code");
	}
}

function mandateThirdPartyEntity(dropdown){
	var mandatoryThirdPartyEntitiesStr = "<%=mandatoryThirdPartyEntitiesStr%>";
	for(i=0; i<dropdown.options.length; i++){
		if (dropdown.options[i].selected == true){
		    curSel = dropdown.options[i].value;	
		}	
	}
	if(mandatoryThirdPartyEntitiesStr.indexOf(curSel) > -1){
		document.getElementById("spanCin").style.visibility = "visible";
	}
	else{
		document.getElementById("spanCin").style.visibility = "hidden";
	}
}

function autoPopulateCersaiFields(dropdown){
	for(i=0; i<dropdown.options.length; i++){
		if (dropdown.options[i].selected == true){
		    curSel = dropdown.options[i].value;	
		}	
	}
	if(curSel === "<%=CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY%>"){
		toggleVisibilityThirdPartyFields("visible");
		toggleDisablityThirdPartyFields(false);
		document.getElementById("ownerOfProperty").value = "";
		document.getElementById("thirdPartyEntity").value = "";
	}
	else{
		toggleVisibilityThirdPartyFields("hidden");
		toggleDisablityThirdPartyFields(true);
		setBorrowerThirdPartyFieldsValues();
		document.getElementById("spanCin").style.visibility = "hidden";
	}
}	

function toggleVisibilityThirdPartyFields(attribute){
	document.getElementById("spanOwner").style.visibility = attribute;
	document.getElementById("spanEntity").style.visibility = attribute;
	document.getElementById("spanAddress").style.visibility = attribute;
	document.getElementById("spanState").style.visibility = attribute;
	document.getElementById("spanCity").style.visibility = attribute;
	document.getElementById("spanPincode").style.visibility = attribute;
}

function toggleDisablityThirdPartyFields(flag){
	document.getElementById("ownerOfProperty").disabled = flag;
	document.getElementById("thirdPartyEntity").disabled = flag;
	document.getElementById("cinForThirdParty").disabled = flag;
	document.getElementById("thirdPartyAddress").disabled = flag;
	document.getElementById("thirdPartyState").disabled = flag;
	document.getElementById("thirdPartyCity").disabled = flag;
	document.getElementById("thirdPartyPincode").disabled = flag;
}

function setBorrowerThirdPartyFieldsValues(){
	document.getElementById("ownerOfProperty").value = "<%=customerPartyName%>";
	document.getElementById("thirdPartyEntity").value = "<%=customerEntity%>";
	document.getElementById("cinForThirdParty").value = "";
	document.getElementById("thirdPartyAddress").value = "";
	document.getElementById("thirdPartyState").value = "";
	document.getElementById("thirdPartyCity").value = "";
	document.getElementById("thirdPartyPincode").value = "";
}

function toggleVisibilityOtherCersaiApplicableFields(attribute){
	document.getElementById("spanRegisterationImg").style.visibility = attribute;
	document.getElementById("spanSalePurchaseDateImg").style.visibility = attribute;
	document.getElementById("spanTrxRef").style.visibility = attribute;
	document.getElementById("spanSecurityInterest").style.visibility = attribute;
	document.getElementById("spanAssetId").style.visibility = attribute;
	document.getElementById("spanRegDate").style.visibility = attribute;
	document.getElementById("spanCersaiId").style.visibility = attribute;
	document.getElementById("spanCersaiSaleDate").style.visibility = attribute;
}

	document.addEventListener("DOMContentLoaded", function(){
		<% if(isCersaiNotApplicable){%>
			toggleVisibilityOtherCersaiApplicableFields("hidden");
			resetAllFields();
		<%}else{%>
			toggleVisibilityOtherCersaiApplicableFields("visible");
			<% if(isCersaiThirdPartyFieldsDisabled){%>
				document.getElementById("spanSecOwnership").style.visibility = "hidden";
				resetMovableFields();
				resetThirdPartyFields();
			<%}else{%>
				document.getElementById("spanSecOwnership").style.visibility = "visible";
				
				if(document.getElementById("securityOwnership").value === "<%=CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY%>" ){
					toggleVisibilityThirdPartyFields("visible");
					toggleDisablityThirdPartyFields(false);
				}
				else{
					toggleVisibilityThirdPartyFields("hidden");
					toggleDisablityThirdPartyFields(true);
				}
				
				toggleCinForThirdPartyVisibility();
				
			<%}%>
		<%}%>
		
	});
	
	function resetThirdPartyFields(){
		document.getElementById("thirdPartyEntity").value = "";
		document.getElementById("cinForThirdParty").value = "";
		document.getElementById("thirdPartyAddress").value = "";
		document.getElementById("thirdPartyState").value = "";
		document.getElementById("thirdPartyCity").value = "";
		document.getElementById("thirdPartyPincode").value = "";
	}
	
	function resetMovableFields(){
		document.getElementById("securityOwnership").value = "";
		document.getElementById("ownerOfProperty").value = "";
		resetThirdPartyFields();
	}
	
	function resetCersaiNotApplicableFields(){
		document.getElementById("cersaiTransactionRefNumber").value = "";
		document.getElementById("cersaiSecurityInterestId").value = "";
		document.getElementById("cersaiAssetId").value = "";
		document.getElementById("dateOfCersaiRegisteration").value = "";
		document.getElementById("cersaiId").value = "";
		document.getElementById("saleDeedPurchaseDate").value = "";
	}
	
	function resetAllFields(){
		resetMovableFields();
		resetCersaiNotApplicableFields()
	}
	
	function toggleCinForThirdPartyVisibility(){
		var mandatoryThirdPartyEntitiesStr = "<%=mandatoryThirdPartyEntitiesStr%>";
		if(""!= document.getElementById("thirdPartyEntity").value && mandatoryThirdPartyEntitiesStr.indexOf(document.getElementById("thirdPartyEntity").value) > -1){
			document.getElementById("spanCin").style.visibility = "visible";
		}
		else{
			document.getElementById("spanCin").style.visibility = "hidden";
		}
	}
</script>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
    <tr>
      <td><h3><bean:message key="label.cersai.details"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
	</thead>

	<tbody>
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
			<tbody>
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message key="label.cersai.security.ownership" />
						<span id="spanSecOwnership" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:select property="securityOwnership" styleId="securityOwnership" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" onchange="javascript:autoPopulateCersaiFields(this)">
							<option value=""><bean:message key="label.please.select" /></option>
							<html:options collection="securityOwnershipList" property="label" labelProperty="value" />
			        	</html:select>&nbsp;
			        	<html:errors property="securityOwnershipError" />
			        </td>
					<td width="20%" class="fieldname"><bean:message key="label.cersai.owner.property" /> 
						<span id="spanOwner" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:text property="ownerOfProperty" styleId="ownerOfProperty" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" size="35"></html:text>
						<html:errors property="ownerOfPropertyError" />
					</td>
				</tr>
				
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message key="label.cersai.third.party.entity" />
					<span id="spanEntity" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"> 
						<html:select property="thirdPartyEntity" styleId="thirdPartyEntity" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" onchange="javascript:mandateThirdPartyEntity(this)">
			           		<integro:common-code categoryCode="<%=CategoryCodeConstant.ENTITY%>" descWithCode="false" />
			        	</html:select>&nbsp;
			        	<html:errors property="thirdPartyEntityError" />
					</td>
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.cin.third.party" />
					<span id="spanCin" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>		
					</td>
					<td width="30%">
						<html:text property="cinForThirdParty" styleId="cinForThirdParty" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" size="35"></html:text>
						<html:errors property="cinForThirdPartyError" />
					</td>
				</tr>
				
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.transaction.reference" /> &nbsp;
						<span id="spanTrxRef" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:text property="cersaiTransactionRefNumber" styleId="cersaiTransactionRefNumber" disabled= "<%=isCersaiNotApplicable%>" size="25"></html:text>
						<html:errors property="cersaiTransactionRefNumberError" />
					</td>
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.security.interest" /> &nbsp;
						<span id="spanSecurityInterest" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>		
					</td>
					<td width="30%">
						<html:text property="cersaiSecurityInterestId" styleId="cersaiSecurityInterestId" disabled= "<%=isCersaiNotApplicable%>" size="35"></html:text>
						<html:errors property="cersaiSecurityInterestIdError" />
					</td>
				</tr>
				
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.asset.id" /> &nbsp;
						<span id="spanAssetId" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>						
					</td>
					<td width="30%">
						<html:text property="cersaiAssetId" styleId="cersaiAssetId" disabled= "<%=isCersaiNotApplicable%>" size="25"></html:text>
						<html:errors property="cersaiAssetIdError" />
					</td>
					<td width="20%" class="fieldname"><bean:message key="label.cersai.registration.date" /> &nbsp;
						<span id="spanRegDate" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>	
					</td>
					<td width="30%">
						<html:text property="dateOfCersaiRegisteration" styleId="dateOfCersaiRegisteration" disabled= "<%=isCersaiNotApplicable%>" readonly="true"/>
						<%if(isCersaiNotApplicable){ %>
						<input type="image" src="img/calendara.gif" name="Image723" id="dateOfCersaiRegisterationImg" onclick="return showCalendar('dateOfCersaiRegisteration', 'dd/mm/y')"
   			    			onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
   			    			<%}else{ %>
   			    			<input type="image" src="img/calendara.gif" name="Image723" id="dateOfCersaiRegisterationImg" onclick="return showCalendar('dateOfCersaiRegisteration', 'dd/mm/y')"
   			    			onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"></input>
   			    			<%} %>
						<html:errors property="dateOfCersaiRegisterationError" />
					</td>
				</tr>
				
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.id" /> &nbsp;
						<span id="spanCersaiId" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:text property="cersaiId" styleId="cersaiId" disabled= "<%=isCersaiNotApplicable%>" size="25"></html:text>
						<html:errors property="cersaiIdError" />
					</td>
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.sale.purchase.agreement.date" /> &nbsp;
					<span id="spanCersaiSaleDate" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:text property="saleDeedPurchaseDate" styleId="saleDeedPurchaseDate" disabled= "<%=isCersaiNotApplicable%>" readonly="true"/>
						<%if(isCersaiNotApplicable){ %>
						<input type="image" src="img/calendara.gif" name="Image723" id="saleDeedPurchaseDate" onclick="return showCalendar('saleDeedPurchaseDate', 'dd/mm/y')"
   			    			onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
   			    			<%}else{ %>
   			    			<input type="image" src="img/calendara.gif" name="Image723" id="saleDeedPurchaseDate" onclick="return showCalendar('saleDeedPurchaseDate', 'dd/mm/y')"
   			    			onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"></input>
   			    			<%} %>
						<html:errors property="saleDeedPurchaseDateError" />
					</td>
				</tr>
				
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.third.party.address" /> &nbsp;
							<span id="spanAddress" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:textarea property="thirdPartyAddress" styleId="thirdPartyAddress" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" rows="3" cols="120" style="width:100%" />
						<html:errors property="thirdPartyAddressError" />
					</td>
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.third.party.state" /> &nbsp;
							<span id="spanState" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>		
					</td>
					<td width="30%">
						<html:select property="thirdPartyState" styleId="thirdPartyState" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" onchange="javascript:refreshThirdPartyCityId(this)">
			           		<option value="">Please Select</option>
							<html:options collection="thirdPartyStateList" property="value" labelProperty="label" />
						</html:select>&nbsp;
			        	<html:errors property="thirdPartyStateError" />
					</td>
				</tr>
				
				<tr class="odd">
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.third.party.city" /> &nbsp;
						<span id="spanCity" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:select property="thirdPartyCity" styleId="thirdPartyCity" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>">
			           		<option value=""><bean:message key="label.please.select"/></option>
			           		<html:options collection="thirdPartyCityList" property="value" labelProperty="label" />
			        	</html:select>&nbsp;
			        	<html:errors property="thirdPartyCityError" />
					</td>
					<td width="20%" class="fieldname"><bean:message
							key="label.cersai.third.party.pincode" /> &nbsp;
						<span id="spanPincode" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<html:text property="thirdPartyPincode" styleId="thirdPartyPincode" disabled= "<%=isCersaiThirdPartyFieldsDisabled%>" onblur="validateThirdPartyPinCode()" size="15"></html:text>
						<html:errors property="thirdPartyPincodeError" />
					</td>
					
					<html:hidden property="statePincodeString" value="<%=statePinCodeString %>"/>
					<html:hidden property="collateralCategory" value="<%=collateralCategory %>"/>
					<html:hidden property="cersaiApplicableInd" value="<%=cersaiApplicableInd %>"/>
				</tr>
				<tr class="odd">
					<td colspan="4">&nbsp;</td>
				</tr>
			</tbody>
        </table>  
    </tbody>
</table>