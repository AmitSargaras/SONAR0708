
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
	com.integrosys.cms.ui.otherbankbranch.OtherBankForm,
	com.integrosys.cms.app.otherbank.trx.IOtherBankTrxValue
	"%>
<%
	OtherBankForm otherBankForm = (OtherBankForm) request.getAttribute("OtherBankForm");
	IOtherBankTrxValue otherBankTrx = (IOtherBankTrxValue)session.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.IOtherBankTrxValue");
	System.out.println("************************************From State "+ otherBankTrx.getFromState());
	String trxId = (String) request.getAttribute("TrxId");
	String event = (String) request.getAttribute("event");
	
	if(event==null){
		event = otherBankForm.getEvent();
	} 
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	List countryList = null;
	List regionList = null;
	List stateList = null;
	List cityList = null;
	
	countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.countryList");
	regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.regionList");
	stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.stateList");
	cityList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.cityList");
	
	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
			
%>
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

<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%><html>
<!--	 InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
<!--		 InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
<!--		 InstanceEndEditable -->

<!--		 InstanceBeginEditable name="CssStyle" -->

<!--		 InstanceEndEditable -->
<!--		 InstanceBeginEditable name="head" -->
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
		clearDisplayDropdown('stateId');
		clearDisplayDropdown('cityId');
}
 var dep = 'regionId';
 var url = '/cms/OtherBank.do?event=refresh_region_id&countryId='+curSel;
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
	clearDisplayDropdown('cityId');
}
 var dep = 'stateId';
 var url = '/cms/OtherBank.do?event=refresh_state_id&regionId='+curSel;
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
 var dep = 'cityId';
 var url = '/cms/OtherBank.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function submitPage () {
	document.forms[0].action="OtherBank.do?event=maker_confirm_resubmit_edit";
    document.forms[0].submit();
}

function submitDraftPage () {
	document.forms[0].action="OtherBank.do?event=maker_confirm_resubmit_draft";
    document.forms[0].submit();
}

function submitUpdateDraftPage () {
	document.forms[0].action="OtherBank.do?event=maker_confirm_resubmit_update";
    document.forms[0].submit();
}

//
</script>
<!--		 InstanceEndEditable -->
	</head>

	<html:form action='OtherBank.do?'>
		<body>
		<input type="hidden" name="TrxId" value="<%=trxId %>" />
<!--			 InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr>
						<td>
							<h3>
								Maintain Other Bank
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
									<%if(otherBankTrx.getFromState().equals("PENDING_DELETE")){ %>
											<tr class="odd">

												<td class="fieldname" width="20%">
													Bank Code <font color="red">*</font>
												</td>
												<td width="30%"><%=otherBankForm.getOtherBankCode()%>&nbsp;
												
												</td>
												<td class="fieldname" width="20%">
													Bank Name <font color="red">*</font></td>
												<td width="30%"><%=otherBankForm.getOtherBankName()%>&nbsp;
												
												</td>
											</tr>
											<%}else{ %>
											<tr class="odd">

												<td class="fieldname" width="20%">
													Bank Code <font color="red">*</font>
												</td>
												<td width="30%"><html:text property="otherBankCode" value="<%=otherBankForm.getOtherBankCode()%>" />&nbsp;
												<br/><html:errors property="otherBankCodeError"/>
												<br/><html:errors property="spaceError"/>
				                  				<br/><html:errors property="specialCharacterCodeError"/>
												</td>
												<td class="fieldname" width="20%">
													Bank Name <font color="red">*</font>
												<br/><bean:message key="error.string.otherbank.name"/></td>
												<td width="30%"><html:text property="otherBankName" value="<%=otherBankForm.getOtherBankName()%>" />&nbsp;
												<br/><html:errors property="otherBankNameError"/>
												<br/><html:errors property="specialCharacterNameError"/>
												</td>
											</tr>
											<%}if(otherBankTrx.getFromState().equals("PENDING_DELETE")){ %>
											
											<tr class="even">
												<td class="fieldname">
													Address 
												</td>
												<td><integro:empty-if-null value="<%=otherBankForm.getAddress()%>"/>&nbsp;												
												</td>
												<td class="fieldname" >Country </td>
								                  <td><integro:empty-if-null value="<%=otherBankForm.getCountry()%>"/>&nbsp;
												  </td>
								                 </tr> 
								                 <%}else{ %>
								                 <tr class="even">
												<td class="fieldname">
													Address 
												</td>
												<td><html:textarea property="address" value="<%=otherBankForm.getAddress()%>" cols="30" rows="3"></html:textarea>&nbsp;</br> 
												<html:errors property="addressError"/>
												</td>
												<td class="fieldname" >Country </td>
								                  <td>
								                  	<html:select name="OtherBankForm" property="countryId"  onchange="javascript:refreshRegionId(this)">
								                  		<option value="">Please Select</option>
								                  		<html:options collection="countryList" labelProperty="label" property="value" />
								                  	</html:select>
												  </td>
								                 </tr> 
								                 <%}if(otherBankTrx.getFromState().equals("PENDING_DELETE")){ %>
								                
								                <tr class="even">
								                	<td class="fieldname" >region </td>
								                	
								                  	<td><integro:empty-if-null value="<%=otherBankForm.getRegion()%>"/>&nbsp;
								                  	</td>
								                  	
								                	<td class="fieldname" >State </td>
								                  	<td><integro:empty-if-null value="<%=otherBankForm.getState()%>"/>&nbsp;
								                  	</td>
								                </tr>
								                <%}else{%>
								                <tr class="even">
								                	<td class="fieldname" >region </td>
								                  	<td>
								                  		<html:select name="OtherBankForm" property="regionId"  onchange="javascript:refreshStateId(this)">
								                  			<option value="">Please Select</option>
								                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
								                  		</html:select>
								                  	</td>
								                  	
								                	<td class="fieldname" >State </td>
								                  	<td>
								                  		<html:select name="OtherBankForm" property="stateId"  onchange="javascript:refreshCityId(this)">
								                  			<option value="">Please Select</option>
								                  			<html:options collection="stateList" labelProperty="label" property="value" />
								                  		</html:select>
								                  	</td>
								                </tr>
								                <%}if(otherBankTrx.getFromState().equals("PENDING_DELETE")){%>
								                <tr class="odd">  
								                  <td class="fieldname" >City </td>
								                  <td width="25%">
								                  	<integro:empty-if-null value="<%=otherBankForm.getCity()%>"/>&nbsp;
								                  </td>
												<td class="fieldname">
													Contact Number 
												</td>
												<td><integro:empty-if-null value="<%=otherBankForm.getContactNo()%>"/>&nbsp;
												</td>
											</tr>
											<%}else{ %>
											<tr class="odd">  
								                  <td class="fieldname" >City </td>
								                  <td width="25%">
								                  	<html:select name="OtherBankForm" property="cityId" >
								                  		<option value="">Please Select</option>
								                  		<html:options collection="cityList" labelProperty="label" property="value" />
								                  	</html:select>
								                  </td>
												<td class="fieldname">
													Contact Number 
												</td>
												<td><html:text name="OtherBankForm" property="contactNo" value="<%=otherBankForm.getContactNo()%>"/>&nbsp;</br> 
												<html:errors property="contactNoError"/>
												</td>
											</tr>
											<%}if(otherBankTrx.getFromState().equals("PENDING_DELETE")){ %>
											<tr class="odd">
												<td class="fieldname">
													Contact Mail 
												</td>
												<td><integro:empty-if-null value="<%=otherBankForm.getContactMailId()%>"/>&nbsp;
												</td>
												  <td class="fieldname">Fax Number</td>
                								<td><integro:empty-if-null  value="<%=otherBankForm.getFaxNo()%>" />&nbsp;
												</td>
											</tr>
											<%}else{ %>
											<tr class="odd">
												<td class="fieldname">
													Contact Mail 
												</td>
												<td><html:text name="OtherBankForm" property="contactMailId" value="<%=otherBankForm.getContactMailId()%>"/>&nbsp;</br> 
												<html:errors property="contactMailIdError"/>
												</td>
												  <td class="fieldname">Fax Number</td>
                								<td><html:text name="OtherBankForm" property="faxNo" value="<%=otherBankForm.getFaxNo()%>"/>&nbsp;</br> 
												<html:errors property="contactMailIdError"/>
												</td>
											</tr>
											<%} %>
						
						<tr class="even">  
									  <td class="fieldname" >Status</td>
			                   <% if(  otherBankTrx.getFromState().equals("PENDING_UPDATE") || otherBankTrx.getFromState().equals("CLOSED") ){ %>
				             	<td ><html:radio property="status" value="ACTIVE"><%=ICMSConstant.STATE_ENABLE.toString()%></html:radio>
			                  	<html:radio property="status" value="INACTIVE"><%=ICMSConstant.STATE_DISABLE.toString()%></html:radio>
				             <%}else{ %>
				              <td><html:radio property="status" value="ACTIVE" disabled="true"><%=ICMSConstant.STATE_ENABLE.toString()%></html:radio>
			                  	<html:radio property="status" value="INACTIVE" disabled="true"><%=ICMSConstant.STATE_DISABLE.toString()%></html:radio>
				              <%} %>
					                  <td class="fieldname">&nbsp;</td>
					                  <td>&nbsp;
					                  </td>
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
							<td class="even"><%=otherBankTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=otherBankTrx.getRemarks() != null? otherBankTrx.getRemarks(): ""%>&nbsp;</td>
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


					<%
				if (event.equals("maker_save_process")) {
			%>
			<td valign="baseline" align="center">
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitDraftPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td valign="baseline" align="center">
				<a href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> &nbsp;
			</td>
			<%
				} else if (event.equals("maker_update_save_process")) {
			%>
			<td valign="baseline" align="center">
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitUpdateDraftPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td valign="baseline" align="center">	
				<a href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> &nbsp;
			</td>
			<%
				} else {
			%>
			<td valign="baseline" align="center">
				<a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick="submitPage()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
			</td>
			<td valign="baseline" align="center">
				<a href="ToDo.do" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a> &nbsp;
			</td>
			<%
				}
			%>

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
			<html:hidden name="OtherBankForm" property="status" />
			<html:hidden name="OtherBankForm"
				property="otherBankCode" />
			<html:hidden name="OtherBankForm"
				property="otherBankName" />

			<html:hidden name="OtherBankForm" property="region" />
			<html:hidden name="OtherBankForm" property="country" />
			<html:hidden name="OtherBankForm" property="state" />
			<html:hidden name="OtherBankForm" property="createdBy" />
			<html:hidden name="OtherBankForm" property="lastUpdateBy" />
			<html:hidden name="OtherBankForm" property="lastUpdateDate" />
			<html:hidden name="OtherBankForm" property="deprecated" />
			<html:hidden name="OtherBankForm" property="id" />
			
			<html:hidden name="OtherBankForm" property="address" />
			<html:hidden name="OtherBankForm" property="cityId" />
			<html:hidden name="OtherBankForm" property="stateId" />
			<html:hidden name="OtherBankForm" property="countryId" />
			<html:hidden name="OtherBankForm" property="contactNo" />
			<html:hidden name="OtherBankForm" property="contactMailId" />
			<html:hidden name="OtherBankForm" property="regionId" />
			<html:hidden name="OtherBankForm" property="faxNo" />


<!--			 InstanceEndEditable -->
		</body>
	</html:form>
<!--	 InstanceEnd -->
</html>
