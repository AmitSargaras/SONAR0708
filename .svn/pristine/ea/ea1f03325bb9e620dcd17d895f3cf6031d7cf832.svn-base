<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,java.math.BigDecimal,com.integrosys.base.businfra.currency.Amount,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<%
ICheckListItem item = (ICheckListItem) request.getAttribute("actualOb");
System.out.println("******************///////////////////// ITEM "+item);
if(item!=null && item.getItemStatus().startsWith("PENDING_")){
	item=(ICheckListItem) request.getAttribute("stageOb");
}
if(item==null){
item = (ICheckListItem) session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.checkListItem");
}
System.out.println("******************///////////////////// ITEM "+item);
SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>

<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="com.integrosys.cms.app.customer.trx.ICMSCustomerTrxValue"%>
<%@page import="com.integrosys.cms.app.checklist.bus.ICheckListItem"%>
<%@page import="java.text.SimpleDateFormat"%><html>
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
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
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
						
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<tbody>
													<tr class="odd">													
													
										<td class="fieldname" width="20%">Edited By</td>
									
										
										<td width="30%">	
										<integro:empty-if-null value="<%=item.getUpdatedBy()%>"/>
											</td>
											
										<td class="fieldname" width="20%">Last Approved By</td>
										
										<td width="30%">
										<integro:empty-if-null value="<%=item.getApprovedBy()%>"/>
											</td>
									</tr>
									<tr class="even">
								
										<td class="fieldname" width="20%">Edited On</td>
										
										<td width="30%">
										
										<%if(item.getUpdatedDate()!=null){ %>
										<%=df.format(item.getUpdatedDate()) %>
										<%}else{ %>
										-&nbsp;
										<%} %>
											</td>
											
										<td class="fieldname" width="20%">Last Approved On </td>
										
										<td width="30%">
										<%if(item.getApprovedDate()!=null){ %>
										<%=df.format(item.getApprovedDate()) %>
										<%}else{ %>
										-&nbsp;
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
