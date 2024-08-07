<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<!-- 
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/cccoltask/no_task.jsp,v 1.6 2006/10/27 08:11:42 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.6 $
 * @since $Date: 2006/10/27 08:11:42 $
 * Tag: $Name:  $
 */
 -->




<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable --> 
</head>
<%
	String errCode = (String)request.getAttribute("error");
	
	String errorMsg = PropertyManager.getValue(errCode);
%>
<body>
<!-- InstanceBeginEditable name="Content" --> 
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr> 
      <td><h3>CC Collaboration Task Information
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
<%  if (errCode == null)
    {
%>
              <td height="111" class="odd" style="text-align:center">Collaboration Task is not allowed.</td>
<%  }
    else
    {
%>              
              <td height="111" class="odd" style="text-align:center"><%= errorMsg%></td>
<%  }%>
 
            </tr>
            </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>
