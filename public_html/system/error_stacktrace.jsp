<%@ page import="java.io.*,
                java.util.*"%>

<html>
<body>
<br>
<center>
  <table width="620" border="0" cellspacing="0" cellpadding="0" vspace="0" hspace="0">
    <tr>
      <td width="10%"> </td>
      <td width="80%">
        <div align='left' class='name'><b>An unexpected response has been detected
          within the system. This will be logged an followup by our staff.</b></div>
      </td>
	  <td width="10%"></td>
    </tr>
    <tr>
      <td height="21" width="10%">&nbsp;</td>
      <td height="21" width="80%">&nbsp;</td>
	  <td height="21" width="10%">&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>

  ===============================================================================================================
  <%
      Throwable t = (Throwable)request.getAttribute("losException");
      String errorMsg = "";
      if (t != null) {
            ByteArrayOutputStream os = null;
            try {
                os = new ByteArrayOutputStream();
                t.printStackTrace(new PrintStream(os));
                errorMsg = os.toString();
            }
            catch(Exception e) {
                e.printStackTrace();
            }
            finally {
                try {
                    os.close();
                }
                catch(Exception ee) {}
            }
      }
  %>
  
  <%
    if(!(errorMsg.equals(""))) {
        StringBuffer buf = new StringBuffer();
        StringTokenizer token = new StringTokenizer(errorMsg, "\n\r");
        while(token.hasMoreTokens()) {
            String sub = token.nextToken();
            buf.append(sub);
            buf.append("<br>");
        }
        errorMsg = buf.toString();
     }
   %>
            
  <p align="left">
    <%=errorMsg%>
  </p>
</center>
</body>
</html>