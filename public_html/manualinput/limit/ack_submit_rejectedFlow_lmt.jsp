<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
		 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.base.businfra.transaction.ITrxResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>      
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

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<%
	//Start Santosh UBS-LIMIT
	String customerID =(String) request.getAttribute("customerID");
	String limitProfileID=(String) request.getAttribute("limitProfileID");
	System.out.println("???????? "+customerID+" >>>>>>>"+limitProfileID);
	//End Santosh UBS-LIMIT
	
	ITrxResult trxResult = (ITrxResult)request.getAttribute("request.ITrxResult");
        ICMSTrxValue cmsTrxValue = (ICMSTrxValue)request.getAttribute("request.ITrxValue");
	String trxId = "";
	String lmtId = "";
	if ( trxResult != null ) 
	{
		ILimitTrxValue value = (ILimitTrxValue)trxResult.getTrxValue();
		if ( value != null )
		{
			trxId = value.getCurrentTrxHistoryID();
			lmtId = value.getStagingLimit().getLimitRef();
		}
	} 
	else if(cmsTrxValue!=null)
	{
            trxId = cmsTrxValue.getCurrentTrxHistoryID();
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
              <td height="111" class="odd" style="text-align:center">The transaction has been submitted. 
			  	<BR>Your Transaction ID is <B><%=trxId%></B>
		      	<BR>The limit ID is <B><%=lmtId%></B>
	      	  </td>
           </tr>
           <tr>
              <td height="51" class="odd" style="text-align:center">
              <a href='MICustomerSearch.do?event=rejectedFlow_list_limit&amp;rejectedFlow=true&amp;searchFlag=false'>Go to Rejected List</a>
              </td>
           </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
