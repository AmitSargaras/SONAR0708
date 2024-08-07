<%@ page
	import="com.integrosys.cms.ui.function.TeamFunctionGrpForm,
	com.integrosys.cms.ui.function.TeamFunctionGrpAction,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	java.util.Enumeration,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
	com.integrosys.base.businfra.search.SearchResult,
	java.util.List"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<%@page import="com.integrosys.cms.app.function.bus.OBTeamFunctionGrp"%>

<%
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMembershipID = Long.parseLong(teamTypeMemID);    
	boolean isEditAccess = (teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_MAKER);
	TeamFunctionGrpForm form = (TeamFunctionGrpForm)request.getAttribute("MaintainFunctionForm");
%>

<html>
<head>
<title>Untitled Document</title>


<script language="JavaScript" type="text/JavaScript">
        <!--
function MM_swapImgRestore() { //v3.0
var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function gotopage(aLocation) {
    window.location = aLocation;
}

function remove() {
    document.forms[0].event.value = "<%=TeamFunctionGrpAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=TeamFunctionGrpAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function edit() {
    document.forms[0].event.value = "<%=TeamFunctionGrpAction.EVENT_READ_MAKER_EDIT %>"
    document.forms[0].submit();
}

//-->
    </script>
</head>
<body>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top"><!-- Content --> <%
		SearchResult sr = (SearchResult) session.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrps");
		List formTeamFunctionGrps = (List)sr.getResultList();
		if (formTeamFunctionGrps != null)
			pageContext.setAttribute("formTeamFunctionGrps", formTeamFunctionGrps);

 	String[] style = { "odd", "even" };
 %> <html:form action="MaintainFunction.do">
			<input type="hidden" name="event"/>
			<%-- Fake value. --%>


			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection" style="margin-top: 10px">
				<thead>
					<tr>
						<td height="34">
						<h3>Maintain Function</h3>
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
						<table id="tblGold" width="100%" border="0" cellpadding="0"
							cellspacing="0" class="tblinfo" style="margin-top: 0">
							<thead>
								<tr>
									<td width="5%">S/N</td>
									<td width="20%">Team Name</td>
									<td width="20%">Team Description</td>
									<td width="15%"><bean:message key="label.function.pre.disbursement"/></td>
									<td width="15%"><bean:message key="label.function.disbursement"/></td>
									<td width="15%"><bean:message key="label.function.post.disbursement"/></td>
									<td width="10%">Action</td>
								</tr>
							</thead>
							<tbody>

								<%
									if (formTeamFunctionGrps != null && formTeamFunctionGrps.size() != 0) {
								%>
								<logic:iterate id="ob"
									name="formTeamFunctionGrps" indexId="counter"
									type="com.integrosys.cms.ui.function.TeamFunctionGrpForm" scope="page">

									<tr class="<%=style[(counter.intValue() + 1)%2] %>">
										<td class="index" valign="top"><%=form.getStartIndex() + counter.intValue() + 1%>
										</td>
										<td>&nbsp;<a
											href="bizstructure.do?event=maker_view_team_wf&TeamId=<%=ob.getTeamId()%>"><integro:empty-if-null
											value="<%=ob.getTeamName()%>" /></a>
										</td>
										<td>&nbsp;<integro:empty-if-null
											value="<%=ob.getTeamDesc()%>" /></td>
										<td style="text-align: center"><input type="checkbox"
											<%if (ob.getIsPreDisb()) {%>
											checked <%}%> disabled="disabled" /></td>

										<td style="text-align: center"><input type="checkbox"
											<%if (ob.getIsDisb()) {%>
											checked <%}%> disabled="disabled" /></td>
										<td style="text-align: center"><input type="checkbox"
											<%if (ob.getIsPostDisb()) {%>
											checked <%}%> disabled="disabled" /></td>
										<td style="text-align: center">
											<% if (isEditAccess) { %>
												<a href="MaintainFunction.do?event=read_maker_edit&teamId=<%=ob.getTeamId()%>">Edit</a>
											<% } else { %>
												<a href="MaintainFunction.do?event=view&teamId=<%=ob.getTeamId()%>"><bean:message key="label.view"/></a>
											<% } %>
										</td>
									</tr>
								</logic:iterate>
								<%} else { %>
								<tr>
									<td colspan="8" class="odd"><bean:message
										key="label.global.not.found" /></td>
								</tr>
								<%} %>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
		</html:form></td>
	</tr>
	<!-- End Content -->

	<!-- General Purpose Bar -->

	<tr>
		<td height="25">

		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
			cellpadding="5" align="center">

			<tr>
			<%
				String pageIndexUrl = "MaintainFunction.do?event=list_read&startIndex=";
				System.out.println("sr.getNItems(): "+sr.getNItems());
			%>
			<td width="650" valign="middle">
			<logic:present name="formTeamFunctionGrps">
			   &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(form.getStartIndex(),10,sr.getNItems())%>'
					url='<%=pageIndexUrl%>' />
			</logic:present>&nbsp;
			</td>
			</tr>
		</table>

		</td>
	</tr>

</table>

</body>
</html>