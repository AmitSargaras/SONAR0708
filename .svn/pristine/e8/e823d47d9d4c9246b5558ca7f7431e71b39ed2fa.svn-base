<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resluxury.IResidentialLuxury,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.collateral.property.*,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.*"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propreslux/PropResLux_read_helper.jsp,v 1.62 2006/09/22 11:35:05 nkumar Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Property, Subtype - Residential Luxury
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.62 $
* Date: $Date: 2006/09/22 11:35:05 $
* Tag: $Name:  $
*/
%>
<%
    IResidentialLuxury oldCollateral = (IResidentialLuxury) itrxValue.getCollateral();
    IResidentialLuxury newCollateral = (IResidentialLuxury) itrxValue.getStagingCollateral();

    String subtype = "PropResLux";
    String prefix = "Property";        
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ include file="/collateral/property/view_common_property.jsp" %>    