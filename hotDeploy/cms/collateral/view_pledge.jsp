<%@ page import="com.integrosys.cms.app.limit.bus.ILimit" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralHelper" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.PropertiesConstantHelper"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.IAssetBasedCollateral" %>

<%
	if (!PropertiesConstantHelper.isSTPRequired() ||
			(PropertiesConstantHelper.isSTPRequired() && 
			PropertiesConstantHelper.isValidSTPSystem(iCol.getSourceId()) &&
			PropertiesConstantHelper.isValidSTPCollateralLoadingSystesm(iCol.getSourceId()))) {

			ILimitProfile limitprofile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
			if (limitprofile != null && PropertiesConstantHelper.isValidSTPCollateralLoadingApplicationType(limitprofile.getApplicationType())) {			
%>

<%
	ICollateralLimitMap[] collateralLimitMap = iCol.getCollateralLimits();
	
	List listOfCollateralLimitMapToBeDisplayed = new ArrayList();
	for (int i=0; (collateralLimitMap != null) && i < collateralLimitMap.length; i++) {
		ICollateralLimitMap map = collateralLimitMap[i];
		if (!ICMSConstant.HOST_STATUS_DELETE.equals(map.getSCIStatus())) {
			listOfCollateralLimitMapToBeDisplayed.add(map);
		}
	}
	
	String[] style = {"even", "odd"};

	if (!listOfCollateralLimitMapToBeDisplayed.isEmpty()) {
    	pageContext.setAttribute("limitList", listOfCollateralLimitMapToBeDisplayed.toArray(new ICollateralLimitMap[0]));
	}
%>
<input type="hidden" name="index"/>
<input type="hidden" name="limitId"/>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
		<td> <h3><bean:message key="label.facility.pledge.title"/></h3></td>
		<td align="right" valign="baseline">
			<input class="btnNormal" type="button" name="Submit2222" value="Add New" onclick="javascript:submitData(12, -1, '<%= limitprofile.getApplicationType()%>', '<%=iCol.getCollateralType().getTypeCode() %>')"/>
			&nbsp; <input name="Submit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitData(13, 0)"/>
		</td>
		</tr>
		<tr>
		<td colspan="2"><hr/></td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td colspan="2">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td width="5%"><bean:message key="label.global.sn"/></td>
				<td width="20%"><bean:message key="label.facility.id"/></td>
				<td width="20%"><bean:message key="label.facility.sibs.id"/></td>
				<td width="25%"><bean:message key="label.facility.description"/></td>
				<td width="15%"><bean:message key="label.global.action"/></td>
				<td width="15%"><bean:message key="label.global.delete"/></td>
				</tr>
			</thead>
			<tbody>	
				<logic:empty name="limitList">
					<tr class="odd">
					<td colspan="6"><bean:message key="label.pledge.info.none" /></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="limitList">
					<logic:iterate id="limitPledge" name="limitList" type="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap" indexId="indexId">
						<tr class="<%=style[rowIdx++%2] %>">
						<td class="index"><%=indexId.intValue() + 1 %> </td>
						<td><%=limitPledge.getLimitID() %>&nbsp;</td>
						<td><%=CollateralHelper.getDisplayColLimitMapLimitID(limitPledge) %>&nbsp;</td>
						<td><integro:common-code categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=CollateralHelper.getFacilityDescription(limitPledge)%>" display="true"/>&nbsp;</td>
						<td><a href="javascript:submitData(14,'<%=limitPledge.getLimitID()%>')"><bean:message key="label.edit"/></a></td>
						<td style="text-align: center;"><html:checkbox property="deletePledge" value="<%=String.valueOf(indexId.intValue()) %>"></html:checkbox></td>
						</tr>
					</logic:iterate>
				</logic:notEmpty>
			</tbody>
		</table>
		<html:errors property="collateralPledge" />
		</td>
		</tr>
		<tr>
		<td colspan="2">&nbsp;</td>
		</tr>
	</tbody>
</table>
<% }} %>