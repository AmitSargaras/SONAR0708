<%@ page import="com.integrosys.base.techinfra.diff.CompareResult,
				 java.util.List,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.collateral.bus.ICollateralPledgor"%>

<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<% rowIdx = 0; // reset odd-even row highlighting %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
	<tr>
	<td> <h3><bean:message key="label.security.title"/></h3></td>
	</tr>
	<tr>
	<td><hr/></td>
	</tr>
</thead>
<tbody>
	<tr>
	<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
		<thead>
			<tr>
			<td width="5%"><bean:message key="label.global.sn"/></td>
			<td width="20%"><bean:message key="label.security.pledgor.id"/></td>
			<td width="20%"><bean:message key="label.customer.id"/></td>
			<td width="30%"><bean:message key="label.security.pledgor.name"/></td>
			<td width="25%"><bean:message key="label.security.pledgor.relationship"/></td>
			</tr>
		</thead>
		<tbody>
			<% 
			if (isProcess) {			
		        List res = CompareOBUtil.compOBArray(newCollateral.getPledgors(),((oldCollateral==null)?null:oldCollateral.getPledgors()));                
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
					pageContext.setAttribute("pledgorList", resultList);
			%>
			<logic:iterate id="compObj" name="pledgorList" type="com.integrosys.base.techinfra.diff.CompareResult" indexId="indexId">
				<%
					ICollateralPledgor pledgor = (ICollateralPledgor)compObj.getObj();
				%>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="<%=compObj.getKey()%>"><%=indexId.intValue() + 1 %> </td>
                    <td><integro:empty-if-null value="<%=pledgor.getPlgIdNumText() %>"/>
					<%-- <% if (pledgor.getPledgorID() != ICMSConstant.LONG_INVALID_VALUE) { %>
					  <integro:empty-if-null value="<%=String.valueOf(pledgor.getPledgorID())%>"/>
					<% } else { %> - <% } %> --%>
					<%
					if (pledgor.getSCIPledgorMapStatus() != null &&
							pledgor.getSCIPledgorMapStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
					%>
						&nbsp;<font color="#FF0000"><b><bean:message key="label.deleted"/></b></font>
					<% } %>
					</td>
					<td><integro:empty-if-null value="<%=pledgor.getLegalID()%>"/></td>
					<td><integro:empty-if-null value="<%=pledgor.getPledgorName()%>"/></td>
					<td>
						<integro:common-code categoryCode="<%=pledgor.getPledgorRelnshipCode() %>" entryCode="<%=pledgor.getPledgorRelnship() %>" display="true"/>
					</td>
					</tr>
			</logic:iterate>
			<%	
				}
			} else {
				ICollateralPledgor[] pledgor = iCol.getPledgors();
				if (pledgor != null && pledgor.length > 0)
					pageContext.setAttribute("pledgorList", pledgor);
			%>
				<logic:empty name="pledgorList">
					<tr class="odd">
					<td colspan="5"><bean:message key="label.global.not.found" /></td>
					</tr>
				</logic:empty>
				<logic:notEmpty name="pledgorList">
					<logic:iterate id="pledgorObj" name="pledgorList" type="com.integrosys.cms.app.collateral.bus.ICollateralPledgor" indexId="indexId">

                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="index"><%=indexId.intValue() + 1 %> </td>
                    <td><integro:empty-if-null value="<%=pledgorObj.getPlgIdNumText() %>"/>
					<%--   <% if (pledgorObj.getPledgorID() != ICMSConstant.LONG_INVALID_VALUE) { %>
					  <integro:empty-if-null value="<%=String.valueOf(pledgorObj.getPledgorID())%>"/>
					<% } else { %> - <% } %> --%>
					<%
					if (pledgorObj.getSCIPledgorMapStatus() != null &&
							pledgorObj.getSCIPledgorMapStatus().equals(ICMSConstant.HOST_STATUS_DELETE)) {
					%>
						&nbsp;<font color="#FF0000"><b><bean:message key="label.deleted"/></b></font>
					<% } %>
					</td>
					<td><integro:empty-if-null value="<%=pledgorObj.getLegalID()%>"/></td>
					<td><integro:empty-if-null value="<%=pledgorObj.getPledgorName()%>"/></td>
					<td>
						<integro:common-code categoryCode="<%=pledgorObj.getPledgorRelnshipCode() %>" entryCode="<%=pledgorObj.getPledgorRelnship() %>" display="true"/>
					</td>
					</tr>
					</logic:iterate>
				</logic:notEmpty>
			<% } %>
		</tbody>
		</table>
	</td>
	</tr>
	<tr>
	<td>&nbsp;</td>
	</tr>
</tbody>
</table>