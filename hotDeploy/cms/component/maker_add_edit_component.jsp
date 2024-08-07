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

	IComponentTrxValue componentTrx = (IComponentTrxValue) session
			.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.IComponentTrxValue");
	DefaultLogger.debug("maker_list_component.jsp", "size is "
			+ componentForm + "<<<<<<<<<<<<<<");
	String event = request.getParameter("event");
	pageContext.setAttribute("componentList", componentForm);
	int sno = 0;
	int startIndex = 0;
	String ind = (String) session
			.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.startIndex");
	
	if (ind != null && (!ind.equals("")))
		startIndex = Integer.parseInt(ind);

	String searchcomponentName = (String) session
			.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.searchcomponentName");
	
	boolean ins = true;
	if (componentTrx.getComponent().getHasInsurance().equalsIgnoreCase(
			"No")) {
		ins = false;
	}
	
	//Start:-------->Abhishek Naik
	List ageList = (List)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.ageList");		
		pageContext.setAttribute("ageList",ageList);
	//End:-------->Abhishek Naik
	
	//Start:-------->Santosh
	DefaultLogger.debug("Before component list","");
	
	List componentCategoryList = (List)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.componentCategoryList");		
		pageContext.setAttribute("componentCategoryList",componentCategoryList);
	//End:-------->Santosh	
	
	DefaultLogger.debug("After component list","");
%>
<%
	String actionStr1 = "com.integrosys.cms.ui.component.MaintainComponentAction";
	String migratedFlag = "N";
	migratedFlag = (String) session.getAttribute(actionStr1
			+ ".migratedFlag");
	if (migratedFlag == null) {
		migratedFlag = "N";
	}
%>


<%@page import="com.integrosys.cms.app.component.trx.IComponentTrxValue"%><html>
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
	document.forms[0].action="component.do?event=return_search_component&session.startIndex=<%=ind%>&session.searchcomponentName=<%=searchcomponentName%>";
	  document.forms[0].submit();
}



function saveForm() {

 	document.forms[0].action="component.do?event=maker_update_draft_component";
    document.forms[0].submit();
}
function submitForm(event) {
	
	if(event=="maker_prepare_resubmit_create")
		{
		
		document.forms[0].action="component.do?event=maker_confirm_resubmit_create";
		
    }else{
      
    	document.forms[0].action="component.do?event=maker_edit_component";
    }
    
    document.forms[0].submit();
}
function disableStatus(){
	document.forms[0].status="DISABLE";
}

function enableStatus(){
	document.forms[0].status="ENABLE";
}

//Start:-------->Abhishek Naik
function disable(){
	

	if(document.MaintainComponentForm.componentType[1].checked){
		document.MaintainComponentForm.hasInsurance.checked = false;
		document.MaintainComponentForm.hasInsurance.disabled = true;
		document.getElementById('bookDebts').style.display = 'none';
		document.getElementById('aging').style.display = 'none';
	}

}

function enable(){
	
	if(document.MaintainComponentForm.componentType[0].checked){
		if(<%=ins%>){
		document.MaintainComponentForm.hasInsurance.checked = true;
		}
		document.MaintainComponentForm.hasInsurance.disabled = false;
		document.getElementById('bookDebts').style.display = '';
		document.getElementById('aging').style.display = '';
	}
	
}

function enableage(ifcheck){
	if(ifcheck == 1){
		document.MaintainComponentForm.age.disabled=false;
		
		
	}
	else if (ifcheck == 2){
		document.MaintainComponentForm.age.disabled=true;
		
		
	}

}
//End:-------->Abhishek Naik



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

	<html:form action='component.do?'>
		<body>
			<input type="hidden" name="startIndex" id="startIndex"
				value="<%=startIndex%>">

			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td align="right">
							<font color="red">*</font>Mandatory
						</td>
					</tr>
					<tr>
						<%
							if ((event.equals("maker_prepare_resubmit_create"))) {
						%>
						<td>
							<h3>
								Create Component
							</h3>
						</td>
						<%
							} else {
						%>
						<td>
							<h3>
								Edit Component
							</h3>
						</td>
						<%
							}
						%>

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
								<%--Start:-------->Abhishek Naik --%>

									<tr class="even">

										<td class="fieldname" width="50%">
											Component Type
										</td>
										<td width="30%">
											Current Asset
											<html:radio property="componentType" value="Current_Asset"
												name="MaintainComponentForm" onclick="javascript:enable()"></html:radio>
											&nbsp;&nbsp; Current Liability
											<html:radio property="componentType"
												value="Current_Liability" name="MaintainComponentForm"
												onclick="javascript:disable()"></html:radio>
											&nbsp;
										</td>
									</tr>

									<tr class="odd">
										<td class="fieldname" width="20%">
											Component Code
										</td>
										<td width="30%"><%=componentForm.getComponentCode()%>
										</td>
									</tr>

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
									<!-- Start Santosh -->
									<tr class="even" id="componentCategory">
										<td class="fieldname" width="20%">
											Component Category
											<font color="red">*</font>
										</td>
										<td>
											<logic:notEmpty property="componentCategory" name="MaintainComponentForm">
											<html:select name="MaintainComponentForm"   property="componentCategory">
												<option value="" >Please Select</option>
												 <logic:iterate id="componentCategory" name="componentCategoryList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      				<html:option value="<%=componentCategory.getValue() %>"><%=componentCategory.getLabel()%></html:option>
                       					 		</logic:iterate>
									        </html:select>&nbsp;</br>
									        </logic:notEmpty>
									        
									        <logic:empty property="componentCategory" name="MaintainComponentForm">
									        <html:select name="MaintainComponentForm"   property="componentCategory">
												<integro:common-code categoryCode="<%=CategoryCodeConstant.COMPONENT_CATEGORY%>" descWithCode="false" />
									        </html:select>&nbsp;</br>
									        </logic:empty>
											<html:errors property="componentCategory" />
										</td>
									</tr>
									<%
										if (null!=componentForm.getApplicableForDp() && "Y".equalsIgnoreCase(componentForm.getApplicableForDp())) {
									%>
									<tr class="even" id="applicableForDp">
										<td class="fieldname" width="20%">
											Applicable for DP
										</td>
										<td>
											<input type="radio" name="applicableForDp" value="Y" checked="checked"
												 onclick="javascript :enableDp(1);"/>
											Yes
											
											<input type="radio" name="applicableForDp" value="N" 
												onclick="javascript :enableDp(2);"/>
											No
											
										</td>
									</tr>
									
									<%
										} 
										 else {
									%>
									<tr class="even" id="applicableForDp">
										<td class="fieldname" width="20%">
											Applicable for DP
										</td>
										<td>
											<input type="radio" name="applicableForDp" value="Y" 
												 onclick="javascript :enableDp(1);"/>
											Yes
										
											<input type="radio" name="applicableForDp" value="N" checked="checked"
												onclick="javascript :enableDp(2);"/>
											No
										</td>
									</tr>
									<%
										}
									%>
									<!-- End Santosh -->
									<%
										if (null!=componentForm.getDebtors() && componentForm.getDebtors().equalsIgnoreCase("Y")) {
									%>
									
									<tr class="even" id="bookDebts">
									
									
										<td class="fieldname" width="20%">
											Is Book Debts/Debtors
											<font color="red">*</font>
										</td>
										<td>
											<input type="radio" name="debtors" value="Y"
												checked="checked" onclick="javascript :enableage(1);">
											Yes
											</input>
											<input type="radio" name="debtors" value="N"
												onclick="javascript :enableage(2);">
											No
											</input>
										</td>
									</tr>

									<tr class="even" id="aging">
										<td class="fieldname" width="20%">
											If Yes then Aging
										</td>
										<td>
											<html:select property="age">
												<option value="" >Please Select</option>
												 <logic:iterate id="al" name="ageList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      				<html:option value="<%=al.getValue() %>"><%=al.getLabel()%></html:option>
                       					 		</logic:iterate>
											</html:select>
											<html:errors property="age" />
										</td>
									</tr>
									
									<%
										} 
									
										 else {
									%>

									<tr class="even" id="bookDebts">
										<td class="fieldname" width="20%">
											Is Book Debts/Debtors
											<font color="red">*</font>
										</td>
										<td>
											<input type="radio" name="debtors" value="Y"
												onclick="javascript :enableage(1);">
											Yes
											</input>
											<input type="radio" name="debtors" value="N"
												checked="checked" onclick="javascript :enableage(2);">
											No
											</input>
										</td>
									</tr>

									<tr class="even" id="aging">
										<td class="fieldname" width="20%">
											If Yes then Aging
										</td>
										<td>
											<html:select property="age" disabled="true">
												<option value="" >Please Select</option>
												 <logic:iterate id="al" name="ageList" type="org.apache.struts.util.LabelValueBean" scope="page">
                                      				<html:option value="<%=al.getValue() %>"><%=al.getLabel()%></html:option>
                       							 </logic:iterate>
											</html:select>
											<html:errors property="age" />
										</td>
									</tr>


									<%
										}
										
										
									%>

									<tr class="even">
										<td class="fieldname" width="20%">
											Has Insurance
										</td>
										<%
											if (null != componentTrx.getComponent().getHasInsurance() && componentTrx.getComponent().getHasInsurance()
														.equalsIgnoreCase("Yes")) {
										%>
										<td width="30%">
											<html:checkbox property="hasInsurance"
												name="MaintainComponentForm" value="Yes"></html:checkbox>
										</td>
										<%
											} else {
										%>
										<td width="30%">
											<html:checkbox property="hasInsurance"
												name="MaintainComponentForm" value="Yes"></html:checkbox>
										</td>
										<%
											}
										%>
									</tr>


									<%--End:-------->Abhishek Naik --%>
								</tbody>
							</table>
						</td>
					</tr>
					<html:hidden name="MaintainComponentForm" property="componentCode"
						value="<%=componentForm.getComponentCode()%>" />
					<html:hidden name="MaintainComponentForm" property="deprecated"
						value="N" />
					<html:hidden name="MaintainComponentForm" property="status"
						value="ACTIVE" />

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
						if ((event.equals("maker_prepare_resubmit_create"))) {
					%>
					<td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_prepare_resubmit_create')"><img
								src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
					<%
						} else {
					%>
					<td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_edit_component')"><img
								src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
					<%
						}
					%>
					<!--  <td colspan="2">
  <center>
  <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" width="70" height="20"
				border="0" id="ImageSave" /></a>
				
				</center>
				&nbsp;
				</td> -->

					<td colspan="2">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" /> </a>
						</center>
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

<script type="text/javascript">
	
	// Added by Abhishek Naik 
		if(document.MaintainComponentForm.componentType[1].checked)	{
				
			disable();}
		else if (document.MaintainComponentForm.componentType[0].checked){
		
			enable();
	}
	
</script>


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
