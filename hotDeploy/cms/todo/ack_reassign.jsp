<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>

<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/common/ack_approve.jsp,v 1.7 2006/10/27 08:42:38 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.7 $
 * @since $Date: 2006/10/27 08:42:38 $
 * Tag: $Name:  $
 */
 -->


<html>
<head>

</head>

<body>
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
              <td height="111" class="odd" style="text-align:center">The selected items have been transferred to 
              	<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT, request.getParameter("reassignTo"))%>. 
              </td>
            </tr>
            <tr>
              <td height="51" class="odd" style="text-align:center"> &nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
