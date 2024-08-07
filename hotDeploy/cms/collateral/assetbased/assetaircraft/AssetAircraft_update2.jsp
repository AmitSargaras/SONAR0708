<%--This file is using for  Specific charge instead of Aircraft --%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetaircraft.AssetAircraftForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    int rowIdx = Integer.parseInt(request.getParameter("rowIdx"));
    String formName = request.getParameter("formName");
%>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			        <td class="fieldname">
					<span class=stp>Description of assets.</span></td>
			        <td colspan="3">
			        <html:textarea property="description" rows="5" style="width:100%"/>&nbsp;
			        <html:errors property="description"/></td>
			</tr>