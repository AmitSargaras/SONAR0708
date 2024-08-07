<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsForm" %>
<%

AssetGenChargeStockDetailsForm form = (AssetGenChargeStockDetailsForm) request.getAttribute("AssetGenChargeStockDetailsForm");
pageContext.setAttribute("AssetGenChargeStockDetailsForm", form);
%> 

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
		<tr>
			<td><h3>Security Coverage</h3></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><hr /></td>
		</tr>
		<tr>
			<td>
				<table width="100%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td width="20%" class="fieldname">Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<input type="text" name="coverageAmount" value="<%=form.getCoverageAmount()%>" disabled="disabled"
									onblur="formatAmountAsCommaSeparated(this)" />
								<html:hidden name="AssetGenChargeStockDetailsForm" property="coverageAmount" />
								<html:errors property="coverageAmountError" />
							</td>
							<td width="20%" class="fieldname">Ad Hoc Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<input type="text" name="adHocCoverageAmount" value="<%=form.getAdHocCoverageAmount() %>" 
									onblur="formatAmountAsCommaSeparated(this)"/>
								<html:hidden name="AssetGenChargeStockDetailsForm" property="adHocCoverageAmount" />
								<html:errors property="adHocCoverageAmountError" />
							</td>
						</tr>
						
						<tr>	
							<%-- <td width="20%" class="fieldname">Insurance Coverage %</td>
							<td width="30%" class="even">
								<input type="text" name="coveragePercentage" value="<%=form.getCoveragePercentage() %>" disabled="disabled"
									onblur="formatAmountAsCommaSeparated(this)"/>
								<html:hidden name="AssetGenChargeStockDetailsForm" property="coveragePercentage" />
								<html:errors property="coveragePercentageError" />
							</td> --%>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<br><br>
