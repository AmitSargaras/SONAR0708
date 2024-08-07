<%@ page import="com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.bus.IItem,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
				 com.integrosys.cms.ui.common.CommonCodeList"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	try {
	IRecurrentCheckListItem stageOb = (IRecurrentCheckListItem)request.getAttribute("stagingOb");
	IRecurrentCheckListItem ob = (IRecurrentCheckListItem)request.getAttribute("actualOb");
	IRecurrentCheckListSubItem subItem = (IRecurrentCheckListSubItem)request.getAttribute("actualSubItem");
	IRecurrentCheckListSubItem stageSubItem = (IRecurrentCheckListSubItem)request.getAttribute("stagingSubItem");
	IItem item = null;
	if(ob!=null){
		item = ob.getItem();
	}
	boolean isDP=false;
	if("DP".equals(stageOb.getDocType())){
		isDP=true;
	}
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
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" --> 
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <%if(isDP){ %>
       <td><h3>Process Recurrent DP Receipt</h3></td>
    <%}else{ %>
      <td><h3><bean:message key="title.rec.doc.receipt.process"/></h3></td>
     <%} %>
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
              <%if(stageOb!=null) { %>
              <td class="<%=CompareOBUtil.compOB(stageOb.getItem(),item,"itemDesc")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.doc.description"/></td>
              <% }else{ %>
              <td class="fieldname"><bean:message key="label.checklist.doc.description"/></td>
              <% } %>
              <td><bean:write name="RecurrentReceiptForm" property="recurrentItemDesc" />&nbsp;</td>
            </tr>
            <%-- <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.one.off"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="oneOff"/>&nbsp;</td>
            </tr> --%>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"frequency")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.frequency"/></td>
              <td>
                <%if(stageOb.getFrequency()!=Integer.MIN_VALUE) { 
                %>
                <bean:write name="RecurrentReceiptForm" property="frequency" />&nbsp;<bean:write name="RecurrentReceiptForm" property="frequencyUnit" />
                <%}%>&nbsp;
              </td>
            </tr>
            <%if(!isDP){ %>
            <tr class="even">
              <%if(stageOb!=null) { %>
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"docEndDate")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.doc.end.date"/></td>
              <%}else{%>
              <td class="fieldname"><bean:message key="label.checklist.doc.end.date"/></td>
              <%}%>
              <td><bean:write name="RecurrentReceiptForm" property="docEndDate" />&nbsp;</td>
            </tr>
            <%} %>
            <%-- <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"gracePeriod")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.grace.period"/></td>
              <td>
                <%if(stageOb.getGracePeriod()!=Integer.MIN_VALUE) {
                %>
                <bean:write name="RecurrentReceiptForm" property="gracePeriod" />&nbsp;<bean:write name="RecurrentReceiptForm" property="gracePeriodUnit" />
                <%}%>&nbsp;
              </td>
            </tr> --%>
            <tr class="odd">
              <%if(stageOb!=null) { %>
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"dueDate")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.due.date"/></td>
              <%}else{%>
              <td class="fieldname"><bean:message key="label.checklist.due.date"/></td>
              <%}%>
              <td><bean:write name="RecurrentReceiptForm" property="dueDate" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"status")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.status"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="recurrentStatus" />&nbsp;</td>
            </tr>
            <%-- <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"chaseReminderInd")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.chaser.reminder.required"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="chaserReminder" />&nbsp;</td>
            </tr> --%>
            <%-- <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"actionParty")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.action.party"/></td>
				<% 	CommonCodeList commonCode = CommonCodeList.getInstance("REC_COVENANT_ACTION_PARTY");
		
					String[] objectValue = (String[]) commonCode.getCommonCodeValues().toArray(new String[0]);
					String[] objectLabel = (String[]) commonCode.getCommonCodeLabels().toArray(new String[0]);
		
					int chosen=-1;
					for (int i=0; i<objectValue.length; i++) {
						if (objectValue[i].equals(stageSubItem.getActionParty())) {
							chosen=i;
						}
					}
					String actionPartyLabel="";
					if (chosen>=0) actionPartyLabel=objectLabel[chosen];
					%>
              <td><%=actionPartyLabel%>&nbsp;</td>
            </tr> --%>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"deferredDate")? "fieldname":"fieldnamediff"%>">
				<bean:message key="label.checklist.deferred.date"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="deferredDate" />&nbsp;</td>
            </tr>
            <%if(!isDP){ %>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"receivedDate")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.date.received"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="dateReceived" />&nbsp;</td>
            </tr>
            <%}%>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"waivedDate")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.date.waived"/></td>
              <td><bean:write name="RecurrentReceiptForm" property="dateWaived" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageSubItem,subItem,"remarks")? "fieldname":"fieldnamediff"%>"><bean:message key="label.checklist.remarks"/></td>
              <td><integro:htmltext value="<%=stageSubItem.getRemarks()%>"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="160" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',0)"><img src="img/return1.gif" name="Image2"  border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
<%
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
