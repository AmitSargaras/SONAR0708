<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,
			java.util.List,java.util.Vector,
			com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>

<%
	//List sr = (List) request.getAttribute("partyGroupList");
	String event = request.getParameter("event");
String migratedFlag = "N";	
	 migratedFlag = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.migratedFlag");
	if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }

String validate = (String) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.validate");
	if(validate == null)
	{
		validate = "";
	}
	String fromPage = request.getParameter("fromPage");
	if(fromPage == null)
	{
		fromPage = "";
	}
	
	System.out.println("666666666666666666666666666666666666666"+event);
	System.out.println("666666666666666666666666666666666666666"+validate);
	//pageContext.setAttribute("partyGroupList", sr);
	//int sno = 0;
	//int startIndex=0;
	//int counter=1;
	//String ind= (String) request.getAttribute("startIndex");
	//if(ind!=null && (!ind.equals("")))
	//{
	//	 startIndex = Integer.parseInt(ind);

	//}
	
	//Added for processing Duplicate PAN no Check
    String duplicatePanPartyDetails = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.duplicatePanPartyDetails");
	//DefaultLogger.debug(this,"duplicatePanPartyDetails:"+duplicatePanPartyDetails);
	ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
	String leiExpDate = form.getLeiExpDate();
	SimpleDateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	String systemDate= df.format(new Date());
%>





<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>
<html>
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
function nextPage(next){
	
	document.forms[0].action="ManualInputCustomer.do?event="+next;
    document.forms[0].submit();
}
function showDetail(name){
	var validate = '<%=validate%>';
	//alert("---------------validate-----"+validate+"9999999999");
	if(validate=='Y')
	{
		document.forms[0].action="ManualInputCustomer.do?event=validate_customer_form_in_edit&fromPage="+name;
	    document.forms[0].submit();
	}
	else if(validate=='YS')
	{
		document.forms[0].action="ManualInputCustomer.do?event=validate_customer_form_in_edit_save&fromPage="+name;
	    document.forms[0].submit();
	}
	else if(name == 'edit_cibil_details'){
	//	alert(document.getElementById("cifId").value);
	//	alert(document.getElementById("pan").value);
		document.forms[0].action="ManualInputCustomer.do?event="+name+"&cifId="+document.getElementById("cifId").value+"&pan="+document.getElementById("pan").value;
	    document.forms[0].submit();
		}
	else{
	document.forms[0].action="ManualInputCustomer.do?event="+name;
    document.forms[0].submit();
	}
	
}
function saveCustomerForm() {

	document.forms[0].action="ManualInputCustomer.do?event=save_customer_in_edit";
    document.forms[0].submit();
   
}
function cancelPage(){
    document.forms[0].action="ManualInputCustomer.do?event=list_customers";
    
    document.forms[0].submit();
}
function submitForm() {
	//alert(document.getElementById("status").value);
	var leiExpDate = '<%=leiExpDate%>';
	const sysDate = Date.parse('<%=systemDate%>');				 
	const leidate = Date.parse(leiExpDate);				 
	if(leidate < sysDate){
		alert('LEI Exp. Date is less than System Date');
	}
	<% if(null!=duplicatePanPartyDetails && !"".equals(duplicatePanPartyDetails)){%>
	if(document.getElementById("status").value == 'ACTIVE'){
	//alert('inside duplicatePartyString');
	var duplicatePanPartyDetails= '<%= duplicatePanPartyDetails %>';
	//alert(duplicatePanPartyDetails);
	var answer=confirm("The PAN Number already exists for "+ duplicatePanPartyDetails +" Party.\nwould you like to continue with same PAN Number?");
	if(answer == true){
	alert("This is Proprietor party");
 	document.forms[0].action="ManualInputCustomer.do?event=edit_customer";
    document.forms[0].submit();
	}
	}
	else{
	 	document.forms[0].action="ManualInputCustomer.do?event=edit_customer";
	    document.forms[0].submit();
	}	
    <% } else{%>
 	document.forms[0].action="ManualInputCustomer.do?event=edit_customer";
    document.forms[0].submit();
    <% }%>
}

//function createPartyGroup() {
	
 //	document.forms[0].action = "MIPartyGroup.do?event=maker_prepare_create_party_group&startIndex=";
 	
  //  document.forms[0].submit();
//}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='ManualInputCustomer.do?' >
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
	<!-- InstanceBeginEditable name="menuScript" -->
	<!-- InstanceEndEditable -->
	<table align="right" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
<tr>&nbsp;</tr>
</table>
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">
			<tr><td>&nbsp;</td></tr>
		<tr>
			<td valign="top">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr background="red">
						<td width="100%" colspan="4">
						<h3>Customer Details - General</h3>
						</td>
					</tr>
					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
					<tr align="left">
						<td width="25%" colspan="1"><input onclick="javascript : showDetail('edit_summary_details')"
							name="AddNew12" type="button" id="AddNew12" value="Summary Details"
							class="btnNormal" />&nbsp;&nbsp;  
						<input onclick="javascript : showDetail('edit_financial_details')"
							name="AddNew12" type="button" id="AddNew12" value="Financial Details"
							class="btnNormal" />&nbsp;&nbsp; 
						<input onclick="javascript : showDetail('edit_cri_details')"
							name="AddNew12" type="button" id="AddNew12" value="CRI Details"
							class="btnNormal" />&nbsp;&nbsp; 
					<input onclick="javascript : showDetail('edit_cibil_details')"
							name="AddNew12" type="button" id="AddNew12" value="CIBIL"
							class="btnNormal" />&nbsp;&nbsp; 
					<input onclick="javascript : showDetail('edit_udf_details')"
							name="AddNew12" type="button" id="AddNew12" value="User Defined Fields (UDF)"
							class="btnNormal" />
					<input onclick="javascript : showDetail('edit_banking_method_details')"
							name="AddNew12" type="button" id="AddNew12" value="Banking Method"
							class="btnNormal" />		
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
					<td>
						<% if(event.equals("edit_financial_details") || event.equals("save_party_group_in_edit") || event.equals("save_edited_party_group_in_edit")|| event.equals("confirm_delete_party_group_in_edit")  ||event.equals("save_edited_party_group") || fromPage.equals("edit_financial_details") ){ %>		
						    <jsp:include page="edit_financial_details.jsp"></jsp:include>
						<%} else if(event.equals("edit_cri_details") || fromPage.equals("edit_cri_details") || event.equals("edit_cri_facility") || event.equals("edit_remove_cri_fac") ){ %>
						    <jsp:include page="edit_cri_details.jsp"></jsp:include>
						<%} else if(event.equals("edit_cibil_details")|| event.equals("save_edited_director_in_edit")|| event.equals("save_director_in_edit") || event.equals("confirm_delete_director_in_edit") || event.equals("copy_office_to_reg_edit")|| fromPage.equals("edit_cibil_details") ){ %>
						    <jsp:include page="edit_cibil_details.jsp"></jsp:include>	
						<%} else if(event.equals("edit_udf_details")|| fromPage.equals("edit_udf_details")){ %>
						    <jsp:include page="create_udf_details.jsp"></jsp:include>   	
						<%}else if(event.equals("edit_banking_method_details") ||event.equals("save_other_bank") ||event.equals("save_other_bank_in_edit")|| fromPage.equals("edit_banking_method_details") || event.equals("delete_banking_method_in_edit")){ %>		
					    	<jsp:include page="edit_banking_method_details.jsp"></jsp:include>
						<%} else { %>			
					    <jsp:include page="edit_summary_details.jsp"></jsp:include>
					<%} %>
						<html:hidden name="ManualInputCustomerInfoForm" property="coBorrowerDetailsInd" styleId="coBorrowerDetailsInd"
							value="<%=form.getCoBorrowerDetailsInd()%>"/>
						<html:hidden name="ManualInputCustomerInfoForm" property="coBorrowerLiabIdList"
							value="<%=form.getCoBorrowerLiabIdList()%>"/>
							<input type="hidden" name="ManualInputCustomerInfoForm" id="status" value="<%=form.getStatus()%>" />
					
					</td>
					</tr>
				<tr><td>&nbsp;</td></tr>
					<tr>
					<td align="center">
					<%if(event.equals("edit_cibil_details") || event.equals("save_edited_director_in_edit") || event.equals("save_director_in_edit") || event.equals("confirm_delete_director_in_edit") || event.equals("copy_office_to_reg_edit") || fromPage.equals("edit_cibil_details")) {%>	
			<a href="javascript:submitForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
			<img src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
			</a>&nbsp;
			<a href="javascript:saveCustomerForm();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
						src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					&nbsp;
			<a href="javascript:cancelPage();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
			<%}else{ %>
					<a href="javascript:saveCustomerForm();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
						src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					&nbsp;
					<%if(event.equals("edit_customer_details")||event.equals("edit_summary_details")||event.equals("save_other_system") ||event.equals("edit_customer") || fromPage.equals("edit_summary_details") || event.equals("save_customer_in_edit") || event.equals("save_edited_system_in_edit") || event.equals("system_deleted_in_edit")|| event.equals("save_vendor_name_in_edit")||event.equals("save_edited_vendor_in_edit")||event.equals("vendor_deleted_in_edit")){ %>
					<a href="javascript:showDetail('edit_financial_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("edit_financial_details") ||event.equals("save_party_group") || event.equals("save_edited_party_group_in_edit")|| event.equals("confirm_delete_party_group_in_edit")|| fromPage.equals("edit_financial_details") || event.equals("calculate_financial_detail_in_edit") ){ %>
					<a href="javascript:showDetail('edit_cri_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("edit_cri_details") || fromPage.equals("edit_cri_details")){ %>
					<a href="javascript:showDetail('edit_cibil_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("edit_udf_details") || fromPage.equals("edit_udf_details")){ %>
					<a href="javascript:nextPage('edit_banking_method_details');"
						onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
							src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("edit_banking_method_details") ||event.equals("save_other_bank")  ||event.equals("save_other_bank_in_edit") || fromPage.equals("edit_banking_method_details") || event.equals("delete_banking_method_in_edit")){ %>
					<a href="javascript:nextPage('edit_cibil_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
				
					<%} %>
					<%}%>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
					</thead>
			</table>
			</td>
		</tr>
		</table>
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
