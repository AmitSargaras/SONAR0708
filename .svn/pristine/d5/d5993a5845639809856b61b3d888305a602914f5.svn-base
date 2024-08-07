<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page
	import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<%
	//List relationshipMgrList = null;
	//List partyGroupList = (List) session
	//		.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupList");
		List systemList = (List) session
			.getAttribute("com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositAction.systemList");
	
	//OBSystemBankBranch systemBank = (OBSystemBankBranch) session
	//.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchObj");
	
	//pageContext.setAttribute("partyGroupList", partyGroupList);
	

	if (!(systemList == null)) {

		pageContext.setAttribute("systemList", systemList);
		//request.setAttribute("systemList", systemList);
	}

	int sno = 0;
	int no = 0;
	//if (sr != null) {
	// relationshipMgrList = new ArrayList(sr.getResultList());
	//pageContext.setAttribute("relationshipMgrList",
	//		relationshipMgrList);
	//}

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
<%
	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	FixedDepositForm value = (FixedDepositForm) request
			.getAttribute("FixedDepositForm");
%>



<%@page
	import="com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositForm"%>


<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.OBLien"%>
<html>
<head>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
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
alert("saveForm-addSystem");
	document.getElementById('customerdetails').style.display = '';
   
}
function getAction(id,name,ind) {
	alert("getAction-create");
	var type = document.getElementById("actionType"+ind).value;

	 if(type =="Edit"){
		document.forms[0].action = "FixedDeposit.do?CashDeposit=" +id +"&system="+name+"&index="+ind;		
    	document.forms[0].event.value = "edit_system";
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "FixedDeposit.do?CashDeposit=" +id +"&system="+name+"&index="+ind;		
    	document.forms[0].event.value = "delete_system";
    	document.forms[0].submit();
	}	    
}
function addParty(){
	alert('inside');
	document.getElementById('backEdit2').style.display = '';
	//document.getElementById('addSystemDetails').style.display = '';
	document.getElementById('addSystemDetails2').style.display = '';
//	document.getElementById('hrline').style.display = '';
	//document.getElementById('name').value = document.getElementById('customerNameShort').value;
	//document.getElementById('sts').value = document.getElementById('status').value;
	//document.getElementById('segment').value = document.getElementById('customerSegment').value;
	
}
function addSystem(){
alert("getAction-addSystem");
	document.forms[0].action="FixedDeposit.do";
	document.forms[0].event.value = "add_lien";	
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
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">					

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="right"><input onclick="javascript : addParty()"
								name="AddNew12" type="button" id="AddNew12" value="Add Details1"
								class="btnNormal" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr id="backEdit2" style="display:none; margin-top:0">            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >     
                <tbody>
                  <tr class="even" >
                 <td width="20%" class="fieldname" >Line No.<font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><html:text property="lineNo" size="15"
								maxlength="10"></html:text>&nbsp;
								<br><html:errors property="lineNo"/>
								
								
								</td>
                  
              <td width="20%" class="fieldname" >Lien Amount<font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><html:text property="lineAmount" size="15"
								maxlength="10"></html:text>&nbsp;
								<br><html:errors property="lineAmount"/>
								
								
								</td>
                </tr>
                <tr class="odd">
	        <td width="20%" class="fieldname" >Serial No.<font color="red">*</font><span class="style11"></span></td>
                  <td width="20%"><html:text property="serialNo" size="10"
								maxlength="30"></html:text>&nbsp;
								<br><html:errors property="serialNo"/>
								
								
								</td>
	        </tr>
                
                 <tr class="odd">
	                <td class="fieldname">
						<span><bean:message key="label.security.asset.description"/></span>&nbsp; </td>
	                <td colspan="3">
	                    <html:textarea  property="remark" rows="3" style="width:100%"  onkeyup="limitTextInput(this,100,'Remark ')"/>
	                    <html:errors property="remark"/></td>
	        </tr>
        </table>
      </td>
    </tr>
						<%--<tr id="addSystemDetails" style="display: none;">
							<td align="right">
							<h3 align="left">System Details</h3>
							<input onclick="javascript : addSystem()"
								name="AddNew12" type="button" id="AddNew12"
								value="Add System Details1" class="btnNormal" /></td>
						</tr>
						<tr id="hrline" style="display: none;">
							<td>
							<hr />
							</td>
						</tr>
						--%><tr id="addSystemDetails2" >
							<td>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
										<td>S/N</td>
										<td>System</td>
										<td>System ID</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
								
									<%--<logic:present name="systemList">
										<logic:iterate id="ob" name="systemList"
											type="com.integrosys.cms.app.customer.bus.OBSystem"
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
												<center><integro:empty-if-null
													value="<%=ob.getSystem()%>" />&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getSystemCustomerId()%>&nbsp;</center>
												</td>
												<td>
												<center><select id="actionType<%=no%>"
													onchange="getAction('<%=ob.getSystemCustomerId()%>','<%=ob.getSystem()%>','<%=no%>')">
													<option value="">-Select-</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
									--%><logic:notPresent name="systemList">
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
	<html:hidden name="FixedDepositForm" property="cashDepositID" />
	<html:hidden name="FixedDepositForm"property="depCurr"  />
	<html:hidden name="FixedDepositForm" property="depAmt" />
	<html:hidden name="FixedDepositForm" property="depMatDate" />
	<html:hidden name="FixedDepositForm" property="depNo" />
	<html:hidden name="FixedDepositForm" property="depositRefNo" />
	<html:hidden name="FixedDepositForm" property="depositReceiptNo" />
    <html:hidden name="FixedDepositForm" property="accountType" />
	<html:hidden name="FixedDepositForm" property="fdrRate" />
	<html:hidden name="FixedDepositForm" property="issueDate" />
	<html:hidden name="FixedDepositForm" property="thirdPartyBank" />
	<html:hidden name="FixedDepositForm" property="accountTypeValue" />
	<html:hidden name="FixedDepositForm" property="accountTypeNum" />
	<html:hidden name="FixedDepositForm" property="tenure" />
	<html:hidden name="FixedDepositForm" property="tenureUOM" />
	<html:hidden name="FixedDepositForm" property="ownBank" />
	<html:hidden name="FixedDepositForm" property="groupAccountNumber" />
	<html:hidden name="FixedDepositForm" property="holdStatus" />
	<%--<html:hidden name="FixedDepositForm" property="fdLinePercentage" />
	--%><html:hidden name="FixedDepositForm" property="depositeInterestRate" />
	<html:hidden name="FixedDepositForm" property="verificationDate" />
	<html:hidden name="FixedDepositForm" property="depositorName" />
	<html:hidden name="FixedDepositForm" property="lineNo" />
	<html:hidden name="FixedDepositForm" property="lineAmount" />
		
	<html:hidden property="event"></html:hidden>
</table>
<!-- InstanceEnd -->