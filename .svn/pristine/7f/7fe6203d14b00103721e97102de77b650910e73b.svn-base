<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.IAgricultural,
                 com.integrosys.cms.app.collateral.bus.*,
                 java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.property.*,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Arrays,
                 java.util.Comparator"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propagri/PropAgri_read_helper.jsp,v 1.65 2006/09/22 11:34:24 nkumar Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Property, Subtype - Agricultural
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.65 $
* Date: $Date: 2006/09/22 11:34:24 $
* Tag: $Name:  $
*/
%>

<%
    IAgricultural oldCollateral = (IAgricultural) itrxValue.getCollateral();
    IAgricultural newCollateral = (IAgricultural) itrxValue.getStagingCollateral();
    String subtype = "PropAgri";
    String prefix = "Property";          
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ include file="/collateral/property/view_common_property.jsp" %> 

