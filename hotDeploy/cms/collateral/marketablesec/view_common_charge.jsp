            <%
                ILimitCharge[] limit = iCol.getLimitCharges();
                ILimitCharge objLimit = null;
                if (limit != null && limit.length > 0) {
                    objLimit = limit[0];
                }
                ILimitCharge oldLimit = null;
                ILimitCharge newLimit = null;
                Amount oldChargeAmt = null;
                Amount newChargeAmt = null;
                if (isProcess) {
                    if (oldCollateral != null && 
                    		oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                        oldLimit = oldCollateral.getLimitCharges()[0];
                    }

                    if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                        newLimit = newCollateral.getLimitCharges()[0];
                    }
                    if (oldLimit != null) {
                        oldChargeAmt = oldLimit.getChargeAmount();
                    }
                    if(newLimit != null) {
                        newChargeAmt = newLimit.getChargeAmount();
                    }
                }
                boolean isLimitNull = (objLimit == null);				
				boolean changed = false;
		                
            %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.date.legal.charge"/>&nbsp;</td>
				<td><% if (!isLimitNull) { %>
						<integro:date object="<%=objLimit.getLegalChargeDate()%>" />
					<% } %> &nbsp; </td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.charge.type"/>&nbsp;<span class="mandatory">*</span></td>
				<td><% if (!isLimitNull) { %>
						<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
					<% } %>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cappedPrice")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.capped.price"/></span></td>
				<td><integro:amount param="amount" amount="<%=iCol.getCappedPrice()%>" decimal="2"/>&nbsp;</td>
			<% if (!subtype.equals("MarksecBondLocal")) { %>			
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			<% } else { %>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"interestRate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.interest.rate"/></span>&nbsp;<span class="mandatory">*</span></td>
				<td><% if (iCol.getInterestRate()!=-1) { %> <%=iCol.getInterestRate()%> <% } %>&nbsp;</td>
			<% } %>
			</tr>			

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">              
				<td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.amount.charge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td>
		            <%  if (isProcess) {
		                    if (newChargeAmt != null && oldChargeAmt == null) {
		                        if (newChargeAmt.getAmount() != 0) {
		                            changed = true;
		                        }
		                    } else if (newChargeAmt != null && oldChargeAmt != null) {
		                        changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount");
		                    }
		                }
		            %>
					<% if (!isLimitNull && objLimit.getChargeAmount() != null &&
						objLimit.getChargeAmount().getCurrencyCode()!= null) { %>
						<bean:write name="<%=formName%>" property="amtCharge"/>
					<% } %> &nbsp;</td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.maturity.date"/>&nbsp;
					<% if ("MarksecBill".equals(subtype) || "MarksecNonListedLocal".equals(subtype) ||
							"MarksecBondLocal".equals(subtype) || "MarksecBondForeign".equals(subtype)) { %>
					<span class="mandatory">*</span>
					<% } %>
					</td>
					<td><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">              
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
		            <bean:message key="label.security.nature.charge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <td colspan="3">
					<% if (!isLimitNull) { %>
						<integro:empty-if-null value="<%=NatureOfChargeList.getInstance().getNatureOfChargeItem(objLimit.getNatureOfCharge())%>"/>
	                <% } %> &nbsp; </td>
			</tr>