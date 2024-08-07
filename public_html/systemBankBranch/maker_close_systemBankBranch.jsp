
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
	com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchForm,com.integrosys.cms.app.systemBankBranch.trx.ISystemBankBranchTrxValue,com.integrosys.cms.app.systemBankBranch.trx.OBSystemBankBranchTrxValue"%>
<%
	 MaintainSystemBankBranchForm systemBankBranchForm = (MaintainSystemBankBranchForm) request.getAttribute("MaintainSystemBankBranchForm");
ISystemBankBranchTrxValue systemBankBranchTrx = (ISystemBankBranchTrxValue)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.ISystemBankBranchTrxValue");
String event = request.getParameter("event");
int sno = 0;
	int startIndex = 0;
	
	List hubValueList = (List)session.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.hubValueList");
	pageContext.setAttribute("hubValueList",hubValueList);
	boolean isNotHub=false;
	if(systemBankBranchForm.getIsHub()!=null)
		if(systemBankBranchForm.getIsHub().equalsIgnoreCase("N"))
			isNotHub=true;
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
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}
function submitPage(event) {
	
	if(event=="maker_draft_close_process")
		{
		
		document.forms[0].action="systemBankBranch.do?event=maker_confirm_draft_close";
		
    }else{
      
    	document.forms[0].action="systemBankBranch.do?event=maker_confirm_close";
    }
    
    document.forms[0].submit();
}

//-->
</script>
<style type="text/css"><!--

.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}
-->
</style>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='systemBankBranch.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
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
								View System Bank Branch
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
											<tr class="even">

												<td class="fieldname" width="20%">
													Branch Code
												</td>
												<td width="30%"><%=systemBankBranchForm.getSystemBankBranchCode()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Branch Name
												</td>
												<td width="30%"><%=systemBankBranchForm.getSystemBankBranchName()%>&nbsp;
												</td>
											</tr>
											<tr class="odd">

												<td class="fieldname" width="20%">
													Bank Code
												</td>
												<td width="30%"><%=systemBankBranchForm.getSystemBankCode()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Bank Name
												</td>
												<td width="30%"><%=systemBankBranchForm.getSystemBankName()%>&nbsp;
												</td>
											</tr>
											 <tr class="even">
             
              <td class="fieldname" width="20%">RBI Code</td>
              <td width="30%"><integro:empty-if-null value="<%=systemBankBranchForm.getRbiCode()%>" />&nbsp;</td>
              <td class="fieldname" width="20%">Status&nbsp;</td>
              <td width="30%"><%if(systemBankBranchForm.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
            </tr>
            <tr class="odd">
             
              <td class="fieldname" width="20%">HUB & Spoke</td>
              <td width="30%">HUB<html:radio name="MaintainSystemBankBranchForm" property="isHub" value="Y" disabled="true" />&nbsp;Spoke<html:radio disabled="true"  name="MaintainSystemBankBranchForm" property="isHub" value="N"/></td>
              <td class="fieldname" width="20%">Linked Hub</td>
              <td width="30%"> <span id="linkedHub" class="<%= isNotHub? "visibleDiv":"hiddenDiv"%>" ><html:select name="MaintainSystemBankBranchForm"   property="linkedHub" disabled="true" >
		      
                      <html:options collection="hubValueList" property="value" labelProperty="label"/>
                    </html:select>&nbsp; </span>&nbsp;</td>
            </tr>
            <tr class="even">
             
              <td class="fieldname" width="20%">Is Vault &nbsp;  </td>
              <td width="30%"><html:checkbox name="MaintainSystemBankBranchForm" property="isVault" disabled="true" />&nbsp;</td>
              <td class="fieldname" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr class="odd">
             
              <td class="fieldname" width="20%">Custodian 1</td>
              <td width="30%"><integro:empty-if-null value="<%=systemBankBranchForm.getCustodian1()%>"/>&nbsp;</td>
              <td class="fieldname" width="20%">Custodian 2</td>
              <td width="30%"><integro:empty-if-null value="<%=systemBankBranchForm.getCustodian2()%>"/>&nbsp;</td>
            </tr>
											<tr class="even">
												<td class="fieldname">
													Address
												</td>
												<td width="30%"><integro:empty-if-null value="<%=systemBankBranchForm.getAddress()%>"/>&nbsp;</td>
												<td class="fieldname">
													Country
												</td>
												<td>
												<%if(systemBankBranchTrx.getStagingSystemBankBranch().getCountry()!=null){ %>
												<%=systemBankBranchTrx.getStagingSystemBankBranch().getCountry().getCountryName()%>
												<%} %>&nbsp;
												</td>
											</tr>
											<tr class="odd">
											<td class="fieldname">
													Region
												</td>
												<td>
												<%if(systemBankBranchTrx.getStagingSystemBankBranch().getRegion()!=null){ %>
												<%=systemBankBranchTrx.getStagingSystemBankBranch().getRegion().getRegionName()%>
												<%} %>
												&nbsp;
												</td>
												<td class="fieldname">
													State
												</td>
												<td>
												<%if(systemBankBranchTrx.getStagingSystemBankBranch().getState()!=null){ %>
												<%=systemBankBranchTrx.getStagingSystemBankBranch().getState().getStateName()%>
												<%} %>
												&nbsp;
												</td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													City/Town
												</td>
												<td>
												<%if(systemBankBranchTrx.getStagingSystemBankBranch().getCityTown()!=null){ %>
												<%=systemBankBranchTrx.getStagingSystemBankBranch().getCityTown().getCityName()%>
												<%} %>
												&nbsp;
												</td>
												<td class="fieldname">
													Pincode
												</td>
												<td><integro:empty-if-null value="<%=systemBankBranchForm.getPincode()%>"/>&nbsp;
												</td>
											</tr>
											
											<tr class="even">

												<td class="fieldname">
												</td>
												<td>
												</td>
												<td class="fieldname">
													Contact Number
												</td>
												<td><integro:empty-if-null value="<%=systemBankBranchForm.getContactNumber()%>"/>&nbsp;
												</td>
											</tr>
											
											<tr class="odd">
												<td class="fieldname">
													Contact Mail
												</td>
												<td><integro:empty-if-null value="<%=systemBankBranchForm.getContactMail()%>"/>&nbsp;
												</td>
												 
							<td class="fieldname">Fax Number</td>
							<td><integro:empty-if-null value="<%=systemBankBranchForm.getFaxNumber()%>"/>&nbsp;</td>

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
							<td class="even"><%=systemBankBranchTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=systemBankBranchTrx.getRemarks() != null
						? systemBankBranchTrx.getRemarks()
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
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
		<tr>


			<td colspan="2">
			 <%if((event.equals("maker_draft_close_process"))){%>
			<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
				onClick="submitPage('maker_draft_close_process')">
				<img src="img/close1a.gif"
				name="Image3311" border="0" id="Image3311" />
				</a>&nbsp;&nbsp;
				<%}else{ %>
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
				onClick="submitPage('maker_prepare_close')">
				<img src="img/close1a.gif"
				name="Image3311" border="0" id="Image3311" />
				</a>&nbsp;&nbsp;
				   <%} %></td>
				  <td colspan="2">
				<a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
				<img
				src="img/cancel1.gif" name="Image2" 
				width="70" height="20" border="0" id="Image2" />
				</a> &nbsp;
				
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


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
