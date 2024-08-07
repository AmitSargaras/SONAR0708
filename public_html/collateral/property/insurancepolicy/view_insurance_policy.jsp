<%				 
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/insurancepolicy/view_insurance_policy.jsp,v 1.2 2005/08/13 06:34:56 hshii Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hshii $<br>
* @version $Revision: 1.2 $
* Date: $Date: 2005/08/13 06:34:56 $
* Tag: $Name:  $
*/
%>

<%
	String prefix = "Property";
	String formStr = "PropertyInsurancePolicyForm";
	String actionNameStr = "PropertyInsurancePolicy.do";
	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.from_page");	
	String prefix1 = "Property";
%>
<%@ include file="/collateral/insurancepolicy/view_insurance_policy.jsp"%>
