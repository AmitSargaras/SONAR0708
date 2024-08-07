<%@ page import="com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListForm,
                 com.integrosys.cms.ui.common.FrequencyList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recurrent/recurrent_view.jsp,v 1.9 2006/10/27 08:19:27 hmbao Exp $
*
* Purpose: recurrent item view page
* Description: Type - Maintain Recurrent Checklist
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.9 $
* Date: $Date: 2006/10/27 08:19:27 $
* Tag: $Name:  $
*/
%>
<%
  	String custTypeTrxID = request.getParameter("custTypeTrxID");
    RecurrentCheckListForm aForm = (RecurrentCheckListForm)request.getAttribute("RecurrentCheckListForm");
    FrequencyList freqList = FrequencyList.getInstance();
    boolean isTrack = request.getParameter("isTrack") != null?request.getParameter("isTrack").equals("true"):false;
    boolean isClose = request.getParameter("isClose") != null?request.getParameter("isClose").equals("true"): false;
    boolean isRead = request.getParameter("isRead") != null?request.getParameter("isRead").equals("true"):false;;
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
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}

function submitPage() {
	document.forms[0].event.value = "return";
	document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body >
<html:form action="RecurrentCheckList" >
<input type="hidden" name="custTypeTrxID" value="<%=request.getParameter("custTypeTrxID")%>"/>
<input type="hidden" name="isTrack" value="<%=isTrack%>"/>
<input type="hidden" name="isClose" value="<%=isClose%>"/>
<input type="hidden" name="event"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.maintain.rec.doc.checklist.view"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.doc.description"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="recurrentItemDesc" /></td>
            </tr>
            <%-- <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
			    <logic:equal name="RecurrentCheckListForm" property="oneOff" scope="request" value="true">
				    <td>&nbsp;Yes</td>
				</logic:equal>
				<logic:equal name="RecurrentCheckListForm" property="oneOff" scope="request" value="false">
					<td>&nbsp;No</td>
				</logic:equal>
            </tr> --%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.frequency"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="frequency" />
                  &nbsp;<integro:empty-if-null value="<%=freqList.getFrequencyValue(aForm.getFrequencyUnit())%>"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.doc.end.date"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="docEndDate" /></td>
            </tr>
            <%-- <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.grace.period"/></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="gracePeriod" />
                  &nbsp;<integro:empty-if-null value="<%=freqList.getFrequencyValue(aForm.getGracePeriodUnit())%>"/></td>
            </tr> --%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.doc.due.date"/></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="dueDate" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.last.doc.entry.date"/></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="lastDocEntryDate"/></td>
            </tr>
            <%-- <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.chaser.reminder"/></td>
						<logic:equal name="RecurrentCheckListForm" property="chaserReminder" scope="request" value="true">
							<td>&nbsp;Yes</td>
						</logic:equal>
						<logic:equal name="RecurrentCheckListForm" property="chaserReminder" scope="request" value="false">
							<td>&nbsp;No</td>
						</logic:equal>
            </tr> --%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
              <td>&nbsp;<bean:write name="RecurrentCheckListForm" property="recurrentItemRemarks" /></td>
            </tr>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
<%  if (isTrack) {
  	String url = "RecurrentCheckList.do?event=to_track&custTypeTrxID=" + custTypeTrxID;
%>
    <td width="100" valign="baseline" align="center"> <a href="<%=url%>" custTypeTrxID cust onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
<%
	} else if (isClose || isRead) {
%>
    <td width="100" valign="baseline" align="center"> <a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
<%
		}
		else {
%>
    <td width="100" valign="baseline" align="center"> <a href="RecurrentCheckList.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
<%  }
%>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
