<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page
	import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<%
String pName = (String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupName");
String cityName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityName");
String stateName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateName");
String regionName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionName");
String countryName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryName");
String cityRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityRegName");
String stateRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateRegName");
String regionRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionRegName");
String countryRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryRegName");
String rmRegionName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rmRegionName");
String relManagerName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.relManagerName");
String scfStatus=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.scfStatus");
System.out.println("--------------------------scfStatus-------------------------");
String scfErrMsg=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.scfErrMsg");
System.out.println("--------------------------scfErrMsg------------------------");
String scfFlag=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.scfFlag");
System.out.println("--------------------------scfFlag------------------------");
String ecbfStatus=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ecbfStatus");
System.out.println("--------------------------ecbfStatus-------------------------");
String ecbfErrMsg=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ecbfErrMsg");
System.out.println("--------------------------ecbfErrMsg------------------------");
String ecbfFlag=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ecbfFlag");
System.out.println("--------------------------ecbfFlag------------------------"); 
	
	int sno = 1;
	int vno = 1;
%>
<%
ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
.getAttribute("ManualInputCustomerInfoForm");
	String context = request.getContextPath() + "/";
	

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	
	List otherSystemList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewOtherSystemList");

	//List otherBankList = value.getOtherBank();

	if (!(otherSystemList == null)) {
		
		pageContext.setAttribute("otherSystemList", otherSystemList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	List vendorList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.vendorList");
			if (!(vendorList == null)) {
				pageContext.setAttribute("vendorList", vendorList);
			}

%>



<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%><html>
<head>

<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>




<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<script language="JavaScript" type="text/JavaScript"><!--
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

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


function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}

function addParty(){
	document.getElementById('addParty').style.display = '';
	document.getElementById('addSystemDetails').style.display = '';
	document.getElementById('addSystemDetails2').style.display = '';
	document.getElementById('hrline').style.display = '';
}
function addSystem(name){
	document.forms[0].action="ManualInputCustomer.do?event="+name;
	
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
 var dep = 'region';
 var url = '/cms/ManualInputCustomer.do?event=refresh_region_id&countryId='+curSel;
 
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
 var dep = 'state';
 var url = '/cms/ManualInputCustomer.do?event=refresh_state_id&regionId='+curSel;
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
 var dep = 'city';
 var url = '/cms/ManualInputCustomer.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function refreshRelationshipMgrId(dropdown)
{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'relationshipMgr';
	 var url = '/cms/ManualInputCustomer.do?event=refresh_rm_id&regionId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
//function createPartyGroup() {
	
 //	document.forms[0].action = "MIPartyGroup.do?event=maker_prepare_create_party_group&startIndex=";
 	
  //  document.forms[0].submit();
//}
//-->
window.onload = function(e){ 
	<%
	if("22".equalsIgnoreCase(form.getEntity()) || "PVT.LTD.".equalsIgnoreCase(form.getEntity()) || "LIMITED".equalsIgnoreCase(form.getEntity())) {
		%>	
	    	document.getElementById("cin").style.visibility = "visible";
	    	<% }
		else {
			%>
		    document.getElementById("cin").style.visibility = "hidden";
	 <%	} %>
}
</script>
<!-- InstanceEndEditable -->
</head>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>Summary Details </h3>
						</td>
					</tr>
					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party ID<font color="red">*</font></td>
										<td width="30%"><%=form.getCifId() %></td>
										<td class="fieldname" width="20%">Party Name<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getCustomerNameShort()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getStatus()%>"/></td>
										<td class="fieldname" width="20%">Main Branch<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getMainBranch()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment<font color="red">*</font></td>
										<td width="30%"><integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode="<%=form.getCustomerSegment()%>"
												descWithCode="false"  display="true"/></td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getRelationshipStartDate()%>"/></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo" id="addParty">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getCustomerNameShort()%>"/></td>
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getStatus()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getMainBranch()%>"/>&nbsp;</td>
										<td class="fieldname" width="20%">Group</td>
										<td width="30%"><integro:empty-if-null value="<%=pName%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">RM Employee Code<font color="red">*</font></td>	
										<td width="30%"><integro:empty-if-null value="<%=form.getRelationshipMgrEmpCode()%>"/></td>	
										<td class="fieldname" width="20%">Relationship Manager</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getRelationshipMgr()%>"/></td>
									</tr>
									<tr class="even">		
										<td class="fieldname" width="20%">RM Region</td>	
										<td width="30%"><integro:empty-if-null value="<%=form.getRmRegion()%>"/></td>
										<td class="fieldname">Segment</td>
										<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode="<%=form.getCustomerSegment()%>"
												descWithCode="false"  display="true"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Entity<font color="red">*</font></td>
										<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.ENTITY%>"
												entryCode="<%=form.getEntity()%>"
												descWithCode="false"  display="true"/></td>
										<td class="fieldname">Industry Name<font color="red">*</font></td>
										<td>
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>"
												entryCode="<%=form.getIndustryName()%>"
												descWithCode="false"  display="true" />	
												</td>
									</tr>
									
									<tr class="even">
										<td class="fieldname" width="20%">CIN/LLPIN<font color="red" id="cin">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getCinLlpin()%>"/></td>
										<td class="fieldname" width="20%">Date of Birth/Incorporation<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getDateOfIncorporation()%>"/></td>
									</tr>
									
									<tr class="odd">
									<td class="fieldname">RBI Industry Code<font color="red">*</font></td>
										<td>
										<%=("".equals(form.getRbiIndustryCode()) || form.getRbiIndustryCode()==null)?"-":form.getRbiIndustryCode()+"-" %>
										<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>"
												entryCode="<%=form.getRbiIndustryCode()%>"
												descWithCode="false"  display="true" /></td>
										<td class="fieldname">Cycle<font color="red">*</font></td>	
										<td><integro:empty-if-null value="<%=form.getCycle()%>"/>
									</tr>
									<tr class="even">
										<td class="fieldname"></td>
										<td></td>
										<td class="fieldname">Party name as per PAN</td>
										<td><integro:empty-if-null value="<%=form.getPartyNameAsPerPan()%>"/>
										<html:errors property="partyNameAsPerPanError"/>
										</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Form 60/61</td>
										<td>
										<% if(form.getForm6061Checked()==null){%>
											<input type="checkbox" id="form6061"   disabled="disabled"></input>
											<html:hidden property="form6061Checked"/>
											<% }else if(form.getForm6061Checked().equals("Y")){%>
											<input type="checkbox" id="form6061" checked="checked" disabled="disabled"></input>
											<html:hidden property="form6061Checked"/>
											<%} else{%>
											<input type="checkbox" id="form6061" disabled="disabled"></input>
											<html:hidden property="form6061Checked"/>
											<%} %>
										</td>
										
										<td class="fieldname">PAN<font color="red">*</font></td>
										<td><integro:empty-if-null value="<%=form.getPan()%>"/></td>
									</tr>
									<!--Santosh LEI CR  -->
									<tr class="even">
										<td class="fieldname">LEI Code</td>
										<td><integro:empty-if-null value="<%=form.getLeiCode()%>"/></td>
										<td class="fieldname">LEI Exp. Date</td>
										<td><integro:empty-if-null value="<%=form.getLeiExpDate()%>"/></td>
									</tr>
									<!--End Santosh LEI CR  -->
									<tr class="even">
										<td class="fieldname">Defer LEI</td>
										<td>
										<% if(form.getDeferLEI()==null){%>
											<input type="checkbox" id="defer"   disabled="disabled"></input>
											<html:hidden property="deferLEI" styleId="deferLEI"/>
											<% }else if(form.getDeferLEI().equals("Y")){%>
											<input type="checkbox" id="defer" checked="checked" disabled="disabled"></input>
											<html:hidden property="deferLEI" styleId="deferLEI"/>
											<%} else{%>
											<input type="checkbox" id="defer" disabled="disabled"></input>
											<html:hidden property="deferLEI" styleId="deferLEI"/>
											<%} %>
										</td>
										
										<td class="fieldname"></td>
										<td></td>
									</tr>
									<tr class="even">
									<tr class="odd">
										<td class="fieldname">Address1<font color="red">*</font></td>
										<td><integro:empty-if-null value="<%=form.getAddress1()%>"/></td>
										<td class="fieldname">Address2</td>
										<td><integro:empty-if-null value="<%=form.getAddress2()%>"/></td>
									</tr>
									<tr class="even">
									<td class="fieldname">Address3</td>
										<td><integro:empty-if-null value="<%=form.getAddress3()%>"/></td>
										<td class="fieldname">Pincode</td>
										<td><integro:empty-if-null value="<%=form.getPostcode()%>"/></td>

									</tr>
									<tr class="odd">
										<td class="fieldname">Country<font color="red">*</font></td>
										<td><integro:empty-if-null value="<%=countryName%>"/></td>
										<td class="fieldname">Region<font color="red">*</font></td>
										<td><integro:empty-if-null value="<%=regionName%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">State<font color="red">*</font></td>
										<td><integro:empty-if-null value="<%=stateName%>"/></td>
										<td class="fieldname">City<font color="red">*</font></td>
										<td><integro:empty-if-null value="<%=cityName%>"/></td>
									</tr>
										<tr class="odd">
									<td class="fieldname">Telephone Number</td>
										<td>
										<integro:empty-if-null value="<%=form.getStdCodeTelNo()%>"/>
										<integro:empty-if-null value="<%=form.getTelephoneNo()%>"/></td>
										<td class="fieldname">Fax No.</td>
										<td>
										<integro:empty-if-null value="<%=form.getStdCodeTelex()%>"/>
										<integro:empty-if-null value="<%=form.getTelex()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">Email</td>
										<td><integro:empty-if-null value="<%=form.getEmail()%>"/></td>
										<td class="fieldname">AADHAR Number</td>
										<td><integro:empty-if-null value="<%=form.getAadharNumber()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.listedCompany"/></td>
										<td><integro:empty-if-null value="<%=form.getListedCompany()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.isinNo"/></td>
										<td><integro:empty-if-null value="<%=form.getIsinNo()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname"><bean:message key="label.party.summary.raroc"/></td>
										<td><integro:empty-if-null value="<%=form.getRaroc()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.raraocPeriod"/></td>
										<td><integro:empty-if-null value="<%=form.getRaraocPeriod()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname"><bean:message key="label.party.summary.yearEndPeriod"/></td>
										<td><integro:empty-if-null value="<%=form.getYearEndPeriod()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.creditMgrEmpId"/></td>
										<td><integro:empty-if-null value="<%=form.getCreditMgrEmpId()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.pfLrdCreditMgrEmpId"/></td>
										<td><integro:empty-if-null value="<%=form.getPfLrdCreditMgrEmpId()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.creditMgrSegment"/></td>
										<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode="<%=form.getCreditMgrSegment()%>"
												descWithCode="false"  display="true" /></td>
									</tr>	
									
								  <tr class="odd">
										<td class="fieldname">SCF Interface Status</td>
										<td><html:text property="scfStatus" size="30"
												maxlength="50" disabled="true" value="<%=scfStatus%>"></html:text>&nbsp; <br></td>
										<td class="fieldname">SCF Interface Failed Reason</td>
										
										<%if(scfErrMsg.isEmpty()) {%>
												<td><html:text property="scfFailedReason" size="30"
														disabled="true" value="<%=scfErrMsg%>"></html:text><br /></td>
												<%}else{ %>
												<td><html:textarea property="scfFailedReason" rows="4"
														cols="50" disabled="true" value="<%=scfErrMsg%>"></html:textarea>
													<br /></td>
												<%} %>
									</tr>	
									  <tr class="even">
										<td class="fieldname">ECBF Interface Status</td>
										<td><html:text property="ecbfStatus" size="30"
												maxlength="50" disabled="true" value="<%=ecbfStatus%>" ></html:text>&nbsp; <br></td>
										<td class="fieldname">ECBF Interface Failed Reason</td>
										<%if(ecbfErrMsg.isEmpty()) {%>
												<td><html:text property="ecbfFailedReason" size="30"
														disabled="true" value="<%=ecbfErrMsg%>"></html:text><br/></td>
										<%}else{ %>
												<td><html:textarea property="ecbfFailedReason" rows="4"
														cols="50" disabled="true" value="<%=ecbfErrMsg%>"></html:textarea>
													<br /></td>
												<%} %>
								     </tr>	
								</tbody>
							</table>
							</td>
						</tr>
						<tr id="addVendorDetails" >
							<td align="right">
							<h3 align="left">Vendor Details</h3>
							</td>
						</tr>
						
						<tr id="hrline" >
							<td>
							<hr />
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr id="addVendorDetails2">
							<td>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
									
										<td>S/N</td>
										<td>Vendor Name</td>
										
									</tr>
								</thead>
								<tbody>
									<logic:present name="vendorList">
										<logic:iterate id="ob" name="vendorList"
											type="com.integrosys.cms.app.customer.bus.OBVendor"
											 scope="page">
											
											<tr class="">
												<td class="index"><%=vno++ %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getVendorName()%>" />&nbsp;</center>
												</td>
												
											</tr>
										</logic:iterate>
									</logic:present>
									<logic:notPresent name="vendorList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
								</tbody>
							</table>
							</td>
						</tr>
						
						<jsp:include page="view_co_borrower_details_summary.jsp" />
						
						<tr id="addSystemDetails" >
							<td align="right">
							<h3 align="left">System Details</h3>
							</td>
						</tr>
						
						<tr id="hrline" >
							<td>
							<hr />
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr id="addSystemDetails2">
							<td>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
									
										<td>S/N</td>
										<td>System</td>
										<td>System ID</td>
										
									</tr>
								</thead>
								<tbody>
									<logic:present name="otherSystemList">
										<logic:iterate id="ob" name="otherSystemList"
											type="com.integrosys.cms.app.customer.bus.OBSystem"
											 scope="page">
											
											<tr class="">
												<td class="index"><%=sno++ %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystem()%>" />&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getSystemCustomerId()%>&nbsp;</center>
												</td>
												
											</tr>
										</logic:iterate>
									</logic:present>
									<logic:notPresent name="otherSystemList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
								</tbody>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
		</table>
		</td>
	</tr>
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />

	<html:hidden name="ManualInputCustomerInfoForm" property="email" />

	<html:hidden name="ManualInputCustomerInfoForm" property="scfStatus" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="scfFailedReason" />


	<html:hidden name="ManualInputCustomerInfoForm" property="ecbfStatus" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="ecbfFailedReason" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="partyGroupName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />		
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="rbiIndustryCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="industryName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />
	<html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" /> 
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
	<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="bankingMethod" />
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalFundedLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="legalName" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalNonFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedShareLimit" />
		
		
		<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeState" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeState" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeEmail" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="borrowerDUNSNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity1" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity2" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity3" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="willfulDefaultStatus" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitFilledStatus" />

	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfSuit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="suitAmount" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
		
			
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
			<html:hidden name="ManualInputCustomerInfoForm"
		property="branchCode" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />


	<html:hidden name="ManualInputCustomerInfoForm" property="pName" value="<%=pName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="cityName"  value="<%=cityName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="stateName"  value="<%=stateName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="regionName" value="<%=regionName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="countryName"  value="<%=countryName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="cityRegName" value="<%=cityRegName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="stateRegName"  value="<%=stateRegName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regionRegName"  value="<%=regionRegName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm"
		property="countryRegName" value="<%=countryRegName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegionName" value="<%=rmRegionName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm"
		property="relManagerName"  value="<%=relManagerName %>"/>

    <html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<!--End Santosh LEI CR  -->	
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag"  />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
	<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="directorName" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="isRBIWilfulDefaultersList" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="nameOfBank" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isDirectorMoreThanOne" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="nameOfDirectorsAndCompany" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfDefault" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="extOfCompromiseAndWriteoff" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isCibilStatusClean" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfCleanCibil" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isBorrDefaulterWithBank" />
		<html:hidden name="ManualInputCustomerInfoForm" property="finalBankMethodList" />
<html:hidden name="ManualInputCustomerInfoForm" property="leadValue" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIds" />
		
		
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="udf_hidden_details.jsp"></jsp:include>
</table>
<!-- InstanceEnd -->