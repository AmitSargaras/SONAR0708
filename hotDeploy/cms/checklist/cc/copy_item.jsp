<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
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

function copy() {
    document.forms[0].event.value="copy";
    document.forms[0].submit();
}

function goCancel() {
	document.forms[0].event.value="cancel";
	document.forms[0].submit();
}

function doSomething(){
    //alert('Before submiit');
    if(document.forms[0].event.value == "") {
        document.forms[0].event.value="copy";
    }else{
        return true;
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif','img/calendarb.gif')"  >
<html:form action="CCCheckList" onsubmit="doSomething()" >
<input type="hidden" name="event" value="" />

<%--hidden fields for owner--%>
<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="docCode" />

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

    <tr>
      <td width="78%"> <h3>Maintain Constitutional / Contractual</h3></td>

    <td width="22%" align="right" valign="baseline">&nbsp; </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <hr /></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td class="fieldname">Doc Code</td>
              <td><bean:write name="CCCheckListForm" property="docCode" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Doc Desc&nbsp;<font color="#0000FF">* </font></td>
              <td>
                  <html:text property="docDesc" size="40" maxlength="100"/><html:errors property="docDesc" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>

  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="75" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/ok2.gif',1)" onClick="copy()" ><img src="img/ok1.gif" name="Image3"  border="0" id="Image3" /></a></td>

    <td width="75" valign="baseline" align="center"><a href="#" onClick="goCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

