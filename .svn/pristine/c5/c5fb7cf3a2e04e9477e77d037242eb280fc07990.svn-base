<!--Modified by Pratheepa for CR234-->
<%@ page import="java.util.List,
                 java.util.ArrayList,
                 java.util.HashMap,
                 java.util.Collection,
                 org.apache.struts.util.LabelValueBean,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Calendar,
                 com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

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
	
	Collection valuesCollection = (Collection) request.getAttribute("covenantValues");
	Collection labelsCollection = (Collection) request.getAttribute("covenantLabels");
	
	String[] valuesObject = new String[1];
	String[] labelsObject = new String[1];
	HashMap covenantOptions = new HashMap();
	String s1="";
	String s2="";
	int objectCount=0;
	

	if (valuesCollection!=null && labelsCollection!=null) {	
		valuesObject = (String[]) valuesCollection.toArray(new String[0]);
		labelsObject = (String[]) labelsCollection.toArray(new String[0]);
		objectCount = valuesObject.length;
	};
	int rowIdx=0;
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
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>


<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--

function checkFeeTrigger()
{
	
	
	for (i=0;i<document.forms[0].riskTrigger.length;i++){
		if (document.forms[0].riskTrigger[i].checked){
			triggerValue  = document.forms[0].riskTrigger [i].value;
		}
	}
	
	
	for (i=0;i<document.forms[0].fee.length;i++){
		if (document.forms[0].fee[i].checked){
			feeValue  = document.forms[0].fee [i].value;
		}
	}
	
	if(feeValue == triggerValue ){
		if(feeValue=='true'){
			alert("Fee and Risk Trigger can not be 'Yes' at the same time ");
			return false;
		}	
	}
	return true;
}
	
function submitPage() {
	if(checkFeeTrigger()){
		document.forms[0].event.value="update_covenant";
		document.forms[0].submit();
	}
}

function setDueDate(cal, date) {
	if (cal != "" && date != "") {
			cal.sel.value = date;
	}
	strDocEndDate = document.forms[0].docEndDate.value;
	gracePeriod = document.forms[0].gracePeriod.value;
	
	if(!isInt(gracePeriod))
	{
	alert("Grace Period should be a Integer!");
	document.forms[0].dueDate.value = "";
	return;
	}
	
	if (gracePeriod != null && gracePeriod != '') {
		gracePeriod = parseInt(gracePeriod.split(' ').join(''));
	}
	else {
		gracePeriod = 0;
	}
	gracePeriodUnit = document.forms[0].gracePeriodUnit.value;

	docEndDate = convertStrToDate(strDocEndDate);
	dueDate = new Date();
	if (strDocEndDate == null || strDocEndDate == '') {
		 document.forms[0].dueDate.value = '';
	}
	else {
		if (gracePeriod == null || gracePeriod == '' || gracePeriodUnit == null || gracePeriodUnit == '') {
			// dueDate = docEndDate when gracePeriod is not available
			document.forms[0].dueDate.value = strDocEndDate;
		}
		else {
			if (gracePeriodUnit != null && gracePeriodUnit != '') {
				// dueDate = docEndDate + gracePeriod
				dueDate = calculateNextDate(docEndDate, gracePeriod, gracePeriodUnit);
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

	function chooseFirstCovenant() 
	{
		document.forms[0].covenantSelect.disabled = false;
		document.forms[0].covenantItemDesc.disabled = true;
	}
	
	function chooseSecondCovenant() 
	{
		document.forms[0].covenantSelect.disabled = true;
		document.forms[0].covenantItemDesc.disabled = false;
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="RecurrentCheckList" >
<html:hidden property="index" />

<html:hidden property="limitProfileId" />
<html:hidden property="subProfileId" />
<input type="hidden" name="event" />
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.maintain.cov.condition.checklist.edit"/></h3></td>
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
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.covenant.condition"/>&nbsp;<font color="#0000FF">* </font></td>
<!--              <td> <html:text property="covenantItemDesc" size="50" maxlength="100"/>
                <br><html:errors property="covenantItemDesc"/>
              </td>-->
			  <%
			    String selectRadio1="";
				String selectRadio2="";
				String selectDisabled1="true";
				String selectDisabled2="true";
				if (aForm.getIsParameterizedDesc().equals("true")) selectDisabled1="false";
				else selectDisabled2="false";
			  %>
                <td><html:radio property="isParameterizedDesc" value="true" onclick="javascript:chooseFirstCovenant();"/>
					<% if (selectDisabled1.equals("true")) { %>
						<html:select property="covenantSelect" disabled="true">
							<html:option value=""><bean:message key="label.please.select"/></html:option>
							<%for (int i=0; i<objectCount; i++) {	
								s1=valuesObject[i]; s2=labelsObject[i];
							%>
							<html:option value="<%=s1%>"><%=s2%></html:option>
							<% } %>
						</html:select></br>
					<% } else { %>
						<html:select property="covenantSelect" disabled="false">
							<html:option value=""><bean:message key="label.please.select"/></html:option>
							<%for (int i=0; i<objectCount; i++) {	
								s1=valuesObject[i]; s2=labelsObject[i];
							%>
							<html:option value="<%=s1%>"><%=s2%></html:option>
							<% } %>
						</html:select></br>
					<% } %>
					<html:radio property="isParameterizedDesc" value="false" onclick="javascript:chooseSecondCovenant();"/>
					<% if (selectDisabled1.equals("true")) { %>
						<html:text disabled="false" property="covenantItemDesc" size="50" maxlength="100">
							<bean:write name="RecurrentCheckListForm" property="covenantItemDesc"/>
						</html:text><br/>
					<% } else { %>	
						<html:text disabled="true" property="covenantItemDesc" size="50" maxlength="100" value=""/>
					<% } %>
					<html:errors property="covenantItemDesc"/><br>
                </td>
            </tr>
            <%-- cr 26 --%>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
              <td>
	            <html:radio property="oneOff" value="true" disabled="<%=isMoreThanOneSubItem%>" onclick="changeFrequency(this)"/>Yes
				&nbsp;&nbsp;
				<html:radio property="oneOff" value="false" disabled="<%=isMoreThanOneSubItem%>" onclick="changeFrequency(this)"/>No
              </td>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.risk.trigger"/></td>
              <td>
	            <html:radio property="riskTrigger" value="true" />Yes
				&nbsp;&nbsp;
				<html:radio property="riskTrigger" value="false" />No
              </td>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.fee"/></td>
              <td>
	            <html:radio property="fee" value="true" />Yes
				&nbsp;&nbsp;
				<html:radio property="fee" value="false" />No
              </td>
            </tr>                         
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.frequency"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:text property="frequency" size="3" maxlength="3" disabled="<%=isOneOff%>"/>&nbsp;&nbsp;
                <html:errors property="frequency"/>
                <html:select property="frequencyUnit" disabled="<%=isOneOff%>">
                  <option value="" ><bean:message key="label.please.select"/></option>
                  <html:options name="frequencyValues" labelName="frequencyLabels"/>
                </html:select>&nbsp;<font color="#0000FF">* </font>
                <html:errors property="frequencyUnit"/>
              </td>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.trigger.due.date"/></td>
              <td>
                <html:text property="dueDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="dueDateCal" border="0" id="dueDateCal" onclick="return showCalendar('dueDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
                <html:errors property="dueDate"/>
              </td>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.trigger.end.date"/>&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="docEndDate" size="12" maxlength="12" readonly="true"/>
                <img src="img/calendara.gif"  name="Image32" border="0" id="Image32" onclick="return showCalendarWithCustomHandling('docEndDate', 'dd/mm/y', setDueDate);" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
                <html:errors property="docEndDate"/>
              </td>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
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
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.last.trigger.entry.date"/></td>
              <td><bean:write name="RecurrentCheckListForm" property="lastDocEntryDate" />
              </td><html:hidden property="lastDocEntryDate"/>
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
              <td><html:textarea property="covenantItemRemarks" rows="4" cols="55" onkeyup="limitTextInput(this.form.covenantItemRemarks, 2000, 'Remarks');"/>
                <html:errors property="covenantItemRemarks"/>
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
                        <td width="100" valign="baseline" align="center"> <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)" onclick="submitPage()" ><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        </td>
                        <td width="100" valign="baseline" align="center"> <a href="RecurrentCheckList.do?event=view_ok" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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
