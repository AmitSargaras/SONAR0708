<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page import="java.util.*"%>
<%ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
.getAttribute("ManualInputCustomerInfoForm");
int no=0;
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
List directorList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewDirectorList");
List transactionHistoryList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.transactionHistoryList");

if(transactionHistoryList!=null){
pageContext.setAttribute("transactionHistoryList", transactionHistoryList);
}
else
{
	transactionHistoryList = new ArrayList();
	String[] stringArray = new String[3];
    stringArray[0] = "-";
    stringArray[1] = "-";
    stringArray[2] = "-";
    transactionHistoryList.add(stringArray);
    transactionHistoryList.add(stringArray);
    pageContext.setAttribute("transactionHistoryList", transactionHistoryList);
}
List otherBankList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.otherBankList");

pageContext.setAttribute("otherBankList", otherBankList);
//List otherBankList = value.getOtherBank();

if (!(directorList == null)) {
	
	pageContext.setAttribute("directorList", directorList);
	//request.setAttribute("otherBankList", otherBankList);
}
	//List sr = (List) request.getAttribute("partyGroupList");
	//String event = request.getParameter("event");
	//pageContext.setAttribute("partyGroupList", sr);
	//int sno = 0;
	//int startIndex=0;
	//int counter=1;
	//String ind= (String) request.getAttribute("startIndex");
	//if(ind!=null && (!ind.equals("")))
	//{
	//	 startIndex = Integer.parseInt(ind);

	//}
%>


<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>


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
function getAction(ind) {
	
	var type = document.getElementById("actionType"+ind).value;

	 if(type =="View"){
		
		document.forms[0].action = "ManualInputCustomer.do?index="+ind;		
    	document.forms[0].event.value = "maker_view_director";
    	document.forms[0].submit();
	}
	    
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
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>CIBIL Details</h3>
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
				<tr>
					<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Branch Code<font color="red">*</font></td>
								<td width="30%"><integro:empty-if-null value="<%=form.getMainBranch()%>"/>&nbsp;</td>
								<td class="fieldname" width="20%">Borrower DUNS number</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getBorrowerDUNSNo()%>"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Customer Name</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getCustomerNameShort()%>"/></td>
								<td class="fieldname" width="20%">PAN</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getPan()%>"/></td>
							</tr>
							<tr class="odd">
								
								<td class="fieldname" width="20%">Party Consent</td>
								<td width="30%">
									<% if(form.getPartyConsent()==null){%>
								
								<input type="checkbox" id="partyC"   disabled="disabled"></input>
								<html:hidden property="partyConsent"/>
								<% }else if(form.getPartyConsent().equals("Y")){%>
								<input type="checkbox" id="partyC" checked="checked" disabled="disabled"></input>
								<html:hidden property="partyConsent"/>
								<%} else{%>
								<input type="checkbox" id="partyC" disabled="disabled"></input>
								<html:hidden property="partyConsent"/>
								<%} %>
									</td>
									<td  class="fieldname" width="20%">&nbsp;</td>
										<td  width="30%">&nbsp;</td>
							</tr>
							<%--<tr class="even">
								<td class="fieldname">Address 1</td>
								<td><integro:empty-if-null value="<%=form.getOfficeAddress1()%>"/></td>
								<td class="fieldname">Address 2</td>
								<td><integro:empty-if-null value="<%=form.getOfficeAddress2()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Address 3</td>
								<td><integro:empty-if-null value="<%=form.getOfficeAddress3()%>"/></td>
								<td class="fieldname">Country</td>
								<td><integro:empty-if-null value="<%=form.getOfficeCountry()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Pincode</td>
								<td><integro:empty-if-null value="<%=form.getOfficePostCode()%>"/></td>
								<td class="fieldname">Region</td>
								<td><integro:empty-if-null value="<%=form.getOfficeRegion()%>"/></td>
								
							</tr>
							<tr class="even">
								<td class="fieldname">State</td>
								<td><integro:empty-if-null value="<%=form.getOfficeState()%>"/>&nbsp;</td>
								<td class="fieldname">City</td>
								<td><integro:empty-if-null value="<%=form.getOfficeCity()%>"/>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Telephone Number</td>
								<td><integro:empty-if-null value="<%=form.getOfficeTelephoneNo()%>"/></td>
								<td class="fieldname">Fax No.</td>
								<td><integro:empty-if-null value="<%=form.getOfficeTelex()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Email</td>
								<td><integro:empty-if-null value="<%=form.getOfficeEmail()%>"/></td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							--%><tr class="even">
								<td class="fieldname">Class of Activity 1</td>
								<td>
								<%=(form.getClassActivity1()== null ||form.getClassActivity1().equals("") )?"-":form.getClassActivity1()+"-" %>
								<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>"
												entryCode="<%=form.getClassActivity1()%>"
												descWithCode="false"  display="true"/></td>
								<td class="fieldname">Class of Activity 2</td>
								<td>
								<%=(form.getClassActivity1()== null ||form.getClassActivity2().equals(""))?"-":form.getClassActivity2()+"-" %>
								<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>"
												entryCode="<%=form.getClassActivity2()%>"
												descWithCode="false"  display="true"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname" width="20%">Registered Office</td>
								<td width="30%">
							
										<% if(form.getRegOffice()==null){%>
								
								<input type="checkbox" id="reg"   disabled="disabled"></input>
								<html:hidden property="regOffice"/>
								<% }else if(form.getRegOffice().equals("Y")){%>
								<input type="checkbox" id="reg" checked="checked" disabled="disabled"></input>
								<html:hidden property="regOffice"/>
								<%} else{%>
								<input type="checkbox" id="reg" disabled="disabled"></input>
								<html:hidden property="regOffice"/>
								<%} %>
									</td>
								<td class="fieldname">Registered office DUNS No.</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeDUNSNo()%>"/></td>
							</tr>
							
							<tr class="even">
								<td class="fieldname">Registered Office Address 1</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeAddress1()%>"/></td>
								<td class="fieldname">Registered Office Address 2</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeAddress2()%>"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Registered Office Address 3</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeAddress3()%>"/></td>
								<td class="fieldname">Country<font color="red">*</font></td>
								<td><integro:empty-if-null value="<%=countryRegName%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Pincode</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficePostCode()%>"/></td>
								<td class="fieldname">Region<font color="red">*</font></td>
								<td><integro:empty-if-null value="<%=regionRegName%>"/>&nbsp;</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">State<font color="red">*</font></td>
								<td><integro:empty-if-null value="<%=stateRegName%>"/>&nbsp;</td>
								<td class="fieldname">City<font color="red">*</font></td>
								<td><integro:empty-if-null value="<%=cityRegName%>"/>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Telephone Number</td>
								<td>
								<integro:empty-if-null value="<%=form.getStdCodeOfficeTelNo()%>"/>
								<integro:empty-if-null value="<%=form.getRegOfficeTelephoneNo()%>"/></td>
								<td class="fieldname">Fax No.</td>
								<td>
									<integro:empty-if-null value="<%=form.getStdCodeOfficeTelex()%>"/>
								<integro:empty-if-null value="<%=form.getRegOfficeTelex()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Email</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeEmail()%>"/></td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Willful Default status<font color="red">*</font></td>
								<td width="30%">	<integro:common-code
												categoryCode="<%=CategoryCodeConstant.WILLFUL_DEFAULT_STATUS%>"
												entryCode="<%=form.getWillfulDefaultStatus()%>"
												descWithCode="false"  display="true"/></td>
								<td class="fieldname" width="20%">Date classified as
								willful default</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getDateWillfulDefault()%>"/>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Suit Filed Status</td>
								<td width="30%">
									<integro:common-code
												categoryCode="<%=CategoryCodeConstant.SUIT_FILLED_STATUS%>"
												entryCode="<%=form.getSuitFilledStatus()%>"
												descWithCode="false"  display="true"/>
								
								</td>
								<td class="fieldname" width="20%">Suit Reference No.</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getSuitReferenceNo()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname" width="20%">Suit Amount</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getSuitAmount()%>"/> </td>
								<td class="fieldname" width="20%">Date of Suit</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getDateOfSuit()%>"/><html:errors property="dateOfSuit" />&nbsp;</td>
							</tr>
							
			
								<tr class="even">
										<td class="fieldname" width="20%">Is it in RBI Wilful Defaulter List?</td>
										<td width="30%">
										
										<%if(form.getIsRBIWilfulDefaultersList()== null ||form.getIsRBIWilfulDefaultersList().equals("No") ||form.getIsRBIWilfulDefaultersList().equals("") ){%>
										<input type="radio"
												id="isRBIWilfulDefaultersList"
												 disabled="disabled"
												 />
											Yes 	<input type="radio"
												id="isRBIWilfulDefaultersList"
													 checked="checked" disabled="disabled"
												 />
											No &nbsp; <br>
											<%}else{%>
											
												<input type="radio"
												id="isRBIWilfulDefaultersList"
												checked="checked" disabled="disabled"
												 />
											Yes 	<input type="radio"
												id="isRBIWilfulDefaultersList"
													  disabled="disabled"
												 />
											No &nbsp; <br>
											
											
													<%}%>
											</td>
										<td class="fieldname" width="20%">
											<p>1)Name of the Bank</p> <br />
											<p>2)If any Directors name appear more than once</p> <br />
											<p>3)Name of Directors and Company</p>
										</td>
										<td><html:select property="nameOfBank"
												styleId="nameOfBank" disabled="true" value="<%=form.getNameOfBank()%>" >
												<option value="">Please Select</option>
				                  				<html:options collection="otherBankList" labelProperty="label" property="value" />
											</html:select> <br /> <br /> <br /> 	
											<%if(form.getIsDirectorMoreThanOne()==null || form.getIsDirectorMoreThanOne().equals("No") || form.getIsDirectorMoreThanOne().equals("") ){%>
											<input type="radio"
												id="isDirectorMoreThanOne"
												 value="Yes" disabled="disabled"  />
											Yes 	<input type="radio" id="isDirectorMoreThanOne"
												 value="No"  disabled="disabled" checked="checked" />
  											No &nbsp;
                                              <%}else{%>
											  		<input type="radio"
												id="isDirectorMoreThanOne"
												 value="Yes" disabled="disabled" checked="checked" />
											Yes 	<input type="radio" id="isDirectorMoreThanOne"
												 value="No"  disabled="disabled"  />
  											No &nbsp;
											  <%}%>



											<br /> <br /> <br /> <html:textarea
												property="nameOfDirectorsAndCompany"
												styleId="nameOfDirectorsAndCompany" rows="3" cols="50"
												readonly="true" value="<%=form.getNameOfDirectorsAndCompany()%>"></html:textarea>
												<html:errors property="nameOfDirectorsAndCompanyLengthError" />
											</td>
									</tr>



									<tr class="odd">
										<td class="fieldname" width="20%">Was the
											borrower/promoter a defaulter with the Bank earlier</td>
										<td width="30%">
										<%if(form.getIsBorrDefaulterWithBank()== null  || form.getIsBorrDefaulterWithBank().equals("No") || form.getIsBorrDefaulterWithBank().equals("")   ){%>
										<input type="radio"
												id="isBorrDefaulterWithBank"
												 value="Yes" disabled="disabled"
												 />
											Yes <input type="radio" id="isBorrDefaulterWithBank"
												 value="No" disabled="disabled" checked="checked"
												/>
											No &nbsp;

                                         <%}else{%>
		<input type="radio"	id="isBorrDefaulterWithBank"
												 value="Yes" disabled="disabled" checked="checked"
												 />
											Yes <input type="radio" id="isBorrDefaulterWithBank"
												 value="No" disabled="disabled" 
												/>
											No &nbsp;


<%}%>										 



											<br></td>
										<td class="fieldname" width="20%">
											<p>1)Provide Details of default</p> <br />
											<p>2)Extent of compromise and write off</p>
										<td><html:textarea property="detailsOfDefault" readonly="true"
												styleId="detailsOfDefault"  rows="3" cols="50" value="<%=form.getDetailsOfDefault()%>"></html:textarea>
											<br />
													<br />
															<br />
											 <html:textarea property="extOfCompromiseAndWriteoff"
												styleId="extOfCompromiseAndWriteoff"  readonly="true"
												rows="3" cols="50"  value="<%=form.getExtOfCompromiseAndWriteoff()%>"></html:textarea></td>
									</tr>


									<tr class="even">
										<td class="fieldname" width="20%">Is CIBIL Status Clean</td>
										<td width="30%">
					<%if(form.getIsCibilStatusClean()== null  || form.getIsCibilStatusClean().equals("No") || form.getIsCibilStatusClean().equals("")   ){%>					
										
										<input type="radio" 
												id="isCibilStatusClean" value="Yes" disabled="disabled" 
												 /> Yes 
												 
												<input type="radio"
												id="isCibilStatusClean"
												 value="No"   disabled="disabled" checked="checked"
												 /> No &nbsp;

                                        <%}else{%>
												<input type="radio" 
												id="isCibilStatusClean" value="Yes" disabled="disabled"  checked="checked"
												 /> Yes 
												 
												<input type="radio"
												id="isCibilStatusClean"
												 value="No"   disabled="disabled" 
												 /> No &nbsp;
										
<%}%>


												 <br>
										</td>
										<td class="fieldname" width="20%">
											<p>1)Provide Details</p>
										<td><html:textarea property="detailsOfCleanCibil"  readonly="true"
												styleId="detailsOfCleanCibil" rows="3" cols="50" value="<%=form.getDetailsOfCleanCibil()%>"></html:textarea>

										</td>
									</tr>
				
					<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
				
				
					<tr>
					<td  colspan="4" align="right">
					<h3 align="left">Other/Relationship Details</h3>
					</td>
				</tr>
						</tbody>
					</table>
					</td>
				</tr>
<tr>
					<td>
					<hr />
					</td>
				</tr>
				<tr>
					<td>

					<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
						style="margin-top: 0" width="100%" align="center">
						<thead>
							<tr>
								<td>S/N</td>
								<td>DIN Number</td>
								<td>Director&rsquo;s Name</td>
								<td>Relationship</td>
								<td>Action</td>
							</tr>
						</thead>
						<tbody>
						<logic:present name="directorList">
										<logic:iterate id="ob" name="directorList"
											type="com.integrosys.cms.app.customer.bus.OBDirector"
											length="10" scope="page">
												<%no=no+1; %>
											<tr class="">
												<td class="index"><%=no %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getDinNo()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getDirectorName()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:common-code
												categoryCode="<%=CategoryCodeConstant.RELATIONSHIP_TYPE%>"
												entryCode="<%=ob.getRelationship()%>"
												descWithCode="false"  display="true"/></center>
												</td>
												<td>
												<center><select id="actionType<%=no%>"
													onchange="getAction('<%=no%>')">
													<option value="">Please Select</option>
													<option value="View">View</option>
												</select></center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
									<logic:notPresent name="directorList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>

						</tbody>
					</table>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
					 <jsp:include page="view_audit_details.jsp"></jsp:include>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
		</table>
		</td>
	</tr>
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
	<html:hidden name="ManualInputCustomerInfoForm"property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
    <html:hidden name="ManualInputCustomerInfoForm" property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyGroupName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />		
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rbiIndustryCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	<html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />
	<html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" /> 
	<html:hidden name="ManualInputCustomerInfoForm" property="industryName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
	
	
	<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
	<html:hidden name="ManualInputCustomerInfoForm" property="bankingMethod" />
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalNonFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="fundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="nonFundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm" property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="nonFundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="legalName" />
<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
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
		property="relationshipStartDate" />
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<!--End Santosh LEI CR  -->	
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
		property="stdCodeOfficeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
			<html:hidden name="ManualInputCustomerInfoForm"
		property="branchCode" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated"  />
		<html:hidden name = "ManualInputCustomerInfoForm" property="form6061Checked"  />
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

