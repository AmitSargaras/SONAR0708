<%@ page import="java.util.List,
                 java.util.ArrayList,
                 java.util.Collection,
                 org.apache.struts.util.LabelValueBean,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Calendar,
                 com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/recurrent/add_recurrent.jsp,v 1.29 2006/10/27 08:19:27 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.29 $
* Date: $Date: 2006/10/27 08:19:27 $
* Tag: $Name:  $
*/
%>
<%
    RecurrentCheckListForm aForm = (RecurrentCheckListForm)request.getAttribute("RecurrentCheckListForm");
    boolean isOneOff = false;
    boolean isMoreThanOneSubItem = false;
    if (aForm.getOneOff() != null && aForm.getOneOff().equals("true")) {
        isOneOff = true;
    }
    if (aForm.getHasMoreSubItems() != null && aForm.getHasMoreSubItems().equals("true")) {
	    isMoreThanOneSubItem = true;
    }
    String index = (String)request.getParameter("index");
    boolean isNew = true;
    if (index != null && index.trim().length() > 0) {
        isNew = false;
    }

	try {
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
	width: 150px;
}
</style>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num) {
    if (num == 0) {
	    document.forms[0].event.value="update_recurrent";
    }
    if (num == 1) {
        document.forms[0].event.value="add_recurrent";
    }
    if (num == 2) {
        document.forms[0].event.value="view_ok";
    }
	document.forms[0].submit();
}

function setDueDate(cal, date) {
	if (cal != "" && date != "") {
			cal.sel.value = date;
	}
	strDocEndDate = document.forms[0].docEndDate.value;
	frequency = document.forms[0].frequency.value;
	if (frequency != null && frequency != '') {
		frequency = parseFloat(frequency.split(' ').join(''));
	}
	else {
		frequency = 0;
	}
	frequencyUnit = document.forms[0].frequencyUnit.value;
	docEndDate = convertStrToDate(strDocEndDate);
	dueDate = new Date();
	if (strDocEndDate == null || strDocEndDate == '') {
		 document.forms[0].dueDate.value = '';
	}
	else {
		if (frequency == null || frequency == '' || frequencyUnit == null || frequencyUnit == '') {
			// dueDate = docEndDate when gracePeriod is not available
			document.forms[0].dueDate.value = strDocEndDate;
		}
		else {
			if (frequencyUnit != null && frequencyUnit != '') {
				// dueDate = docEndDate + gracePeriod
				dueDate = calculateNextDate(docEndDate, frequency, frequencyUnit);
				strDueDate = convertDateToStr(dueDate);
				document.forms[0].dueDate.value = strDueDate;
			}
		}
	}
}

var tmpFreq = "";
var tmpFreqUnit = "";
var tmpLastDocEntryDate = "";

function changeFrequency(selectedObj) {
    if(selectedObj.value == 'true') {
        tmpFreq = document.forms[0].frequency.value;
        tmpFreqUnit = document.forms[0].frequencyUnit.value;
        tmpLastDocEntryDate = document.forms[0].lastDocEntryDate.value;
        document.forms[0].frequency.value="";
        document.forms[0].frequencyUnit.value="";
        document.forms[0].lastDocEntryDate.value="";
        document.forms[0].frequency.disabled=true;
        document.forms[0].frequencyUnit.disabled=true;
        document.forms[0].lastDocEntryDateCal.disabled=true;
    } else {
        document.forms[0].frequency.disabled=false;
        document.forms[0].frequencyUnit.disabled=false;
        document.forms[0].lastDocEntryDateCal.disabled=false;
        document.forms[0].frequency.value = tmpFreq;
        document.forms[0].frequencyUnit.value = tmpFreqUnit;
        document.forms[0].lastDocEntryDate.value = tmpLastDocEntryDate;
    }
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="RecurrentCheckList" >
<html:hidden property="limitProfileId" />
<html:hidden property="subProfileId" />
<html:hidden property="index" />
<html:hidden property="hasMoreSubItems"/>
<input type="hidden" name="event" />
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.maintain.rec.doc.checklist"/> - <%=isNew?"New":"Edit"%></h3></td>
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
              <td>
                <html:text property="recurrentItemDesc" size="50" maxlength="100"/>
                <br><html:errors property="recurrentItemDesc"/>
              </td>
            </tr>
            <%-- <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
              <td>
	            <html:radio property="oneOff" value="true" disabled="<%=isMoreThanOneSubItem%>" onclick="changeFrequency(this)"/>Yes
				&nbsp;&nbsp;
				<html:radio property="oneOff" value="false" disabled="<%=isMoreThanOneSubItem%>" onclick="changeFrequency(this)"/>No
              </td>
            </tr> --%>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.frequency"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:text property="frequency" size="3" maxlength="3" disabled="<%=isOneOff%>" onchange="setDueDate('','')"/>&nbsp;&nbsp;
                <html:errors property="frequency"/>
                <html:select property="frequencyUnit" disabled="<%=isOneOff%>" onchange="setDueDate('','')">
                  <option value="" ><bean:message key="label.please.select"/></option>
                  <html:options name="frequencyValues" labelName="frequencyLabels"/>
                </html:select>&nbsp;<font color="#0000FF">* </font>
                <html:errors property="frequencyUnit"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.doc.end.date"/>&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="docEndDate" size="12" maxlength="12" readonly="true"/>
                <img src="img/calendara.gif"  name="Image32" border="0" id="Image32" onclick="return showCalendarWithCustomHandling('docEndDate', 'dd/mm/y', setDueDate);" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
                <html:errors property="docEndDate"/>
              </td>
            </tr>
            <%-- <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.grace.period"/></td>
              <td>
                <html:text property="gracePeriod" size="3" maxlength="3" onchange="setDueDate('','')"/> &nbsp;&nbsp;
                <html:errors property="gracePeriod"/>
                <html:select property="gracePeriodUnit" onchange="setDueDate('','')">
                  <option value=""><bean:message key="label.please.select"/></option>
                  <html:options name="frequencyValues" labelName="frequencyLabels"/>
                </html:select>
                <html:errors property="gracePeriodUnit"/>
              </td>
            </tr> --%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.doc.due.date"/></td>
              <td>
                <html:text property="dueDate" size="12" maxlength="12" readonly="true" /><!--
                <img src="img/calendara.gif"  name="dueDateCal" border="0" id="dueDateCal" onclick="return showCalendar('dueDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
                --><html:errors property="dueDate"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.last.doc.entry.date"/></td>
              <td><html:text property="lastDocEntryDate" size="12" maxlength="12" readonly="true"/>
                <img src="img/calendara.gif"  name="lastDocEntryDateCal" border="0" id="lastDocEntryDateCal" <%=isOneOff?"disabled":""%> onclick="return showCalendar('lastDocEntryDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
                <html:errors property="lastDocEntryDate"/>
              </td>
            </tr>
            <%-- <tr class="even">
              <td class="fieldname"><bean:message key="label.checklist.chaser.reminder.required"/></td>
              <td><html:radio property="chaserReminder" value="true"/>Yes
					&nbsp;&nbsp;
					<html:radio property="chaserReminder" value="false"/>No</td>
            </tr> --%>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
              <td>
                <html:textarea property="recurrentItemRemarks" rows="5" cols="60" onkeyup="limitTextInput(this.form.recurrentItemRemarks, 250, 'Remarks');"/>
                <html:errors property="recurrentItemRemarks"/>
                <!--</textarea>-->
              </td>
            </tr>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">
    <%  if (!isNew) {  %>
        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)" onclick="submitPage(0)" >
    <% } else { %>
        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)" onclick="submitPage(1)" >
    <% } %>
        <img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
    </td>
    <td width="100" valign="baseline" align="center"> <a href="#" onclick="submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
<%
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
