<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.AssetSpecVehiclesForm"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>

<script type="text/javascript">
<!--
	function checkPbrPbtPeriod(value) {
		if (value == 'PBR' || value == 'PBT') {
			document.getElementById('pbrPbtPeriodMandatory').style.visibility = 'visible';
		}
		else {
			document.getElementById('pbrPbtPeriodMandatory').style.visibility = 'hidden';
		}
	}
	
	function refreshModel(brand) {
		var brandValue = brand.options[brand.selectedIndex].value;
		var dropDownToBeRefresh = 'modelNo';
		
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=modelOptions&brand='+brandValue+'&code=MODEL&ref='+brandValue+'&desc=true';
		
		sendLoadDropdownReq(dropDownToBeRefresh, url);
	}
	
	function refreshYearOfManufacture(model) {
		var modelValue = model.options[model.selectedIndex].value;
		var dropDownToBeRefresh = 'yearMfg';

		var makeObject = document.forms[0].brand;
		var makeValue = makeObject.options[makeObject.selectedIndex].value;
		
		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name=yearOfManufactureOptions&brand='+modelValue+'&code=MODEL_YEAR_MAP&ref='+makeValue + '|' +modelValue;
		
		sendLoadDropdownReq(dropDownToBeRefresh, url);
	}
-->
</script>

<%
	int rowIdx = Integer.parseInt(request.getParameter("rowIdx"));
	String formName = request.getParameter("formName");
	String EHakMilikNumber = request.getParameter("EHakMilikNumber");
	AssetSpecVehiclesForm form = (AssetSpecVehiclesForm) request.getAttribute("AssetSpecVehiclesForm");
	
%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.vehicle.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    <td class="fieldname">
				<span class="fieldname"><bean:message key="label.security.asset.registration.no"/></span> &nbsp;</td>
		    <td><html:text property="regNo" maxlength="15"/>&nbsp;
		        <html:errors property="regNoError"/>&nbsp;
		        <html:errors property="regNo"/></td>
		    <td class="fieldname">
				<span class="fieldname"><bean:message key="label.security.asset.logbook.no"/></span> </td>
		    <td><html:text property="logBookNumber" maxlength="20"/>&nbsp;
		        <html:errors property="logBookNumberError"/>&nbsp;
		        <html:errors property="logBookNumber"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		  
		   <td class="fieldname">
				<span class="fieldname"><bean:message key="label.security.asset.registration.date"/></span></td>
		    <td><html:text property="regDate" readonly="true" size="15" maxlength="11"/>
		        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
                     onclick="showCalendar('regDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                     onmouseout="MM_swapImgRestore()"/>&nbsp; <html:errors property="regDateError"/></td>
		       
		       <td class="fieldname"><span class="fieldname">Start Date</span>
				</td>
		     <td><html:text property="startDate" readonly="true" size="15" maxlength="11"/>
		        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
                     onclick="showCalendar('startDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                     onmouseout="MM_swapImgRestore()"/>&nbsp; <html:errors property="startDateError"/></td>
		        
		       
		<!--	<td class="fieldname">
                <span class="fieldname"><bean:message key="label.security.asset.invoice.date"/></span></td>
            <td><html:text property="invoiceDate" readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
                     onclick="showCalendar('invoiceDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                     onmouseout="MM_swapImgRestore()"/>&nbsp;
            <html:errors property="invoiceDate"/></td>-->
		
		        
		         <!-- <td class="fieldname">
				<span class = stp><bean:message key="label.security.asset.registration.fee"/></span></td>
		    <td><html:text property="regFee" maxlength="20"/>&nbsp;
		        <html:errors property="regFee"/></td> -->
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname" width="20%">
		        <span class="fieldname"><bean:message key="label.security.asset.chassisno"/></span> </td>
		    <td width="30%"><html:text property="chassisNumber"/>&nbsp;<html:errors property="chassisNumberError"/></td>
		 <td class="fieldname" width="20%">
                <span class="fieldname"><bean:message key="label.security.asset.engine.no"/></span></td>
            <td width="30%"><html:text property="engineNo"/>&nbsp;<html:errors property="engineNoError"/></td>
		</tr>
	   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	   <td class="fieldname" >
                  <span class="fieldname">RamId</span>&nbsp;</td>
                  <td colspan="3"><html:text property="ramId" maxlength="15"/>&nbsp;<html:errors property="ramIdError"/></td>
                  
       </tr>
	    
       <tr class="odd">
							<td colspan="4" align="right" class="amount"><input onclick="javascript : dispNonMandatoryField()"
								name="AddNew12" type="button" id="AddNew12" value="Additional Details"
								class="btnNormal" />&nbsp;<input onclick="javascript : hideNonMandatoryField()"
								name="AddNew13" type="button" id="AddNew13" value="Hide Additional Details"
								class="btnNormal" /></td>
	   </tr>

	<tbody id="disp1" style="display: none;">
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="fieldname">
				<span class="fieldname"><bean:message key="label.security.asset.goods.status" /></span> </td>
            <td colspan="3"><html:select property="goodStatus" onchange="setGoodStatus(this.value)">
                    <option value=""><bean:message key="label.please.select"/></option>
                   <html:options name="goodStatusID" labelName="goodStatusValue"/>
                </html:select>&nbsp;
                <html:errors property="goodStatus"/></td>
        </tr>
		<!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    <td class="fieldname"><bean:message key="label.security.asset.dealer.name"/></td>
			<td><html:select property="dealerName">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.VEHICLE_DEALER%>" />
                </html:select>&nbsp;</td>
            <td class="fieldname">
                <span class=stp><bean:message key="label.security.asset.invoice.date"/></span></td>
            <td><html:text property="invoiceDate" readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
                     onclick="showCalendar('invoiceDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                     onmouseout="MM_swapImgRestore()"/>&nbsp;
            <html:errors property="invoiceDate"/></td>
		</tr>
		--><!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname"><bean:message key="label.security.invoice.no"/></td>
			<td><html:text property="invoiceNo" maxlength="50" />
				<html:errors property="invoiceNo"/> </td>
			<td class="fieldname">&nbsp;</td>
			<td>&nbsp;</td>
		</tr>		
		--><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    <td class="fieldname">
		        <span class="fieldname"><bean:message key="label.security.asset.make"/></span>&nbsp;</td>
		        <td><html:text property="brand" maxlength="15" onchange="refreshModel(this)"/> &nbsp; </td>
		<%--	<td><html:select property="brand" onchange="refreshModel(this)">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.VEHICLE_BRAND%>" />
					<%--<option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="brandID" labelName="brandValue"/> 
                </html:select>&nbsp;<html:errors property="brand"/></td>     --%>
			<td class="fieldname">
		        <span class="fieldname"><bean:message key="label.security.asset.model"/></span>&nbsp;
</td>

      <td><html:text property="modelNo" maxlength="15"/> &nbsp; </td>
		<%-- 	<td><html:select property="modelNo" >
					<logic:notEmpty name="AssetSpecVehiclesForm" property="brand">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.ASSET_MODEL_TYPE%>" refEntryCode="<%=form.getBrand()%>" />
					</logic:notEmpty>
					<logic:empty name="AssetSpecVehiclesForm" property="brand">
						<option label="Please Select" value="" />
					</logic:empty>
					<%--<option value=""><bean:message key="label.please.select"/></option>
                    <html:options collection="modelOptions" property="value" labelProperty="label"/> 
                </html:select>&nbsp;<html:errors property="modelNo"/></td>    --%>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<span class="fieldname"><bean:message key="label.security.asset.yearofmanufacture"/></span>&nbsp;
</td>
		    <td><%--<html:text property="yearMfg" maxlength="4"/>--%>
		    	<html:select property="yearMfg" >
					<option value=""><bean:message key="label.please.select"/></option>
                    <html:options collection="yearOfManufactureOptions" property="value" labelProperty="label"/>
		    	</html:select>
		    	<html:errors property="yearMfg"/></td>
            <td class="fieldname"><bean:message key="label.security.asset.price.list"/>
			&nbsp;<span></span></td>
            <td><html:text property="plist" maxlength="15" size="23" styleId="plist" onblur="javascript:formatAmountAsCommaSeparated(this)"/> &nbsp; <html:errors property="plistError"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="fieldname">
                <span class="fieldname"><bean:message key="label.security.asset.vehicletype"/></span>&nbsp;</td>
            <td><html:select property="assetType">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="assetTypeID" labelName="assetTypeValue"/>
                </html:select>&nbsp;<html:errors property="assetType"/></td>
			<td class="fieldname">
				<span class="fieldname"><bean:message key="label.security.asset.purchase.price"/></span>
				&nbsp;</td>
		    <td><html:text property="purchasePrice" styleId="purchasePrice" onblur="javascript:formatAmountAsCommaSeparated(this)"/><html:errors property="purchasePriceError"/></td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="fieldname">
                <span class="fieldname"><bean:message key="label.security.asset.purchase.date"/></span> </td>
            <td><html:text property="datePurchase" readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
                     onclick="showCalendar('datePurchase', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                     onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="datePurchaseError"/></td>
                     <td class="fieldname">
		       <bean:message key="label.security.asset.transmission.type"/>&nbsp;</td>
			<td><html:select property="transType">
					<option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="transTypeID" labelName="transTypeValue"/>
                </html:select>&nbsp;</td>
		</tr>
		

		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		
		<td class="fieldname">
               <bean:message key="label.security.asset.energy.source"/>&nbsp;</td>
            <td><html:select property="energySource">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="energySourceID" labelName="energySourceValue"/>
                </html:select>&nbsp;</td>
                
                <td class="fieldname">
               <span class="fieldname"><bean:message key="label.security.asset.color"/></span>&nbsp;</td>
            <td><html:text property="vehColor"/>&nbsp;<html:errors property="vehColorError"/></td>
			
			
		</tr><!--
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
		       <bean:message key="label.security.asset.engine.capacity"/>&nbsp;</td>
		    <td><html:text property="engineCapacity"/>&nbsp;<html:errors property="engineCapacity"/></td>
            
			
			<td class="fieldname">
		        <span class = stp><bean:message key="label.security.asset.ehak.milik.number"/></span>&nbsp;</td>
		    <td><html:text property="EHakMilikNumber" maxlength="16"></html:text>&nbsp;<html:errors property="EHakMilikNumber"/></td>
            
		</tr>-->
				
		<!--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
		        <span class = stp><bean:message key="label.security.asset.downpayment.tradein"/></span>&nbsp;</td>
		    <td><html:text property="dptradein" onchange="setTradeInDepositValue();" />&nbsp;<html:errors property="dptradein"/></td>
			<td class="fieldname">
		        <span class = stp><bean:message key="label.security.asset.downpayment.cash"/></span>&nbsp;</td>
		    <td><html:text property="dpcash"/>&nbsp;<html:errors property="dpcash"/></td>
		</tr>

		--><html:hidden property="ownershipClaimNumber"/>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		
		<td class="fieldname">
		        <span class="fieldname"><bean:message key="label.security.asset.public.transport"/></span>&nbsp;</td>
		         <td><html:radio property="pubTransport" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/></html:radio>&nbsp
				<html:radio property="pubTransport" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/></html:radio>&nbsp; <html:errors property="pubTransport"/></td>
	
			<!--<td class="fieldname">
		        <span class = stp><bean:message key="label.security.asset.yard.options"/></span></td>
		    <td><html:radio property="yardOptions" value="<%=ICMSConstant.YARD_YARD%>">Yard</html:radio>&nbsp;
				<html:radio property="yardOptions" value="<%=ICMSConstant.YARD_WAREHOUSE%>">Warehouse</html:radio>&nbsp;
				<html:radio property="yardOptions" value="<%=ICMSConstant.YARD_STORE%>">Store</html:radio>&nbsp; </td>
			--><td class="fieldname">
		        <bean:message key="label.security.asset.horse.power"/>&nbsp;</td>
		         <td><html:text property="horsePower" maxlength="15"/>&nbsp;</td>
				</tr>
				
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		          <td class="fieldname">
                  <bean:message key="label.security.asset.heavyvehicle.type"/>&nbsp;</td>
                  <td colspan="3"><html:text property="heavyvehicle" maxlength="15"/>&nbsp;</td>
			       
				</tr>
				
				
		</tbody>
				<!--
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
		        <span class = stp><bean:message key="label.security.asset.date.chattel.sold"/></span>&nbsp;</td>
		    <td><html:text property="chattelSoldDate" readonly="true" size="15" maxlength="11"/>
		        <img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
		             onclick="showCalendar('chattelSoldDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
		             onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="chattelSoldDate"/></td>
			<td class="fieldname">
		        <span class = stp><bean:message key="label.security.asset.rl.serialno"/></span>&nbsp;</td>
		    <td><html:text property="rlSerialNumber"/>&nbsp;</td>
		</tr>
		
		--></table>
		</td>
	</tr>
  </tbody>
</table>

<script type="text/javascript">
<!--
	pbrPbtIndicator = document.getElementById('pbtIndicator');
	checkPbrPbtPeriod(pbrPbtIndicator.options[pbrPbtIndicator.selectedIndex].value);
-->
</script>