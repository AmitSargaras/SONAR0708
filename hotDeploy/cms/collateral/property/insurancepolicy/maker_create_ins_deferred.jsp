
<%@ page import="	com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
					com.integrosys.cms.app.collateral.bus.ICollateral "%>
					<%-- ,com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle" --%>

<%
	String formStr = "PropertyInsurancePolicyForm";
	String actionNameStr = "PropertyInsurancePolicy.do";
	
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj");
    ICollateral iCol = (ICollateral) itrxValue.getStagingCollateral();
	String getSubtypeCode = iCol.getCollateralSubType().getSubTypeCode();
	
	request.setAttribute("getSubtypeCode",getSubtypeCode);
	String prefix1 = "Property";
%>
<%@ include file="/collateral/insurancepolicy/maker_create_ins_deferred.jsp"%>



