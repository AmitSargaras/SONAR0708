<%				 
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/insurancepolicy/update_insurance_policy.jsp,v 1.1 2005/08/12 02:35:16 hshii Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hshii $<br>
* @version $Revision: 1.1 $
* Date: $Date: 2005/08/12 02:35:16 $
* Tag: $Name:  $
*/
%>

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
<%@ include file="/collateral/insurancepolicy/add_insurance.jsp"%>



