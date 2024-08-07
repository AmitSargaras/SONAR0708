<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
	
	<%@page import="java.util.*"%>
<%
int sno = 0;
int no = 0;
ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");


List partyGrpList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewPartyGrpList");

List otherBankList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewOtherBankList");

//List otherBankList = value.getOtherBank();

if (!(otherBankList == null)) {
	
	pageContext.setAttribute("otherBankList", otherBankList);
	//request.setAttribute("otherBankList", otherBankList);
}

//List partyGrpList = value.getSublineParty();

if (!(partyGrpList == null)) {
	
	pageContext.setAttribute("partyGrpList", partyGrpList);
	//request.setAttribute("otherBankList", otherBankList);
}

 
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
<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->

<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%><head>
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
function enbleBtn(ifChecked){
	if(ifChecked == 1){
		document.getElementById('detailBtn').disabled = false;
		document.getElementById('sblnDetails').style.display = ''
	}else if (ifChecked == 2 ){
		document.getElementById('detailBtn').disabled = true;
		document.getElementById('sblnDetails').style.display = 'none'		
	}
}
function shwdetails(selobj){
	
	if(selobj.value == 'MULTIPLE' || selobj.value == 'CONSORTIUM'){
		document.getElementById('bnklbl').style.display = '';
		document.getElementById('bankName').style.display = '';
		document.getElementById('bnkname').style.display = '';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = '';
	}else if(selobj.value == 'SOLE' || selobj.value == ''){
		document.getElementById('bnklbl').style.display = 'none';
		document.getElementById('bankName').style.display = 'none';
		document.getElementById('bnkname').style.display = 'none';
		document.getElementById('button2').style.display = '';
		document.getElementById('bnkdtltbl').style.display = 'none';
	}
}
function addSubLine(name){
	document.forms[0].action="ManualInputCustomer.do?event="+name;
	
    document.forms[0].submit();
}
function getBankList(name)
{    
    var bankName = document.forms[0].bankName.value;
	document.forms[0].action="ManualInputCustomer.do?event="+name;
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">

			<tr id="financialdetails">
				<td>
				<table width="100%" height="100%" cellspacing="0" cellpadding="0"
					border="0">
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo"
							width="100%">
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="25%">Sub Line </td>
									<td width="25%"><html:radio property="subLine"
										value="OPEN" onclick="javascript : enbleBtn(1); "  disabled="true">Open</html:radio> <html:radio property="subLine"
										value="CLOSE" onclick="javascript : enbleBtn(2);" disabled="true">Close</html:radio></td>
									<td class="fieldname" width="25%">&nbsp;</td>
									<td width="25%">&nbsp;</td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
					</tr>
				
					<tr>
						<td>
							<%if(value.getSubLine().equals("OPEN")) {%>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="sblnDetails" >
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Party</td>
									<td>Facility</td>
									<td>Amount (INR)</td>
									
								</tr>
							</thead>
							<tbody>
						
								<logic:present name="partyGrpList">
										<logic:iterate id="ob" name="partyGrpList"
											type="com.integrosys.cms.app.customer.bus.OBSubline"
											length="10" scope="page">
											<%
												String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											
											<tr class="<%=rowClass%>">
												<td  class="index"><%=sno %></td>
												<td><center><%=ob.getPartyGroup().getCustomerName()%></center></td>
												<td><center>GUARANTEE</center></td>
												<td><center><%=ob.getAmount()%></center></td>
									            
									           
									            
											</tr>
											
										</logic:iterate>
									</logic:present>
									
									<logic:notPresent name="partyGrpList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
								
							</tbody>
						</table>
						<%}else if(value.getSubLine().equals("")) {%>
						
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="sblnDetails" style="display: none;">
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Party</td>
									<td>Facility</td>
									<td>Amount (INR)</td>
									
								</tr>
							</thead>
							<tbody>
						
								<logic:present name="partyGrpList">
										<logic:iterate id="ob" name="partyGrpList"
											type=" com.integrosys.cms.app.customer.bus.OBSubline"
											length="10" scope="page">
											<%
												String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											
											<tr class="<%=rowClass%>">
												<td></td>
												<td></td>
												<td></td>
												<td></td>
									          
											</tr>
											
										</logic:iterate>
									</logic:present>
									
									<logic:notPresent name="partyGrpList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
								
							</tbody>
						</table>
						
					<%} %>
					</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo"
							width="100%">
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="25%">Banking Method</td>
									<td width="25%"><html:select
										name="ManualInputCustomerInfoForm" property="bankingMethod"
										onchange="javascript : shwdetails(this);" disabled="true">
										<html:option value="">Select</html:option>
										<html:option value="SOLE">Sole</html:option>
										<html:option value="MULTIPLE">Multiple</html:option>
										<html:option value="CONSORTIUM">Consortium</html:option>
									</html:select></td>
										
									<td class="fieldname" width="25%">Exceptional Cases</td>
									<td class="even" width="25%">
									<html:select name="ManualInputCustomerInfoForm" property="exceptionalCases" disabled="true">
										<html:option value="">Select</html:option>
										<html:option value="RL_IBPC">IBPC</html:option>
										<html:option value="RL_STANDALONE_MEMO_LINE">STANDALONE MEMO LINE</html:option>
										<html:option value="RL_GUARANTOR_LINE">GUARANTOR LINE</html:option>
										<html:option value="RL_100_FD_BACKED_CASES">100% FD BACKED CASES</html:option>
										<html:option value="RL_STANDALONE_DRUL">STANDALONE DRUL</html:option>
									</html:select>
								   </td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<%if(value.getBankingMethod().equals("MULTIPLE") ||value.getBankingMethod().equals("CONSORTIUM")) {%>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="bnkdtltbl" >
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Bank Name</td>
									<td>Branch Name</td>
									<td>
									
									Nodal/Lead
									
									</td>
								</tr>
							</thead>
							<tbody>
							
								<!--<tr class="odd">
									<td class="index" width="10%">1</td>
									<td><center>HDFC Bank</center></td>
									<td><center><input type="radio" name="nodalLead" checked="checked"></center></td>
								</tr>
								
								--><logic:present name="otherBankList">
										<logic:iterate id="ob" name="otherBankList"
											type="com.integrosys.cms.app.customer.bus.OBBankingMethod"
											length="10" scope="page">
											<%
												String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											<%if(ob.getBankType().equals("S")) {%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
												</td>
												<td><center><input type="radio"  id="nodalLead"  disabled="disabled" name="nodalLead" value="<%="s"+","+ob.getBankId()%>" >
										</center></td>
												
									
											</tr>
											<%}else if(ob.getBankType().equals("O")){ %>
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankName()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getOtherbranch().getOtherBranchName()%>" />&nbsp;</center>
												</td>
												<td><center><input type="radio"  id="nodalLead"  name="nodalLead" value="<%="o"+","+ob.getBankId() %>"  disabled="disabled" >
										</center></td>
												
									
											</tr>
											<%} %>
										</logic:iterate>
									</logic:present>
									
									<logic:notPresent name="otherBankList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
									
							</tbody>
						</table>
						<%}else if(value.getBankingMethod().equals("")  ||value.getBankingMethod().equals("SOLE")) {%>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="bnkdtltbl" style="display:none;" >
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Bank Name</td>
									<td>Branch Name</td>
									<td>
									
									Nodal/Lead
									
									</td>
								</tr>
							</thead>
							<tbody>
							
								<!--<tr class="odd">
									<td class="index" width="10%">1</td>
									<td><center>HDFC Bank</center></td>
									<td><center><input type="radio" name="nodalLead" checked="checked"></center></td>
								</tr>
								
								--><logic:present name="otherBankList">
										<logic:iterate id="ob" name="otherBankList"
											type="com.integrosys.cms.app.customer.bus.OBBankingMethod"
											length="10" scope="page">
											<%
												String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
													<td>
												<%if(ob.getBankType().equals("S")) {%>
												<center><integro:empty-if-null
													value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
													<%}else{ %>
													<center><integro:empty-if-null
													value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankName()%>" />&nbsp;</center>
													<%} %>
												</td>
												<td>
												<%if(ob.getBankType().equals("S")) {%>
												<center><integro:empty-if-null
													value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
													<%}else{ %>
													<center><integro:empty-if-null
													value="<%=ob.getOtherbranch().getOtherBranchName()%>" />&nbsp;</center>
													<%} %>
												</td>
												<td><center><input type="radio" id="nodalLead" name="nodalLead" disabled="disabled"></center></td>
												
									
											</tr>
											
										</logic:iterate>
									</logic:present>
									
									<logic:notPresent name="otherBankList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
									
							</tbody>
						</table>
						<%} %>
						</td>
					</tr>
<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo">
							<tbody>
								<tr class="even">
									<td class="fieldname" width="17%">Total Funded Limit (INR)</td>
									<td width="17%"><integro:empty-if-null value="<%=value.getTotalFundedLimit()%>"/></td>
									<td class="fieldname" width="17%">Funded Share %</td>
									<td width="17%"><integro:empty-if-null value="<%=value.getFundedSharePercent()%>"/></td>
									<td class="fieldname" width="17%">Funded Share Limit (INR)</td>
									<td width="17%"><integro:empty-if-null value="<%=value.getFundedShareLimit()%>"/></td>
								</tr>
								<tr class="odd">
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="even">
									<td class="fieldname">Total Non Funded Limit (INR)</td>
									<td><integro:empty-if-null value="<%=value.getTotalNonFundedLimit()%>"/></td>
									<td class="fieldname">Non Funded Share %</td>
									<td><integro:empty-if-null value="<%=value.getNonFundedSharePercent()%>"/></td>
									<td class="fieldname">Non Funded Limit (INR)</td>
									<td><integro:empty-if-null value="<%=value.getNonFundedShareLimit()%>"/></td>
								</tr>
								<tr class="odd">
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="even">
									<td class="fieldname">Memo Exposure</td>
									<td><integro:empty-if-null value="<%=value.getMemoExposure()%>"/></td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="odd">
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="even">
									<td class="fieldname">Total Sanctioned Limits</td>
									<td><integro:empty-if-null value="<%=value.getTotalSanctionedLimit()%>"/></td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="odd">
									<td style="border: 0 none">&nbsp;</td>
									<td style="border: 0 none">&nbsp;</td>
									<td style="border: 0 none">&nbsp;</td>
									<td style="border: 0 none">&nbsp;</td>
									<td style="border: 0 none">&nbsp;</td>
									<td style="border: 0 none">&nbsp;</td>
								</tr>
								<tr class="even">
									<td class="fieldname">MPBF </td>
									<td><integro:empty-if-null value="<%=value.getMpbf()%>"/></td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
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
	<html:hidden name="ManualInputCustomerInfoForm" property="domicileCountry" value="IN" />
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
	<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	
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
	<html:hidden name="ManualInputCustomerInfoForm"
		property="legalName" />
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
		
	
	<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />	

</table>


<!-- InstanceEnd -->

