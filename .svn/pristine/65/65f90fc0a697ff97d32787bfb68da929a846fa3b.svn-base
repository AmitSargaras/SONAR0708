<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    LADReceiptForm form = (LADReceiptForm) request.getAttribute("LADReceiptForm");
    String lableDocDate = "Doc Expiry Date";
    String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if (isPolicy == null|| isPolicy.trim().length() == 0) {
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}

	if ( (isPolicy != null && isPolicy.equals("false")) || (monitorType != null && monitorType.equals (ICMSConstant.PREMIUM_RECEIPT)) )
	{
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
	}
	List currencyList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptAction.currencyList");
    if(currencyList!=null){
    	pageContext.setAttribute("currencyList",currencyList);
    }
	String status = (String) request.getAttribute("status");
	System.out.print("status is ==========="+status);

%>




<%@page import="com.integrosys.cms.ui.checklist.LADreceipt.LADReceiptForm"%>
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

function saveForm(){
    if (document.forms["LADReceiptForm"].isPolicy.value == "true"){
		if (document.forms["LADReceiptForm"].docEffDate.value != document.forms["LADReceiptForm"].docOldEffDate.value) {
			document.forms["LADReceiptForm"].isEffDateChanged.value="true";
		}
	}
	document.forms["LADReceiptForm"].event.value="save_update";
	document.forms["LADReceiptForm"].submit();
}

function cancelForm() {
	document.forms["LADReceiptForm"].event.value="view_ok";
	document.forms["LADReceiptForm"].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>
<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<html:form action="LADReceipt" >
<html:hidden property="event" />

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
    <html:hidden property="identifyDate"/>
<!--to keep fields value when error come -->
<html:hidden property="docCode" />
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<html:hidden property="docOldEffDate" />
<html:hidden property="isEffDateChanged" />
<html:hidden property="isPolicy" value="<%=isPolicy%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update LAD Doc Receipt </h3></td>
    </tr>
    <tr>
      <td> <h3> Doc Description - Updated</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <!--start table for  to  document  item in Details-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="docCode" /></td>
            </tr>
<!--            <tr class="even">-->
<!--              <td class="fieldname">Doc No</td>-->
<!--              <td>&nbsp;<bean:write name="LADReceiptForm" property="docNo" /></td>-->
<!--            </tr>-->
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="LADReceiptForm" property="docDesc" /></td>
            </tr>
 <%--
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="docRef" maxlength="100" size="30"/><html:errors property="docRef"/></td>
            </tr>
--%>
<!--             <tr class="even">-->
<!--               <td class="fieldname">Document Type</td>-->
<!--               <td><html:select property="monitorType">-->
<!--                        <integro:common-code categoryCode="MONITOR_TYPE"/>-->
<!--                    </html:select>-->
<!--               </td>-->
<!--            </tr>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Form No</td>-->
<!--              <td><html:text property="formNo" maxlength="50" size="30"/><html:errors property="formNo"/></td>-->
<!--            </tr>-->
 
            <tr class="odd">
              <td class="fieldname">Doc Date &nbsp;</td>
              <td><html:text property="docDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="docDate" />
              </td>
            </tr>
             <tr class="odd">
                        <td class="fieldname">Doc Due Date </td>
                        <td><html:text property="completedDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('completedDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="completedDate"/>
                        </td>
                    </tr>
 <%--
            <%
				if(isPolicy!=null && isPolicy.equals("true"))
				{

			%>
            <tr class="even">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="docEffDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docEffDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="docEffDate" />
              </td>
            </tr>
            <%
       			 }
       		%>
--%>
            <tr class="even">
              <td class="fieldname"><%=lableDocDate%></td>
              <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="docExpDate" />
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

<!--            <tr class="even">-->
<!--              <td class="fieldname">Action Party </td>-->
<!--              <td><html:select property="actionParty">-->
<!--                      <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                  </html:select>-->
<!--                  <html:errors property="actionParty" />-->
<!--                </td>-->
<!--            </tr>-->
<!--             <tr class="even">-->
<!--              <td class="fieldname">Credit Approver </td>-->
<!--              <td><html:select property="actionParty">-->
<!--                      <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                  </html:select>-->
<!--                  <html:errors property="actionParty" />-->
<!--                </td>-->
<!--            </tr>-->
<%-- start here for cr-17 
           <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                    <html:radio property="shared" value="true"   />Yes
                    <html:radio property="shared" value="false"  />No
                    <html:errors property="shared" />
              </td>
              </tr>
--%>
            </tbody>
            </table>
<%--
            <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp" />
--%>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                 <tbody>
                 <tr class="old">
                     <td class="fieldname">Remarks</td>
                     <td><html:textarea name="LADReceiptForm" rows="5" style="width:97%"  property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                    </tr>
                  </tbody>
            </table>
            <!--start  for  save and cancel -->
            <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td align="center" valign="middle">
                          <a href="#" onclick="saveForm()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1" border="0" id="Image1" /></a>
                          <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
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
