<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.ITradeInInfo,
				com.integrosys.cms.app.collateral.bus.type.asset.subtype.OBTradeInInfo" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%	
    ITradeInInfo[] tradeInArray = newCollateral.getTradeInInfo(); //staging
	ITradeInInfo newTradeIn = null;
	if(tradeInArray!=null&&tradeInArray.length>0){
		newTradeIn = tradeInArray[0];
	}
	//System.out.println("Stage:"+(tradeInArray==null?0:tradeInArray.length));
	ITradeInInfo[] oldTradeInArray = null;
	if(oldCollateral!=null){
		oldTradeInArray = oldCollateral.getTradeInInfo();
	}
	//System.out.println("Actual:"+(tradeInArray==null?0:tradeInArray.length));
	ITradeInInfo oldTradeIn = null;
	if(oldTradeInArray!=null&&oldTradeInArray.length>0){
		oldTradeIn = oldTradeInArray[0];
	}
	ITradeInInfo tradeInInfo = null;
	if(isProcess){
		tradeInInfo = newTradeIn;
	}else{
		tradeInInfo = oldTradeIn;
	}
	if(tradeInInfo==null){
		tradeInInfo = new OBTradeInInfo();
	}
	String tradeInDeposit = "";
	if(tradeInInfo!=null&&tradeInInfo.getTradeInDeposit()!=null){
		tradeInDeposit = tradeInInfo.getTradeInDeposit()+"";
	}
	boolean isMandatory = false;
	if(tradeInDeposit.length()!=0){
		isMandatory = true;
	}
	
	//reset table row style counter
	rowIdx = 0;
%>

<script language="JavaScript" type="text/JavaScript">
	function setMandatory() {
		if(<%=!isMandatory%>){
			setVisibility('makeStarID','hidden');
			setVisibility('modelStarID','hidden');
			setVisibility('yearOfManufactureStarID','hidden');
			setVisibility('registrationNoStarID','hidden');
			setVisibility('tradeInValueStarID','hidden');
		}else{
			setVisibility('makeStarID','visible');
			setVisibility('modelStarID','visible');
			setVisibility('yearOfManufactureStarID','visible');
			setVisibility('registrationNoStarID','visible');
			setVisibility('tradeInValueStarID','visible');
		}
	}
	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	} 
</script>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.asset.tradein.title"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newTradeIn,oldTradeIn,"make")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
					<span class=stp><bean:message key="label.security.asset.make"/></span>&nbsp;<span class="mandatory" id="makeStarID">*</span>
				</td>
				<td width="30%">
					<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_BRAND,tradeInInfo.getMake())%>"/>
					&nbsp;
				</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newTradeIn,oldTradeIn,"model")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
					<span class=stp><bean:message key="label.security.asset.model"/></span>&nbsp;<span class="mandatory" id="modelStarID">*</span>
				</td>
				<td width="30%">
					<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ASSET_MODEL_TYPE,tradeInInfo.getModel())%>"/>
					&nbsp;
				</td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?((CompareOBUtil.compOB(newTradeIn,oldTradeIn,"yearOfManufacture")
						||(tradeInInfo.getYearOfManufacture()==null))?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.asset.yearofmanufacture"/></span>&nbsp;<span class="mandatory" id="yearOfManufactureStarID">*</span> 
				</td>
				<td>
					<integro:empty-if-null value="<%=tradeInInfo.getYearOfManufacture()%>" /> &nbsp;
				</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newTradeIn,oldTradeIn,"registrationNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.asset.registration.no"/></span>&nbsp;<span class="mandatory" id="registrationNoStarID">*</span> 
				</td>
				<td>
					<integro:empty-if-null value="<%=tradeInInfo.getRegistrationNo()%>" /> &nbsp;
				</td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newTradeIn,oldTradeIn,"tradeInValue")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.asset.tradein.value"/></span>&nbsp;<span class="mandatory" id="tradeInValueStarID">*</span>
				</td>
				<td>
					<% if (tradeInInfo.getTradeInValue()!=null&&tradeInInfo.getTradeInValue().getAmountAsDouble()==ICMSConstant.DOUBLE_INVALID_VALUE) { %> 
					- &nbsp
					<% } else { %>
					<integro:amount param="amount" amount="<%=tradeInInfo.getTradeInValue()%>" decimal="2" />&nbsp;
					<% } %>
				</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newTradeIn,oldTradeIn,"tradeInDeposit")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.asset.tradein.deposit"/></span>&nbsp; 
				</td>
				<td>
					<% if (tradeInInfo.getTradeInDeposit()!=null&&tradeInInfo.getTradeInDeposit().getAmountAsDouble()==ICMSConstant.DOUBLE_INVALID_VALUE) { %> 
					- &nbsp
					<% } else { %>
					<integro:amount param="amount" amount="<%=tradeInInfo.getTradeInDeposit()%>" decimal="2" />&nbsp;
					<% } %>
				</td>
			</tr>
		
		</table>
	</td></tr>
  </tbody>
</table>
<script>
	setMandatory();
</script>