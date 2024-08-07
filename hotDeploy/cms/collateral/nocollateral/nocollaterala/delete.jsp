<%@ page import="com.integrosys.cms.ui.collateral.CollateralUiUtil"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%
	String toSubmitActionName = CollateralUiUtil.getActionNameBySubType(iCol.getCollateralSubType().getSubTypeCode());
	String delURL = toSubmitActionName+".do?event=delete&collateralID="+String.valueOf(iCol.getCollateralID());
	
	System.out.println("subType:"+iCol.getCollateralSubType().getSubTypeCode());
	System.out.println("toSubmitActionName:"+toSubmitActionName);
	System.out.println("delURL:"+delURL);
%>
<table width="150" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="75">
			<% if (isDeleting) { %>
				<p class="deletedItem">
			        DELETED
			    </p>
			<% } %>
		</td>
            <%  if (userAccess && !isSSC && isDeletable) {%>
        <td width="75">
        	<input type="button" name="Button_D" value="Delete" class="btnNormal" style="width:50" onclick="gotopage('<%=delURL%>')"/>
        </td>
	        <%	} %>
	</tr>
</table>