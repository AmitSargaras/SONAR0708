<%@ page
	import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.CoverageTypeList,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.VehicleTypeList,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Arrays,
                 java.util.Comparator,
			 	 com.integrosys.cms.ui.common.CommonCodeList,
		 		 com.integrosys.base.techinfra.diff.CompareOBUtil,
		 		 java.util.List,
				 java.util.ArrayList,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>

<%
	ISpecificChargeVehicle oldCollateral = (ISpecificChargeVehicle) itrxValue.getCollateral();
	ISpecificChargeVehicle newCollateral = (ISpecificChargeVehicle) itrxValue.getStagingCollateral();

	String subtype = "AssetSpecVehicles";
	String prefix = "Asset";
	String formName = subtype + "Form";
	String formActionName = subtype + "Collateral.do";

	AssetSpecVehiclesForm colForm = (AssetSpecVehiclesForm) request.getAttribute(formName);
%>

<script type="text/javascript">
	function dispNonMandatoryField() {
		document.getElementById('disp1').style.display = '';
	}
	function hideNonMandatoryField() {
		document.getElementById('disp1').style.display = 'none';
	}
	function dispNonMandatoryField2() {
		document.getElementById('disp2').style.display = '';
	}
	function hideNonMandatoryField2() {
		document.getElementById('disp2').style.display = 'none';
	}
	<!--
//-->
</script>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page
	import="com.integrosys.cms.ui.collateral.assetbased.assetspecvehicles.AssetSpecVehiclesForm"%><tbody>
	<tr>
		<td colspan="2">
			<table width="98%" border="0" cellpadding="0" cellspacing="0"
				class="tblInfo" align="center">
				<tbody>
					<%@ include
						file="/collateral/common/view_basic_security_fields.jsp"%>
				</tbody>
			</table>
		</td>
	</tr>
	
	
	<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
<%if("process".equals(from_event)){ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%} %>

<!--End by Pramod Katkar-->
</tbody>
</table>












	<!--End by Pramod Katkar-->
</tbody>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
<%@ include file="/collateral/common/view_common_cersai_fields.jsp"%>

<table class="tblFormSection" width="98%" border="0" align="center"
	cellpadding="0" cellspacing="0" style="margin-top: 10px">
	<thead>
		<tr>
			<td>
				<h3>
					<bean:message key="title.vehicle.information" />
				</h3>
			</td>
		</tr>
		<tr>
			<td>
				<hr />
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">

					<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
						<td width="20%"
							class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "registrationNo") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
							<bean:message key="label.security.asset.registration.no" />
						</td>
						<td width="30%"><integro:empty-if-null
								value="<%=iCol.getRegistrationNo()%>" />&nbsp;</td>
						<td width="20%"
							class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "pbtPbrPeriodDays") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
							<bean:message key="label.security.asset.logbook.no" />
						</td>
						<td width="30%"><integro:empty-if-null
								value="<%=iCol.getLogBookNumber()%>" /> &nbsp;</td>
					</tr>

					<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
						<td
							class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "registrationDate") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
							<bean:message key="label.security.asset.registration.date" />
						</td>
						<td><integro:date object="<%=iCol.getRegistrationDate()%>" />&nbsp;</td>
						<td
							class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "startDate") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
							Start Date&nbsp;</td>
						<td><integro:date object="<%=iCol.getStartDate()%>" />&nbsp;</td>


					</tr>

					<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
						<td
							class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "chassisNumber") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
							<bean:message key="label.security.asset.chassisno" />
						</td>
						<td><integro:empty-if-null
								value="<%=iCol.getChassisNumber()%>" />&nbsp;</td>
						<td
							class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "engineNo") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
							<bean:message key="label.security.asset.engine.no" />
						</td>
						<td><integro:empty-if-null value="<%=iCol.getEngineNo()%>" />&nbsp;</td>
					</tr>

					<tr>
						<td
							class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "startDate") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
							Ram Id</td>
						<td colspan="3"><integro:empty-if-null
								value="<%=iCol.getRamId()%>" />&nbsp;</td>
					</tr>

					<tr class="odd">
						<td colspan="4" align="right" class="amount"><input
							onclick="javascript : dispNonMandatoryField()" name="AddNew12"
							type="button" id="AddNew12" value="Additional Details"
							class="btnNormal" /><input
							onclick="javascript : hideNonMandatoryField()" name="AddNew13"
							type="button" id="AddNew13" value="Hide Additional Details"
							class="btnNormal" /></td>
					</tr>


					<tbody id="disp1" style="display: none;">
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td width="20%"
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "goodStatus") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.asset.goods.status" />
							</td>
							<td colspan="3" width="30%"><integro:empty-if-null
									value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.GOODS_STATUS,
					iCol.getGoodStatus())%>" />
								&nbsp;</td>
						</tr>
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "brand") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<span class=stp> <bean:message
										key="label.security.asset.make" /></span>
							</td>
							<td><integro:empty-if-null value="<%=iCol.getBrand()%>" />

								<%-- 
					<integro:empty-if-null
						value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_BRAND, iCol.getBrand())%>" />
					--%> &nbsp;</td>
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "modelNo") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<span class=stp> <bean:message
										key="label.security.asset.model" /></span>&nbsp;
							</td>
							<td><integro:empty-if-null value="<%=iCol.getModelNo()%>" />

								<%--
					<integro:empty-if-null
						value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ASSET_MODEL_TYPE, iCol.getModelNo())%>" />
					 --%> &nbsp;</td>

						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "yearOfManufacture") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
								<span class=stp> <bean:message
										key="label.security.asset.yearofmanufacture" /></span>
							</td>
							<td><bean:write name="AssetSpecVehiclesForm"
									property="yearMfg" />&nbsp;
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "plist") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.asset.price.list" />&nbsp;
							</td>
							<td>
								<%
									AssetSpecVehiclesForm aForm1 = new AssetSpecVehiclesForm();
									if (iCol.getPlist() != null) {

										aForm1.setPlist(String.valueOf(iCol.getPlist().getAmount()));
								%> <integro:empty-if-null
									value="<%=UIUtil.formatWithCommaAndDecimal(aForm1.getPlist())%>" />&nbsp;
							</td>
							<%
								}
							%>&nbsp;
							</td>





						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">

							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "assetType") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<span class=stp> <bean:message
										key="label.security.asset.vehicletype" /></span>
							</td>
							<td><integro:empty-if-null
									value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_TYPE,
					iCol.getAssetType())%>" />
								&nbsp;</td>
							<td
								class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "purchasePrice") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
								<span class=stp> <bean:message
										key="label.security.asset.purchase.price" />&nbsp;
							</span>
							</td>

							<td>
								<%
									AssetSpecVehiclesForm aForm2 = new AssetSpecVehiclesForm();
									if (iCol.getPurchasePrice() != null) {

										aForm2.setPurchasePrice(String.valueOf(iCol.getPurchasePrice().getAmount()));
								%> <integro:empty-if-null
									value="<%=UIUtil.formatWithCommaAndDecimal(aForm2.getPurchasePrice())%>" />&nbsp;
							</td>
							<%
								}
							%>&nbsp;
							</td>

						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "purchaseDate") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
								<span class=stp> <bean:message
										key="label.security.asset.purchase.date" /></span>
							</td>
							<td><integro:date object="<%=iCol.getPurchaseDate()%>" />&nbsp;</td>
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "transType") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.asset.transmission.type" />&nbsp;
							</td>
							<td><integro:empty-if-null
									value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.TRANSMISSION_TYPE,
					iCol.getTransType())%>" />&nbsp;</td>
						</tr>


						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "energySource") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
								<bean:message key="label.security.asset.energy.source" />&nbsp;
							</td>
							<td><integro:empty-if-null
									value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ENERGY_SOURCE,
					iCol.getEnergySource())%>" />&nbsp;</td>

							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "vehColor") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.asset.color" />&nbsp;
							</td>
							<td colspan="3"><integro:empty-if-null
									value="<%=iCol.getVehColor()%>" />&nbsp;</td>



						</tr>
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess ? (CompareOBUtil.compOB(newCollateral, oldCollateral, "pubTransport") ? "fieldname"
					: "fieldnamediff") : "fieldname"%>">
								<bean:message key="label.security.asset.public.transport" />&nbsp;
							</td>
							<td>
								<%
									if (iCol.getPubTransport() != null && iCol.getPubTransport().equals("Y")) {
								%>
								Yes &nbsp;&nbsp; <%
 	} else if (iCol.getPubTransport() != null && iCol.getPubTransport().equals("N")) {
 %>
								No &nbsp;&nbsp; <%
 	} else {
 %> &nbsp;&nbsp; <%
 	}
 %>
							</td>
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "vehColor") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.asset.horse.power" />&nbsp;
							</td>
							<td colspan="3"><integro:empty-if-null
									value="<%=iCol.getHorsePower()%>" />&nbsp;</td>

						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "vehColor") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.asset.heavyvehicle.type" />&nbsp;
							</td>
							<td colspan="3"><integro:empty-if-null
									value="<%=iCol.getHeavyvehicle()%>" />&nbsp;</td>
						</tr>



						<%--
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td
						class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"startDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					Asset value at the time of collateral booking &nbsp;</td>
					<td><integro:empty-if-null
						value="<%=iCol.getAssetCollateralBookingVal()%>" />&nbsp;</td>
					<td
						class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"startDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp> Description of assets </span>&nbsp;</td>
					<td><integro:empty-if-null
						value="<%=iCol.getDescriptionAssets()%>" />&nbsp;</td>

				</tr>
				<%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp"%>
--%>

					</tbody>

				</table>
			</td>
		</tr>
	</tbody>


</table>


<table class="tblFormSection" width="98%" border="0" align="center"
	cellpadding="0" cellspacing="0" style="margin-top: 10px">
	<thead>
		<tr>
			<td>
				<h3>
					<bean:message key="title.other.vehicle.information" />
				</h3>
			</td>
		</tr>
		<tr>
			<td>
				<hr />
			</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">


					<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
						<td class="fieldname"><bean:message
								key="label.security.maturity.date" /></td>
						<td colspan="3"><integro:date
								object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
					</tr>
					<tr class="odd">
						<td colspan="4" class="amount"><input
							onclick="javascript : dispNonMandatoryField2()" name="AddNew22"
							type="button" id="AddNew22" value="Additional Details"
							class="btnNormal" />&nbsp;<input
							onclick="javascript : hideNonMandatoryField2()" name="AddNew23"
							type="button" id="AddNew23" value="Hide Additional Details"
							class="btnNormal" /></td>
					</tr>
					<tbody id="disp2" style="display: none;">
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname"><span class="fieldname"><bean:message
										key="label.security.asset.residual.scrap.value" /></span></td>
							<td colspan="3"><integro:empty-if-null
									value="<%=iCol.getScrapValue() != null
					? UIUtil.formatWithCommaAndDecimal(String.valueOf(iCol.getScrapValue().getAmount()))
					: null%>" />&nbsp;</td>
						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td width="20%"
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "isPhysicalInspection") ? "fieldname"
							: "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.phy.verification" />&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%>
							<td width="30%"><integro:boolean-display style="yn"
									value="<%=iCol.getIsPhysicalInspection()%>" />&nbsp;</td>
							<%
								boolean physicalUpdated = false;
								if (isProcess) {
									physicalUpdated = CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreq")
											|| (iCol.getPhysicalInspectionFreq() < 0);
									physicalUpdated = physicalUpdated
											&& CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreqUnit");
								}
							%>
							<td
								class="<%=isProcess ? (physicalUpdated ? "fieldname" : "fieldnamediff") : "fieldname"%>">
								<bean:message key="label.security.phy.verification.frequency" />
								<%
									if (iCol.getIsPhysicalInspection()) {
								%> &nbsp;<%--<span class="mandatory">*</span>
        --%>
								<%
									}
								%>
							</td>
							<td>
								<%
									if (iCol.getPhysicalInspectionFreqUnit() != null) {
								%> <integro:common-code-single
									entryCode="<%=iCol.getPhysicalInspectionFreqUnit()%>"
									display="true"
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" /> <%
 	}
 %> &nbsp;
							</td>
						</tr>


						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "lastPhysicalInspectDate") ? "fieldname"
							: "fieldnamediff")
					: "fieldname"%>">
								<bean:message key="label.security.last.phy.verification.date" />
								<%
									if (iCol.getIsPhysicalInspection()) {
								%> &nbsp;<%--<span class="mandatory">*</span>
        --%>
								<%
									}
								%>
							</td>
							<td><integro:date
									object="<%=iCol.getLastPhysicalInspectDate()%>" />&nbsp;</td>
							<td class="fieldname"><bean:message
									key="label.security.next.phy.verification.date" /></td>
							<td><integro:date
									object="<%=iCol.getNextPhysicalInspectDate()%>" />&nbsp;</td>
						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname"><bean:message
									key="label.security.env.liability" /></td>
							<td width="30%"><integro:empty-if-null
									value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ENV_RISK_STATUS,
					iCol.getEnvRiskyStatus())%>" />
								&nbsp;</td>

							<td class="fieldname"><bean:message
									key="label.security.date.sec.confirm.env.risk" />&nbsp;</td>
							<td><integro:date object="<%=iCol.getEnvRiskyDate()%>" />&nbsp;

							</td>
						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname">Asset value at the time of collateral
								booking</td>
							<td><integro:empty-if-null
									value="<%=iCol.getAssetCollateralBookingVal() != null
					? UIUtil.formatWithComma(String.valueOf(iCol.getAssetCollateralBookingVal()))
					: null%>" />&nbsp;</td>
							<td class="fieldname">Description of assets</td>

							<td><integro:empty-if-null
									value="<%=iCol.getDescriptionAssets()%>" />&nbsp;</td>

						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td
								class="<%=isProcess
					? (CompareOBUtil.compOB(newCollateral, oldCollateral, "vehColor") ? "fieldname" : "fieldnamediff")
					: "fieldname"%>">
								Remarks&nbsp;</td>
							<td colspan="3"><integro:empty-if-null
									value="<%=iCol.getRemarks()%>" />&nbsp;</td>
						</tr>

					</tbody>

				</table>
			</td>
		</tr>
	</tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center"
	cellpadding="0" cellspacing="0" style="margin-top: 10px">
	<!--
	<thead>
		
    <tr>
      <td> <h3>  <bean:message key="title.other.vehicle.information"/></h3></td>
    </tr>
   
		<tr>
			<td>
			<hr />
			</td>
		</tr>
	</thead>
	 -->
	<tbody>
		<tr>
			<%--<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <%@ include file="/collateral/common/common_physical_inspection_read.jsp" %>
		<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
		</tr>
		</table>
		
		
		
		</table>
	</td>--%>
		</tr>
	</tbody>
</table>

<%--<%@ include file="/collateral/assetbased/trade_in_info_view.jsp" %> --%>



<%@ include
	file="/collateral/insurancepolicy/view_insurance_summary.jsp"%>

<jsp:include page="/collateral/view_security_coverage.jsp" />

<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>

<%-- 
<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>


<%@ include file="/collateral/assetbased/view_charge_summary.jsp" %>
 View three valuation details
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>    --%>
