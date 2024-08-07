
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<html>
<head>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
</script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 1;
%>
<body>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
		<td> <h3><bean:message key="label.facility.edit.charge.title"/></h3></td>
		</tr>
		<tr>
		<td><hr/></td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td colspan="2">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td><bean:message key="label.facility.collateral.information"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.collateral.type"/> </td>
				<td></td>
				<td class="fieldname"><bean:message key="label.collateral.subtype"/></td>
				<td></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.collateral.id"/> </td>
				<td></td>
				<td class="fieldname"><bean:message key="label.collateral.sibs.id"/></td>
				<td></td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td><bean:message key="label.facility.information"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.facility.no"/> </td>
				<td></td>
				<td class="fieldname"><bean:message key="label.facility.description"/></td>
				<td></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.sibs.application.no"/> </td>
				<td></td>
				<td class="fieldname"><bean:message key="label.sibs.facility.code"/></td>
				<td></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.sib.facility.seq"/> </td>
				<td></td>
				<td class="fieldname"><bean:message key="label.facility.activate.limit"/></td>
				<td></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.facility.approved.limit"/> </td>
				<td></td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td><bean:message key="label.security.charge.infor"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.amount"/> </td>
				<td></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.amount.draw"/></td>
				<td></td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
	</tbody>
</table>
</body>

</html>