<%@ page import="com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%    
    CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");

    String event = request.getParameter("event");
	boolean isViewUplift = false ;
	if(event.equals("VIEW_PENDING_TEMP_UPLIFT")||
		event.equals("VIEW_TEMP_UPLIFTED")){
		isViewUplift = true ;
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
<script language="JavaScript" src="js/validation.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
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

function saveForm() {
	document.forms["CCReceiptForm"].event.value="save_temp_uplift";
	document.forms["CCReceiptForm"].submit();
}

function cancelForm() {
	document.forms["CCReceiptForm"].event.value="view_ok";
	document.forms["CCReceiptForm"].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<html:form action="CCReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />

<!--to keep fields value when error come -->
<html:hidden property="docCode" />
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<html:hidden property="docRef" />
<html:hidden property="formNo" />
<html:hidden property="docDate" />
<html:hidden property="docExpDate" />
<html:hidden property="receivedDate" />


<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Constitutional/Contractual Doc Receipt </h3></td>
    </tr>
    <tr>
      <td> <h3> Doc Description - Allow Temp Uplift</h3></td>
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
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docCode" /></td>
            </tr>
            <tr class="even">
                <td class="fieldname">Doc No</td>
                <td>&nbsp;<bean:write name="CCReceiptForm" property="docNo"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDesc" /></td>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Doc Ref</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docRef" /></td>
            </tr>
--%>
            <tr class="even">
              <td class="fieldname">Form No</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="formNo" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Doc Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docDate" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Doc Expiry Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="docExpDate" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Date Temp Uplifted
              <%if(!isViewUplift){ %>&nbsp;<font color="#0000FF">*</font><%} %></td>
              <%if(!isViewUplift){ %>
              <td><html:text property="tempUpliftedDate" size="12" maxlength="10" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" 
                onclick="return showCalendar('tempUpliftedDate', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="tempUpliftedDate" /> 
              </td>
              <%}else{ %>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="tempUpliftedDate" /></td>
              <%}%>
            </tr>
            <tr class="even">
              <td class="fieldname">Expected Date Of Return</td>
              <%if(!isViewUplift){ %>
              <td><html:text property="expectedReturnDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" onclick="return showCalendar('expectedReturnDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" />
				<span id="extDate"></span> 
              </td>
              <%}else{ %>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="expectedReturnDate" /></td>
              <%}%>
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
            <tr class="odd">
              <td class="fieldname">Action Party</td>
              <%if(!isViewUplift){ %>
              <td><html:select property="actionParty">
				  <integro:common-code categoryCode="ACTION_PARTY"/></html:select>
                  <html:errors property="actionParty" />
                </td>
                <% }else{%>
                <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=aForm.getActionParty()%>" display="true" descWithCode="false"/></td>
                <%} %>
            </tr>
<%-- start here for cr-17
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >               
                  <html:radio property="shared" disabled="true" value="true"   />Yes
                  <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>
--%>
            </tbody>
        </table>
<%--       
         <jsp:include page="/checklist/ccreceipt/ViewShareCheckList.jsp" />
--%>
         <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
            <tbody>
                <tr class="even">
                    <td class="fieldname">Remarks</td>
                    <%if(!isViewUplift){ %>
                    <td><html:textarea name="CCReceiptForm" rows="5" cols="80" property="docRemarks"  onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                	<% }else{%>
                	<td>
	                    <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;
              		</td>
                	<%} %>
                </tr>
            </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
           <%if(!isViewUplift){ %>
            <td align="center" valign="middle">
                <a href="#" onclick="saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1" border="0" id="Image1" /></a>
                <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
            </td>
            <% }else{%>
			<td align="center" valign="middle">
                <a href="#" onClick="cancelForm()" ><img src="img/return1.gif"  name="Image4411"  border="0" id="Image4411" /></a>
            </td>
            <%} %>
          </tr>          
        </table>
<%-- End here for cr-17 --%>
        </td>
    </tr>
  </tbody>
</table>
</html:form>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>
