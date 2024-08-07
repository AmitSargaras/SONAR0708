<%@ page import="com.integrosys.cms.app.bridgingloan.bus.IBuildUp,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Add Copy
* Description: This is a screen to duplicate the number of units.
* It can be reached by clicking on the “ADD FROM COPY” tab on the top of the screen.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>
<%
    try {
        IBuildUp[] objBuildUp = (IBuildUp[]) request.getAttribute("objBuildUp");
        int copyFromIndex = Integer.parseInt(request.getParameter("copyFromIndex"));
%>

<html>
<head>
<title>CMS</title>


<script>
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

function gotoPage(event) {
    var copyFromIndex = document.forms[0].copyFromIndex.value;
    var noOfCopy = document.forms[0].noOfCopy.value;
    opener.location="BL_BuildUp.do?event="+event+"&copyFromIndex="+copyFromIndex+"&noOfCopy="+noOfCopy;
}

function isNumber(numValue) {
    var x = numValue.value;
    var anum = /(^\d+$)|(^\d+\.\d+$)/;
    if (anum.test(x))
        result = true;
    else {
        alert("Please input a valid number!")
        result = false
    }
    return result;
}

function checkNumber(numValue) {
    if (!isNumber(numValue))
        document.forms[0].noOfCopy.value = ''; //Clear field
}

function checkValidation() {
    var noOfCopy = document.forms[0].noOfCopy.value;
    var regUnitIDNo = /^(\d{1,})-(\d{1,})$/;
    var regUnitNo = /^#(\d{1,})-(\d{1,})$/;
    var isRegUnitIDNo = regUnitIDNo.test('<%=objBuildUp[copyFromIndex].getUnitID()%>');
    var isRegUnitNo = regUnitNo.test('<%=objBuildUp[copyFromIndex].getUnitNo()%>');

    if (noOfCopy == null || noOfCopy == '' || noOfCopy == 'undefined') {
        alert('Please input a valid number of copies!');
        return;
    }
    else if (!isRegUnitIDNo) { //False
        alert('Unable to copy due to incorrect format. (e.g. Unit ID No: 1023259382-001)!');
        return;
    }
    else if (!isRegUnitNo) { //False
        alert('Unable to copy due to incorrect format. (e.g. Unit No: #01-101)!');
        return;
    }
    else {
        gotoPage('add_copy');
        self.close();
    }
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_BuildUp.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="copyFromIndex" value="<%=copyFromIndex%>"/>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%"><h3>Add Copy</h3></td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td class="fieldname" width="75%"><bean:message key="label.bridgingloan.unt.id.no"/></td>
                    <td width="25%"><integro:empty-if-null value="<%=objBuildUp[copyFromIndex].getUnitID()%>"/></td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.block.no"/></td>
                    <td><integro:empty-if-null value="<%=objBuildUp[copyFromIndex].getBlockNo()%>"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.unt.no"/></td>
                    <td><integro:empty-if-null value="<%=objBuildUp[copyFromIndex].getUnitNo()%>"/></td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td ><hr></td>
    </tr>
    <tr>
        <td style="text-align:left" valign="bottom"><strong>No. of Copies :
            <input name="noOfCopy" type="text" size="6" maxlength="6" onblur="javascript:checkNumber(this);" />
            Copies to be Created</strong></td>
    </tr>
    </thead>
</tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <a href="javascript:;" onclick="javascript:checkValidation();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3"  border="0" id="Image3" /></a>
            <a href="javascript:window.close();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
