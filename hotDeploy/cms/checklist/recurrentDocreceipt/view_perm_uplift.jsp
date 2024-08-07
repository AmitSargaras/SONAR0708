<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    SecurityReceiptForm form = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
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
	document.forms["SecurityReceiptForm"].event.value="save_perm_uplift";
	document.forms["SecurityReceiptForm"].submit();
}

function cancelForm() {
	document.forms["SecurityReceiptForm"].event.value="view_ok";
	document.forms["SecurityReceiptForm"].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<html:form action="SecurityReceipt" >
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

<!--to keep fields value when error come -->
<html:hidden property="docCode" />
<html:hidden property="docNo"/>
<html:hidden property="docDesc" />
<html:hidden property="docRef" />
<html:hidden property="formNo" />
<html:hidden property="docDate" />
<html:hidden property="docExpDate" />
<!-- <html:hidden property="identifyDate" /> -->
   

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Security Doc Receipt </h3></td>
    </tr>
    <tr>
      <td> <h3> Doc Description - Allow Perm Uplift</h3></td>
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
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docCode" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Doc No</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docNo" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docDesc" /></td>
            </tr>
<%--            <tr class="even">
              <td class="fieldname">Doc Ref</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docRef" /></td>
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
            <tr class="odd">
              <td class="fieldname">Form No</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="formNo" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Doc Date</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docDate" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Doc Expiry Date</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docExpDate" /></td>
            </tr>          
            <tr class="even">
              <td class="fieldname">Date Perm Uplifted&nbsp;<font color="#0000FF">*</font></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="permUpliftedDate" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Action Party</td>
              <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=form.getActionParty()%>" display="true" descWithCode="false"/></td>
            </tr>
            </tbody>
        </table>          
            <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                <tr class="even">
                    <td class="fieldname">Remarks</td>
                    <td>
                    <% SecurityReceiptForm aForm = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm"); %>
                    <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80"  />&nbsp;
                	</td>
                </tr>
                </tbody>
            </table>
            <% String le =(String)request.getAttribute("leyes");
                    if("leyes".equals(le)){
             %>
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td><font color="#FF0000" size="1">
                        You are not allowed to Delete or Allow Perm Uplift the last mandatory document in this list until Enforcieablity status for this Security is updated to 'No'.
                        </font>
                    </td>
                </tr>
            </table>
             <%}%>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center" valign="middle">
                    <a href="#" onClick="cancelForm()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                </td>
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
