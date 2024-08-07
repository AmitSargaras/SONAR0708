
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.Vector,com.integrosys.cms.ui.bizstructure.MaintainTeamForm,com.integrosys.base.uiinfra.common.ICommonEventConstant,java.util.List,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.bizstructure.app.bus.ITeamType"%>

<%
	try {
		List teamList = (List) request.getAttribute("TeamTypeList");
		List moduleList = (List) request.getAttribute("moduleList");
		pageContext.setAttribute("moduleList", moduleList);
		MaintainUserRoleForm form = (MaintainUserRoleForm) request
				.getAttribute("MaintainUserRoleForm");
		if (teamList != null) {
			pageContext.setAttribute("TeamList", teamList);
		}
		int sno = form.getStartIndex();
		String memberTypeId = request.getParameter("memberTypeId");
		String teamTypeName = "";
		String event = request.getParameter("event");
		List teamTypeList = (List) session
				.getAttribute("com.integrosys.cms.ui.userrole.BizStructureIPinAction.TeamTypeList");
		teamTypeName = getTeamTypeFromList(memberTypeId, teamTypeList)
				.getMembershipName();
		
		int masterCount =0;
		int transCount =0;
%>
<%!private ITeamTypeMembership getTeamTypeFromList(String teamTypeId,
			List teamTypeList) {
		ITeamTypeMembership teamType = null;
		for (int i = 0; i < teamTypeList.size(); i++) {
			teamType = (ITeamTypeMembership) teamTypeList.get(i);
			if (Long.parseLong(teamTypeId) == teamType.getMembershipID()) {
				return teamType;
			}
		}
		return teamType;
	}%>





<%@page import="com.integrosys.cms.ui.userrole.MaintainUserRoleForm"%>
<%@page
	import="com.integrosys.component.bizstructure.app.bus.ITeamTypeMembership"%><html>
<head>
<title>Maker Team Listing</title>




</head>

<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top"><!-- Content -->
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">

			<thead>
				<tr>
					<td width="82%">
					<h3>View Masters <%=teamTypeName%> Role Access</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
							<tr>
								<td width="7%"><bean:message key="label.global.sn" /></td>
								<td width="25%"><bean:message
									key="title.user.role.module.name" /></td>
								<td width="10%"><bean:message
									key="title.user.role.view.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.add.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.edit.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.delete.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.approve.access" /></td>
							</tr>
						</thead>
						<tbody>
							<logic:present name="moduleList">
								<logic:iterate id="ob" name="moduleList"
									type="com.integrosys.cms.app.userrole.bus.OBUserRole"
									scope="page">

									<%
										masterCount++;
										if (ob.getModuleId().getModuleType().equals("MASTERS")) {
											masterCount--;
										//DefaultLogger.debug("maker_list_team.jsp","..."+teamList.get(0).getClass());
														String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
									%>
									<tr class="<%=rowClass%>">
										<td class="index"><%=sno%></td>
										<td><%=ob.getModuleId().getModuleName()%>&nbsp;</td>
										<%
											if (ob.getViewAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>
										<%
											if (ob.getAddAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

										<%
											if (ob.getEditAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

										<%
											if (ob.getDeleteAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

										<%
											if (ob.getApproveAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

									</tr>
									<%
										}
									%>
								</logic:iterate>
							</logic:present>
							<%
								if (moduleList.size() == 0 || masterCount == moduleList.size()) {
							%>
							<tr class="odd">
								<td colspan=7 class="label"><bean:message
									key="label.global.not.found" /></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					</td>
				</tr>
			</tbody>


			<thead>
				<tr>
					<td width="82%">
					<h3>View Transaction <%=teamTypeName%> Role Access</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
							<tr>
								<td width="7%"><bean:message key="label.global.sn" /></td>
								<td width="25%"><bean:message
									key="title.user.role.module.name" /></td>
								<td width="10%"><bean:message
									key="title.user.role.view.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.add.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.edit.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.delete.access" /></td>
								<td width="10%"><bean:message
									key="title.user.role.approve.access" /></td>
							</tr>
						</thead>
						<tbody>
							<logic:present name="moduleList">
								<logic:iterate id="ob" name="moduleList"
									type="com.integrosys.cms.app.userrole.bus.OBUserRole"
									scope="page">
									<%
									transCount++;
										if (ob.getModuleId().getModuleType().equals(
															"TRANSACTIONS")) {
											transCount--;
									%>
									<%
										//DefaultLogger.debug("maker_list_team.jsp","..."+teamList.get(0).getClass());
														String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
									%>
									<tr class="<%=rowClass%>">
										<td class="index"><%=sno%></td>
										<td><%=ob.getModuleId().getModuleName()%>&nbsp;</td>
										<%
											if (ob.getViewAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>
										<%
											if (ob.getAddAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

										<%
											if (ob.getEditAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

										<%
											if (ob.getDeleteAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

										<%
											if (ob.getApproveAccess().equalsIgnoreCase("Y")) {
										%>
										<td><input type="checkbox" disabled="disabled"
											checked="checked" /></td>
										<%
											} else {
										%>
										<td><input type="checkbox" disabled="disabled" /></td>
										<%
											}
										%>

									</tr>
									<%
										}
									%>
								</logic:iterate>
							</logic:present>
							<%
								if (moduleList.size() == 0 || transCount == moduleList.size()) {
							%>
							<tr class="odd">
								<td colspan=7 class="label"><bean:message
									key="label.global.not.found" /></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					</td>
				</tr>
			</tbody>



		</table>

		</td>
	</tr>
	<!-- End Content -->

	<!-- General Purpose Bar -->

	<logic:present name="moduleList">
		<tr>
			<td height="25">
			<table id="GeneralPurposeBar" width="100%" style="margin-left: 10px"
				border="0" cellspacing="0" cellpadding="5" align="center">
				<tr>
					<%
						String pageIndexUrl = null;
								if (form.getModuleName() != null
										&& form.getModuleName().length() > 0) {
									pageIndexUrl = "UserRole.do?event=maker_list_user_role&memberTypeId="
											+ memberTypeId
											+ "&name="
											+ form.getModuleName() + "&startIndex=";
								} else {
									pageIndexUrl = "UserRole.do?event=maker_list_user_role&memberTypeId="
											+ memberTypeId + "&startIndex=";
								}
					%>
					<td width="650" valign="middle"><logic:present
						name="moduleList">
		   &nbsp;<integro:pageindex
							pageIndex='<%=new PageIndex(form.getStartIndex(),10,moduleList.size())%>'
							url='<%=pageIndexUrl%>' />
					</logic:present>&nbsp;</td>
				</tr>
			</table>
			</td>
		</tr>
	</logic:present>

</table>

</body>
</html>

<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

