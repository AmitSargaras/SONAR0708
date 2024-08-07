<%@page import="com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%
	String thirdPartyStateName = null; 
	String thirdPartyCityName = null;
	String collateralCategory = "";
	String cersaiApplicableInd = null;
	Boolean isCersaiNotApplicable = false;
	Boolean isCersaiThirdPartyFieldsDisabled = false;
	Boolean isThirdPartyOwnership = false;
	Boolean isCinThirdPartyVisible = false;
	String mandatoryThirdPartyEntitiesStr = "";
	
	if ("Other".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Asset".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Ins".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Mark".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Cash".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Gte".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.mandatoryThirdPartyEntitiesStr");
	} else if ("NoCollateral".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.mandatoryThirdPartyEntitiesStr");
	} else if ("Property".equals(prefix)) {
		thirdPartyStateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.thirdPartyState");
		thirdPartyCityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.thirdPartyCity");
		collateralCategory = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.collateralCategory");
		cersaiApplicableInd = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cersaiApplicableInd");
		mandatoryThirdPartyEntitiesStr = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.mandatoryThirdPartyEntitiesStr");
	}
	
	if(ICMSConstant.NO.equals(cersaiApplicableInd)){
		isCersaiNotApplicable = true;
	}
	
	if(isCersaiNotApplicable || 
			(!isCersaiNotApplicable && CommonCodeEntryConstant.CollateralCategoryCodes.MOVABLE.equals(collateralCategory)) ){
		isCersaiThirdPartyFieldsDisabled = true;
	}
	
	if(null != newCollateral && CommonCodeEntryConstant.SecurityOwnershipCodes.THIRD_PARTY.equals(newCollateral.getSecurityOwnership())){
		isThirdPartyOwnership = true; 
	}
	if(null != newCollateral && null != newCollateral.getThirdPartyEntity() && null != mandatoryThirdPartyEntitiesStr && mandatoryThirdPartyEntitiesStr.contains(newCollateral.getThirdPartyEntity())){
		isCinThirdPartyVisible = true;
	}
%>

<script>

function toggleVisibilityOtherCersaiApplicableFields(attribute){
	document.getElementById("spanTrxRef").style.visibility = attribute;
	document.getElementById("spanSecurityInterest").style.visibility = attribute;
	document.getElementById("spanAssetId").style.visibility = attribute;
	document.getElementById("spanRegDate").style.visibility = attribute;
	document.getElementById("spanCersaiId").style.visibility = attribute;
	document.getElementById("spanCersaiSaleDate").style.visibility = attribute;
}

function toggleVisibilityThirdPartyFields(attribute){
	document.getElementById("spanOwner").style.visibility = attribute;
	document.getElementById("spanEntity").style.visibility = attribute;
	document.getElementById("spanAddress").style.visibility = attribute;
	document.getElementById("spanState").style.visibility = attribute;
	document.getElementById("spanCity").style.visibility = attribute;
	document.getElementById("spanPincode").style.visibility = attribute;
}

document.addEventListener("DOMContentLoaded", function(){
	<% if(isCersaiNotApplicable){%>
		toggleVisibilityOtherCersaiApplicableFields("hidden");
	<%}else{%>
		toggleVisibilityOtherCersaiApplicableFields("visible");
		if(<%=isThirdPartyOwnership%>){
			toggleVisibilityThirdPartyFields("visible");
		}
		else{
			toggleVisibilityThirdPartyFields("hidden");
		}
	<%}%>
	
	<% if(isCersaiThirdPartyFieldsDisabled){%>
			document.getElementById("spanSecOwnership").style.visibility = "hidden";
	<%}else{%>
			document.getElementById("spanSecOwnership").style.visibility = "visible";
	<%}%>
	
	<% if(isCinThirdPartyVisible){%>
		document.getElementById("spanCin").style.visibility = "visible";
	<%}else{%>
		document.getElementById("spanCin").style.visibility = "hidden";
	<%}%>
	
	
});

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
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"securityOwnership")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname">
						<bean:message key="label.cersai.security.ownership" />
						<span id="spanSecOwnership" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"> 
						<integro:common-code-single  categoryCode="<%= CategoryCodeConstant.COMMON_CODE_SECURITY_OWNERSHIP %>" 
							entryCode="<%=iCol.getSecurityOwnership() %>" display="true"  descWithCode="false"/>
					</td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ownerOfProperty")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname"><bean:message
							key="label.cersai.owner.property" />
						<span id="spanOwner" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"> <integro:empty-if-null	value="<%=iCol.getOwnerOfProperty()%>" /> </td>
				</tr>
				
				<tr class="odd">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"thirdPartyEntity")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname">
						<bean:message key="label.cersai.third.party.entity" />
						<span id="spanEntity" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%">
						<integro:common-code-single  categoryCode="<%=CategoryCodeConstant.ENTITY%>" 
							entryCode="<%=iCol.getThirdPartyEntity() %>" display="true"  descWithCode="false"/>
					</td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cinForThirdParty")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname">
						<bean:message key="label.cersai.cin.third.party" />
						<span id="spanCin" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getCinForThirdParty()%>" /></td>
				</tr>
				
				<tr class="odd">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cersaiTransactionRefNumber")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.transaction.reference" /> &nbsp;
						<span id="spanTrxRef" style="visibility:hidden">&nbsp;</span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getCersaiTransactionRefNumber()%>" /></td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cersaiSecurityInterestId")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.security.interest" /> &nbsp;
						<span id="spanSecurityInterest" style="visibility:hidden">&nbsp;</span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getCersaiSecurityInterestId()%>" /></td>
				</tr>
				
				<tr class="odd">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cersaiAssetId")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.asset.id" /> &nbsp;
						<span id="spanAssetId" style="visibility:hidden">&nbsp;</span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getCersaiAssetId()%>" /></td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"dateOfCersaiRegisteration")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.registration.date" /> &nbsp;
						<span id="spanRegDate" style="visibility:hidden">&nbsp;</span>
					</td>
					<td width="30%"><integro:date object="<%=iCol.getDateOfCersaiRegisteration()%>"/>&nbsp;</td>
				</tr>
				
				<tr class="odd">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cersaiId")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.id" /> &nbsp;
						<span id="spanCersaiId" style="visibility:hidden">&nbsp;</span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getCersaiId()%>" /></td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"saleDeedPurchaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.sale.purchase.agreement.date" /> &nbsp;
						<span id="spanCersaiSaleDate" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"><integro:date object="<%=iCol.getSaleDeedPurchaseDate()%>"/>&nbsp;</td>
				</tr>
				
				<tr class="odd">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"thirdPartyAddress")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.third.party.address" /> &nbsp;
						<span id="spanAddress" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getThirdPartyAddress()%>" /></td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"thirdPartyState")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.third.party.state" /> &nbsp;
						<span id="spanState" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>	
					</td>
					<td width="30%"><integro:empty-if-null value="<%=thirdPartyStateName%>" />
					</td>
				</tr>
				
				<tr class="odd">
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"thirdPartyCity")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.third.party.city" /> &nbsp;
						<span id="spanCity" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=thirdPartyCityName%>" /></td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"thirdPartyPincode")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%" class="fieldname" width="20%" class="fieldname"><bean:message key="label.cersai.third.party.pincode" /> &nbsp;
						<span id="spanPincode" style="visibility:hidden">&nbsp;<bean:message key="label.perfection" /></span>
					</td>
					<td width="30%"><integro:empty-if-null value="<%=iCol.getThirdPartyPincode()%>" /></td>
				</tr>
				<tr class="odd">
					<td colspan="4">&nbsp;</td>
				</tr>
			</tbody>
        </table>  
    </tbody>
</table>