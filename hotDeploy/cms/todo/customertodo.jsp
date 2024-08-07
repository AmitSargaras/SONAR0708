<%@ page import="java.util.Collection,
                 java.util.Iterator,
                 com.integrosys.cms.app.transaction.OBLPTodoObject"%>
<%
    String event = request.getParameter("event");
    String transactionID = request.getParameter("transactionID");
    if (event == null) event = "prepare";
	Collection result = (Collection)request.getAttribute("resultList");
    System.out.println("collection col --- "+ result.size());
    String title = "To Do (In-Progress Customer)";

    for (Iterator iterator = result.iterator(); iterator.hasNext();) {
        OBLPTodoObject object = (OBLPTodoObject) iterator.next();
        if ("TAT".equals(object.getActionID()) && "New".equals(object.getStatus())) {
            title = "To Do (New Customer)";
            break;
        }

    }

%>




<html>
<head>

</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><%=title%></h3></td>
  </tr>
  <tr>
    <td><hr /></td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
		  <tr>
              <td width="9%">S/N</td>
              <td width="54%">Stages</td>
              <td width="37%">Status</td>
          </tr>
		  </thead>
		  <tbody>
          <%
              int ct = 1;
              String classname = "even";
              for (Iterator iterator = result.iterator(); iterator.hasNext();) {
                  OBLPTodoObject obTodoObject = (OBLPTodoObject) iterator.next();
                  if (classname.equals("even")) classname = "odd";
                  else if (classname.equals("odd")) classname = "even";
          %>

          <tr class="<%=classname%>">
            <td class="index"><%=ct++%></td>
            <td>
            <%
                  if (obTodoObject.isEnabled()) {
            %>

            <a href="<%=obTodoObject.getProcessURL() + "&transactionID=" + transactionID%>"><%=obTodoObject.getActionName()%></a>
            <%
                  } else {
            %>
            <%=obTodoObject.getActionName()%>
            <%
                  }
            %>

            </td>
            <td><%=obTodoObject.getStatus()%></td>
        </tr>
        <%
              } // for loop
        %>


		  </tbody>
        </table></td>
  </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
