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
    String subtype = "PropCommGeneral";
    String prefix = "Property";      
    String formName = subtype+"Form";    
	String formActionName = subtype+"Collateral.do";
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ include file="/collateral/property/viewCommonPropPrevVal2.jsp" %> 
