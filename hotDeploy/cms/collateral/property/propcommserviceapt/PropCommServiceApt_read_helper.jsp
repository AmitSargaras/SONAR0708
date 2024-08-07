<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.app.collateral.bus.type.property.subtype.comshophouse.ICommercialShopHouse,
				 com.integrosys.cms.app.collateral.bus.*,
				 com.integrosys.cms.ui.common.CountryList,
				 com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.cms.ui.collateral.property.*,
				 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 java.util.*" %>
<%@ page
		import="com.integrosys.cms.app.collateral.bus.type.property.subtype.serviceapartment.ICommercialServiceApartment" %>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue" %>
<%@ page import="com.integrosys.cms.ui.collateral.*"%>

<%
	/**
	 * Copyright Integro Technologies Pte Ltd
	 * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propcommshop/PropCommShop_read_helper.jsp,v 1.63 2006/09/22 11:34:40 nkumar Exp $
	 *
	 * Purpose: Helper page to display data for read and process
	 * Description: Type - Property, Subtype - Commercial Shop House
	 *
	 * @author $Author: nkumar $<br>
	 * @version $Revision: 1.63 $
	 * Date: $Date: 2006/09/22 11:34:40 $
	 * Tag: $Name:  $
	 */
%>
<%
	ICommercialServiceApartment oldCollateral = ( ICommercialServiceApartment ) itrxValue.getCollateral ();
	ICommercialServiceApartment newCollateral = ( ICommercialServiceApartment ) itrxValue.getStagingCollateral ();
	String subtype = "PropCommServiceApt";
	String prefix = "Property";
	String formName = subtype+"Form";	
	String formActionName = subtype+"Collateral.do";	
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ include file="/collateral/property/view_common_property.jsp" %>    
