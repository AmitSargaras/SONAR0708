<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
				 com.integrosys.cms.app.common.util.*,
                 java.util.*,
                 com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%--  // cr 36
    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();

    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);
    
--%>


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
	document.forms["CCReceiptForm"].event.value="save_defer_req";
	document.forms["CCReceiptForm"].submit();
}

function cancelForm() {
	document.forms["CCReceiptForm"].event.value="view_ok";
	document.forms["CCReceiptForm"].submit();
}

<%--
function days_between(date1, date2) {

    // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();

    // Calculate the difference in milliseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);

    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY);

}

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

function calculateDaysDiff() {
    strdate1 = document.forms[0].deferDate.value;
    strdate2 = document.forms[0].deferExtendedDate.value;
    date1 = new Date();
    date2 = new Date();
    if ((strdate2 == null || strdate2 == '') && (strdate1 == null || strdate1 == '')) {
       document.forms[0].ddnDays.value = '';
    } else {
        <% if (bcaApprovedDate == null) { %>
            document.forms[0].ddnDays.value = '';
        <% } else { %>
            if (strdate2 != null && strdate2 != '') {                
                date1 = new Date(strdate2.substring(7,11), months[strdate2.substring(3,6)], strdate2.substring(0,2));
            } else {              	
              	date1 = new Date(strdate1.substring(7,11), months[strdate1.substring(3,6)], strdate1.substring(0,2));
            }

            date2 = new Date(<%=cal.get(Calendar.YEAR)%>, <%=cal.get(Calendar.MONTH)%>, <%=cal.get(Calendar.DAY_OF_MONTH)%>);

            if (date1 < date2) {
                document.forms[0].ddnDays.value = 0;
            } else {

                daysDiff = days_between(date1, date2);
                document.forms[0].ddnDays.value = daysDiff;
                //if (daysDiff > 90)
                //  document.all['warning90'].innerHTML = '<font color="#FF0000" size="1">Deferral Date is more than 90 calendar days from BCA approval date.</font>';
                //else
                //  document.all['warning90'].innerHTML = '';
            }
        <% } %>
    }
}--%>
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
<html:hidden property="identifyDate" />




<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Constitutional/Contractual Doc Receipt </h3></td>
    </tr>
    <tr>
      <td><h3> Doc Description - Defer</h3></td>
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
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="CCReceiptForm" property="identifyDate" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Defer To&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="deferDate" size="12" maxlength="12" readonly="true" />
              <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('deferDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="deferDate" /></td>
            </tr>
            <%-- // cr 36 --%>
            <tr class="even">
              <td class="fieldname">Extended Deferment Date</td>
              <td><html:text property="deferExtendedDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11a" border="0" id="Image1a" onclick="return showCalendar('deferExtendedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11a','','img/calendarb.gif',1)" /><html:errors property="deferExtendedDate" />
              </td>
            </tr>
<%--            <tr class="odd">
              <td class="fieldname" >DDN valid for </td><td ><input type="text" name="ddnDays" size="5" readonly="true"> &nbsp;&nbsp;<a href="#" onclick="calculateDaysDiff()">Days</a></td>
            </tr>
--%>            
            <tr class="odd">
              <td class="fieldname">Action Party <font color="#0000FF">*</font></td>
              <td><html:select property="actionParty">
				  <integro:common-code categoryCode="ACTION_PARTY"/></html:select>
                  <html:errors property="actionParty" />
                </td>
            </tr>
<%-- start here for cr-17 --%>
<%--            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                   <html:radio property="shared" disabled="true" value="true" />Yes
                   <html:radio property="shared" disabled="true" value="false"  />No
               </td>
              </tr>
--%>          </tbody>
        </table>

        <%--  <jsp:include page="/checklist/ccreceipt/ViewShareCheckList.jsp" /> --%>
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
           <thead>
            </thead>
            <tbody>
            <tr class="even">
              <td class="fieldname">Narration</td>
              <td><html:textarea name="CCReceiptForm" rows="10" cols="80"  property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
            </tr>
          </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="center" valign="middle">
                    <a href="#" onclick = "saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1" width="60" height="22" border="0" id="Image1" /></a>
                    <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
                </td>
            </tr>
        </table>
        </td>
    </tr>
  </tbody>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
