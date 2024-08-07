<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.function.trx.ITeamFunctionGrpTrxValue,
                 com.integrosys.cms.ui.function.TeamFunctionGrpForm,
                 com.integrosys.cms.ui.function.TeamFunctionGrpAction"%>
<%
    String event = request.getParameter("event");
    DefaultLogger.debug("list2.jsp","event from getParameter is > "+event);

    String approveEvent=TeamFunctionGrpAction.EVENT_APPROVE;
    String rejectEvent=TeamFunctionGrpAction.EVENT_REJECT;
    String headingLable="Maintain Function";

	ITeamFunctionGrpTrxValue trxValueForView = (ITeamFunctionGrpTrxValue) session
			.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.teamFunctionGrpTrxValueForView");

	ITeamFunctionGrpTrxValue trxValue = (ITeamFunctionGrpTrxValue) session
			.getAttribute("com.integrosys.cms.ui.function.TeamFunctionGrpAction.teamFunctionGrpTrxValue");
	TeamFunctionGrpForm form = null;
	if (trxValueForView.getStagingTeamFunctionGrps() != null && trxValueForView.getStagingTeamFunctionGrps().get(0) != null) {
		form = (TeamFunctionGrpForm)trxValueForView.getStagingTeamFunctionGrps().get(0);
	}
	String[] style = {"odd", "even"};
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function approvePage() {
    document.forms[0].action="MaintainFunction.do?event=<%=approveEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="MaintainFunction.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='MaintainFunction.do?'>
<body>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><%=headingLable%></h3></td>
  </tr>
  <tr>
    <td><hr></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
          <thead>
          </thead>
          <tbody>
          <%int count=1; %>
          	<tr>
          		<td class="fieldname">Team Name</td>
          		<td class="<%=style[count++%2]%>"><%= form.getTeamName() %></td>
          	</tr>
          	<tr>
          		<td class="fieldname">Team Description</td>
          		<td class="<%=style[count++%2]%>"><%= form.getTeamDesc() %></td>
          	</tr>
          	<tr>
          		<td class="fieldname">Function</td>
          		<td class="<%=style[count++%2]%>">
	          		<input type="checkbox" <%if (form.getIsPreDisb()) { %>checked <%} %> disabled="disabled"/>
	          		<bean:message key="label.function.pre.disbursement"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          		<input type="checkbox" <%if (form.getIsDisb()) { %>checked <%} %> disabled="disabled"/>
	          		<bean:message key="label.function.disbursement"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	          		<input type="checkbox" <%if (form.getIsPostDisb()) { %>checked <%} %> disabled="disabled">
	          		<bean:message key="label.function.post.disbursement"/>
          		</td>
          	</tr>
          </tbody>
        </table> </td>
  </tr>

  <tr>
 <td align="center"><b><html:errors property="updateError" /></b></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
                            </table></td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        </tr>
  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
