<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
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

<%
String event=(String) request.getAttribute("event");
System.out.println("////////////********** event-:"+event);
String startIndex=(String) request.getAttribute("startIndex");
String searchstatus= (String) request.getAttribute("searchstatus");
//String status1= (String) request.getAttribute("searchstatus");
String discType= (String) request.getAttribute("discType");
System.out.println("////////////********** searchstatus bfr:"+searchstatus);
System.out.println("////////////********** discType bfr:"+discType);
System.out.println("////////////********** startIndex:"+startIndex);
if(searchstatus==null){
	searchstatus="Please";
}
if(discType==null){
	discType="Please";
}
%>


<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<%
		

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
              <td height="111" class="odd" style="text-align:center">The transaction
                has been submitted. <BR></td>
            </tr>
            <% String url ="Discrepency.do?event=return_list_discrepency";
            url = url+"&searchstatus="+searchstatus+"&discType="+discType+"&startIndex="+startIndex ;
            String url2 ="ToDo.do?event=todo_cancel";
            %>
            <tr>
            <%if("checker_approve_bulk_discrepency".equals(event)||"checker_bulk_reject_discrepency".equals(event)){ %>
            <td height="51" class="odd" style="text-align:center"><a href='<%=url2 %>'>To Do List(Discrepency)</a></td>
            <%}else{ %>
              <td height="51" class="odd" style="text-align:center"><a href='<%=url %>'>Back to Discrepency</a></td>
              <%} %>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
   <input type="hidden" name="searchstatus" value="<%=searchstatus%>"/>
<input type="hidden" name="discType" value="<%=discType%>"/>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
