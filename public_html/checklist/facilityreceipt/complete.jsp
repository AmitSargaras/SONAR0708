<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	FacilityReceiptForm form = (FacilityReceiptForm)request.getAttribute("FacilityReceiptForm");
    String status = (String) request.getAttribute("status");
    if(status == null) {
        status = request.getParameter("status");
    }
    DefaultLogger.debug("\\secreceipt\\complete.jsp", status + "|");

    String monitorType = (String) request.getAttribute("monitorType");
    String lableDocDate = "Doc Expiry Date";
    String isPolicy = request.getParameter("isPolicy");
    if (isPolicy == null || isPolicy.trim().length() == 0) {
        isPolicy = (monitorType != null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
    }
    if ((isPolicy != null && isPolicy.equals("false"))
            || (monitorType != null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))) {
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
    }
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.allCreditApproverList");
    if(allCreditApproverList!=null){
    	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
    }
%>




<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptForm"%>
<%@page import="java.util.List"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
<script language="JavaScript" src="js/validation.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>

<Script language="JavaScript" type="text/JavaScript">
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

function saveForm(currentStatus) {
	if(document.forms["FacilityReceiptForm"].isPolicy.value == "true"){
		if(document.forms["FacilityReceiptForm"].docEffDate.value != document.forms["FacilityReceiptForm"].docOldEffDate.value){
			document.forms["FacilityReceiptForm"].isEffDateChanged.value="true";
		}
	}
	document.forms["FacilityReceiptForm"].event.value="save_complete";
    document.forms["FacilityReceiptForm"].status.value=currentStatus;
	document.forms["FacilityReceiptForm"].submit();
}

function cancelForm() {
	document.forms["FacilityReceiptForm"].event.value="view_ok";
	document.forms["FacilityReceiptForm"].submit();
}

function verifyDocEffDateChanged() {
	if(document.forms["FacilityReceiptForm"].isPolicy.value == "true"){
		if(document.forms["FacilityReceiptForm"].docEffDate.value != document.forms["FacilityReceiptForm"].docOldEffDate.value){
			document.forms["FacilityReceiptForm"].isEffDateChanged.value="true";
		}
	}
}

//-->
</Script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<html:form action="FacilityReceipt" >
<html:hidden property="event" />
<input type =hidden name="status" />


<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />
<html:hidden property="receivedDate" />

<!--to keep fields value when error come -->
<html:hidden property="docCode" />
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<!--<html:hidden property="identifyDate" /> -->

<html:hidden property="docOldEffDate" />
<html:hidden property="isEffDateChanged" />
<html:hidden property="isPolicy" value="<%=isPolicy%>"/>
<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Facility Doc Receipt </h3></td>
    </tr>
    <tr>
      <td> <h3> Doc Description - Completed</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
           <td>
    <%  if(status==null || status.equals("AWAITING")|| status.equals("REMINDED") || status.equals("DEFERRED") ) { %>
        <html:hidden property="awaiting" value="true" />
        <!--start table for  to  document  item Details-->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
              <thead>
              </thead>
              <tbody>
                <tr class="odd">
                  <td class="fieldname">Code</td>
                  <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docCode" /></td>
                </tr>
<!--                <tr class="even">-->
<!--                  <td class="fieldname">Doc No</td>-->
<!--                  <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docNo" /></td>-->
<!--                </tr>-->
                <tr class="odd">
                  <td class="fieldname">Description</td>
                  <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docDesc" /></td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Doc Date</td>
                  <td><html:text property="docDate" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="docDate" />
                  </td>
                </tr>
 <%--
                <% if(isPolicy!=null && isPolicy.equals("true")){	%>
                <tr class="even">
                  <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
                  <td><html:text property="docEffDate" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docEffDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="docEffDate" />
                  </td>
                </tr>
                <% } %>
--%>
                <tr class="odd">
                  <td class="fieldname"><%=lableDocDate%></td>
                  <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="docExpDate" />
                  </td>
                </tr>
 <%--
                <tr class="even">
                  <td class="fieldname">Identify Date</td>
                  <td><html:text property="identifyDate" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('identifyDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                    <html:errors property="identifyDate" />
                  </td>
                </tr>
--%>			
				<tr class="even">
                  <td class="fieldname">Date Completed<font color="RED">*</font></td>
                  <td><html:text property="completedDate" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('completedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="docExpDate" />
                  </td>
                </tr>
<!--                <tr class="odd">-->
<!--                  <td class="fieldname">Action Party </td>-->
<!--                  <td><html:select property="actionParty">-->
<!--                        <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                      </html:select>-->
<!--                      <html:errors property="actionParty" />-->
<!--                    </td>-->
<!--                </tr>-->
<%-- start here for cr-17 
                <tr class="even">
                   <td class="fieldname" >Shared</td>
                   <td >
                        <html:radio property="shared" value="true"  />Yes
                        <html:radio property="shared" value="false" />No
                        <html:errors property="shared" />
                   </td>
                   </tr>
--%>
                 </tbody>
          </table>
          <%-- <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp" />
          <!--Start table for Narration  -->
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                  <tbody>
                  <tr class="even">
                      <td class="fieldname">Narration</td>
                      <td><html:textarea name="FacilityReceiptForm" rows="10" style="width:97%"  property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                  </tr>
                 </tbody>
          </table> --%>
 <%-- End here  for cr-17 --%>
       <%} else {%>
    <!--start table for  to  document  item Details-->
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
              <thead>
              </thead>
            <tbody>
              <html:hidden property="docRef" />
              <html:hidden property="formNo" />
              <html:hidden property="docDate" />
              <html:hidden property="docExpDate" />
              <html:hidden property="docEffDate" />
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docCode" /></td>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Doc No</td>-->
<!--              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docNo" /></td>-->
<!--            </tr>-->
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docDesc" /></td>
            </tr>
 <%--
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docRef" /></td>
            </tr>
--%>
            <tr class="even">
	              <td class="fieldname">Document Type</td>
	              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>
	              <td>-</td>
	              <%}else{ %>
	              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>
	            	<%} %>
            </tr>
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="formNo" /></td>-->
<!--            </tr>-->
            <tr class="even">
              <td class="fieldname">Doc Date</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docDate" /></td>
            </tr>
 <%--
            <% 	if(isPolicy!=null && isPolicy.equals("true")){	%>
			<tr class="odd">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docEffDate" /></td>
            </tr>
            <%  }  %>
--%>
            <tr class="odd">
              <td class="fieldname"><%=lableDocDate%></td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docExpDate" /></td>
            </tr>
             <tr class="even">
              <td class="fieldname">Doc Received Date</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="receivedDate" /></td>
            </tr>
 <%--             
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="FacilityReceiptForm" property="identifyDate" /></td>
            </tr>
--%>
			<tr class="even">
                  <td class="fieldname">Date Completed&nbsp;<font color="RED">*</font></td>
                  <td><html:text property="completedDate" size="12" maxlength="12" readonly="true" />
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('completedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                  <html:errors property="completedDate" />
                  </td>
             </tr>
              <tr class="odd">
              <td class="fieldname">Credit Approver </td>
              <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="allCreditApproverList" labelProperty="label" property="value" />
											</html:select>
                </td>
            </tr>
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Action Party </td>-->
<!--              <td><html:select property="actionParty">-->
<!--                  <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                  </html:select>-->
<!--                </td>-->
<!--            </tr>-->
    <%-- start here for cr-17 
             <tr class="even">
               <td class="fieldname" >Shared</td>
               <td >
                    <html:radio property="shared" value="true"   onclick="assignDocShare(this);" />Yes
                    <html:radio property="shared" value="false"  onclick="assignDocShare(this);"/>No
                    <html:errors property="shared" />
               </td>
               </tr>
--%>
          </tbody>
        </table>
<%--
        <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp" />
--%>
        <!--Start table for Narration  -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                    <tr class="even">
                        <td class="fieldname">Remarks</td>
                        <td><html:textarea name="FacilityReceiptForm" rows="5" style="width:97%"  property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                    </tr>
                </tbody>
        </table>
         <%}%>
     <!--End  else condition here  -->
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                    <a href="#" onclick="saveForm('<%=status%>')"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1"  border="0" id="Image1" /></a>
                    <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4"  border="0" id="Image4" /></a>
                 </td>
              </tr>
        </table>
 <%-- End here  for cr-17 --%>
        </td>
    </tr>
  </tbody>
</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

