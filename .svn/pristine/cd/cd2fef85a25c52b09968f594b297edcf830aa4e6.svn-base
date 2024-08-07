<%@page import="com.integrosys.cms.ui.excLineforstpsrm.ExcLineForSTPSRMForm"%>
<%@page import="com.integrosys.cms.ui.excLineforstpsrm.ExcLineForSTPSRMAction"%>
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
	IExcLineForSTPSRMTrxValue trx = (IExcLineForSTPSRMTrxValue)session.getAttribute(ExcLineForSTPSRMAction.class.getName() + ".excLineForSTPSRMTrxValue");
    List lineNoList=(List) session.getAttribute(ExcLineForSTPSRMAction.class.getName() + "." + "lineNoList");
    if(lineNoList == null)
    	lineNoList = new ArrayList();
    pageContext.setAttribute("lineNoList",lineNoList);
    
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

function submitForm() {
		document.forms[0].action = "ExcLineForSTPSRM.do?event=maker_confirm_resubmit_edit";
		document.forms[0].submit();
		newShowSilkScreen();
}
</script>
</head>
<html:form action='ExcLineForSTPSRM.do'>
	<body>
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
					<td>
						<h3>Update Exclusion line for STP of SRM</h3>
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
								  <td class="fieldname" >Line Code <font color="red">*</font></td>
				                  <td width="20%">
									<%=form.getLineCode()%>
				                  </td>
								  <td class="fieldname">Excluded <font color="red">*</font></td>
								  <td>
									<html:checkbox property="excluded"></html:checkbox>&nbsp;
									<br><html:errors property="excluded" /> 
								  </td>
								</tr>
								<html:hidden name="ExcLineForSTPSRMForm" property="id" />
								<html:hidden name="ExcLineForSTPSRMForm" property="lineCode" />
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
			</tbody>
		</table>
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td>
					<center>
						<a href="javascript:submitForm();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
							<img src="img/submit1.gif" name="Image3311" border="0"
							id="Image3311" />
						</a>
					</center> &nbsp;
				</td>
				<td>
					<center>
						<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</center> &nbsp;
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</body>
</html:form>
</html>