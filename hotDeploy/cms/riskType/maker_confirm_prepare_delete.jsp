<%@page import="com.integrosys.cms.ui.riskType.RiskTypeForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.riskType.RiskTypeForm,com.integrosys.cms.app.riskType.trx.IRiskTypeTrxValue,com.integrosys.cms.app.riskType.trx.OBRiskTypeTrxValue"%>
<%

 RiskTypeForm riskTypeForm = (RiskTypeForm) request.getAttribute("RiskTypeForm");
IRiskTypeTrxValue riskTypeTrx = (IRiskTypeTrxValue)session.getAttribute("com.integrosys.cms.ui.riskType.RiskTypeAction.IRiskTypeTrxValue"); 
	
String event = request.getParameter("event");
String rejectEvent;
if (event.equals("checker_view_risk_type")) {
	rejectEvent = "checker_list_risk_type";
} else {
	rejectEvent = "maker_list_risk_type";
}
	
%>

<%@page import="com.integrosys.cms.app.riskType.bus.IRiskType"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function cancelPage() {
	document.forms[0].action = "ToDo.do?event=prepare";
	document.forms[0].action="riskType.do?event=<%=rejectEvent %>&go=N";
	document.forms[0].submit();
}

function submitPage() {
	document.forms[0].action = "riskType.do?event=maker_confirm_resubmit_delete";
	document.forms[0].submit();
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='riskType.do?'>
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<br>
				<br>
				<br>
				<tr>
					<td>
						<h3>Delete Risk Type</h3>
					</td>
				</tr>
				<tr>
					<td>
						<hr />
						<br>
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
								<tr class="even">
									<td class="fieldname" >Risk Type Name</td>
									<td style="width: 200px;"><%=riskTypeForm.getRiskTypeName()%> &nbsp;</td>

									<td class="fieldname" >Risk Type Code</td>
									<td style="width: 200px;"><%=riskTypeForm.getRiskTypeCode()%>&nbsp;</td>
								</tr>
							
								<html:hidden name="RiskTypeForm" property="status" />
								<html:hidden name="RiskTypeForm" property="riskTypeName" />
								<html:hidden name="RiskTypeForm" property="riskTypeCode" />
								
								<html:hidden name="RiskTypeForm" property="createBy" />
								<html:hidden name="RiskTypeForm" property="lastUpdateBy" />
								<html:hidden name="RiskTypeForm" property="lastUpdateDate" />
								<html:hidden name="RiskTypeForm" property="creationDate" />
								<html:hidden name="RiskTypeForm" property="id" />
								<html:hidden name="RiskTypeForm" property="deprecated" />
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
			
					<td colspan="4">
						<center>
							<a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)">
								<img
										src="img/delete1.gif" name="Image3311" border="0"
										id="Image3311" />
							</a>
						</center>
						&nbsp;
					</td>
					
 					<td colspan="4">
						<center>
							<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
								<img src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
						</center>
						&nbsp;
					</td>
					
  			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>

		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
