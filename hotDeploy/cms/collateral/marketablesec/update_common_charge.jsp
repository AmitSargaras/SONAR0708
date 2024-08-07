   
   <input type="hidden" name="subTypeValue" value="<%=subtype%>"/>
   <html:hidden property="chargeId"/>
   
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td  class="fieldname"><bean:message key="label.security.date.legal.charge"/>&nbsp;</td>
		<td><html:text property="legalChargeDate" readonly="true" size="15" maxlength="11" />
			<img src="img/calendara.gif"  
	      	   name="Image723" border="0" id="Image723" 
	      	   onclick="return showCalendar('legalChargeDate', 'dd/mm/y')" 
	      	   onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" 
	      	   onmouseout="MM_swapImgRestore()" />
		    <html:errors property="legalChargeDate"/></td>
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.charge.type"/></span>&nbsp;
			<span class="mandatory">*</span></td>               
		<td><html:select property="chargeType">
				<option value="" ><bean:message key="label.please.select"/> </option>
				<html:options name="chargeID" labelName="chargeValue"/>
            </html:select>
			<html:errors property="chargeType"/></td>
    </tr>
	
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.capped.price"/></span></td>
		<td><html:text property="cappedPrice"/>&nbsp;<html:errors property="cappedPrice"/></td>
	<% if (!subtype.equals("MarksecBondLocal")) { %>			
		<td class="fieldname">&nbsp;</td>
		<td>&nbsp;</td>
	<% } else { %>
		<td class="fieldname">
			<span class=stp><bean:message key="label.security.interest.rate"/></span>&nbsp;<span class="mandatory">*</span></td>
		<td><html:text property="interestRate"/>&nbsp;<html:errors property="interestRate"/></td>
	<% } %>
	</tr>

	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname"><bean:message key="label.security.amount.charge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>       
		<td>
			<html:text property="amtCharge" size="15" maxlength="15" />&nbsp;
			<html:errors property="amtCharge"/></td>
		<td class="fieldname">
			<span class = stp><bean:message key="label.security.maturity.date"/></span>&nbsp;
			<span id="mandPerfMaturityDate" style="visibility:hidden" ></span>
			<% if ("MarksecBill".equals(subtype) || "MarksecNonListedLocal".equals(subtype) ||
					"MarksecBondLocal".equals(subtype)|| "MarksecBondForeign".equals(subtype)) { %>
			<span class="mandatory"  >*</span>
			<%} %>
			</td>
		<td><html:text property="collateralMaturityDate"  readonly="true" />
			<img src="img/calendara.gif"  
	      	   name="Image723" border="0" id="Image723" 
	      	   onclick="return showCalendar('collateralMaturityDate', 'dd/mm/y')" 
	      	   onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" 
	      	   onmouseout="MM_swapImgRestore()" />
			<html:errors property="collateralMaturityDate"/></td>
		
    </tr>
	
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">
			<bean:message key="label.security.nature.charge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
		<td colspan="3">
			<html:select property="natureOfCharge">
				<option value="" ><bean:message key="label.please.select"/> </option>
				<html:options name="natureOfChargeID" labelName="natureOfChargeValue"/>
            </html:select>
			<html:errors property="natureOfCharge"/></td>
	</tr>
	