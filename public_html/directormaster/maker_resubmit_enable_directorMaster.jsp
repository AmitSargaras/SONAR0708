
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,
	java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.ui.directorMaster.MaintainDirectorMasterForm,com.integrosys.cms.app.directorMaster.trx.IDirectorMasterTrxValue,com.integrosys.cms.app.directorMaster.trx.OBDirectorMasterTrxValue"%>
<%
	 MaintainDirectorMasterForm directorMasterForm = (MaintainDirectorMasterForm) request.getAttribute("MaintainDirectorMasterForm");
	IDirectorMasterTrxValue directorMasterTrx = (IDirectorMasterTrxValue)session.getAttribute("com.integrosys.cms.ui.directorMaster.MaintainDirectorMasterAction.IDirectorMasterTrxValue");

	int sno = 0;
	int startIndex = 0;
%>


<html>
	<head>
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
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}

function submitPage () {
	document.forms[0].action="directorMaster.do?event=maker_confirm_resubmit_disable";
    document.forms[0].submit();
}


</script>

	</head>

	<html:form action='directorMaster.do?'>
		<body>
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<br>
					<br>
					<br>
					<br>
					<tr>
						<td>
							<h3>
								View Director Master
							</h3>
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

												<td class="fieldname" width="20%">
													Director Code
												</td>
												<td width="30%"><%=directorMasterForm.getDirectorCode()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Name
												</td>
												<td width="30%"><%=directorMasterForm.getName()%>&nbsp;
												</td>
											</tr>
											<tr class="odd">

												<td class="fieldname" width="20%">
													Relationship
												</td>
												<td width="30%"><%=directorMasterForm.getDinNo()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Status
												</td>
												<td width="30%">
												 <%! String status=null; %>
							                       <%if(directorMasterForm.getStatus().trim().equalsIgnoreCase("ACTIVE"))
							                       {
							                    	  status="Enable";
							                       }
							                       else
							                       {
							                    	  status="Disable";
							                       }
							                         
							                       %>&nbsp;<%=status %>
												&nbsp;</td>
											</tr>
											
<html:hidden name="MaintainDirectorMasterForm" property="status" />
 <html:hidden name="MaintainDirectorMasterForm" property="dinNo" />
 <html:hidden name="MaintainDirectorMasterForm" property="name"/>
 <html:hidden name="MaintainDirectorMasterForm" property="directorCode"/>


 <html:hidden name="MaintainDirectorMasterForm" property="createBy" value="SA_MAKER"/>
 <html:hidden name="MaintainDirectorMasterForm" property="lastUpdateBy" value="SA_MAKER"/>
 <html:hidden name="MaintainDirectorMasterForm" property="lastUpdateDate"/>
 <html:hidden name="MaintainDirectorMasterForm" property="creationDate"/>
 <html:hidden name="MaintainDirectorMasterForm" property="deprecated" value="N"/>
 <html:hidden name="MaintainDirectorMasterForm" property="id"/>
</tr>
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
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=directorMasterTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=directorMasterTrx.getRemarks() != null
						? directorMasterTrx.getRemarks()
						: ""%>&nbsp;</td>
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
					<td valign="baseline" align="center">
						&nbsp;
					</td>
					<td valign="baseline" align="center">
						&nbsp;
					</td>
				</tr>
				<tr>


					<td valign="baseline" align="center">
						 <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>&nbsp;&nbsp;
          			</td>
          			<td valign="baseline" align="center">	
          				<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a>
						&nbsp;
					</td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
		</body>
	</html:form>
</html>
