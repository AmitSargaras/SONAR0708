<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,
	com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,
	com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector,
	com.integrosys.cms.app.customer.bus.OBSubline,com.integrosys.cms.app.customer.bus.OBIfscMethod"%>
	<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
	
<%@page import="java.util.*"%>
<%
int sno = 0;
int no = 0;
ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");

List ifscBranchList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ifscBranchList");
System.out.println("??????????????????????"+ifscBranchList);
if (!(ifscBranchList == null)) {
	TreeMap soretedMap= new TreeMap();
	for(int i=0;i<ifscBranchList.size();i++)
	{
		OBIfscMethod ob=(OBIfscMethod)ifscBranchList.get(i);
		if("O".equals(ob.getBankType())){
			soretedMap.put(ob.getBranchName().toUpperCase()+"+"+ob.getIfscCode(),ob);
		}
	}
	ifscBranchList = new ArrayList(soretedMap.values());
	
	for (int i = 0; ifscBranchList.size() > i; i++) {
		OBIfscMethod nodal = (OBIfscMethod) ifscBranchList.get(i);
		if(nodal != null && !nodal.equals("")){
		if (nodal.getNodal() != null && !nodal.getNodal().equals("")) {
			if (nodal.getBankType()!=null && nodal.getBankType().equals("O")) {
				if (nodal.getNodal()!= null && nodal.getNodal().equals("Y")) {
					value.setNodalLead("o,"+(String.valueOf(nodal.getIfscCode()).trim()));
				}
			} else if (nodal.getBankType()!=null && nodal.getBankType().equals("S")) {
				if (nodal.getNodal()!= null && nodal.getNodal().equals("Y")) {
					value.setNodalLead("s,"+(String.valueOf(nodal.getIfscCode()).trim()));
				}
			}
		}
		if (nodal.getLead() != null &&  !nodal.getLead().equals("")) {
			if (nodal.getBankType()!=null && nodal.getBankType().equals("O") ) {
				if (nodal.getLead()!= null && nodal.getLead().equals("Y")) {
					value.setLeadValue("o,"+(String.valueOf(nodal.getIfscCode()).trim()));
				}
			} else if (nodal.getBankType()!=null && nodal.getBankType().equals("S")) {
				if (nodal.getLead()!= null && nodal.getLead().equals("Y")) {
					value.setLeadValue("s,"+(String.valueOf(nodal.getIfscCode()).trim()));
				}
			}
		}
		}
	}
}
if (ifscBranchList != null) {
	pageContext.setAttribute("ifscBranchList", ifscBranchList);
}else{
	pageContext.setAttribute("ifscBranchList", new ArrayList());
}

List partyGrpList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewPartyGrpList");

List otherBankList = (List) session
.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewOtherBankList");

//List otherBankList = value.getOtherBank();
	if (!(otherBankList == null)) {
		TreeMap soretedMap= new TreeMap();
		for(int i=0;i<otherBankList.size();i++)
		{
			OBBankingMethod ob=(OBBankingMethod)otherBankList.get(i);
			if("S".equals(ob.getBankType())){
				soretedMap.put(ob.getSystembank().getSystemBankName().toUpperCase(),ob);
			}
			else if("O".equals(ob.getBankType())){
				soretedMap.put(ob.getOtherbranch().getOtherBranchName().toUpperCase()+"+"+ob.getOtherbranch().getOtherBankCode(),ob);
			}
		}

		otherBankList = new ArrayList(soretedMap.values());
		}
if (!(otherBankList == null)) {
	
	pageContext.setAttribute("otherBankList", otherBankList);
	//request.setAttribute("otherBankList", otherBankList);
}

//List partyGrpList = value.getSublineParty();

OBSubline sysObj = new OBSubline();
for(int i = 0; i< partyGrpList.size();i++)
{
	sysObj = 	(OBSubline)partyGrpList.get(i);	
	if(sysObj.getPartyGroup()== null)
	{
		partyGrpList.remove(i);		
		i = i-1;
	}
}
if (!(partyGrpList == null)) {
	
	pageContext.setAttribute("partyGrpList", partyGrpList);
	//request.setAttribute("otherBankList", otherBankList);
}
else
{
	pageContext.setAttribute("partyGrpList", new ArrayList());
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
	
	value.setBankingMethod(value.getFinalBankMethodList());
	
%>
<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->

<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBBankingMethod"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><head>
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
	
	if(selobj.value == 'MULTIPLE' || selobj.value == 'CONSORTIUM' || selobj.value == 'OUTSIDECONSORTIUM' || selobj.value == 'OUTSIDEMULTIPLE'){
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
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>Banking Method</h3>
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

			<tr id="financialdetails">
				<td>
				<table width="100%" height="100%" cellspacing="0" cellpadding="0"
					border="0">
					
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
						<table border="0" cellspacing="0" cellpadding="0" class="tblInfo"
							width="100%">
							<tbody>
								<tr class="odd">
									<td class="fieldname" width="25%">Banking Method<font color="red">*</font></td>
									<%-- <td width="25%"><html:select
										name="ManualInputCustomerInfoForm" property="bankingMethod"
										onchange="javascript : shwdetails(this);" disabled="true">
										<html:option value="">Select</html:option>
										<html:option value="SOLE">Sole</html:option>
										<html:option value="MULTIPLE">Multiple</html:option>
										<html:option value="CONSORTIUM">Consortium</html:option>
										<html:option value="OUTSIDEMULTIPLE">Outside Multiple</html:option>
										<html:option value="OUTSIDECONSORTIUM">Outside Consortium</html:option>
									</html:select></td> --%>
									
									<td >
                                   <% 		 String bankMethod= value.getFinalBankMethodList();
                                  
                                   System.out.println("value.getFinalBankMethodList()===>"+value.getFinalBankMethodList());
                                   //System.out.println("value.getBankingMethod()===>"+value.getBankingMethod());
                                   String[] bankMethodArray=bankMethod.split(",");
         			  if(bankMethodArray!=null){
         			  for(int i =0; i< bankMethodArray.length ;i++){
         				System.out.println("bankMethodArray===>"+bankMethodArray);
         				 String[] bankMethodArray1 = bankMethodArray[i].split("-");
         			    	%>
         			    	<integro:common-code-single categoryCode="<%=CategoryCodeConstant.BANKING_METHOD%>" entryCode="<%=bankMethodArray1[0]%>" display="true" descWithCode="false" />
	        											<br>
         			    	
         			    	<%
										}
         			  }
										 %>      &nbsp;</td>
									
									
									
										
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
						<%if(value.getBankingMethod().equals("MULTIPLE") ||value.getBankingMethod().equals("CONSORTIUM")
								|| value.getBankingMethod().equals("OUTSIDEMULTIPLE") ||value.getBankingMethod().equals("OUTSIDECONSORTIUM")
								
								|| value.getBankingMethod().contains(",MULTIPLE-MULTIPLE")
								|| value.getBankingMethod().contains(",CONSORTIUM-CONSORTIUM")
								|| value.getBankingMethod().contains(",OUTSIDEMULTIPLE-OUTSIDE MULTIPLE")
								|| value.getBankingMethod().contains(",OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM")
								
								|| value.getBankingMethod().contains("MULTIPLE-MULTIPLE,")
								|| value.getBankingMethod().contains("CONSORTIUM-CONSORTIUM,")
								|| value.getBankingMethod().contains("OUTSIDEMULTIPLE-OUTSIDE MULTIPLE,")
								|| value.getBankingMethod().contains("OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM,")
								
								|| value.getBankingMethod().equals("MULTIPLE-MULTIPLE")
								|| value.getBankingMethod().equals("CONSORTIUM-CONSORTIUM")
								|| value.getBankingMethod().equals("OUTSIDEMULTIPLE-OUTSIDE MULTIPLE")
								|| value.getBankingMethod().equals("OUTSIDECONSORTIUM-OUTSIDE CONSORTIUM")
								) {%>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="bnkdtltbl" >
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>IFSC Code</td>
									<td>Bank Name</td>
									<td>Branch Name</td>
									<td>Address</td>
									<td>Email Id</td>
									<td>Revised Email Id</td>
									<td>Nodal</td>
									<td>Lead</td>
									<td>Status</td>
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
											 scope="page">
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
												<td><center><integro:empty-if-null
													value="<%=ob.getSystembank().getCode()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystembank().getSystemBankName()%>" />&nbsp;</center>
												</td>
												<td><center><integro:empty-if-null
													value="<%=ob.getSystembank().getAddress()%>" />&nbsp;</center>
												</td>
												<td><center><integro:empty-if-null
													value="<%=ob.getSystembank().getContactMail()%>" />&nbsp;</center>
												</td>
												<td><center><integro:empty-if-null
													value="<%=ob.getRevisedEmailIds()%>" />&nbsp;</center>
												</td>
												<td><center>
												
													<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   String[] array = value.getNodalLead().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getNodalLead().startsWith("s") && Long.toString(ob.getBankId()).equals(bankId)) {%>
												
												<input type="radio" id="nodalLead" name="nodalLead" value="<%="s" + "," + ob.getBankId()%>" checked="checked" disabled="disabled">
											<%}else{ %>
												<input type="radio" id="nodalLead" name="nodalLead" value="<%="s" + "," + ob.getBankId()%>" disabled="disabled">
											
											<%} %>
											<%}else{ %>
											<input type="radio" id="nodalLead" name="nodalLead" value="<%="s" + "," + ob.getBankId()%>"  disabled="disabled">
											<%} %>
										</center></td>
										
										<!--Lead Value  -->
												
											<td><center>
												<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   String[] array = value.getLeadValue().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getLeadValue().startsWith("s") && Long.toString(ob.getBankId()).equals(bankId)) {%>
												
												<input type="radio" id="leadValue" name="leadValue" value="<%="s" + "," + ob.getBankId()%>" checked="checked" disabled="disabled">
											<%}else{ %>
												<input type="radio" id="leadValue" name="leadValue" value="<%="s" + "," + ob.getBankId()%>" disabled="disabled">
											
											<%} %>
											<%}else{ %>
											<input type="radio" id="leadValue" name="leadValue" value="<%="s" + "," + ob.getBankId()%>"  disabled="disabled">
											<%} %>
										</center></td>
										
										
												<td><center><integro:empty-if-null value="<%=ob.getStatus()%>" />&nbsp;</center></td>
									
											</tr>
											<%}else if(ob.getBankType().equals("O")){ %>
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
												<td>
													<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankCode()%>" />&nbsp;</center>
												</td>
												<td>
											<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getOtherBankCode().getOtherBankName()%>" />&nbsp;</center>
											</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getOtherbranch().getOtherBranchName()%>" />&nbsp;</center>
												</td>
												<td>
													<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getAddress()%>" />&nbsp;</center>
												</td>
												<td>
													<center><integro:empty-if-null
												value="<%=ob.getOtherbranch().getContactMailId()%>" />&nbsp;</center>
												</td>
												<td>
													<center><integro:empty-if-null
												value="<%=ob.getRevisedEmailIds()%>" />&nbsp;</center>
												</td>
												<td><center>
												
												<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   String[] array = value.getNodalLead().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getNodalLead().startsWith("o") && Long.toString(ob.getBankId()).equals(bankId)) {%>
											<input type="radio" id="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getBankId()%>" checked="checked"  disabled="disabled"> 
											<%}else {%>
											<input type="radio" id="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getBankId()%>"  disabled="disabled">
											<%} %>
											<%}else {%>
											<input type="radio" id="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getBankId()%>"  disabled="disabled">
											<%} %>
										</center></td>
										
										<!--Lead Value  -->
									
									<td><center>
												<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   String[] array = value.getLeadValue().split(",");
		                                       //long bankId = Long.parseLong(array[1]);
		                                       String bankId = array[1];
			                                   if (value.getLeadValue().startsWith("o") && Long.toString(ob.getBankId()).equals(bankId)) {%>
											<input type="radio" id="leadValue" name="leadValue" value="<%="o" + "," + ob.getBankId()%>" checked="checked"  disabled="disabled"> 
											<%}else {%>
											<input type="radio" id="leadValue" name="leadValue" value="<%="o" + "," + ob.getBankId()%>"  disabled="disabled">
											<%} %>
											<%}else {%>
											<input type="radio" id="leadValue" name="leadValue" value="<%="o" + "," + ob.getBankId()%>"  disabled="disabled">
											<%} %>
										</center></td>
										
												<td><center><integro:empty-if-null value="<%=ob.getStatus()%>" />&nbsp;</center></td>
									
											</tr>
											<%} %>
										</logic:iterate>
									</logic:present>
			<!-- @@@@@@@@@@@@@@@@@@@@  IFSC CODE @@@@@@@@@@@@@@@@@@@@@@@@@  -->               
                        		<logic:present name="ifscBranchList">
									<logic:iterate id="ob" name="ifscBranchList"
											type="com.integrosys.cms.app.customer.bus.OBIfscMethod" scope="page">
										<% String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
										%>
										<%if (ob.getBankType().equals("O")) {%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=no%></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getIfscCode()%>" />&nbsp;</center></td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBankName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBranchName()%>" />&nbsp;</center>
											</td>
											<td>
											<center><integro:empty-if-null
												value="<%=ob.getBranchNameAddress()%>" />&nbsp;</center>
											</td>
											<td><center><integro:empty-if-null
												value="<%=ob.getEmailID()%>" />&nbsp;</center></td>
											<td><center><integro:empty-if-null
												value="<%=ob.getRevisedEmailID()%>" />&nbsp;</center></td>
											<td>
											<center>
											<%
											if(value.getNodalLead()!=null && !value.getNodalLead().equals(""))
											{
			                                   	String[] array = value.getNodalLead().split(",");
		                                       	String bankId = array[1];
			                                   	if (value.getNodalLead().startsWith("o") && ob.getIfscCode().equals(bankId)) {%>
												<input type="radio" id="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>" checked="checked" disabled="disabled">
												<%}else {%>
												<input type="radio" id="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>" disabled="disabled">
												<%} %>
											<%}else {%>
												<input type="radio" id="nodalLead" name="nodalLead" value="<%="o" + "," + ob.getIfscCode()%>" disabled="disabled">
											<%} %>
											</center>
												
											</td>
											
											<!--Lead value  -->
										
										<td>
											<center>
											<%
											if(value.getLeadValue()!=null && !value.getLeadValue().equals(""))
											{
			                                   	String[] array = value.getLeadValue().split(",");
		                                       	String bankId = array[1];
			                                   	if (value.getLeadValue().startsWith("o") && ob.getIfscCode().equals(bankId)) {%>
												<input type="radio" id="leadValue" name="leadValue" value="<%="o" + "," + ob.getIfscCode()%>" checked="checked" disabled="disabled">
												<%}else {%>
												<input type="radio" id="leadValue" name="leadValue" value="<%="o" + "," + ob.getIfscCode()%>" disabled="disabled">
												<%} %>
											<%}else {%>
												<input type="radio" id="leadValue" name="leadValue" value="<%="o" + "," + ob.getIfscCode()%>" disabled="disabled">
											<%} %>
											</center>
												
											</td>
											
											<td><center><integro:empty-if-null value="<%=ob.getStatus()%>" />&nbsp;</center></td>
										</tr>
										<%}%>
									</logic:iterate>
								</logic:present>
                <!-- @@@@@@@@@@@@@@@@@@@@  IFSC CODE @@@@@@@@@@@@@@@@@@@@@@@@@  --> 
									<logic:notPresent name="otherBankList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
									
							</tbody>
						</table>
						<%}else if(value.getBankingMethod().equals("")  ||value.getBankingMethod().equals("SOLE")  || 
								 value.getBankingMethod().equals("SOLE-SOLE")) {%>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="bnkdtltbl" style="display:none;" >
							<thead>
								<tr>
									<td>Sr. No.</td>
									<td>Bank Name</td>
									<td>Branch Name</td>
									<td>Nodal</td>
									<td>Lead</td>
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
											 scope="page">
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
												<td><center><input type="radio" id="leadValue" name="leadValue" disabled="disabled"></center></td>
									
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
					
					
					<!-- MULTIPLE AND CONSORTIUM FIELDS ACCRODING TO BANKING METHOD  -->
	<span><table>
	<tr colspan="1">
<td >
<%if(value.getBankingMethod().equals("MULTIPLE") 
								|| value.getBankingMethod().contains(",MULTIPLE-MULTIPLE")
								|| value.getBankingMethod().contains("MULTIPLE-MULTIPLE,")
								|| value.getBankingMethod().equals("MULTIPLE-MULTIPLE")
								) {%>
<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo"  id="isMultiple">
							
							
								
							
							<tbody>
							<thead>
							<tr>
									<td colspan="3">MULTIPLE BANKING</td>
									
								</tr>
								<tr>
									<td colspan="1">Share %</td>
									<td colspan="2">Proposed</td>
								</tr>
								</thead>
								<tr>
								
									<td colspan="1" style="background-color: #D1D0CE"></td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">
									Fund Based %
									</td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">Non Fund Based %</td>
									
								</tr>
								<tr>
									<td colspan="1" style="background-color: #D1D0CE; color:black;">Lead Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getMultBankFundBasedLeadBankPer()%>"  />&nbsp;</center>
									</td colspan="1" style="background-color: #E5E4E2">
									
									<td style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getMultBankNonFundBasedLeadBankPer()%>"  />&nbsp;</center>
									</td>
									
								</tr>
								<tr>
									<td colspan="1" style="background-color: #D1D0CE;color:black;">HDFC Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getMultBankFundBasedHdfcBankPer()%>"  />&nbsp;</center>
									</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getMultBankNonFundBasedHdfcBankPer()%>"  />&nbsp;</center>
									</td>
									
								</tr>
								      		
							</tbody>
						</table>

<%}%>
</td><td>
<%if(value.getBankingMethod().equals("CONSORTIUM")
		|| value.getBankingMethod().contains(",CONSORTIUM-CONSORTIUM")
		|| value.getBankingMethod().contains("CONSORTIUM-CONSORTIUM,")
		|| value.getBankingMethod().equals("CONSORTIUM-CONSORTIUM")
		) {%>

<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblinfo" id="isConsortium" >
							<thead>
							
								<tr>
									<td colspan="3">CONSORTIUM BANKING</td>
									
								</tr>
								<tr>
									<td colspan="1">Share %</td>
									<td colspan="2">Proposed</td>
								</tr>
								</thead>
							
							<tbody>
								    <tr>
								
									<td colspan="1" style="background-color: #D1D0CE"></td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">
									Fund Based %
									</td>
									<td colspan="1" style="background-color: #E5E4E2;color:black;">Non Fund Based %</td>
									
								</tr>
								
								<tr>
									<td colspan="1" style="background-color: #D1D0CE; color:black;">Lead Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getConsBankFundBasedLeadBankPer()%>"  />&nbsp;</center>
									</td colspan="1" style="background-color: #E5E4E2">
									<td style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getConsBankNonFundBasedLeadBankPer()%>"  />&nbsp;</center>
									</td>
									
								</tr>
								<tr>
									<td colspan="1" style="background-color: #D1D0CE;color:black;">HDFC Bank</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getConsBankFundBasedHdfcBankPer()%>"  />&nbsp;</center>
									</td>
									<td colspan="1" style="background-color: #E5E4E2">
									<center><integro:empty-if-null
												value="<%=value.getConsBankNonFundBasedHdfcBankPer()%>"  />&nbsp;</center>
									</td>
									
								</tr>  		
							</tbody>
						</table>
						<%} %>
						

</td></tr>				
		</table></span>			
					
					
					
					
					
					
					
					
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
		<html:hidden name="ManualInputCustomerInfoForm" property="branchCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyGroupName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />	
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
	<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI"  styleId="deferLEI"/>
	<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated" styleId="isPanValidated" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
	<!--End Santosh LEI CR  -->	
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
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		
		<html:hidden name="ManualInputCustomerInfoForm" property="pName"  />

	<html:hidden name="ManualInputCustomerInfoForm" property="cityName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="stateName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="regionName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="countryName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="cityRegName"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="stateRegName" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regionRegName" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="countryRegName" />

	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegionName" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="relManagerName" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
		
		
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
		
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="udf_hidden_details.jsp"/>	

</table>


<!-- InstanceEnd -->

