<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.base.businfra.transaction.ITrxResult"%>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/genddn/ack_approve.jsp,v 1.3 2006/10/27 08:45:31 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.3 $
 * @since $Date: 2006/10/27 08:45:31 $
 * Tag: $Name:  $
 */
 -->




<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> 
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

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%
		ITrxResult trxResult = (ITrxResult)request.getAttribute("request.ITrxResult");
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue)request.getAttribute("request.ITrxValue");
        String trxId = "";
		if ( trxResult != null ) {
			ICMSTrxValue value = (ICMSTrxValue)trxResult.getTrxValue();
			if ( value != null )
				trxId = value.getCurrentTrxHistoryID();
		} else if(cmsTrxValue!=null){
            trxId = cmsTrxValue.getCurrentTrxHistoryID();
        }

%>
<body onload="MM_preloadImages('img/printCCC1.gif')">
<!-- InstanceBeginEditable name="Content" -->
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr>
      <td><h3>Confirmation
          <hr/>
        </h3></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td height="111" class="odd" style="text-align:center">The transaction
                has been approved. <BR>Your Transaction ID is <B><%=trxId%></B></td>
            </tr>
            <tr>
              <td height="51" class="odd" style="text-align:center"> &nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/PRINTLLI2.gif',1)"><img src="img/PRINTLLI1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GenerateDDN.do?event=print_doc','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5')"/></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
