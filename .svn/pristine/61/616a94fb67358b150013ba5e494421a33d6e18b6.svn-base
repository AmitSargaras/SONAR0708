<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.component.MaintainComponentForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%
	MaintainComponentForm componentForm = (MaintainComponentForm) request
			.getAttribute("MaintainComponentForm");
	if (componentForm == null) {
		componentForm = new MaintainComponentForm();
	}
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	String startIndex = (String) session
			.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.startIndex");
	
	String searchcomponentName = (String) session
			.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.searchcomponentName");
	
			
	List ageList = (List)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.ageList");		
		pageContext.setAttribute("ageList",ageList);
		
	System.out.println(">>>>>>>>>>>>>>>>>>"+componentForm.getComponentType());
	if(componentForm.getComponentType()==null){
		componentForm.setComponentType("Current_Asset");
		componentForm.setDebtors("N");
		componentForm.setAge("N");
	}
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>"+componentForm.getComponentType());
	
%>

<html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<script type="text/javascript" src="js/imageNavigation.js"></script>
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript" src="js/calDriver.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="css/calendar-blue.css" />
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

function disableHub(){
	

	var key = document.getElementById("pqr").value;
	alert(key);
	var radioBtns = document.getElementById('choiceTable');
	var allRadios = radioBtns.getElementsByTagName('html:radio');
	for(var i=0; i<allRadios.length;i++)
	{
		alert("xx");
		if(allRadios[i].checked == true){
			var val = allRadios[i].value;
			if(val=='N'){
				document.getElementById('abc').disabled = false;
			}
			else{
				document.getElementById('abc').disabled = true;
			}
		}
	}
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
	
  document.forms[0].action="component.do?event=return_search_component&session.startIndex=<%=startIndex%>&session.searchcomponentName=<%=searchcomponentName%>";
  document.forms[0].submit();
}
function submitForm() {

 	document.forms[0].action="component.do?event=maker_create_component";
    document.forms[0].submit();
}

function enableStatus(){
	document.forms[0].status="ACTIVE";
}

function disable(){
	if(document.MaintainComponentForm.componentType[1].checked){
		document.MaintainComponentForm.hasInsurance.checked = false;
		document.MaintainComponentForm.hasInsurance.disabled = true;
		document.getElementById('bookDebts').style.display = 'none'
		document.getElementById('aging').style.display = 'none'
		}
}
function enable(){
	if(document.MaintainComponentForm.componentType[0].checked){
		document.MaintainComponentForm.hasInsurance.checked = true;
		document.MaintainComponentForm.hasInsurance.disabled = false;
		document.getElementById('bookDebts').style.display = ''
		document.getElementById('aging').style.display = ''
		}
}


function enableage(ifcheck){
	if(ifcheck == 1){
		document.getElementById('ageValue').disabled=false;
	}
	else if (ifcheck == 2){
		document.getElementById('ageValue').disabled=true;
	}

}

//-->
</script>
		<style type="text/css">
<!--
.hiddenDiv {
	display: none;
}

.visibleDiv {
	display: block;
	border: 1px grey solid;
}

.style1 {
	color: #FF0000
}

.style5 {
	color: #FF0000
}

.style11 {
	color: #FF0000
}
-->
</style>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action="/component" onreset="showSpanCustodian()">
		<input type="hidden" name="event" />
		<input type="hidden" name="searchcomponentName" />
		<input type="hidden" name="startIndex" />
		<body onload=enableStatus();">

			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td align="right">
							<font color="red">*</font>Mandatory
						</td>
					</tr>
					<tr>
						<td>
							<h3>
								Add New Component
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
								class="tblInput" id="choiceTable">
								<thead>
								</thead>
								<tbody>
								
								<%--Start:--------------------------->Abhishek Naik --%>


									<tr class="even">


										<%
											if (componentForm != null) {
													if (componentForm.getComponentType() != null
															&& componentForm.getComponentType()
																	.equalsIgnoreCase("Current_Asset")) {
										%>
										<td class="fieldname" width="50%">
											Component Type
										</td>
										<td width="30%">
											Current Asset
											<input type="radio" name="componentType" checked="checked"
												value="Current_Asset" onclick="javascript:enable()">
											&nbsp;&nbsp; Current Liability
											<input type="radio" name="componentType"
												value="Current_Liability" onclick="javascript:disable()">
											&nbsp;
										</td>


										<%
											} else {
														if (componentForm.getComponentType() != null
																&& componentForm.getComponentType()
																		.equalsIgnoreCase("Current_Liability")) {
										%>
										<td class="fieldname" width="50%">
											Component Type
										</td>
										<td width="30%">
											Current Asset
											<input type="radio" name="componentType"
												value="Current_Asset" onclick="javascript:enable()">
											&nbsp;&nbsp; Current Liability
											<input type="radio" name="componentType" checked="checked"
												value="Current_Liability" onclick="javascript:disable()">
											&nbsp;
										</td>


										<%
											} else {
										%>

										<td class="fieldname" width="50%">
											Component Type
										</td>
										<td width="30%">
											Current Asset
											<input type="radio" checked="checked" name="componentType"
												value="Current_Asset" onclick="javascript:enable()">
											&nbsp;&nbsp; Current Liability
											<input type="radio" name="componentType"
												value="Current_Liability" onclick="javascript:disable()">
											&nbsp;
										</td>


										<%
											}
													}
												}
										%>

									</tr>

									<tr class="odd">
										<td class="fieldname" width="20%">
											Component Code
										</td>
										<td width="30%">
											<html:text property="componentCode" maxlength="50"
												style="background:#B4CFEC" disabled="true" />
											&nbsp;
										</td>
									</tr>

									<%
										if (componentForm != null) {
												if (componentForm.getComponentName() != null) {
									%>
									<tr class="odd">
										<td class="fieldname" width="20%">
											Component Name
											<font color="red">*</font>
										</td>
										<td width="30%">
											<html:text property="componentName" size="60" maxlength="50" />
											&nbsp;
											<html:errors property="componentName" />
										</td>
									</tr>

									<%
										} else {
									%>
									<tr class="odd">
										<td class="fieldname" width="20%">
											Component Name
											<font color="red">*</font>
										</td>
										<td width="30%">
											<html:text property="componentName" size="60" maxlength="50" />
											&nbsp;
											<html:errors property="componentName" />
										</td>
									</tr>
									<%
										}
											}
									%>
									
									<!-- Start Santosh -->
									<tr class="even" id="componentCategory">
										<td class="fieldname" width="20%">
											Component Category
											<font color="red">*</font>
										</td>
										<td>
											<html:select name="MaintainComponentForm"   property="componentCategory">
												<integro:common-code categoryCode="<%=CategoryCodeConstant.COMPONENT_CATEGORY%>" descWithCode="false" />
									        </html:select>&nbsp;</br>
											<html:errors property="componentCategory" />
										</td>
									</tr>
									
									<tr class="even" id="applicableForDp">
										<td class="fieldname" width="20%">
											Applicable for DP
										</td>
										<td>
											<input type="radio" name="applicableForDp" value="Y" checked="checked"
												 onclick="javascript :enableDp(1);">
											Yes
											</input>
											<input type="radio" name="applicableForDp" value="N" 
												onclick="javascript :enableDp(2);">
											No
											</input>
										</td>
									</tr>
									<!-- End Santosh -->
									<%
													if (componentForm.getComponentType() == null||(componentForm.getComponentType() != null
															&& componentForm.getComponentType().equalsIgnoreCase("Current_Asset"))) {
										%>
									<tr class="even" id="bookDebts" >
										
										<td class="fieldname" width="20%">
											Is Book Debts/Debtors
											<font color="red">*</font>
										</td>
										<td>
											<input type="radio" name="debtors" value="Y"
												 onclick="javascript :enableage(1);">
											Yes
											</input>
											<input type="radio" name="debtors" value="N" checked="checked"
												onclick="javascript :enableage(2);">
											No
											</input>
										</td>
								</tr>
										<%} else{%>
										<tr class="even" id="bookDebts" style="display:none">
										<td class="fieldname" width="20%" >
											Is Book Debts/Debtors
											<font color="red">*</font>
										</td>
										<td >
											<input type="radio" name="debtors" value="Y"
												 onclick="javascript :enableage(1);">
											Yes
											</input>
											<input type="radio" name="debtors" value="N" checked="checked"
												onclick="javascript :enableage(2);">
											No
											</input>
										</td>
										</tr>
										<%} %>
									

									<%
													if (componentForm.getComponentType() == null||(componentForm.getComponentType() != null
															&& componentForm.getComponentType().equalsIgnoreCase("Current_Asset"))) {
									%>
									<tr class="even" id="aging">
										<td class="fieldname" width="20%">
											If Yes then Aging
										</td>
										<td>
											<html:select property="age" styleId="ageValue" disabled="true">
											<option value="" >Please Select</option>
												 <logic:iterate id="al" name="ageList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      				<html:option value="<%=al.getValue() %>"><%=al.getLabel()%></html:option>
                       					 </logic:iterate>
													
											</html:select>
											<html:errors property="age" />
										</td>
									</tr>	
										<%}
											 else{
										%>
										<tr class="even" id="aging" style="display:none">
										<td class="fieldname" width="20%">
											If Yes then Aging
										</td>
										<td>
											<html:select property="age" styleId="ageValue" 
												 disabled="true">
												 <option value="" >Please Select</option>
												<logic:iterate id="al" name="ageList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      				<html:option value="<%=al.getValue() %>"><%=al.getLabel()%></html:option>
                                      				 </logic:iterate>
											</html:select>
										</td>
										</tr>
										<%} %>
										
										
									<tr class="even">
										<%
											if (componentForm != null) {
													if (componentForm.getComponentType() != null
															&& componentForm.getComponentType()
																	.equalsIgnoreCase("Current_Asset")) {
														if (componentForm.getHasInsurance() != null
																&& componentForm.getHasInsurance()
																		.equalsIgnoreCase("Yes")) {
										%>
										<td class="fieldname" width="20%">
											Has Insurance
										</td>
										<td width="30%">
											<input type="checkbox" checked="checked" name="hasInsurance"
												value="Yes" property="ins">
											&nbsp;
										</td>
										<%
											} else {
										%>
										<td class="fieldname" width="20%">
											Has Insurance
										</td>
										<td width="30%">
											<input type="checkbox" name="hasInsurance" value="Yes"
												property="ins">
											&nbsp;
										</td>
										<%
											}
													} else if (componentForm.getComponentType() != null
															&& componentForm.getComponentType()
																	.equalsIgnoreCase("Current_Liability")) {
										%>
										<td class="fieldname" width="20%">
											Has Insurance
										</td>
										<td width="30%">
											<input type="checkbox" name="hasInsurance" value="Yes"
												disabled="disabled" property="ins">
											&nbsp;
										</td>
										<%
											} else {
										%>
										<td class="fieldname" width="20%">
											Has Insurance
										</td>
										<td width="30%">
											<input type="checkbox" checked="checked" name="hasInsurance"
												value="Yes" property="ins">
											&nbsp;
										</td>
										<%
											}
												}
										%>
									</tr>

								</tbody>
							</table>
						</td>
					</tr>

					<%--End:--------------------->Abhishek Naik --%>
				</tbody>
			</table>



			<html:hidden name="MaintainComponentForm" property="deprecated"
				value="N" />
			<html:hidden name="MaintainComponentForm" property="status"
				value="ACTIVE" />


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
					<td colspan="4">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;
					</td>

					<td colspan="4">

						<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
						</a> &nbsp;&nbsp;
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