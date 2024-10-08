
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.manualinput.partygroup.MIPartyGroupForm,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.partygroup.trx.IPartyGroupTrxValue,com.integrosys.cms.app.partygroup.trx.OBPartyGroupTrxValue"%>
<%
	MIPartyGroupForm patyGroupForm = (MIPartyGroupForm) request
			.getAttribute("MIPartyGroupForm");
	IPartyGroupTrxValue patyGroupTrx = (IPartyGroupTrxValue) session
			.getAttribute("com.integrosys.cms.ui.partygroup.MaintainPartyGroupAction.IPartyGroupTrxValue");
	int sno = 0;
	int startIndex = 0;
%>
<%
String actionStr1 = "com.integrosys.cms.ui.manualinput.partygroup.MIPartyGroupAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>

<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
function cancelPage(){
    document.forms[0].action="MIPartyGroup.do?event=maker_list_party_group&startIndex=<%=request.getAttribute("startIndex")%>";
    
    document.forms[0].submit();
}
function submitForm() {
 	document.forms[0].action="MIPartyGroup.do?event=maker_edit_party_group";
    document.forms[0].submit();
}

function saveForm() {

 	document.forms[0].action="MIPartyGroup.do?event=maker_edit_draft_party_group";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='MIPartyGroup.do'>
	<body>
	<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
	<!-- InstanceBeginEditable name="Content" -->
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
		
			<tr>
				<td>
				<h3>Edit Party Group</h3>
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

							<td class="fieldname" width="30%">Party Group Code</td>
							<td width="20%"><bean:write name="MIPartyGroupForm"
								property="partyCode" />&nbsp;</td>
							<td class="fieldname" width="30%">Party Group Name<font color="red">*</font></td>
							<td width="20%"><html:text property="partyName" size="50"
								maxlength="100"></html:text>&nbsp;
								<br><html:errors property="partyNameError"/>
								<html:errors property="dupPartyNameError"/>
								</td>
						</tr>
						<tr class="even">
							<td class="fieldname" width="30%">Group Exp Limit </td>
							<td width="20%"><html:text property="groupExpLimit"
								size="30" maxlength="23" styleId="groupExpLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"></html:text>&nbsp;
							<br>	<html:errors property="grpExpLmtError"/>
								</td>
							<td class="fieldname" width="30%">&nbsp;</td>
							<td width="20%">&nbsp;</td>
						</tr>
						<html:hidden name="MIPartyGroupForm" property="status" />
						<html:hidden name="MIPartyGroupForm" property="partyCode" />
						<html:hidden name="MIPartyGroupForm" property="partyName" />
						<html:hidden name="MIPartyGroupForm" property="groupExpLimit" />
						<html:hidden name="MIPartyGroupForm" property="masterId" />
						<html:hidden name="MIPartyGroupForm" property="createBy" />
						<html:hidden name="MIPartyGroupForm" property="lastUpdateBy" />
						<html:hidden name="MIPartyGroupForm" property="lastUpdateDate" />
						<html:hidden name="MIPartyGroupForm" property="creationDate" />
						<html:hidden name="MIPartyGroupForm" property="deprecated" />
						<html:hidden name="MIPartyGroupForm" property="id" />
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
			<td>
			<center><a href="javascript:submitForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
			<img src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
			</a></center>
			&nbsp;</td>
			<td>
			<center><a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a></center>
			&nbsp;</td>
			<td>
			<center><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
				src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
			</a></center>
			&nbsp;</td>
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
