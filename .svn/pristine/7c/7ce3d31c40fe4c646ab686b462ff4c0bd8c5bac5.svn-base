<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>


<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%
ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request
.getAttribute("ManualInputCustomerInfoForm");

	String leiExpDate = value.getLeiExpDate();
	SimpleDateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	String systemDate= df.format(new Date());
	
	//List sr = (List) request.getAttribute("partyGroupList");
	String event = request.getParameter("event");
	System.out.println("Event == "+event);
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
	
	//System.out.println("666666666666666666666666666666666666666"+event);
	//System.out.println("666666666666666666666666666666666666666"+validate);
	ICMSCustomerTrxValue trx = (ICMSCustomerTrxValue)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ICMSCustomerTrxValue");
	 if( trx != null ) {
	        DefaultLogger.debug(this,  "trx "+trx);
	      
	    }else {
	        DefaultLogger.debug(this, "trx is  NULL in request");
	    }

	
	//System.out.println("666666666666666666666666666666666666666"+event);
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
%>





<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.integrosys.cms.app.customer.trx.ICMSCustomerTrxValue"%><html>
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
		document.forms[0].action="ManualInputCustomer.do?event=validate_customer_form_in_resubmit&fromPage="+name;
	    document.forms[0].submit();
	}
	else if(name == 'process_cibil_details' && document.getElementById("status").value == 'ACTIVE'){
		document.forms[0].action="ManualInputCustomer.do?event="+name+"&cifId="+document.getElementById("cifId").value+"&pan="+document.getElementById("pan").value;
	    document.forms[0].submit();
	}
	else{
	document.forms[0].action="ManualInputCustomer.do?event="+name;
    document.forms[0].submit();
	}
}
function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}


function returnPage() {
  // document.forms[0].action = "ManualInputCustomer.do?event=list_customers";
   // document.forms[0].submit();
	 document.forms[0].action = "ToDo.do";
	    document.forms[0].event.value = "prepare";
	    document.forms[0].submit();
}


function savecreate() 
{
	var leiExpDate = '<%=leiExpDate%>';
	const sysDate = Date.parse('<%=systemDate%>');				 
	const leidate = Date.parse(leiExpDate);				 
	if(leidate < sysDate){
		alert('LEI Exp. Date is less than System Date');
	}
	//alert(document.getElementById("status").value);
	<% if(null!=duplicatePanPartyDetails && !"".equals(duplicatePanPartyDetails)){%>
	if(document.getElementById("status").value == 'ACTIVE'){
	//alert('inside duplicatePartyString');
	var duplicatePanPartyDetails= '<%= duplicatePanPartyDetails %>';
	//alert(duplicatePanPartyDetails);
	var answer=confirm("The PAN Number already exists for "+ duplicatePanPartyDetails +" Party.\nwould you like to continue with same PAN Number?");
	if(answer == true){
		alert("This is Proprietor party");
		document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value="maker_resubmit_create_customer";
	  //document.forms[0].event.value="create_customer";
	    document.forms[0].submit();
	}
	}
	else{
		document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value="maker_resubmit_create_customer";
	  //document.forms[0].event.value="create_customer";
	    document.forms[0].submit();
	}	
    <% } else{%>
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value="maker_resubmit_create_customer";
  //document.forms[0].event.value="create_customer";
    document.forms[0].submit();
    <%} %>
}
function createDraft() 
{
	var leiExpDate = '<%=leiExpDate%>';
	const sysDate = Date.parse('<%=systemDate%>');				 
	const leidate = Date.parse(leiExpDate);				 
	if(leidate < sysDate){
		alert('LEI Exp. Date is less than System Date');
	}
	//alert(document.getElementById("status").value);
	<% if(null!=duplicatePanPartyDetails && !"".equals(duplicatePanPartyDetails)){%>
	if(document.getElementById("status").value == 'ACTIVE'){
	//alert('inside duplicatePartyString');
	var duplicatePanPartyDetails= '<%= duplicatePanPartyDetails %>';
	//alert(duplicatePanPartyDetails);
	var answer=confirm("The PAN Number already exists for "+ duplicatePanPartyDetails +" Party.\nwould you like to continue with same PAN Number?");
	if(answer == true){
		document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value="create_draft_customer";
	  //document.forms[0].event.value="create_customer";
	    document.forms[0].submit();
	}
	}
	else{
		document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value="create_draft_customer";
	  //document.forms[0].event.value="create_customer";
	    document.forms[0].submit();
	}	
    <% } else{%>
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value="create_draft_customer";
  //document.forms[0].event.value="create_customer";
    document.forms[0].submit();
    <% } %>
}
function editDraft() 
{
	var leiExpDate = '<%=leiExpDate%>';
	const sysDate = Date.parse('<%=systemDate%>');				 
	const leidate = Date.parse(leiExpDate);				 
	if(leidate < sysDate){
		alert('LEI Exp. Date is less than System Date');
	}
	//alert(document.getElementById("status").value);
	<% if(null!=duplicatePanPartyDetails && !"".equals(duplicatePanPartyDetails)){%>
	if(document.getElementById("status").value == 'ACTIVE'){
	//alert('inside duplicatePartyString');
	var duplicatePanPartyDetails= '<%= duplicatePanPartyDetails %>';
	//alert(duplicatePanPartyDetails);
	var answer=confirm("The PAN Number already exists for "+ duplicatePanPartyDetails +" Party.\nwould you like to continue with same PAN Number?");
	if(answer == true){
		document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value="update_draft_customer";
	  //document.forms[0].event.value="create_customer";
	    document.forms[0].submit();
	}
	}
	else{
		document.forms[0].action = "ManualInputCustomer.do";
	    document.forms[0].event.value="update_draft_customer";
	  //document.forms[0].event.value="create_customer";
	    document.forms[0].submit();
	}	
    <% } else{%>
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value="update_draft_customer";
  //document.forms[0].event.value="create_customer";
    document.forms[0].submit();
    <% }%>
}
function saveedit() 
{
	var leiExpDate = '<%=leiExpDate%>';
	const sysDate = Date.parse('<%=systemDate%>');				 
	const leidate = Date.parse(leiExpDate);				 
	if(leidate < sysDate){
		alert('LEI Exp. Date is less than System Date');
	}
	//alert(document.getElementById("status").value);
	<% if(null!=duplicatePanPartyDetails && !"".equals(duplicatePanPartyDetails)){%>
	if(document.getElementById("status").value == 'ACTIVE'){
	//alert('inside duplicatePartyString');
	var duplicatePanPartyDetails= '<%= duplicatePanPartyDetails %>';
	//alert(duplicatePanPartyDetails);
	var answer=confirm("The PAN Number already exists for "+ duplicatePanPartyDetails +" Party.\nwould you like to continue with same PAN Number?");
	if(answer == true){
		document.forms[0].action = "ManualInputCustomer.do";
		document.forms[0].event.value="maker_resubmit_update_customer";
		document.forms[0].submit();
	}
	}
	else{
		document.forms[0].action = "ManualInputCustomer.do";
		document.forms[0].event.value="maker_resubmit_update_customer";
		document.forms[0].submit();
	}	
    <% } else{%>
	document.forms[0].action = "ManualInputCustomer.do";
   document.forms[0].event.value="maker_resubmit_update_customer";
// document.forms[0].event.value="edit_customer";
    document.forms[0].submit();
    <% }%>
}
function savedelete() 
{
	document.forms[0].action = "ManualInputCustomer.do";
    document.forms[0].event.value="maker_resubmit_delete_customer";
// document.forms[0].event.value="maker_delete_customer";
    document.forms[0].submit();
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
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">
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
						<td width="25%" colspan="1"><input onclick="javascript : showDetail('process_summary_details')"
							name="AddNew12" type="button" id="AddNew12" value="Summary Details"
							class="btnNormal" />&nbsp;&nbsp;  
						<input onclick="javascript : showDetail('process_financial_details')"
							name="AddNew12" type="button" id="AddNew12" value="Financial Details"
							class="btnNormal" />&nbsp;&nbsp; 
						<input onclick="javascript : showDetail('process_cri_details')"
							name="AddNew12" type="button" id="AddNew12" value="CRI Details"
							class="btnNormal" />&nbsp;&nbsp; 
					<input onclick="javascript : showDetail('process_cibil_details')"
							name="AddNew12" type="button" id="AddNew12" value="CIBIL"
							class="btnNormal" />&nbsp;&nbsp; 
						<input onclick="javascript : showDetail('process_udf_details')"
							name="AddNew12" type="button" id="AddNew12" value="User Defined Fields (UDF)"
							class="btnNormal" />
						<input onclick="javascript : showDetail('process_banking_method_details')"
							name="AddNew12" type="button" id="AddNew12" value="Banking Method"
							class="btnNormal" />&nbsp;&nbsp; 
							<input type="hidden" name="ManualInputCustomerInfoForm" id="status" value="<%=value.getStatus()%>" />
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
					<td>
						<% if(event.equals("process_financial_details") || fromPage.equals("process_financial_details") ){ %>		
						    <jsp:include page="process_financial_details.jsp"></jsp:include>
						<%} else if(event.equals("process_cri_details") || fromPage.equals("process_cri_details") || event.equals("process_remove_cri_fac") || event.equals("process_cri_facility")){ %>
						    <jsp:include page="process_cri_details.jsp"></jsp:include>
						<%} else if(event.equals("process_cibil_details")  || event.equals("save_director_in_resubmit") || event.equals("save_edited_director_in_resubmit")  || event.equals("confirm_delete_director_in_resubmit") || event.equals("copy_office_to_reg_resubmit")|| fromPage.equals("process_cibil_details")){ %>
						    <jsp:include page="process_cibil_details.jsp"></jsp:include>	
						<%} else if(event.equals("process_udf_details")  || fromPage.equals("process_udf_details") ) { %>
						    <jsp:include page="process_udf_details.jsp"></jsp:include>	    
						<%} else if(event.equals("process_banking_method_details") ||event.equals("save_other_bank") ||event.equals("save_party_group") || event.equals("save_party_group_in_resubmit") ||event.equals("save_edited_party_group_in_resubmit")|| event.equals("confirm_delete_party_group_in_resubmit")  ||event.equals("save_edited_party_group") ||event.equals("save_other_bank_in_resubmit") || fromPage.equals("process_banking_method_details") || event.equals("delete_banking_method_in_resubmit")){ %>		
					    <jsp:include page="process_banking_method_details.jsp"></jsp:include>
					<%}else { %>			
					    <jsp:include page="process_summary_details.jsp"></jsp:include>
					<%} %>
					</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
					<td align="center">
					<%if(event.equals("process_cibil_details") || event.equals("save_director_in_resubmit") || event.equals("save_edited_director_in_resubmit")  || event.equals("confirm_delete_director_in_resubmit") || event.equals("copy_office_to_reg_resubmit") || fromPage.equals("process_cibil_details")) {%>	
			 
			
			  <%if(trx.getFromState().equals("PENDING_CREATE")){ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/submit2.gif',1)">
     		<img src="img/submit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:savecreate()"/></a>
     		<%}else if(trx.getFromState().equals("PENDING_UPDATE")){ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/submit2.gif',1)">
     		<img src="img/submit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:saveedit()"/></a>
     		<%}else if(trx.getFromState().equals("PENDING_DELETE")){ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/submit2.gif',1)">
     		<img src="img/submit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:savedelete()"/></a>
     		 <%}else if(trx.getFromState().equals("PENDING_PERFECTION")){ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/submit2.gif',1)">
     		<img src="img/submit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:createDraft()"/></a>
     		 <%}else if(trx.getFromState().equals("ACTIVE")){ %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/submit2.gif',1)">
     		<img src="img/submit1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:editDraft()"/></a>
     		<%} %>
     		<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
     		<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="returnPage()"/></a>	        	
			
			
			
			
			
			<!--<a href="javascript:submitForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
			<img src="img/submit1.gif" name="Image3311" border="0" id="Image3311" />
			</a>&nbsp;
			<a href="javascript:saveForm();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
						src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					&nbsp;
			<a href="javascript:cancelPage();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
			--><%}else{ %>
					<!--<a href="javascript:saveForm();"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
						src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					&nbsp;
					--><%if(event.equals("process_page") || event.equals("process_summary_details") || event.equals("update_draft_customer") || event.equals("save_other_system") || event.equals("save_other_system_in_resubmit") || event.equals("system_deleted_in_resubmit") || event.equals("save_edited_system_in_resubmit") || fromPage.equals("process_summary_details")  || event.equals("maker_save_process")|| event.equals("maker_resubmit_update_customer")|| event.equals("maker_resubmit_create_customer") ){ %>
					<a href="javascript:showDetail('process_financial_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("process_financial_details") ||event.equals("save_other_bank") ||event.equals("save_party_group") ||event.equals("save_party_group_in_resubmit") ||event.equals("save_edited_party_group_in_resubmit")|| event.equals("confirm_delete_party_group_in_resubmit")||event.equals("save_other_bank_in_resubmit") || fromPage.equals("process_financial_details")|| event.equals("calculate_financial_detail_in_resubmit")  || event.equals("delete_banking_method_in_resubmit")){ %>
					<a href="javascript:showDetail('process_cri_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("process_cri_details") || fromPage.equals("process_cri_details")){ %>
					<a href="javascript:showDetail('process_cibil_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("process_udf_details") || fromPage.equals("process_udf_details")){ %>
					<a href="javascript:showDetail('process_banking_method_details');"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image4411','','img/next2.gif',1)"><img
						src="img/next1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
					
					<%}else if(event.equals("process_banking_method_details") || fromPage.equals("process_banking_method_details")){ %>
					<a href="javascript:showDetail('process_cibil_details');"
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
