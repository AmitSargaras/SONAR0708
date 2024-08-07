<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.base.businfra.transaction.ITrxResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails"%>
<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue"%>
<!--
 /**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/common/ack_submit.jsp,v 1.7 2006/10/27 08:42:38 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.7 $
 * @since $Date: 2006/10/27 08:42:38 $
 * Tag: $Name:  $
 */
 -->




<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<%
		ITrxResult trxResult = (ITrxResult)request.getAttribute("request.ITrxResult");
        ICCICounterpartyDetailsTrxValue cmsTrxValue = (ICCICounterpartyDetailsTrxValue)request.getAttribute("request.ITrxValue");


        String trxId = "";
        String groupNo = "";
        if ( trxResult != null ) {
			ICMSTrxValue value = (ICMSTrxValue)trxResult.getTrxValue();
			if ( value != null )
				trxId = value.getCurrentTrxHistoryID();
		} else if(cmsTrxValue!=null){
            trxId = cmsTrxValue.getCurrentTrxHistoryID();
            ICCICounterpartyDetails details = cmsTrxValue.getStagingCCICounterpartyDetails();
            if (details != null) {
                groupNo = String.valueOf(details.getGroupCCINo());
            }
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
                  The transaction has been submitted. <BR>Your Transaction ID is <B><%=trxId%></B>
                     <BR>Your CCI No. is <B><%=groupNo%></B>
              </td>
            </tr>
            <tr>
              <td height="51" class="odd" style="text-align:center"> &nbsp; </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
