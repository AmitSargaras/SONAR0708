<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
				com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Collection,
                 java.util.HashMap"%>
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recreceipt/rec_receipt_recurrent.jsp,v 1.23 2006/10/27 08:19:07 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.23 $
* Date: $Date: 2006/10/27 08:19:07 $
* Tag: $Name:  $
*/
%>
<%
    IRecurrentCheckListTrxValue checkListTrxVal = null;
    try {
        checkListTrxVal = (com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.checkListTrxVal");
    }
    catch (Exception e) {
    }
    String status = "";
    if (checkListTrxVal != null) {
        status = checkListTrxVal.getStatus();
    }
    int row = 0;
    RecurrentReceiptForm aForm = (RecurrentReceiptForm) request.getAttribute("RecurrentReceiptForm");
    Boolean showSubItemDetail = (Boolean) request.getAttribute("showSubItemDetail");
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
<script type="text/javascript" src="js/validation.js"></script>


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
function updateRecurrent() {
	document.forms[0].event.value="update_recurrent_item";
	document.forms[0].submit();
}

function changeDeferredOrReceivedDate (cal, date) {
	if (cal != "") {
	    cal.sel.value = date;
	}

    if (date != "") {
        document.forms[0].dateWaived.value="";
    }
}

function changeWaivedDate (cal, date) {
	if (cal != "") {
	    cal.sel.value = date;
	}
    if (date != "") {
        document.forms[0].deferredDate.value="";
        document.forms[0].dateReceived.value="";
    }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif','img/ok2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="RecurrentReceipt" >
<input type="hidden" name="event" />
<html:hidden property="index" />
<html:hidden property="subItemIndex" />
<html:hidden property="limitProfileId" />
<html:hidden property="subProfileId" />
<html:hidden property="recurrentItemDesc" />
<html:hidden property="frequency" />
<html:hidden property="frequencyUnit" />
<html:hidden property="dueDate" />
<html:hidden property="recurrentStatus" />

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
              <td class="fieldname"><bean:message key="label.checklist.doc.desc"/></td>
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
            <%-- <tr class="even">
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
            </tr> --%><%--
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.action.party"/></td>
              <td>	<%
                    if (!((ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.STATE_PENDING_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE))) {
					%>		
					<html:select property="actionParty">
					    <integro:common-code categoryCode="REC_COVENANT_ACTION_PARTY"/>
					</html:select>
					<% } else { %> 
						<integro:common-code categoryCode="REC_COVENANT_ACTION_PARTY" entryCode="<%=aForm.getActionParty()%>" display="true" descWithCode="false"/>
					<% } %>
              </td>
            </tr>
            --%><tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.date.deferred.to"/></td>
            	<td>
                <%
                    if ((ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.STATE_PENDING_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)){
                %>
                <bean:write name="RecurrentReceiptForm" property="deferredDate"/>
                <% } else { %>
                <html:text property="deferredDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="dateDeferredCal" border="0" id="Image1" onclick="return showCalendarWithCustomHandling('deferredDate', 'dd/mm/y', changeDeferredOrReceivedDate);" onmouseover="MM_swapImage('Image21','','img/calendarb.gif',1)" />
                <html:errors property="deferredDate" />
                <% } %>
                &nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.date.received"/></td>
              <td>
                <%
                    if ((ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.STATE_PENDING_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                %>
                <bean:write name="RecurrentReceiptForm" property="dateReceived"/>
                <% } else { %>
                <html:text property="dateReceived" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="dateReceivedCal" border="0" id="Image1" onclick="return showCalendarWithCustomHandling('dateReceived', 'dd/mm/y', changeDeferredOrReceivedDate);" onmouseover="MM_swapImage('Image21','','img/calendarb.gif',1)" />
                <html:errors property="dateReceived" />
                <% } %>
                &nbsp;
              </td>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.date.waived"/></td>
              <td>
                <%
                    if ((ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.STATE_PENDING_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                %>
                <bean:write name="RecurrentReceiptForm" property="dateWaived"/>
                <% } else { %>
                    <html:text property="dateWaived" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif" name="dateWaivedCal" border="0" id="Image1" onclick="return showCalendarWithCustomHandling('dateWaived', 'dd/mm/y', changeWaivedDate);" onmouseover="MM_swapImage('Image21','','img/calendarb.gif',1)" />
                    <html:errors property="dateWaived" />
                <% } %>
                &nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
              <td>
                <%
                    if ((ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.STATE_PENDING_RECEIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                %>
                    <integro:htmltext value="<%=aForm.getRecurrentSubItemRemarks()%>"/>
                <% } else { %>
                    <html:textarea property="recurrentSubItemRemarks" rows="5" style="width:100%" onkeyup="limitTextInput(this.form.recurrentSubItemRemarks, 250, 'Remarks');"/>
                    <html:errors property="recurrentSubItemRemarks"/>
                <% } %>
              </td>
            </tr>
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
   <%
       if ((ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(aForm.getRecurrentStatus()) ||
           ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
           ICMSConstant.STATE_PENDING_RECEIVED.equals(aForm.getRecurrentStatus()) ||
           ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus())) && status.equals(ICMSConstant.STATE_ACTIVE)){
       %>
		<td colspan="2" width="100" valign="baseline" align="center">
			<a href="RecurrentReceipt.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
		</td>
       <% } else { %>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/ok2.gif',1)" onclick="updateRecurrent()" ><img src="img/ok1.gif" name="Image3" width="70" height="20" border="0" id="Image3" /></a></td>
    <td width="100" valign="baseline" align="center"><a href="RecurrentReceipt.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',0)"><img src="img/cancel1.gif" name="Image2"  border="0" id="Image2" /></a></td>
       <% } %>
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
				<a href="RecurrentReceipt.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
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
