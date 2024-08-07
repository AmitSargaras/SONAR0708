<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/reassignment/ack_reassignment.jsp,v 1.6 2006/10/27 08:47:01 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.6 $
 * @since $Date: 2006/10/27 08:47:01 $
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
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue)request.getAttribute("request.ITrxValue");
        String trxId = cmsTrxValue.getCurrentTrxHistoryID();
        String trxType = "";
        if (ICMSConstant.TRX_TYPE_COL_CHECKLIST_RECEIPT.equals(cmsTrxValue.getTransactionSubType())) {
            trxType = "Security Checklist";
        } else if (ICMSConstant.TRX_TYPE_CC_CHECKLIST_RECEIPT.equals(cmsTrxValue.getTransactionSubType())) {
            trxType = "CC Checklist";
        } else {
            trxType = "Commodity Deal";
        }
%>
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
              <td height="111" class="odd" style="text-align:center">
              The pending multi-level approval <%=trxType%> transaction has been forwarded to FAM to-do list.
              <br/><br/>
              Your Transaction ID is <B><%=trxId%></B></td>
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
