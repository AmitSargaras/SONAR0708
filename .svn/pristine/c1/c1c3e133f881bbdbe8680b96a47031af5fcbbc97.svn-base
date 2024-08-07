<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralForm,
				com.integrosys.cms.app.collateral.bus.ICollateral,
				org.apache.struts.action.ActionMapping" %>
<%
String insuranceCoverageAmount = UIUtil.removeComma(colForm.getCoverageAmount());
%> 

<script>
	function refreshCoveragePercentage(){
		var insuranceCoverageAmount = '<%=insuranceCoverageAmount%>';
		var adhocCoverageAmount = removeComma(document.getElementById("adHocCoverageAmount").value);
		
		var totalCoverageAmount = parseFloat(insuranceCoverageAmount)
		if(parseFloat(adhocCoverageAmount)>0){
			totalCoverageAmount = parseFloat(insuranceCoverageAmount)+ parseFloat(adhocCoverageAmount);
		}
		
		var totalPolicyAmt = '<%=totalPolicyAmt%>';
		
		var coveragePercent = (totalPolicyAmt>0 && totalCoverageAmount>0)? parseFloat((totalPolicyAmt/totalCoverageAmount)*100).toFixed(2):0;
		
		document.getElementById("coveragePercentage").value = coveragePercent;
	}
</script>

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
								<input type="text" name="coverageAmount" value="<%=colForm.getCoverageAmount()%>" disabled="disabled"
									onblur="formatAmountAsCommaSeparated(this)" />
								<html:hidden property="coverageAmount" />
								<html:errors property="coverageAmountError" />
							</td>
							
							<td width="20%" class="fieldname">Ad Hoc Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<input type="text" id="adHocCoverageAmount" name="adHocCoverageAmount" value="<%=colForm.getAdHocCoverageAmount()%>"  
									onblur="formatAmountAsCommaSeparated(this)" onchange="javascript:refreshCoveragePercentage();"/>
								<html:hidden property="adHocCoverageAmount" />
								<html:errors property="adhocCoverageAmountError" />
							</td>
							
						</tr>
						<tr>	
							<%-- <td width="20%" class="fieldname">Insurance Coverage %</td>
							<td width="30%" class="even">
								<input type="text" id="coveragePercentage" name="coveragePercentage" value="<%=colForm.getCoveragePercentage() %>" disabled="disabled"
									onblur="formatAmountAsCommaSeparated(this)"/>
								<html:hidden property="coveragePercentage" />
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
