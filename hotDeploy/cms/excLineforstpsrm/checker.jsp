<%@page import="com.integrosys.cms.ui.excLineforstpsrm.IExcLineForSTPSRMConstant"%>
<%@page import="com.integrosys.cms.ui.excLineforstpsrm.ExcLineForSTPSRMAction"%>
<%@page import="com.integrosys.cms.ui.excLineforstpsrm.ExcLineForSTPSRMForm"%>
<%@page import="com.integrosys.cms.app.excLineforstpsrm.trx.IExcLineForSTPSRMTrxValue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	String context = request.getContextPath() + "/";
	int sno = 0;
	int startIndex = 0;
    String event = request.getParameter("event");
    IExcLineForSTPSRMTrxValue trx = (IExcLineForSTPSRMTrxValue)session.getAttribute(ExcLineForSTPSRMAction.class.getName() 
    		+ "." +IExcLineForSTPSRMConstant.POJO_TRX);

    String submitEvent = "checker_approve_edit";
	String rejectEvent = "checker_reject_edit";
	ExcLineForSTPSRMForm form = (ExcLineForSTPSRMForm) request.getAttribute("ExcLineForSTPSRMForm");
%>
<html>
<head>
<title>Untitled Document</title>
 <script language="JavaScript" type="text/javascript"	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">

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

function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
	document.forms[0].submit();
	newShowSilkScreen();
}

function approvePage() {
    document.forms[0].action="ExcLineForSTPSRM.do?event=<%=submitEvent%>";
    document.forms[0].submit();
    newShowSilkScreen();
}
function rejectPage() {
    document.forms[0].action="ExcLineForSTPSRM.do?event=<%=rejectEvent%>";
	document.forms[0].submit();
	newShowSilkScreen();
}
</script>
</head>
<html:form action='ExcLineForSTPSRM.do'>
	<html:errors property="master"/>
	<body>
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
					<td>
						<h3>Exclusion line for STP of SRM</h3>
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
							<thead>
							</thead>
							<tbody>
								<tr class="odd">
								  <td class="fieldname" >Line Code<font color="red">*</font></td>
				                  <td width="20%">
									<%=form.getLineCode()%>
				                  </td>
									<td class="fieldname">Excluded <font color="red">*</font></td>
									<td>
										<html:checkbox property="excluded" value="<%=form.getExcluded()%>" disabled="true"></html:checkbox>&nbsp;
									</td>
								</tr>
								<html:hidden name="ExcLineForSTPSRMForm" property="id" />
								<html:hidden name="ExcLineForSTPSRMForm" property="lineCode" />
								<html:hidden name="ExcLineForSTPSRMForm" property="excluded" />
								<html:hidden name="ExcLineForSTPSRMForm" property="versionTime" />
								<html:hidden name="ExcLineForSTPSRMForm" property="lastUpdateDate" />
								<html:hidden name="ExcLineForSTPSRMForm" property="creationDate" />
								<html:hidden name="ExcLineForSTPSRMForm" property="createBy" />
								<html:hidden name="ExcLineForSTPSRMForm" property="lastUpdateBy" />
								<html:hidden name="ExcLineForSTPSRMForm" property="status" />
								<html:hidden name="ExcLineForSTPSRMForm" property="deprecated" />
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblInfo">
							<tbody>
								<tr>
									<td class="fieldname" width="20%">Remarks</td>
									<td class="odd"><textarea name="remarks" rows="4"
											style="width: 90%"></textarea></br>
									<html:errors property="remarksError" /></td>
								</tr>
								<tr>
									<td class="fieldname">Last Action By</td>
									<td class="even"><%=trx.getUserInfo()%>&nbsp;</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">Last Remarks Made</td>
									<td class="even"><%=trx.getRemarks() != null ? trx.getRemarks() : ""%>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td><a href="javascript:approvePage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
						src="img/approve1.gif" name="Image8" width="80" height="20"
						border="0" id="Image8" /></a></td>
				<td><a href="javascript:rejectPage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
						src="img/reject1.gif" name="Image9" width="70" height="20"
						border="0" id="Image9" /></a></td>
				<td><a href="javascript:cancelPage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image1" border="0" id="Image1" /></a></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</body>
</html:form>
</html>