<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsForm,
				com.integrosys.base.techinfra.diff.CompareOBUtil,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.app.collateral.bus.ICollateral,
				com.integrosys.base.uiinfra.common.ICommonEventConstant,
				org.apache.struts.action.ActionMapping" %>

<%

AssetGenChargeStockDetailsForm form = (AssetGenChargeStockDetailsForm) request.getAttribute("AssetGenChargeStockDetailsForm");

String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(ipinPath+".serviceColObj");

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
							<td width="20" class="fieldname">Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<%=form.getCoverageAmount() %>
							</td>
							<td width="20%" class="fieldname">Ad Hoc Insurance Coverage Amount (INR)</td>
							<td width="30%" class="even">
								<%=form.getAdHocCoverageAmount() %>
							</td>
						</tr>
						<tr>
							<%-- <td width="20" class="fieldname">Insurance Coverage %</td>
							<td width="30%" class="even">
								<%=form.getCoveragePercentage() %>
							</td> --%>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>
<br><br>
