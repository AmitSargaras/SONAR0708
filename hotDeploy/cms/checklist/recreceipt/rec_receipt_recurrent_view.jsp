<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
				com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recreceipt/rec_receipt_recurrent_view.jsp,v 1.8 2006/10/27 08:19:07 hmbao Exp $
*
* Purpose: View Recurrent Receipt
* Description: View Recurrent/Covenant Receipt
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.8 $
* Date: $Date: 2006/10/27 08:19:07 $
* Tag: $Name:  $
*/
%>
<%
	int row = 0;
    RecurrentReceiptForm aForm = (RecurrentReceiptForm)request.getAttribute("RecurrentReceiptForm");
    Boolean showSubItemDetail = (Boolean)request.getAttribute("showSubItemDetail");
    boolean toTrack = request.getParameter("toTrack") != null?request.getParameter("toTrack").equals("true"):false;
    boolean isClose = request.getParameter("isClose") != null?request.getParameter("isClose").equals("true"): false;
    boolean isRead = request.getParameter("isRead") != null?request.getParameter("isRead").equals("true"):false;
	FrequencyList freqList = FrequencyList.getInstance();
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

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}+-
</style>


<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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

function submitPage() {
	document.forms[0].event.value="return";
	document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif','img/ok2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="RecurrentReceipt" >
<input type="hidden" name="event" />
<input type="hidden" name="toTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isClose" value="<%=isClose%>"/>

<%	//bernard - added if condition for CMS-1490
	if (showSubItemDetail==null || (showSubItemDetail!=null && showSubItemDetail==Boolean.TRUE))
	{
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.rec.doc.receipt.process"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.doc.description"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="recurrentItemDesc" />&nbsp;</td>
            </tr>
            <%-- <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="oneOff" />&nbsp;</td>
            </tr> --%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.frequency"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="frequency" />&nbsp;<bean:write name="RecurrentReceiptForm" property="frequencyUnit" />&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.doc.end.date"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="docEndDate" />&nbsp;</td>
            </tr>
           <%--  <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.grace.period"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="gracePeriod" />&nbsp;<bean:write name="RecurrentReceiptForm" property="gracePeriodUnit" />&nbsp;</td>
            </tr> --%>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.due.date"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="dueDate" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.status"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="recurrentStatus" />&nbsp;</td>
            </tr>
            <%-- <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.chaser.reminder.required"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="chaserReminder" />&nbsp;</td>
            </tr> --%>
          </tbody>
        </table></td>
    </tr>
		<tr>
			<td><html:errors property="noEntryError"/></td>
		</tr>
  </tbody>
</table>

<table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
		<td colspan="2" width="100" valign="baseline" align="center">
			<a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
		</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>

<%	} //bernard - end of if showSubItemDetail condition (CMS-1490)
%>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.rec.doc.receipt.history"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="7%"><bean:message key="title.sequence.number"/></td>
              <td width="15%"><bean:message key="label.checklist.frequency"/></td>
              <td width="16%"><bean:message key="label.checklist.doc.end.date"/></td>
              <td width="16%"><bean:message key="label.checklist.due.date"/></td>
              <td width="16%"><bean:message key="label.checklist.date.received"/></td>
              <td width="16%"><bean:message key="label.checklist.date.waived"/></td>
              <td width="30%"><bean:message key="label.checklist.remarks"/></td>
            </tr>
          </thead>
          <tbody>
    <logic:present name="itemhistory"  scope="request" >
    <logic:iterate id="OB" name="itemhistory"  type="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem"  scope="request" >
<%
	  if (OB.getReceivedDate() != null || OB.getWaivedDate()!=null) {
			String rowClass="";
			row++;
			if(row%2!=0){
				 rowClass="odd";
			}else{
				 rowClass="even";
			}
%>
            <tr class="<%=rowClass%>"> 
              <td class="index"><%=row%></td>
              <%
              	if (OB.getFrequencyUnit() == null) {
              %>
              	<td style="text-align:center">-</td>
              <%
          		} else {
              %>
				<td><%=OB.getFrequency()%>&nbsp;<%=freqList.getFrequencyValue(OB.getFrequencyUnit())%></td>
			  <%} %>
              <td>
              <% //CR-127
                 if (OB.getDocEndDate() != null) { %>
                  <integro:date object="<%=OB.getDocEndDate()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td>
              <% if (OB.getDueDate() != null) { %>
                  <integro:date object="<%=OB.getDueDate()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td>
              <% if (OB.getReceivedDate() != null) { %>
                <integro:date object="<%=OB.getReceivedDate()%>"/>&nbsp;
              <% } else { %> - <% }%>
              </td>
              <td>
              <% if (OB.getWaivedDate() != null) { %>
                <integro:date object="<%=OB.getWaivedDate()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td><integro:htmltext value="<%=OB.getRemarks()%>" lineLength="20"/>&nbsp;</td>
            </tr>
<%
      }
%>
</logic:iterate>
<%
		if (row == 0) {
%>
            <tr class="odd">
              <td colspan="7"><bean:message key="label.error.no.history"/></td>
            </tr>
<%
		}
%>
</logic:present>
<logic:notPresent name="itemhistory" >
            <tr class="odd">
              <td colspan="7"><bean:message key="label.error.no.history"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
<%	//bernard - added if block for CMS-1490
	if (showSubItemDetail!=null && showSubItemDetail==Boolean.FALSE)
	{
%>
	    <tr>
    	  <td colspan="7">&nbsp;</td>
    	</tr>
    	<tr>
			<td colspan="7" valign="baseline" align="center">
				<a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
			</td>
		</tr>
<%	}
%>
    <tr>
      <td colspan="7">&nbsp;</td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
