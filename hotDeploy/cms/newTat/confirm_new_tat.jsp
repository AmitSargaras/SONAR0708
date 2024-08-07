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
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatForm"%>

<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	 HashMap regionMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.regionMap");
	 HashMap rmMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.rmMap");
	 
	 NewTatForm value = (NewTatForm) request.getAttribute("NewTatForm");
	 List relationshipMgrList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.relationshipMgrList");
	 if (!(relationshipMgrList == null)) {
			
			pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("relationshipMgrList", new ArrayList());
		 
	 }
	 
	 
	 List facilityCategoryList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityCategoryList");
	 if (!(facilityCategoryList == null)) {
			
			pageContext.setAttribute("facilityCategoryList", facilityCategoryList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("facilityCategoryList", new ArrayList());
		 
	 }
	 
	 List facilityNameList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityNameList");
	 if (!(facilityNameList == null)) {
			
			pageContext.setAttribute("facilityNameList", facilityNameList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("facilityNameList", new ArrayList());
		 
	 }
	 
	 List CAMTypeList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.CAMTypeList");
	 if (!(CAMTypeList == null)) {
			
			pageContext.setAttribute("CAMTypeList", CAMTypeList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("CAMTypeList", new ArrayList());
		 
	 }
	 
	 List DeferralTypeList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.DeferralTypeList");
	 if (!(DeferralTypeList == null)) {
			
			pageContext.setAttribute("DeferralTypeList", DeferralTypeList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("DeferralTypeList", new ArrayList());
		 
	 }
	 
	 List LSSCoOrdinatorBranchList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.LSSCoOrdinatorBranchList");
	 if (!(LSSCoOrdinatorBranchList == null)) {
			
			pageContext.setAttribute("LSSCoOrdinatorBranchList", LSSCoOrdinatorBranchList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("LSSCoOrdinatorBranchList", new ArrayList());
		 
	 }
%>


<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.ArrayList"%><html>
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
    document.forms[0].action="NewTat.do?event=list_cancel";
    
    document.forms[0].submit();
}
function submitForm() {

 	document.forms[0].action="NewTat.do?event=submit_documents";
    document.forms[0].submit();
}

function myFunction()
{
var x;
var r=confirm("Do you want to submit the documents.!!!!");
if (r==true)
  {
	document.forms[0].action="NewTat.do?event=submit_documents";
    document.forms[0].submit();
  }
}


function enbleBtn(ifChecked){
	if(ifChecked == 1){
		
		document.getElementById('fCategory').style.display = ''
		document.getElementById('fName').style.display = ''
		document.getElementById('deferralType').style.display = 'none'
		document.getElementById('CAMType').style.display = 'none'
	}else if (ifChecked == 2 ){
	
		document.getElementById('fCategory').style.display = 'none'
			document.getElementById('fName').style.display = 'none'
			document.getElementById('deferralType').style.display = ''
			document.getElementById('CAMType').style.display = 'none'	
	}else if (ifChecked == 3 ){
		
		document.getElementById('fCategory').style.display = 'none'
			document.getElementById('fName').style.display = 'none'
			document.getElementById('deferralType').style.display = 'none'
			document.getElementById('CAMType').style.display = ''
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

<html:form action="/NewTat">
	<body>

	<!-- InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3>Submit Documents</h3>
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

						<tr class="odd">

							<td class="fieldname" width="10%">Party Name: <font
								color="red">*</font></td>
							<td width="30%"><integro:empty-if-null
								value="<%=customer.getCustomerName() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Party Id: <font
								color="red">*</font></td>
							<td width="30%"><integro:empty-if-null
								value="<%=customer.getCifId() %>" />&nbsp;</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="10%">Segment: <font color="red">*</font></td>
							<td width="30%"><integro:common-code-single
								categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
								descWithCode="false" display="true"
								entryCode="<%=customer.getCustomerSegment() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Region: <font color="red">*</font></td>
							<td width="30%"><integro:empty-if-null
								value="<%=regionMap.get(customer.getRmRegion()) %>" />&nbsp;</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="10%">Relationship Manager: <font
								color="red">*</font></td>
							<td width="30%">
							<%if(rmMap.get(customer.getRelationshipMgr())==null ){ %> <html:select
								name="NewTatForm" property="relationshipManager"
								style="width:250px">
								<option value="">Please Select</option>
								<html:options collection="relationshipMgrList"
									labelProperty="label" property="value" />
							</html:select> <br>
							<%}else{ %> <integro:empty-if-null
								value="<%=rmMap.get(customer.getRelationshipMgr()) %>" />&nbsp;
							<%} %> <html:errors property="relationshipMgrError" /></td>

						</tr>

						<tr class="even">

							<td class="fieldname" width="10%">Case Initiator: <font
								color="red">*</font></td>
							<td width="30%"><integro:empty-if-null
								value="<%=user.getUserName() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Module: <font color="red">*</font></td>
							<td width="25%">
							<%if( value.getModule()==null || value.getModule().equalsIgnoreCase("LIMIT")){
											%> <input type="radio" name="module" checked="checked"
								value="LIMIT" onclick="javascript : enbleBtn(1);">Limit
							Release</input> <input type="radio" name="module" value="PDDC"
								onclick="javascript : enbleBtn(2);">Post Disbursal
							Deferral Clearance</input> <input type="radio" name="module" value="CAM"
								onclick="javascript : enbleBtn(3);">CAM Module</input> <%
										}
										else if( value.getModule().equalsIgnoreCase("PDDC") ){
					                  	%> <input type="radio" name="module"
								value="LIMIT" onclick="javascript : enbleBtn(1);">Limit
							Release</input> <input type="radio" name="module" checked="checked"
								value="PDDC">Post Disbursal Deferral Clearance</input> <input
								type="radio" name="module" value="CAM"
								onclick="javascript : enbleBtn(3);">CAM Module</input> <%
										}else if( value.getModule().equalsIgnoreCase("CAM") ){
					                  	%> <input type="radio" name="module"
								value="LIMIT" onclick="javascript : enbleBtn(1);">Limit
							Release</input> <input type="radio" name="module" value="PDDC"
								onclick="javascript : enbleBtn(2);">Post Disbursal
							Deferral Clearance</input> <input type="radio" name="module"
								checked="checked" value="CAM">CAM Module</input> <%}%> <br>
							<html:errors property="moduleError" /></td>

						</tr>
						<% if(value.getModule()==null || value.getModule().equalsIgnoreCase("LIMIT") ){  %>
						<tr class="even" id="fCategory">

							<td class="fieldname" width="10%">Facility Category: <font
								color="red">*</font></td>
							<td><html:select name="NewTatForm"
								property="facilityCategory">
								<!--											      <option value="">Please Select  </option>	-->
								<!--									                      <html:options collection="facilityCategoryList" property="label" labelProperty="value"/>-->
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY%>"
									descWithCode="false" />
							</html:select>&nbsp;</br>
							<html:errors property="newFacilityCategoryError" /></td>

						</tr>

						<%}else{ %>
						<tr class="even" id="fCategory" style="display: none;">

							<td class="fieldname" width="10%">Facility Category: <font
								color="red">*</font></td>
							<td><html:select name="NewTatForm"
								property="facilityCategory">
								<!--											      <option value="">Please Select  </option>	-->
								<!--									                      <html:options collection="facilityCategoryList" property="label" labelProperty="value"/>-->
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY%>"
									descWithCode="false" />
							</html:select>&nbsp;</br>
							<html:errors property="newFacilityCategoryError" /></td>

						</tr>

						<%} %>
						<% if(value.getModule()==null || value.getModule().equalsIgnoreCase("LIMIT") ){  %>
						<tr class="even" id="fName">

							<td class="fieldname" width="10%">Facility Name: <font
								color="red">*</font></td>
							<td width="30%"><html:select name="NewTatForm"
								property="facilityName" style="width:250px">
								<option value="">Please Select</option>
								<html:options collection="facilityNameList"
									labelProperty="label" property="value" />
							</html:select> <br>
							<html:errors property="facilityNameError" /></td>

						</tr>
						<%}else{ %>

						<tr class="even" id="fName" style="display: none;">

							<td class="fieldname" width="10%">Facility Name: <font
								color="red">*</font></td>
							<td width="30%"><html:select name="NewTatForm"
								property="facilityName" style="width:250px">
								<option value="">Please Select</option>
								<html:options collection="facilityNameList"
									labelProperty="label" property="value" />
							</html:select> <br>
							<html:errors property="facilityNameError" /></td>

						</tr>
						<%} %>
						<% if(value.getModule()!=null && value.getModule().equalsIgnoreCase("PDDC") ){  %>
						<tr class="even" id="CAMType">

							<td class="fieldname" width="10%">CAM Type: <font
								color="red">*</font></td>
							<td width="30%"><html:select property="camType" value="">
								<html:option value="">Please Select</html:option>
								<html:option value="Initial">Initial</html:option>
								<html:option value="Interim">Interim</html:option>
								<html:option value="Annual">Annual</html:option>
							</html:select> <br>
							<html:errors property="CAMTypeError" /></td>

						</tr>
						<%}else{ %>
						<tr class="even" id="CAMType" style="display: none;">

							<td class="fieldname" width="10%">CAM Type: <font
								color="red">*</font></td>
							<td width="30%"><html:select property="camType" value="">
								<html:option value="">Please Select</html:option>
								<html:option value="Initial">Initial</html:option>
								<html:option value="Interim">Interim</html:option>
								<html:option value="Annual">Annual</html:option>
							</html:select> <br>
							<html:errors property="CAMTypeError" /></td>

						</tr>

						<%} %>
						<% if(value.getModule()!=null && value.getModule().equalsIgnoreCase("PDDC") ){  %>
						<tr class="even" id="deferralType">

							<td class="fieldname" width="10%">Deferral Type: <font
								color="red">*</font></td>


							<html:select name="NewTatForm" property="deferralType">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>"
									descWithCode="false" />
							</html:select>
							&nbsp;
							</br>
							<html:errors property="DeferralTypeError" />
							</td>



						</tr>

						<%}else{ %>
						<tr class="even" id="deferralType" style="display: none;">

							<td class="fieldname" width="10%">Deferral Type: <font
								color="red">*</font></td>
							<td><html:select name="NewTatForm" property="deferralType">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>"
									descWithCode="false" />
							</html:select>&nbsp;</br>
							<html:errors property="DeferralTypeError" /></td>

						</tr>
						<%} %>
						<tr class="even">

							<td class="fieldname" width="10%">LSS Co-ordinator Branch: <font
								color="red">*</font></td>
							<td width="30%"><html:select name="NewTatForm"
								property="lssCoordinatorBranch" style="width:250px">
								<option value="">Please Select</option>
								<html:options collection="LSSCoOrdinatorBranchList"
									labelProperty="label" property="value" />
							</html:select> <br>
							<html:errors property="LSSCoOrdinatorBranchError" /></td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Remarks: <font color="red">*</font></td>
							<td><html:text property="remarks" size="30" maxlength="20"></html:text>&nbsp;
							<br>
							<html:errors property="remarksError" /></td>

						</tr>
						<html:hidden property="status" />
						<html:hidden name="NewTatForm" property="module" />
						<html:hidden name="NewTatForm" property="lspLeId" />
						<html:hidden name="NewTatForm" property="lspShortName" />

						<html:hidden name="NewTatForm" property="createBy"
							value="SA_MAKER" />
						<html:hidden name="NewTatForm" property="lastUpdateBy"
							value="SA_MAKER" />
						<html:hidden name="NewTatForm" property="lastUpdateDate" />
						<html:hidden name="NewTatForm" property="creationDate" />
						<html:hidden name="NewTatForm" property="deprecated" value="N" />
						<html:hidden name="NewTatForm" property="id" />




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
			<td colspan="4"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick=" myFunction()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;</td>
			<!--<td colspan="4"><a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" width="70" height="20"
				border="0" id="ImageSave" />
				
				</a>&nbsp;&nbsp;
				
				</td>
			-->
			<td colspan="4"><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
			</a> &nbsp;&nbsp;</td>

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
