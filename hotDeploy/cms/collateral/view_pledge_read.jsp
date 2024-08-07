<%@ page import="com.integrosys.cms.app.limit.bus.ILimit" %>
<%@ page import="java.util.*" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
				com.integrosys.cms.ui.collateral.CollateralHelper"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.PropertiesConstantHelper"%>
<%@ page import="com.integrosys.cms.app.limit.proxy.ILimitProxy"%>
<%@ page import="com.integrosys.cms.app.limit.proxy.LimitProxyImpl"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	if (!PropertiesConstantHelper.isSTPRequired() ||
			(PropertiesConstantHelper.isSTPRequired() && 
			PropertiesConstantHelper.isValidSTPSystem(iCol.getSourceId()) &&
			PropertiesConstantHelper.isValidSTPCollateralLoadingSystesm(iCol.getSourceId()))) {

			ILimitProfile limitprofile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
			if (limitprofile == null ||
					(limitprofile != null && PropertiesConstantHelper.isValidSTPCollateralLoadingApplicationType(limitprofile.getApplicationType()))) {			
%>
<%
	String[] style = {"even", "odd"};

%>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
		<td> <h3><bean:message key="label.facility.pledge.title"/></h3></td>
		</tr>
		<tr>
		<td><hr/></td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td width="5%"><bean:message key="label.global.sn"/></td>
				<td width="30%"><bean:message key="label.facility.id"/></td>
				<td width="25%"><bean:message key="label.facility.sibs.id"/></td>
				<td width="30%"><bean:message key="label.facility.description"/></td>
				<td width="10%"><bean:message key="label.global.action"/></td>
				</tr>
			</thead>
			<tbody>
				<% 
				if (isProcess) { 
			        List res = CompareOBUtil.compOBArray(newCollateral.getCollateralLimits(),((oldCollateral==null)?null:oldCollateral.getCollateralLimits()));                
			        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
			        if (resultList == null || resultList.length == 0) {			        				        
				%>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td colspan="5">
                    <bean:message key="label.global.not.found"/>
                    </td>
                    </tr>
				<%  
					} else {
						List listOfCollateralLimitMapToBeDisplayed = new ArrayList();
						for (int i=0; i < resultList.length; i++) {
							ICollateralLimitMap map = (ICollateralLimitMap) resultList[i].getObj();
							if (!ICMSConstant.HOST_STATUS_DELETE.equals(map.getSCIStatus())) {
								listOfCollateralLimitMapToBeDisplayed.add(resultList[i]);
							}
						}
						
						pageContext.setAttribute("limitList", listOfCollateralLimitMapToBeDisplayed);
				%>
				<logic:iterate id="compObj" name="limitList" type="com.integrosys.base.techinfra.diff.CompareResult" indexId="indexId">
				<%
					ICollateralLimitMap limitPledge = (ICollateralLimitMap)compObj.getObj();					
				%>
					<%
					ILimitProxy proxy = new LimitProxyImpl();
					ILimit limitObject = proxy.getLimit(limitPledge.getLimitID());					
					%>
					<tr class="<%=style[rowIdx++%2] %>">
					<td class="<%=compObj.getKey()%>"><%=indexId.intValue() + 1 %> </td>
					<td><%=limitPledge.getLimitID() %></td>
					<td><integro:empty-if-null value="<%=CollateralHelper.getDisplayColLimitMapLimitID(limitPledge) %>"/> </td>
					<td><integro:common-code categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=limitObject.getFacilityDesc()%>" display="true"/></td>
					<td style="text-align: center;"><a href="<%=formActionName%>?event=view_pledge&index=<%=limitPledge.getLimitID()%>&from_event=<%=from_event%>&subtype=<%=subtype%>"><bean:message key="label.view"/></a></td>
					</tr>
				</logic:iterate>
				<% }
					} else {
						ICollateralLimitMap[] collateralLimitMap = iCol.getCollateralLimits();
						
						List listOfCollateralLimitMapToBeDisplayed = new ArrayList();
						for (int i=0; (collateralLimitMap != null) && i < collateralLimitMap.length; i++) {
							ICollateralLimitMap map = collateralLimitMap[i];
							if (!ICMSConstant.HOST_STATUS_DELETE.equals(map.getSCIStatus())) {
								listOfCollateralLimitMapToBeDisplayed.add(map);
							}
						}

					    pageContext.setAttribute("limitList", listOfCollateralLimitMapToBeDisplayed.toArray(new ICollateralLimitMap[0]));
				%>

				<logic:empty name="limitList">
					<tr class="odd">
					<td colspan="5"><bean:message key="label.pledge.info.none" /></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="limitList">
					<logic:iterate id="limitPledge" name="limitList" type="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap" indexId="indexId">
						<%
						ILimitProxy proxy = new LimitProxyImpl();
                        ILimit limitObject = null;
                        try{
                            limitObject = proxy.getLimit(limitPledge.getLimitID());
                        }catch (Exception e){
                            limitObject = null;
                        }
                        if(limitObject != null){
                        %>
						<tr class="<%=style[rowIdx++%2] %>">
						<td class="index"><%=indexId.intValue() + 1 %> </td>
						<td><%=limitPledge.getLimitID() %></td>
						<td><integro:empty-if-null value="<%=CollateralHelper.getDisplayColLimitMapLimitID(limitPledge) %>"/> </td>
						<td><integro:common-code categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=limitObject.getFacilityDesc()%>" display="true"/></td>
						<td style="text-align: center;"><a href="<%=formActionName%>?event=view_pledge&index=<%=indexId.intValue() %>&from_event=<%=from_event%>&subtype=<%=subtype%>&limitId=<%=limitPledge.getLimitID() %>"><bean:message key="label.view"/></a></td>
						</tr>
                        <%}else{%>
                        <tr class="odd">
                        <td colspan="5"><bean:message key="label.pledge.info.none" /></td>
                        </tr>
                        <%}%>
                    </logic:iterate>
				</logic:notEmpty>
				<% } %>
			</tbody>
		</table>
		</td>
		</tr>
		<tr>
		<td colspan="2">&nbsp;</td>
		</tr>
	</tbody>
</table>
<% }} %>