<!-- 
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/checklist/cc/checklist_error.jsp,v 1.4 2006/10/27 08:14:19 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.4 $
 * @since $Date: 2006/10/27 08:14:19 $
 * Tag: $Name:  $
 */
 -->

<%@ page import="com.integrosys.cms.app.common.constant.ICMSErrorCodes"%>



<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable --> 
</head>
<%
    String errorCode = (String)request.getAttribute("error_code");
    System.out.println("ERRORCODE: " + errorCode);
%>
<body>
<!-- InstanceBeginEditable name="Content" --> 
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr> 
      <td><h3>Information 
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
              <td height="111" class="odd" style="text-align:center">
<%      if (ICMSErrorCodes.NO_INSTR_BKG_LOCATION.equals(errorCode))
        {
%>          There is no instruction booking location for this customer/pledgor.
<%      }
        else
        {
%>          There is no legal constitution for this customer/pledgor.
<%      }
%>            </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>
