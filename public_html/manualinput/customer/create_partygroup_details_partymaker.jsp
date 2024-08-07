<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector,java.util.HashMap"%>

<%
	String event = request.getParameter("event");
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
	DefaultLogger.debug(this," value of from page is "+fromPage);
     DefaultLogger.debug(this,"----------------------- value of event is ----------------"+event);
     
     
   //Added for processing Duplicate PAN no Check
   // HashMap partyNamePanMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyNamePanMap");
 	//DefaultLogger.debug(this,"partyNamePanMap:"+partyNamePanMap);
 
 	//String partyNamePanMapJson = JSONValue.toJSONString(partyNamePanMap);
 	//System.out.println("partyNamePanMapJson >> " + partyNamePanMapJson);

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
 
	if(validate == 'Y')
	{
		document.forms[0].action="ManualInputCustomer.do?event=validate_customer_form&fromPage="+name;
	    document.forms[0].submit();
	}
	else if(validate =='YS')
	{
		document.forms[0].action="ManualInputCustomer.do?event=validate_customer_form_save&fromPage="+name;
	    document.forms[0].submit();
	}
	else if(name == 'display_cibil_details'){
		document.forms[0].action="ManualInputCustomer.do?event="+name+"&cifId="+document.getElementById("cifId").value+"&pan="+document.getElementById("pan").value;
	    document.forms[0].submit();
	}
	else{
	document.forms[0].action="ManualInputCustomer.do?event="+name;
    document.forms[0].submit();
	}
}
function saveCustomerForm() {

	document.forms[0].action="ManualInputCustomer.do?event=save_customer_partymaker";
    document.forms[0].submit();
   
}
function cancelPage(){
    document.forms[0].action="ManualInputCustomer.do?event=list_customers_partymaker";
    
    document.forms[0].submit();
}
function submitForm() {
 	document.forms[0].action="ManualInputCustomer.do?event=create_customer_partymaker";
    document.forms[0].submit();

}

function submitFormSSSSS() {
 	document.forms[0].action="ManualInputCustomer.do?event=create_customer_partymaker";
    document.forms[0].submit();
}

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
					<tr>
					<td>		
					    <jsp:include page="create_summary_details_partymaker.jsp"></jsp:include>
					
					</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
					<td align="center">
					
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
