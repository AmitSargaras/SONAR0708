<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckListItem,
					java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    ICheckListItem checkListItem = (ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.security.SecurityCheckListAction.checkListItem");
	ArrayList replaceList = (ArrayList)request.getAttribute("replaceList");

	// construct the name value pair for the replaceList options
	ArrayList itemRefList = new ArrayList();
	ArrayList itemCodeDescList = new ArrayList();
 	Iterator replaceListIterator = replaceList.iterator();
 	while (replaceListIterator.hasNext()) {
	 	String[] itemData = (String[])replaceListIterator.next();

		String itemRef = (itemData[0]==null) ? "" : itemData[0];
		String itemCode = (itemData[1]==null) ? "-" : itemData[1];
		String itemDesc = (itemData[2]==null) ? "-" : itemData[2];
		itemRefList.add(itemRef);
		itemCodeDescList.add(itemDesc+" ("+itemCode+") "+"("+itemRef+")");
	}
	pageContext.setAttribute("itemRefList", itemRefList);
	pageContext.setAttribute("itemCodeDescList", itemCodeDescList);

	String thisCheckListItemID = null; //the current checklist item ID
	String docCode = "-"; //master doc code
	String docDesc = "-"; //master doc description
	if (checkListItem!=null)
	{
		System.out.println("> replace_item.jsp: checkListItem is not null!");
		
		long temp = checkListItem.getCheckListItemID();
		thisCheckListItemID = String.valueOf(temp);
		docCode = checkListItem.getItemCode()==null ? "-" : checkListItem.getItemCode();
		docDesc = checkListItem.getItemDesc()==null ? "-" : checkListItem.getItemDesc();
	}
	else
		System.out.println("> replace_item.jsp: checkListItem is NULL!");

	String index = (String) request.getParameter("index");
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px ;
}
</style>


<script language="JavaScript" type="text/JavaScript">
<!--
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

function gotopage (aLocation) {
	window.location = aLocation ;
}

function replace() {
    document.forms[0].event.value="replace";
    document.forms[0].replaceCheckListItemRef.value=document.forms[0].replaceCheckListItemRef.options[document.forms[0].replaceCheckListItemRef.selectedIndex].value;
    document.forms[0].submit();
}

function goCancel() {
	document.forms[0].event.value="back";
	document.forms[0].submit();
}

function doSomething(){
    //alert('Before submit');
    if(document.forms[0].event.value == "") {
        document.forms[0].event.value="replace";
    }else{
        return true;
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="SecurityCheckList" onsubmit="doSomething()" >
<input type="hidden" name="event" value="" />

<%--hidden fields for owner--%>
<%--Bernard - added the following hidden fields--%>
<html:hidden property="limitProfileID" />
<html:hidden property="checkListID" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="collateralID" />
<html:hidden property="docCode" />

<input type="hidden" name="index" value="<%=index%>" />
<input type="hidden" name="checkListItemRefID" />
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

    <tr>
      <td width="78%">
      <h3>Replace Document Linkage</h3>
    </td>

    <td width="22%" align="right" valign="baseline">&nbsp; </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <hr /></td>
    </tr>
    <tr>
      <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
        <tbody>
        <tr class="even">
          <td class="fieldname" width="20%">Master Doc Code</td>
          <td><%=docCode%></td>
        </tr>
        <tr class="odd"> 
          <td class="fieldname" width="20%">Master Doc Desc</td>
          <td><%=docDesc%></td>
        </tr>
        <tr class="odd"> 
          <td class="fieldname" width="20%">Replace Existing Doc Linkage With&nbsp;<font color="#0000FF">* </font></td>
          <td valign="middle" style="border-left:0;border-right:0" class="even"> 
<%		if (replaceList!=null && replaceList.size()>0)
		{
%> 			<html:select property="replaceCheckListItemRef">
				<option value="" >Please Select </option>
				<html:options name="itemRefList" labelName="itemCodeDescList"/>
			</html:select>
			<html:errors property="replaceCheckListItemRef" />
<%		}
		else
		{
%>			No document(s) available for replacement.
<%		}
%>
            <br/>
            <br/>
          </td>
        </tr>
        </tbody> 
      </table>
    </td>
    </tr>

  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
<%	if (replaceList!=null && replaceList.size()>0)
	{
%>		<td width="75" valign="baseline" align="center"><a href="#" onClick="replace()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3"  border="0" id="Image3" /></a></td>
		<td width="75" valign="baseline" align="center"><a href="#" onClick="goCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
<%	}
	else
	{
%>
		<td valign="baseline" align="center" colspan="2"><a href="#" onClick="goCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
<%	}
%>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

