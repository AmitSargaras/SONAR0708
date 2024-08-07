<!--Modified for CR234-->
<%@ page import="com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.checklist.recurrent.RecurrentCheckListForm,
                 com.integrosys.cms.ui.common.FrequencyList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
	IConvenant stageOb = (IConvenant)request.getAttribute("stagingOb");
	IConvenant ob = (IConvenant)request.getAttribute("actualOb");
    RecurrentCheckListForm aForm = (RecurrentCheckListForm)request.getAttribute("RecurrentCheckListForm");
    System.out.println("doc end date: " + aForm.getDocEndDate());
    System.out.println("remarks:" +aForm.getRemarks());
   // System.out.println("remarks1:" +stageOb.getRemarks());
    FrequencyList freqList = FrequencyList.getInstance();

%>



<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false"--> 
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
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body >
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.maintain.cov.condition.checklist.process.view"/></h3></td>
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
            <tr class="even"> 
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"description")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.covenant.condition"/>&nbsp;<font color="#00AAFF">* </font></td>
			    <logic:equal name="RecurrentCheckListForm" property="isParameterizedDesc" scope="request" value="false">
					<td><bean:write name="RecurrentCheckListForm" property="covenantItemDesc" />&nbsp;</td>
				</logic:equal>
			    <logic:equal name="RecurrentCheckListForm" property="isParameterizedDesc" scope="request" value="true">
					<td><integro:common-code categoryCode="COVENANT_CONDITION" entryCode="<%=aForm.getCovenantSelect()%>" display="true" descWithCode="false"/></td>
				</logic:equal>
            </tr>
            <%-- cr 26 --%>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"isOneOffInd")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.one.off"/></td>
			    <logic:equal name="RecurrentCheckListForm" property="oneOff" scope="request" value="true">
				    <td>&nbsp;Yes</td>
				</logic:equal>
				<logic:equal name="RecurrentCheckListForm" property="oneOff" scope="request" value="false">
					<td>&nbsp;No</td>
				</logic:equal>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"riskTrigger")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.risk.trigger"/></td>
			    <logic:equal name="RecurrentCheckListForm" property="riskTrigger" scope="request" value="true">
				    <td>&nbsp;Yes</td>
				</logic:equal>
				<logic:equal name="RecurrentCheckListForm" property="riskTrigger" scope="request" value="false">
					<td>&nbsp;No</td>
				</logic:equal>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"fee")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.fee"/></td>
			    <logic:equal name="RecurrentCheckListForm" property="fee" scope="request" value="true">
				    <td>&nbsp;Yes</td>
				</logic:equal>
				<logic:equal name="RecurrentCheckListForm" property="fee" scope="request" value="false">
					<td>&nbsp;No</td>
				</logic:equal>
            </tr>
            <tr class="odd">
            <%if (stageOb != null && ob == null && stageOb.getFrequency()==Integer.MIN_VALUE && (stageOb.getFrequencyUnit() == null || stageOb.getFrequencyUnit().equals(""))) {
            %>
              <td class="<%="fieldname"%>">
				<bean:message key="label.checklist.frequency"/>&nbsp;<font color="#00AAFF">* </font></td>
            <%} else {
                String tdClass = CompareOBUtil.compOB(stageOb,ob,"frequency")? "fieldname":"fieldnamediff";
	              if (tdClass.equals("fieldname")) {
		              tdClass = CompareOBUtil.compOB(stageOb,ob,"frequencyUnit")? "fieldname":"fieldnamediff";
	              }
            %>
              <td class="<%=tdClass%>"><bean:message key="label.checklist.frequency"/>&nbsp;<font color="#00AAFF">* </font></td>
	          <%} %>
              <td><bean:write name="RecurrentCheckListForm" property="frequency" />&nbsp;
                  <integro:empty-if-null value="<%=freqList.getFrequencyValue(aForm.getFrequencyUnit())%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
             <%if(stageOb!=null) { %>
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"initialDueDate")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.trigger.due.date"/></td>
              <%}else{%>
              <td class="fieldname"><bean:message key="label.checklist.trigger.due.date"/></td>
              <%}%>
              <td><bean:write name="RecurrentCheckListForm" property="dueDate" />&nbsp;</td>
            </tr>
            <tr class="odd">
             <%if(stageOb!=null) { %>
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"initialDocEndDate")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.trigger.end.date"/>&nbsp;<font color="#00AAFF">* </font></td>
              <%}else{%>
              <td class="fieldname"><bean:message key="label.checklist.trigger.end.date"/></td>
              <%}%>
              <td><bean:write name="RecurrentCheckListForm" property="docEndDate" scope="request"  />&nbsp;</td>
            </tr>
            <tr class="even">
            <%if (stageOb != null && ob == null && stageOb.getGracePeriod()==Integer.MIN_VALUE && (stageOb.getGracePeriodUnit() == null || stageOb.getGracePeriodUnit().equals(""))) {
            %>
              <td class="fieldname"><bean:message key="label.checklist.grace.period"/></td>
            <%} else {
                String tdClass = CompareOBUtil.compOB(stageOb,ob,"gracePeriod")? "fieldname":"fieldnamediff";
	              if (tdClass.equals("fieldname")) {
		              tdClass = CompareOBUtil.compOB(stageOb,ob,"gracePeriodUnit")? "fieldname":"fieldnamediff";
	              }
            %>
              <td class="<%=tdClass%>"><bean:message key="label.checklist.grace.period"/></td>
	          <%} %>
              <td><bean:write name="RecurrentCheckListForm" property="gracePeriod" />&nbsp;
                  <integro:empty-if-null value="<%=freqList.getFrequencyValue(aForm.getGracePeriodUnit())%>"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"lastDocEntryDate")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.last.trigger.entry.date"/></td>
              <td><bean:write name="RecurrentCheckListForm" property="lastDocEntryDate"/>&nbsp;</td>
            </tr>
<%--            <tr class="even">
              <td class="< %=CompareOBUtil.compOB(stageOb,ob,"chaseReminderInd")? "fieldname":"fieldnamediff"% >">Chaser / Reminder</td>
						< logic :equal name="RecurrentCheckListForm" property="chaserReminder" scope="request" value="true">
							<td>Yes&nbsp;</td>
						</ logic :equal>
						< logic :equal name="RecurrentCheckListForm" property="chaserReminder" scope="request" value="false">
							<td>No&nbsp;</td>
						</ logic :equal>
            </tr>
--%>			<%-- cr 26 --%>
           <tr class="odd"> 
           		  
	                 <td class="<%=CompareOBUtil.compOB(stageOb,ob,"remarks")? "fieldname":"fieldnamediff"%>">
						<bean:message key="label.checklist.remarks"/></td>
	                 <!-- <td><bean:write name="RecurrentCheckListForm" property="remarks" />&nbsp;
	                
             	         <integro:empty-if-null value="<%=aForm.getRemarks()%>"/>&nbsp;</td> -->
             	         <%if(stageOb!=null){%>
             	        <td> <integro:empty-if-null value="<%=stageOb.getRemarks()%>"/>&nbsp;</td>
             	        <%}else{%>
             	        <td><bean:write name="RecurrentCheckListForm" property="remarks" />&nbsp;
             	         <integro:empty-if-null value="<%=aForm.getRemarks()%>"/>&nbsp;</td>
             	         <%}%>
	                               
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
    <td width="100" valign="baseline" align="center"> <a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a> 
    </td>
  </tr>
  <tr> 
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
