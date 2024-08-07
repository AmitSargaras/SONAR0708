<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                  java.util.Collection,
				 java.util.Iterator,
				 java.util.List,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant" %>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<%
	String event = request.getParameter("event");

	String fromPage = request.getParameter("fromPage");
	if(fromPage == null)
	{
		fromPage = "";
	}

	
	System.out.println("666666666666666666666666666666666666666"+event+" fromPage:"+fromPage);
	String sessionCriteria = (String) request.getAttribute("sessionCriteria");
	request.setAttribute("sessionCriteria", sessionCriteria);
	System.out.println(">>>>>>>lmtlistcmd>>>>>>>>session criteria"+sessionCriteria);
	
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
function nextPage(next,sessionCriteria){
	//alert("next:"+next);
	document.forms[0].action="MIAcntDetail.do?event="+next+"&sessionCriteria="+sessionCriteria;
    document.forms[0].submit();
}
function showDetail(name,sessionCriteria){
	//alert("NAME:"+name);
	document.forms[0].action="MIAcntDetail.do?event="+name+"&sessionCriteria="+sessionCriteria;
    document.forms[0].submit();
	
}

function cancelPage(sessionCriteria){
    document.forms[0].action="MIAcntDetail.do?event=list_customers&sessionCriteria="+sessionCriteria;
    
    document.forms[0].submit();
}


</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='MIAcntDetail.do?' >
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
	<!-- InstanceBeginEditable name="menuScript" -->
	<!-- InstanceEndEditable -->
	<table align="right" width="100%"  class="tblFormSection">
<tr >
<%-- <td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td> --%>
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
						<td width="25%" colspan="1"><input onclick="javascript : showDetail('close_released_line_details_rejected','<%=sessionCriteria%>')"
							name="AddNew12" type="button" id="AddNew12" value="Released Line Details"
							class="btnNormal" />&nbsp;&nbsp;  
						<input onclick="javascript : showDetail('close_udf_rejected','<%=sessionCriteria%>')"
							name="AddNew12" type="button" id="AddNew12" value="USER DEFINED FIELDS(UDF)"
							class="btnNormal" />&nbsp;&nbsp; 
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
					<td>
						<% if(event.equals("close_udf_rejected") || fromPage.equals("close_udf_rejected") ){ %>		
						    <jsp:include page="close_udf_rejected.jsp"></jsp:include>
						<%} else { %>			
					    <jsp:include page="close_released_line_details_rejected.jsp"></jsp:include>
					<%} %>
				
					
					</td>
					</tr>
				<tr><td>&nbsp;</td></tr>
					<tr>
					<td align="center">
					<% if(event.equals("close_udf_rejected") || fromPage.equals("close_udf_rejected")){ %>
				<a href="javascript:nextPage('close_released_line_details_rejected','<%=sessionCriteria%>');"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/prev2.gif',1)"><img
				src="img/prev1.gif" name="Image4411" border="0" id="Image4411" />
					</a>
		
			<%} %>
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
