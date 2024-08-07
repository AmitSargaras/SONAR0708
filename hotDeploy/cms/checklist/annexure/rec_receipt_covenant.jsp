<!--Modified by Pratheepa for CR234 -->
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
				 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptForm,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.HashMap,
                 java.util.Collection"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recreceipt/rec_receipt_covenant.jsp,v 1.33 2006/11/12 11:41:31 nkumar Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.33 $
* Date: $Date: 2006/11/12 11:41:31 $
* Tag: $Name:  $
*/
%>
<%
    IRecurrentCheckListTrxValue checkListTrxVal = null;    
    try{
    checkListTrxVal =(IRecurrentCheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.checkListTrxVal");
    }
    catch(Exception e){
    }    
    String status = "";
    if (checkListTrxVal!=null){
	    status = checkListTrxVal.getStatus();
    }
    
    int row = 0;
    RecurrentReceiptForm aForm = (RecurrentReceiptForm)request.getAttribute("RecurrentReceiptForm");
    String itemDesc = null;
    String itemType = null;
    if(aForm!=null){
    	itemDesc = aForm.getCovenantItemDesc();
    	
    	String fee = aForm.getFee();
    	String riskTrigger = aForm.getRiskTrigger();
    	if(fee.equalsIgnoreCase("Yes"))
    		itemType = "Fee";
    	else if(riskTrigger.equalsIgnoreCase("Yes"))
    		itemType = "RiskTrigger";
    	else 
    		itemType = "Covenant";
    	System.out.println("itemType:" +itemType);
    }	
    Boolean showSubItemDetail = (Boolean)request.getAttribute("showSubItemDetail");
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
     months = new Array();
     months['Jan'] = 0;
     months['Feb'] = 1;
     months['Mar'] = 2;
     months['Apr'] = 3;
     months['May'] = 4;
     months['Jun'] = 5;
     months['Jul'] = 6;
     months['Aug'] = 7;
     months['Sep'] = 8;
     months['Oct'] = 9;
     months['Nov'] = 10;
     months['Dec'] = 11;
     var isVerified_flag = false;

/*
function limitText(limitField, limitNum) {
	if (limitField.value.length > limitNum) {
        limitField.value = limitField.value.substring(0, limitNum);
        alert('The remarks field is limited to '+limitNum+' characters.');
	}
}
*/

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

function updateCovenant() {
   clearErrorMsg();
   var isSumiting = true;
   if(!isCheckDateValid()){
		var checkDateString = document.forms[0].dateChecked.value;
	    if (checkDateString != null && checkDateString != ''){
		     document.all['warning90'].innerHTML = '<font color="#FF0000" size="1"><br>Checked date should be earlier than current date.</font>';
	    }
		else{
			 document.all['warning90'].innerHTML = '<font color="#FF0000" size="1"><br>This is a mandatory field.</font>';
	    }
        isSumiting = false;
	}

    if (!isWaivedDateValid()){
   	     document.all['warning100'].innerHTML = '<font color="#FF0000" size="1"><br>Waived date should be earlier than current date.</font>';
          isSumiting = false;
    }

   if(isSumiting){
    var limit = document.forms[0].isVerified.length;
	for (i=0;i<limit;i++) {
		if(document.forms[0].isVerified[i].checked == true){
			temp = document.forms[0].isVerified[i].value;
			document.forms[0].isComplied.value =  temp;
		}
	}
	document.forms[0].event.value="update_covenant_item";
	document.forms[0].submit();
    }
}

function isCheckDateValid(){
    var now = new Date();
    now = now.getTime(); //NN3
    var pastDate = true;
    var checkDateString = document.forms[0].dateChecked.value;

    if( checkDateString != null && checkDateString != ''){
    var dateToCheck  = new Date(checkDateString.substring(7,11), months[checkDateString.substring(3,6)], checkDateString.substring(0,2));
    var checkDate = dateToCheck.getTime();
    pastDate = (now >= checkDate);
    }
    else{
	    if (isVerified_flag == true){
	    pastDate = true;
       }
    }
    return pastDate;
  }

  function isWaivedDateValid(){
    var now = new Date();
    now = now.getTime(); //NN3
    var pastDate = true;
    var WaivedDateString = document.forms[0].dateWaived.value;

    if( WaivedDateString != null && WaivedDateString != ''){
    var dateToCheck  = new Date(WaivedDateString.substring(7,11), months[WaivedDateString.substring(3,6)], WaivedDateString.substring(0,2));
    var WaivedDate = dateToCheck.getTime();
    pastDate = (now >= WaivedDate);
    }
    return pastDate;
  }

function showCalendar1(a,b) {
    clearErrorMsg();
	var limit = document.forms[0].isVerified.length;
	for (i=0;i<limit;i++) {
		if(document.forms[0].isVerified[i].checked == true){
			temp = document.forms[0].isVerified[i].value;
		}
	}
	//if(temp=="true"){
	doClearDeferredAndWaivedDate() ;
		return showCalendar(a,b);
	//}
}

function doSomething(){
    clearErrorMsg();
	document.forms[0].dateChecked.value="";
	isVerified_flag = false;
}

// needed to clear fields
function doClearDeferredAndWaivedDate() {
    clearErrorMsg();
	document.forms[0].dateWaived.value="";
	document.forms[0].deferredDate.value="";
	isVerified_flag = true;
}


//cr26
function changeDeferredOrReceivedDate (cal, date) {
clearErrorMsg();
	if (cal != "") {
	    cal.sel.value = date;
	}

    if (date != "") {
        document.forms[0].dateWaived.value="";
        document.forms[0].dateChecked.value="";//cr26
    }
}

function changeWaivedDate (cal, date) {
clearErrorMsg();
  	if (cal != "") {
	    cal.sel.value = date;
	}
    if (date != "") {
        document.forms[0].deferredDate.value="";
        document.forms[0].dateChecked.value="";//cr26
    }
}

function clearErrorMsg(){
  document.all['warning90'].innerHTML = '';
  document.all['warning100'].innerHTML = '';
}

function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
}
//-->
</script>

<!-- InstanceEndEditable -->
</head>
<% boolean temp_isComplied = false;
        temp_isComplied = aForm.getIsVerified();
        if(temp_isComplied){ %>
      <script type="text/javascript" >isVerified_flag = true;</script>
        <% }else{ %>
      <script type="text/javascript" >isVerified_flag = false;</script>
 <% } %>
<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif','img/ok2.gif')">
<html:form action="RecurrentReceipt" >
<input type="hidden" name="event" />
<html:hidden property="index" />
<html:hidden property="limitProfileId" />
<html:hidden property="subProfileId" />
<html:hidden property="covenantItemDesc" />
<html:hidden property="covenantItemRemarks" />
<%-- cr 26 --%>
<html:hidden property="subItemIndex" />
<html:hidden property="frequency" />
<html:hidden property="frequencyUnit" />
<html:hidden property="dueDate" />
<html:hidden property="recurrentStatus" />
<input type="hidden" name="isComplied" />

<%	//bernard - added if condition for CMS-1490
	if (showSubItemDetail==null || (showSubItemDetail!=null && showSubItemDetail==Boolean.TRUE))
	{
%>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.update.cov.checklist"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.covenant.condition"/></td>
				<td><bean:write name="RecurrentReceiptForm" property="covenantItemDesc" />&nbsp;</td>
            </tr>
            <%-- cr 26 --%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="oneOff" />&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.risk.trigger"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="riskTrigger" />&nbsp;</td>
            </tr>
            <tr class="even">
	       <td class="fieldname"><bean:message key="label.checklist.fee"/></td>
	       <td><bean:write name="RecurrentReceiptForm" property="fee" />&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.frequency"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="frequency" />&nbsp;<bean:write name="RecurrentReceiptForm" property="frequencyUnit" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.covenant.end.date"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="docEndDate" />&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.grace.period"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="gracePeriod" />&nbsp;<bean:write name="RecurrentReceiptForm" property="gracePeriodUnit" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.due.date"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="dueDate" />&nbsp;
              <html:hidden property="dueDate"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.status"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="recurrentStatus" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.complied"/></td>
              <td>
               <%
                    if ((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                    boolean temp = false;
                    temp = aForm.getIsVerified();
                    String isVerified = "No";
                    if(temp){
                        isVerified = "Yes";
                    }
                %>
			    <%= isVerified %>
                <html:hidden name="RecurrentReceiptForm" property="isVerified"/>
                <% } else {  %>
				<html:radio property="isVerified" value="true" onclick="doClearDeferredAndWaivedDate(); setDateReceiveMandatory();" />
                Yes
                <html:radio property="isVerified" value="false" onclick="doSomething(); setDateReceiveMandatory();" />
                No
                <% } %>&nbsp;
                </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.action.party"/></td>
              <td>	<%
                    if (!((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE))) {
					%>		
					<html:select property="actionParty">
					    <integro:common-code categoryCode="REC_COVENANT_ACTION_PARTY"/>
					</html:select>
					<% } else 	{ %>
						<integro:common-code categoryCode="REC_COVENANT_ACTION_PARTY" entryCode="<%=aForm.getActionParty()%>" display="true" descWithCode="false"/>
					<% } %>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.date.received"/>
                  <span id="dateReceivedID"><bean:message key="label.mandatory" /></span>
              </td>
              <td>
                <%
                    if ((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                %>
                <bean:write name="RecurrentReceiptForm" property="dateChecked"/>
                <% } else { %>
                <html:text property="dateChecked" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="dateCheckedCal" border="0" id="Image1" onclick="return showCalendar1('dateChecked', 'dd/mm/y');" onmouseover="MM_swapImage('Image21','','img/calendarb.gif',1)" /><span id="warning90"></span>
                <html:errors property="dateChecked" />
                <% } %>
                &nbsp;
                </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.deferred.date"/></td>
            	<td>
                <%
                    if ((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
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
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.date.waived"/></td>
              <td>
                <%
                    if ((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                %>
                <bean:write name="RecurrentReceiptForm" property="dateWaived"/>
                <% } else { %>
                    <html:text property="dateWaived" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif" name="dateWaivedCal" border="0" id="Image1" onclick="return showCalendarWithCustomHandling('dateWaived', 'dd/mm/y', changeWaivedDate);" onmouseover="MM_swapImage('Image21','','img/calendarb.gif',1)" />
                    <span id="warning100"></span><html:errors property="dateWaived" />
                <% } %>
                &nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
              <td>
                <%
                    if ((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
                            ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
                %>
                    <integro:htmltext value="<%=aForm.getRecurrentSubItemRemarks()%>"/>&nbsp;
                <% } else { %>
                    <html:textarea property="recurrentSubItemRemarks" rows="5" style="width:100%" onkeyup="limitTextInput(this.form.recurrentSubItemRemarks,2000, 'Remarks');" />
                    <html:errors property="recurrentSubItemRemarks"/>
                <% } %>
              </td>
            </tr>

          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
   <%  // cr 26
       if ((ICMSConstant.CONVENANT_STATE_CHECKED.equals(aForm.getRecurrentStatus()) ||
           ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(aForm.getRecurrentStatus()) ||
           ICMSConstant.CONVENANT_STATE_PENDING_CHECKED.equals(aForm.getRecurrentStatus()) ||
           ICMSConstant.RECURRENT_ITEM_STATE_PENDING_WAIVER.equals(aForm.getRecurrentStatus()))&& status.equals(ICMSConstant.STATE_ACTIVE)) {
       %>
		<td colspan="2" width="100" valign="baseline" align="center">
			<a href="RecurrentReceipt.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
		</td>
       <% } else { %>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/ok2.gif',1)" onclick="updateCovenant()" ><img src="img/ok1.gif" name="Image3" border="0" id="Image3" /></a></td>
    <td width="100" valign="baseline" align="center"><a href="RecurrentReceipt.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',0)"><img src="img/cancel1.gif" name="Image2"  border="0" id="Image2" /></a></td>
       <% } %>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>

<%	} //bernard - end of if showSubItemDetail condition (CMS-1490)
// cr 26
%>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.covenant.receipt.history"/></h3></td>
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
			    <td width="23%"><bean:message key="label.checklist.covenant.end.date"/></td>
			    <td width="15%"><bean:message key="label.checklist.due.date"/></td>
			    <td width="10%"><bean:message key="label.checklist.complied"/></td>
			    <td width="10%"><bean:message key="label.checklist.date.received"/></td>
			    <td width="10%"><bean:message key="label.checklist.date.waived"/></td>
				<td width="10%"><bean:message key="label.checklist.remarks"/></td>
            </tr>
          </thead>
          <tbody>
    <logic:present name="itemhistory"  scope="request" >
    <logic:iterate id="OB" name="itemhistory"  type="com.integrosys.cms.app.recurrent.bus.IConvenantSubItem"  scope="request" >
<%
	  if (OB.getCheckedDate() != null || OB.getWaivedDate()!=null) {
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
              	<% // CMS-1829 
              		if (OB.getCheckedDate() != null) { 
						if(OB.getIsVerifiedInd()){			%>
							Yes&nbsp;
              	<%		}else{			%>
              	  			No&nbsp;
              	<% 		}
              		} else { %> - <% } %>
              </td>
              <td>
              <% if (OB.getCheckedDate() != null) { %>
                <integro:date object="<%=OB.getCheckedDate()%>"/>&nbsp;
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
              <td colspan="12"><bean:message key="label.error.no.history"/></td>
            </tr>
<%
		}
%>
</logic:present>
<logic:notPresent name="itemhistory" >
            <tr class="odd">
              <td colspan="8"><bean:message key="label.error.no.history"/></td>
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
    	  <td colspan="8">&nbsp;</td>
    	</tr>
    	<tr>
			<td colspan="8" valign="baseline" align="center">
				<a href="RecurrentReceipt.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',0)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a>
			</td>
		</tr>
<%	}
%>
    <tr>
      <td colspan="8">&nbsp;</td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
<script>
    function setDateReceiveMandatory(){
        var isComplied = isVerified_flag;

        if ( ((isComplied != null && isComplied != "") && isComplied == true)){
            setVisibility("dateReceivedID","visible");
       }else{
            setVisibility("dateReceivedID","hidden");
        }
    }
    setDateReceiveMandatory();
</script>
</body>
<!-- InstanceEnd --></html>

