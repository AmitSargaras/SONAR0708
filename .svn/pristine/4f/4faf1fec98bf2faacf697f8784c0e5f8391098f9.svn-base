
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.otherbankbranch.OtherBranchForm,com.integrosys.cms.app.otherbranch.trx.IOtherBankBranchTrxValue,com.integrosys.cms.app.otherbranch.trx.OBOtherBankBranchTrxValue"%>
<%
	OtherBranchForm otherBranchForm = (OtherBranchForm) request
			.getAttribute("OtherBranchForm");


	IOtherBankBranchTrxValue otherBranchTrx = (IOtherBankBranchTrxValue) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.IOtherBankBranchTrxValue");
	String trxId = (String) request.getAttribute("TrxId");
	String event = (String) request.getAttribute("event");
	if(event==null){
		event = otherBranchForm.getEvent();
	} 
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	
	List countryList = null;
	List regionList = null;
	List stateList = null;
	List cityList = null;

	countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.countryList");
	regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.regionList");
	stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.stateList");
	cityList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.cityList");

	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
%>


<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%><html>
<!--	 InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
	
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
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

function refreshRegionId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 if(curSel==""){
		clearDisplayDropdown('branchStateId');
		clearDisplayDropdown('branchCityId');
}
 var dep = 'branchRegionId';
 var url = '/cms/OtherBranch.do?event=refresh_region_id&countryId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function refreshStateId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 if(curSel==""){
		clearDisplayDropdown('branchCityId');
}
 var dep = 'branchStateId';
 var url = '/cms/OtherBranch.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshCityId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'branchCityId';
 var url = '/cms/OtherBranch.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function submitPage () {
	document.forms[0].action="OtherBranch.do?event=maker_confirm_resubmit_edit";
    document.forms[0].submit();
}

function submitDraftPage () {
	document.forms[0].action="OtherBranch.do?event=maker_confirm_resubmit_draft";
    document.forms[0].submit();
}

function SubmitUpdateDraftPage () {
	document.forms[0].action="OtherBranch.do?event=maker_confirm_resubmit_update";
    document.forms[0].submit();
}


</script>
<!--		 InstanceEndEditable -->
	</head>

	<html:form action='OtherBranch.do?'>
	<body>
	<input type="hidden" name="TrxId" value="<%=trxId %>" />
	<!--			 InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<br>
			<tr>
				<td>
				<h3>Maintain Other Bank Branch</h3>
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

							<td class="fieldname" width="20%">Bank Code </td>
							<td width="30%"><%=otherBranchForm.getOtherBankCode()%> &nbsp;
							</td>
							<td class="fieldname" width="20%">Bank Name </td>
							<td width="30%"><bean:write name="OtherBranchForm"  property="otherBankName"/></td>
						</tr>
						
						<tr class="odd">

							<td class="fieldname" width="20%">Branch Code <font
								color="red">*</font></td>
							<td width="30%"><bean:write property="otherBranchCode" name="OtherBranchForm"/> 
							<br/><html:errors property="otherBranchCodeError"/>
							</td>
							<td class="fieldname" width="20%">Branch Name <font
								color="red">*</font>
							<br/><bean:message key="error.string.branch.name"/></td>
							<td width="30%"><input type="text" name="otherBranchName" value="<%=otherBranchForm.getOtherBranchName()%>" /> </td>
							<br/><html:errors property="otherBranchNameError"/>
						</tr>
						
						<tr class="odd">

							<td class="fieldname" width="20%">RBI Code </td>
							<td width="30%"><input type="text" name="branchRbiCode" value="<%=otherBranchForm.getBranchRbiCode()%>" />
							<br/><html:errors property=""/>
							</td>
							<td class="fieldname" width="20%">&nbsp;</td>
							<td width="30%">&nbsp; </td>
						</tr>
						
						<tr class="even">
							<td class="fieldname">Address </td>
							<td><html:textarea name="OtherBranchForm" property="branchAddress"
								value="<%=otherBranchForm.getBranchAddress()%>" cols="30" rows="3" />&nbsp;</br>
							<html:errors property="addressError" /></td>
							<td class="fieldname">Country </td>
				                  <td>
				                  	<html:select name="OtherBranchForm" property="branchCountryId"  onchange="javascript:refreshRegionId(this)">
				                  		<option value="">Please Select</option>
				                  		<html:options collection="countryList" labelProperty="label" property="value" />
				                  	</html:select>
								  </td>
				                 </tr> 
				                
				                <tr class="even">
				                	<td class="fieldname" >region </td>
				                  	<td>
				                  		<html:select name="OtherBranchForm" property="branchRegionId"  onchange="javascript:refreshStateId(this)">
				                  			<option value="">Please Select</option>
				                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
				                  		</html:select>
				                  	</td>
				                  	
				                	<td class="fieldname" >State </td>
				                  	<td>
				                  		<html:select name="OtherBranchForm" property="branchStateId"  onchange="javascript:refreshCityId(this)">
				                  			<option value="">Please Select</option>
				                  			<html:options collection="stateList" labelProperty="label" property="value" />
				                  		</html:select>
				                  	</td>
				                </tr>
				                <tr class="odd">  
				                  <td class="fieldname" >City/Town </td>
				                  <td width="25%">
				                  	<html:select name="OtherBranchForm" property="branchCityId" >
				                  		<option value="">Please Select</option>
				                  		<html:options collection="cityList" labelProperty="label" property="value" />
				                  	</html:select>
				                  </td>
				                  <td class="fieldname">Contact Number</td>
							<td><html:text name="OtherBranchForm" property="branchContactNo"
								value="<%=otherBranchForm.getBranchContactNo()%>" />&nbsp;</br>
							<html:errors property="branchContactNoError" /></td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Contact Mail 
							</td>
							<td><html:text name="OtherBranchForm"
								property="branchContactMailId"
								value="<%=otherBranchForm.getBranchContactMailId()%>" />&nbsp;</br>
							<html:errors property="branchContactMailIdError" /></td>
							<td class="fieldname">Fax Number</td>
							<td><html:text name="OtherBranchForm"
								property="branchFaxNo"
								value="<%=otherBranchForm.getBranchFaxNo()%>" />&nbsp;</br>
							<html:errors property="branchFaxNoError" /></td>

						</tr>
						
						<tr class="even">  
									  <td class="fieldname" >Status</td>
					                 
					                  
					                   <% if(  otherBranchTrx.getFromState().equals("PENDING_UPDATE") || otherBranchTrx.getFromState().equals("CLOSED") ){ %>
				             	<td ><html:radio property="status" value="ACTIVE"><%=ICMSConstant.STATE_ENABLE.toString()%></html:radio>
			                  	<html:radio property="status" value="INACTIVE"><%=ICMSConstant.STATE_DISABLE.toString()%></html:radio></td>
				             <%}else{ %>
				              <td><html:radio property="status" value="ACTIVE" disabled="true"><%=ICMSConstant.STATE_ENABLE.toString()%></html:radio>
			                  	<html:radio property="status" value="INACTIVE" disabled="true"><%=ICMSConstant.STATE_DISABLE.toString()%></html:radio>
				              <%} %>
				              </td>
					                  	
					                  <td class="fieldname">&nbsp;</td>
					                  <td>&nbsp;
					                  </td>
				                </tr>
					</tbody>

					<html:hidden name="OtherBranchForm" property="status" />
					<html:hidden name="OtherBranchForm" property="otherBankId" />
					<html:hidden name="OtherBranchForm" property="otherBankCode" />
					<html:hidden name="OtherBranchForm" property="otherBranchCode" />
					<html:hidden name="OtherBranchForm" property="createdBy" />
					<html:hidden name="OtherBranchForm" property="lastUpdateBy" />
					<html:hidden name="OtherBranchForm" property="lastUpdateDate" />
					<html:hidden name="OtherBranchForm" property="deprecated" />
					<html:hidden name="OtherBranchForm" property="id" />
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
							<td class="even"><%=otherBranchTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=otherBranchTrx.getRemarks() != null
						? otherBranchTrx.getRemarks()
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
			<td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>
		<tr>


			<%
				if (event.equals("maker_save_process")) {
			%>
			<td colspan="2"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitDraftPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a>
				</td>
				<td colspan="2">
				<a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> </td>
			<%
				} else if (event.equals("maker_update_save_process")) {
			%>
			<td colspan="2"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="SubmitUpdateDraftPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a> 
				</td>
				<td colspan="2">
				<a
				href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> </td>
			<%
				} else {
			%>
			<td colspan="2"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a> 
				</td>
				<td colspan="2">
				<a href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> </td>
			<%
				}
			%>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>


	<!--			 InstanceEndEditable -->
	</body>
</html:form>
<!--	 InstanceEnd -->
</html>
