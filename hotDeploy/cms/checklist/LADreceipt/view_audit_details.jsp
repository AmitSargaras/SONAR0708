<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,java.math.BigDecimal,com.integrosys.base.businfra.currency.Amount,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<%
	
List transactionHistoryList = (List) session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.transactionHistoryList");
if(transactionHistoryList!=null){
	pageContext.setAttribute("transactionHistoryList", transactionHistoryList);
	}	else   	{
		transactionHistoryList = new ArrayList();
		String[] stringArray = new String[4];
        stringArray[0] = "-";
        stringArray[1] = "-";
        stringArray[2] = "-";
        stringArray[3] = "-";
        transactionHistoryList.add(stringArray);
        transactionHistoryList.add(stringArray);
		pageContext.setAttribute("transactionHistoryList", transactionHistoryList);
	}
	OBSystemBankBranch systemBank = (OBSystemBankBranch) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchObj");
	int sno = 0;
	int no = 0;
%>
<%
	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
	ICMSCustomerTrxValue trx = (ICMSCustomerTrxValue)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ICMSCustomerTrxValue");
	 if( trx != null ) {
	        DefaultLogger.debug(this,  "trx "+trx);
	    }else {
	        DefaultLogger.debug(this, "trx is  NULL in request");
	    }
%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="com.integrosys.cms.app.customer.trx.ICMSCustomerTrxValue"%><html>
<head>
<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>
<head>
<title>Untitled Document</title>
<script language="JavaScript" type="text/JavaScript">
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
</script>
<!-- InstanceEndEditable -->
</head>
<table width="100%"  cellspacing="0" cellpadding="0"
	border="0">			
	<tr>
		<td valign="top">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<%String[] firstRecord = (String[])transactionHistoryList.get(0);%>
											<%String[] secondRecord = (String[])transactionHistoryList.get(1);%>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<tbody>
													<tr class="odd">													
													<%if(firstRecord[2].equals("DRAFT") || (firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("DRAFT"))){ %>
													<td class="fieldname" width="20%">Draft By</td>
											<%}else if((firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_CREATE"))
													||(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("-")))
													{ %>
										<td class="fieldname" width="20%">Created By</td>
										<%}else{ %>
										<td class="fieldname" width="20%">Edited By</td>
										<%} %>
										
										<td width="30%">	
									<%if(firstRecord[2].equals("ACTIVE") && secondRecord[2].equals("-")){ %>
									<%if(secondRecord[2].equals("-")){%>
										<%=firstRecord[0]%>
									<%}else{ %>
									<%=secondRecord[0]%>
									<%} %>
								    <%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=secondRecord[0]%>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_CREATE")){ %>
									<%=secondRecord[0]%>
									<%}else if(firstRecord[2].equals("REJECTED")  && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=secondRecord[0]%>
											<%}else{%>
											<%=firstRecord[0]%>
									<%} %>
											</td>
											<%if(firstRecord[2].equals("DRAFT") || (firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("DRAFT"))){ %>
										
                                          <td class="fieldname" width="20%">Last Draft By</td>
											<%}else{ %>
										<td class="fieldname" width="20%">Last Approved By</td>
										<%} %>
										<td width="30%">
										<%if(firstRecord[2].equals("ACTIVE") && secondRecord[2].equals("-")){ %>		
										
										<%if(secondRecord[2].equals("-")){%>
										<%=secondRecord[0]%>
									<%}else{ %>
									<%=firstRecord[0]%>
										<%} %>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=firstRecord[0]%>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_CREATE")){ %>
									<%=firstRecord[0]%>
									<%}else if(firstRecord[2].equals("REJECTED") && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=firstRecord[0]%>
									<%}else{%>
									<%=secondRecord[0]%>
											<%} %>
											</td>
									</tr>
									<tr class="even">
									<%if(firstRecord[2].equals("DRAFT") || (firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("DRAFT"))){ %>
													<td class="fieldname" width="20%">Draft On</td>
											<%}else if((firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_CREATE"))
													||(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("-"))){ %>
										<td class="fieldname" width="20%">Created On</td>
										<%}else{ %>
										<td class="fieldname" width="20%">Edited On</td>
										<%} %>
										
										<td width="30%">
										<%if(firstRecord[2].equals("ACTIVE")){ %>
										<%if(secondRecord[2].equals("-")){%>
										<%=firstRecord[3]%>
									<%}else{ %>
									<%=secondRecord[3]%>
									<%} %>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_CREATE")){ %>
									<%=secondRecord[3]%>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=secondRecord[3]%>
									<%}else if(firstRecord[2].equals("REJECTED")  && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=secondRecord[3]%>
									<%}else{%>
									<%=firstRecord[3]%>
									<%} %>
											</td>
											<%if(firstRecord[2].equals("DRAFT") || (firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("DRAFT"))){ %>
													<td class="fieldname" width="20%">Last Draft On</td>
											<%}else{%>
										<td class="fieldname" width="20%">Last Approved On </td>
										<%}%>
										<td width="30%">
										<%if(firstRecord[2].equals("ACTIVE")){ %>
											<%if(secondRecord[2].equals("-")){%>
										<%=secondRecord[1]%>
									<%}else{ %>
									<%=firstRecord[1]%>
									<%} %>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_CREATE")){ %>
									<%=firstRecord[1]%>
									<%}else if(firstRecord[2].equals("ACTIVE")  && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=firstRecord[1]%>
									<%}else if(firstRecord[2].equals("REJECTED") && secondRecord[2].equals("PENDING_UPDATE")){ %>
									<%=firstRecord[1]%>
									<%}else{%>
									<%=secondRecord[1]%>
									<%} %>
											</td>
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
</table>
