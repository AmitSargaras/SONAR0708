<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.industrial.IIndustrial,
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
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propindus/PropIndus_read_helper.jsp,v 1.63 2006/09/22 11:34:48 nkumar Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Property, Subtype - Industrial
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.63 $
* Date: $Date: 2006/09/22 11:34:48 $
* Tag: $Name:  $
*/
%>
<%
    IIndustrial oldCollateral = (IIndustrial) itrxValue.getCollateral();
    IIndustrial newCollateral = (IIndustrial) itrxValue.getStagingCollateral();
    String subtype = "PropIndus";
    String prefix = "Property";        
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";      
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ include file="/collateral/property/view_common_property.jsp" %> 