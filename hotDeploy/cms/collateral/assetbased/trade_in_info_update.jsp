<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	//reset table row style counter
	rowIdx = 0;
%>

<script language="JavaScript" type="text/JavaScript">
<!--
	function setMandatory() {
		var valueStr = document.getElementById('tradeInDeposit').value;
		if(valueStr==null||valueStr.length==0){
			setVisibility('makeStarID','hidden');
			setVisibility('modelStarID','hidden');
			setVisibility('yearOfManufactureStarID','hidden');
			setVisibility('registrationNoStarID','hidden');
			setVisibility('tradeInValueStarID','hidden');
			
			document.getElementById('tradeInMake').disabled = true;
			document.getElementById('tradeInYearOfManufacture').disabled = true;
			document.getElementById('tradeInModel').disabled = true;
			document.getElementById('tradeInRegistrationNo').disabled = true;
			document.getElementById('tradeInValue').disabled = true;
			//document.forms[0].modelStarID.disabled = true;
			//document.forms[0].yearOfManufactureStarID.disabled = true;
			//document.forms[0].registrationNoStarID.disabled = true;
			//document.forms[0].tradeInValueStarID.disabled = true;
		}else{
			setVisibility('makeStarID','visible');
			setVisibility('modelStarID','visible');
			setVisibility('yearOfManufactureStarID','visible');
			setVisibility('registrationNoStarID','visible');
			setVisibility('tradeInValueStarID','visible');

			document.getElementById('tradeInMake').disabled = false;
			document.getElementById('tradeInYearOfManufacture').disabled = false;
			document.getElementById('tradeInModel').disabled = false;
			document.getElementById('tradeInRegistrationNo').disabled = false;
			document.getElementById('tradeInValue').disabled = false;
		}
	}

	function setVisibility(elementID,visibility){
	  	document.getElementById(elementID).style.visibility = visibility;
	}
	
	function refreshTradeInModel(brand) {
		var brandValue = brand.options[brand.selectedIndex].value;
		var dropDownToBeRefresh = 'tradeInModel';
		
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=tradeInModelOptions&brand='+brandValue+'&code=MODEL&ref='+brandValue+'&desc=true';
		
		sendLoadDropdownReq(dropDownToBeRefresh, url);
	}
	
	function refreshTradeInYearOfManufacture(model) {
		var modelValue = model.options[model.selectedIndex].value;
		var dropDownToBeRefresh = 'tradeInYearOfManufacture';

		var makeObject = document.forms[0].tradeInMake;
		var makeValue = makeObject.options[makeObject.selectedIndex].value;
		
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=yearOfManufactureOptions&brand='+modelValue+'&code=MODEL_YEAR_MAP&ref='+makeValue + '|' +modelValue;
		
		sendLoadDropdownReq(dropDownToBeRefresh, url);
	}
-->
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
				<td class="fieldname" width="20%">
					<span class=stp><bean:message key="label.security.asset.make"/></span>&nbsp;<span class="mandatory" id="makeStarID">*</span>
				</td>
				<td width="30%">
					<html:select property="tradeInMake" onchange="refreshTradeInModel(this)">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.VEHICLE_BRAND%>" />
	                </html:select>&nbsp;
					<html:errors property="make"/>
				</td>
				<td class="fieldname" width="20%">
					<span class=stp><bean:message key="label.security.asset.model"/></span>&nbsp;<span class="mandatory" id="modelStarID">*</span>
				</td>
				<td width="30%">
					<html:select property="tradeInModel" >
						<logic:notEmpty name="org.apache.struts.taglib.html.BEAN" property="tradeInMake">
							<bean:define id="theTradeInMake" name="org.apache.struts.taglib.html.BEAN" property="tradeInMake" type="java.lang.String"/>
							<integro:common-code categoryCode="<%=CategoryCodeConstant.ASSET_MODEL_TYPE%>" refEntryCode="<%=theTradeInMake%>" />
						</logic:notEmpty>
						<logic:empty name="org.apache.struts.taglib.html.BEAN" property="tradeInMake">
							<option label="Please Select" value="" />
						</logic:empty>
					</html:select>&nbsp;
					<html:errors property="model"/>
				</td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.yearofmanufacture"/></span>&nbsp;<span class="mandatory" id="yearOfManufactureStarID">*</span> 
				</td>
				<td>
					<%-- <html:text property="tradeInYearOfManufacture" maxlength="4"/>--%>
				   	<html:select property="tradeInYearOfManufacture">
						<option value=""><bean:message key="label.please.select"/></option>
			            <html:options collection="tradeInYearOfManufactureOptions" property="value" labelProperty="label"/>
			    	</html:select>
					<html:errors property="tradeInYearOfManufacture"/>
				</td>
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.registration.no"/></span>&nbsp;<span class="mandatory" id="registrationNoStarID">*</span >
				</td>
				<td>
					<html:text property="tradeInRegistrationNo" maxlength="25"/>&nbsp;
					<html:errors property="tradeInRegistrationNo"/>
				</td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.tradein.value"/></span>&nbsp;<span class="mandatory" id="tradeInValueStarID">*</span >
				</td>
				<td>
					<html:text property="tradeInValue" maxlength="21"/>&nbsp;
					<html:errors property="tradeInValue"/>
				</td>
				<td class="fieldname">
					<span class=stp><bean:message key="label.security.asset.tradein.deposit"/></span>&nbsp;
				</td>
				<td>
					<html:text property="tradeInDeposit" maxlength="21"  readonly="true" value="<%=colForm.getDptradein() %>" />&nbsp;
					<html:errors property="tradeInDeposit"/>
				</td>
			</tr>
		
		</table>
	</td></tr>
  </tbody>
</table>
<script>
	setMandatory();
</script>