<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckListItem,
					java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    ICheckListItem checkListItem = (ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.security.SecurityCheckListAction.checkListItem");
	ArrayList linkedList = (ArrayList)request.getAttribute("linkedList");
	ArrayList linkableList = (ArrayList)request.getAttribute("linkableList");
	
	String thisCheckListItemID = null; //the current checklist item ID
	String docCode = "-"; //master doc code
	String docDesc = "-"; //master doc description
	if (checkListItem!=null)
	{
		System.out.println("> link_item.jsp: checkListItem is not null!");
		
		long temp = checkListItem.getCheckListItemID();
		thisCheckListItemID = String.valueOf(temp);
		docCode = checkListItem.getItemCode()==null ? "-" : checkListItem.getItemCode();
		docDesc = checkListItem.getItemDesc()==null ? "-" : checkListItem.getItemDesc();
	}
	else
		System.out.println("> link_item.jsp: checkListItem is NULL!");

	
	/*if (linkableList!=null)
	{
		for (int i=0; i<linkableList.size(); i++)
		{
			String[] data = (String[])linkableList.get(i);
			String checkListItemID = data[0];
			String itemCode = data[1];
			String itemDesc = data[2];
			System.out.println("> link_item.jsp: linkableList["+i+"]: checkListItemID="+checkListItemID+", itemCode="+itemCode+", itemDesc="+itemDesc);
		}
	}
	else
		System.out.println("> link_item.jsp: linkableList is NULL!");*/
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

function gotopage(aLocation) {
	window.location = aLocation ;
}

function add_linkable_option(text, value) {
	var oOption = document.createElement("OPTION");
	oOption.text=text;
	oOption.value=value;
	document.forms[0].linkableList.options.add(oOption)
	return true;
}

function add_linked_option(text, value) {
	var oOption = document.createElement("OPTION");
	oOption.text=text;
	oOption.value=value;
	document.forms[0].linkedList.options.add(oOption)
	return true;
}

function del_linked_option(value) {
	var my_index=-1

	for (var m=0; m<document.forms[0].linkedList.options.length; m++) //retrieving the index
		if (document.forms[0].linkedList.options[m].value==value) 
			my_index=m;

	if (my_index==-1) // someting wrong happened
	{
		alert("Unable to find index to delete: "+value)
		return false;
	}
	else
		document.forms[0].linkedList.options.remove(my_index)
}

function del_linkable_option(value) {
	var my_index=-1

	for (var m=0; m<document.forms[0].linkableList.options.length; m++) //retrieving the index
		if (document.forms[0].linkableList.options[m].value==value) 
			my_index=m;

	if (my_index==-1) // someting wrong happened
	{
		alert("Unable to find index to delete: "+value)
		return false;
	}
	else
		document.forms[0].linkableList.options.remove(my_index)
}

function link_button() {
	//iterates through the linkableList to find the selected options to copy
	for (var m=0; m<document.forms[0].linkableList.options.length; m++)
	{
		if (document.forms[0].linkableList.options[m].selected==true)
		{
			add_linked_option(document.forms[0].linkableList.options[m].text, document.forms[0].linkableList.options[m].value);
		}
	}
	var i=0;
	//iterates through the linkableList and deletes all selected options
	while (i<document.forms[0].linkableList.options.length)
	{
		if (document.forms[0].linkableList.options[i].selected==true)
		{
			del_linkable_option(document.forms[0].linkableList.options[i].value);
			i=0;
		}
		else i++;
	}
	return true;
}

function unlink_button() {
	//iterates through the linkedList to find the selected options to copy
	for (var m=0; m<document.forms[0].linkedList.options.length; m++)
	{
		if (document.forms[0].linkedList.options[m].selected==true)
		{
			add_linkable_option(document.forms[0].linkedList.options[m].text, document.forms[0].linkedList.options[m].value);
		}
	}
	var i=0;
	//iterates through the linkedList and deletes all selected options
	while (i<document.forms[0].linkedList.options.length)
	{
		if (document.forms[0].linkedList.options[i].selected==true)
		{
			del_linked_option(document.forms[0].linkedList.options[i].value);
			i=0;
		}
		else i++;
	}
	return true;
}

function link() {
	var linkableItemIDs="";
	var linkedItemIDs="";
    document.forms[0].event.value="link";

    //iterates through linkableList and extracts checkListItemIDs
	for (var m=0; m<document.forms[0].linkableList.options.length; m++)
	{
		if (m==0)
			linkableItemIDs = document.forms[0].linkableList.options[m].value;
		else
			linkableItemIDs = linkableItemIDs + "," + document.forms[0].linkableList.options[m].value;
	}
			
	//iterates through linkedList and extracts checkListItemIDs
	for (var n=0; n<document.forms[0].linkedList.options.length; n++)
	{
		if (n==0)
			linkedItemIDs = document.forms[0].linkedList.options[n].value;
		else
			linkedItemIDs = linkedItemIDs + "," + document.forms[0].linkedList.options[n].value;
	}

	//alert(linkableItemIDs);
	//alert(linkedItemIDs);

    document.forms[0].linkableItemIDs.value=linkableItemIDs;
    document.forms[0].linkedItemIDs.value=linkedItemIDs;
    document.forms[0].submit();
}

function goCancel() {
	document.forms[0].event.value="back";
	document.forms[0].submit();
}

function doSomething(){
    //alert('Before submit');
    if(document.forms[0].event.value == "") {
        document.forms[0].event.value="link";
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

<%--hidden fields for this page--%>
<%--Bernard - added the following hidden fields--%>
<html:hidden property="limitProfileID" />
<html:hidden property="checkListID" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="collateralID" />
<html:hidden property="docCode" />
<input type="hidden" name="linkableItemIDs" />
<input type="hidden" name="linkedItemIDs" />


<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

    <tr>
      <td width="78%"> 
      <h3>Maintain Document Linkage</h3>
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
          <td colspan="3"><%=docCode%></td>
        </tr>
        <tr class="odd"> 
          <td class="fieldname" width="20%">Master Doc Desc</td>
          <td colspan="3"><%=docDesc%></td>
        </tr>
        <tr class="odd"> 
          <td class="fieldname">Document(s) <br>
             to Link to Master Doc</td>
<%			if ((linkableList!=null && linkableList.size()>0) || (linkedList!=null && linkedList.size()>0))
			{
%>          
				<td valign="middle" style="border-left:0;border-right:0" class="even">Linkable Doc List<br/>
		            <select name="linkableList" size="6" multiple class="word" id="select">
<%					if (linkableList!=null)
					{
						for (int i=0; i<linkableList.size(); i++)
						{
							String[] data = (String[])linkableList.get(i);
							String checkListItemID = data[0]==null ? "" : data[0];
							String itemCode = data[1]==null ? "-" : data[1];
							String itemDesc = data[2]==null ? "-" : data[2];
							String itemRef = data[3] == null ? "-" : data[3];
							if (!checkListItemID.equals(thisCheckListItemID))
							{
%>								<option value="<%=checkListItemID%>"><%=itemDesc%>&nbsp;(<%=itemCode%>)&nbsp;(<%=itemRef%>)</option>
<%							}
						}
					}
%>
		            </select>
		          </td>
		          <td  valign="middle" style="border-left:0;border-right:0;text-align:left" class="even"> 
		            <input type="button" name="Button2" value="Link&gt;&gt;" style="width:80" onClick="link_button()" class="word"/>
		            <br/>
		            <br/>
		            <input type="button" name="Button" value="&lt;&lt;De-Link" style="width:80" onClick="unlink_button()" class="word"/>
		          </td>
		          <td style="border-left:0" class="even">Linked Doc List<br/>
		            <select name="linkedList" size="6" multiple class="word" id="select">
<%					if (linkedList!=null)
					{
						for (int i=0; i<linkedList.size(); i++)
						{
							String[] data = (String[])linkedList.get(i);
							String checkListItemID = data[0]==null ? "" : data[0];
							String itemCode = data[1]==null ? "-" : data[1];
							String itemDesc = data[2]==null ? "-" : data[2];
							String itemRef = data[3] == null ? "-" : data[3];
							if (!checkListItemID.equals(thisCheckListItemID))
							{
%>								<option value="<%=checkListItemID%>"><%=itemDesc%>&nbsp;(<%=itemCode%>)&nbsp;(<%=itemRef%>)</option>
<%							}
						}
					}
%>
		            </select>
		          </td>
<%			}
			else
			{
%>				<td colspan="3">No document(s) available to link.</td>
<%			}
%>
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
<%	if ((linkableList!=null && linkableList.size()>0) || (linkedList!=null && linkedList.size()>0))
	{
%>
		<td width="75" valign="baseline" align="center"><a href="#" onClick="link()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3"  border="0" id="Image3" /></a></td>
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

