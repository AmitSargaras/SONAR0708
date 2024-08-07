<%@ page
	import="
	com.integrosys.cms.app.common.util.CommonUtil,
	com.integrosys.cms.ui.common.CurrencyList,
	java.util.HashMap,
	com.integrosys.cms.ui.function.TeamFunctionGrpForm,
	com.integrosys.cms.ui.function.TeamFunctionGrpAction,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	java.util.Enumeration,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	// Get the record markers.
	TeamFunctionGrpForm teamFunctionGrpForm = (TeamFunctionGrpForm) session
			.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp");
	int offset = ((Integer) session.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.offset"))
			.intValue();
	int length = ((Integer) session.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.length"))
			.intValue();

	int rowIdx = 0;

	DefaultLogger.debug(this, "offset = " + offset);
	DefaultLogger.debug(this, "length = " + length);
		
	//DefaultLogger.debug(this, "total entries = " + totalEntries);
%>

<html>
<head>

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

//-->
</script>
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp"%>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top"><!-- Content --> <html:form
			action="MaintainFunction.do">
			<input type="hidden" name="event" />
			<%-- Fake value. --%>
			<input type="hidden" name="targetOffset" value="<%=offset%>" />


			<table width="98%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection" style="margin-top: 10px">
				<thead>
					<tr>
						<td height="34">
						<h3><bean:message key="title.maintain.function"/></h3>
						</td>
					</tr>
					<tr>
						<td>
						<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<table id="tblGold" width="100%" border="0" cellpadding="0"
							cellspacing="0" class="tblinfo" style="margin-top: 0">
							<thead>
								<tr>
									<td width="5%">S/N</td>
									<td width="20%">Team Name</td>
									<td width="20%">Team Description</td>
									<td width="55%">Function</td>
								</tr>
							</thead>
							<tbody>
								<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
									<td class="index" valign="top"><%=rowIdx%></td>
									<td>&nbsp;<bean:write
										name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp"
										property="teamName" /></td>
									<td>&nbsp;<bean:write
										name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp"
										property="teamDesc" /></td>
									<td><html:checkbox
										name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp"
										property="isPreDisb" disabled="true">
										<bean:message key="label.function.pre.disbursement" /></html:checkbox>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:checkbox
										name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp"
										property="isDisb" disabled="true">
										<bean:message key="label.function.disbursement" />
									</html:checkbox> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <html:checkbox
										name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp"
										property="isPostDisb" disabled="true">
										<bean:message key="label.function.post.disbursement" />
									</html:checkbox></td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>

			<table width="150" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td valign="baseline" align="center">&nbsp;</td>
				</tr>
				<tr>
					<%
						String isTrack = request.getParameter("isTrack");
					%>
					<td width="100" valign="baseline" align="center">
						<% if (isTrack != null && isTrack.equals(ICMSConstant.TRUE_VALUE)) { %>
						<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
						<% } else { %>
						<a href="MaintainFunction.do?event=list_read" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
						<% } %>
						<img
						src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
					</td>
				</tr>
				<tr>
					<td valign="baseline" align="center">&nbsp;</td>
				</tr>
			</table>

		</html:form></td>
	</tr>
	<!-- End Content -->

</table>



</body>
</html>