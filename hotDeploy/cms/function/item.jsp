<%@ page
	import="com.integrosys.cms.ui.function.TeamFunctionGrpAction,
	java.util.Collection,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	java.util.Iterator,
    com.integrosys.cms.app.function.trx.ITeamFunctionGrpTrxValue,
	com.integrosys.cms.ui.function.TeamFunctionGrpForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
</style>

<%
	//GoldItemForm actionForm = (GoldItemForm) pageContext.findAttribute("goldItemForm");

	TeamFunctionGrpForm teamFunctionGrpForm = (TeamFunctionGrpForm) session.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp");
	ITeamFunctionGrpTrxValue trxValue = (ITeamFunctionGrpTrxValue) session
	.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.teamFunctionGrpTrxValue");
	String event = (String) request.getParameter("event");

	String[] style = {"odd", "even"};

%>

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

function submitForm() {
    document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].event.value = "<%=TeamFunctionGrpAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

function closeForm() {
    document.forms[0].event.value = "<%=TeamFunctionGrpAction.EVENT_CLOSE%>";
    document.forms[0].submit();
}

//-->
    </script>
<!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp"%>
<br>



<html:form action="MaintainFunction.do">
	<html:hidden property="event"
		value="<%=TeamFunctionGrpAction.EVENT_SUBMIT%>" />
	<table width="60%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
				<h3>Edit Credit Operation Unit Team</h3>
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
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInput">
					<thead></thead>
					<tbody>
					<% int count = 1; %>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname">Team Name&nbsp;<font
								color="#0000FF">* </font>
								<html:hidden name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="teamId"/>
								<html:hidden name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="teamTypeId"/>
								</td>
							<td><bean:write name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="teamName"/>
							<html:errors property="teamName" /><html:hidden name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="teamName" />
							</td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname">Team Description</td>
							<td><bean:write name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="teamDesc"/>
							<html:errors property="teamDesc" /><html:hidden name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="teamDesc"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname">Function</td>
							<td width="72%">
							<%if(TeamFunctionGrpAction.EVENT_READ_CHECKER_CLOSE.equals(event)) { %>
							<html:checkbox name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="isPreDisb" disabled="true"><bean:message key="label.function.pre.disbursement"/></html:checkbox>
							<html:checkbox name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="isDisb" disabled="true"><bean:message key="label.function.disbursement"/></html:checkbox>
							<html:checkbox name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="isPostDisb" disabled="true"><bean:message key="label.function.post.disbursement"/></html:checkbox>
							<%} else {%> 
							<html:checkbox name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="isPreDisb" styleId="pre-disb" ><label for="pre-disb"><bean:message key="label.function.pre.disbursement"/></label></html:checkbox>
							<html:checkbox name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="isDisb" styleId="disb"><label for="disb"><bean:message key="label.function.disbursement"/></label></html:checkbox>
							<html:checkbox name="com.integrosys.cms.ui.function.TeamFunctionGrpAction.formTeamFunctionGrp" property="isPostDisb" styleId="post-disb"><label for="post-disb"><bean:message key="label.function.post.disbursement"/></label></html:checkbox>
							<%} %>
							<html:errors property="function" />
							</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<% if (TeamFunctionGrpAction.EVENT_READ_MAKER_PROCESS.equals(event) 
					|| TeamFunctionGrpAction.EVENT_READ_CHECKER_CLOSE.equals(event)) { %>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td class="fieldname">Remarks</td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><%=trxValue.getRemarks()!=null?trxValue.getRemarks():""%>&nbsp;</td>
                                </tr>
                              </tbody>
                            </table>
				</td>
			</tr>
			<%} %>
		</tbody>
	</table>

	<table width="120" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
		<%if (TeamFunctionGrpAction.EVENT_READ_CHECKER_CLOSE.equals(event)) { %>
			<td><a href="#" onmouseout="MM_swapImgRestore()"
				onClick="closeForm();"
				onmouseover="MM_swapImage('Image1','','img/close2a.gif',1)"> <img
				src="img/close1a.gif" name="Image1" width="70" height="20" border="0"
				id="Image1" /></a></td>
		<%} else {%>
			<td><a href="#" onmouseout="MM_swapImgRestore()"
				onClick="submitForm();"
				onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"> <img
				src="img/submit1.gif" name="Image1" width="75" height="22" border="0"
				id="Image1" /></a></td>
		<%} %>
			<% if (TeamFunctionGrpAction.EVENT_READ_MAKER_PROCESS.equals(event) ||
					TeamFunctionGrpAction.EVENT_READ_CHECKER_CLOSE.equals(event)) { %>
			<td><a href="ToDo.do?event=prepare&isMenu=Y"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"> <img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a></td>
			<% } else { %>
			<td><a href="MaintainFunction.do?event=list_read"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"> <img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a></td>
				<%} %>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>