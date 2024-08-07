
<%@page import="com.integrosys.cms.ui.collateral.CollateralForm"%>
<%@page import="com.integrosys.cms.ui.collateral.property.propcommgeneral.PropCommGeneralForm"%><%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.comgeneral.ICommercialGeneral,
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
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propcommgeneral/PropCommGeneral_read_helper.jsp,v 1.62 2006/09/22 11:34:32 nkumar Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Property, Subtype - General Commercial
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.62 $
* Date: $Date: 2006/09/22 11:34:32 $
* Tag: $Name:  $
*/
%>

<%
    ICommercialGeneral oldCollateral = (ICommercialGeneral) itrxValue.getCollateral();
    ICommercialGeneral newCollateral = (ICommercialGeneral) itrxValue.getStagingCollateral();
    String subtype = "PropCommGeneral";
    String prefix = "Property";      
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
	
	PropCommGeneralForm colForm = (PropCommGeneralForm) request.getAttribute(formName);
	System.out.println(">>>>>>>>>>>>from_event 1 >>>>>>>>>>>>>>"+from_event);
	//System.out.println(">>>>>>>>>>>>newCollateral>>>>>>>>>>>>>>"+newCollateral.getCommonRevalFreq());
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/property/view_common_propertyVal.jsp" %> 
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<script>
	dispAmtInWords();
</script>