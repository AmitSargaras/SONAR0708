
<%@ page import="	com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
					com.integrosys.cms.app.collateral.bus.ICollateral,
                    com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargevehicle.ISpecificChargeVehicle"%>

<%
	String formStr = "AssetInsurancePolicyForm";
	String actionNameStr = "AssetInsurancePolicy.do";
	
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    ICollateral iCol = (ICollateral) itrxValue.getStagingCollateral();
	String getSubtypeCode = iCol.getCollateralSubType().getSubTypeCode();
	
	request.setAttribute("getSubtypeCode",getSubtypeCode);
	String prefix1 = "Asset";
%>
<%@ include file="/collateral/insurancepolicy/maker_update_ins_deferred.jsp"%>



