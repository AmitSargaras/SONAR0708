<%@ page import="com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog"%>

<script language="JavaScript" type="text/JavaScript">
<!--
function refreshPage(index) {
    document.forms[0].event.value="refresh";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}
-->
</script>
<input type="hidden" name="commentIndexID"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td width="77%">
      <h3>History of Comments</h3>
    </td>
   </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="5%">S/N</td>
          <td width="19%">Date/Time</td>
          <td width="22%">Made By</td>
          <td width="54%">Comments</td>
        </tr>
        </thead>
        <tbody>
        <%
        	OBCMSTrxHistoryLog[] historyLog = null;
        	if (colTrxVal != null) {
            historyLog = (OBCMSTrxHistoryLog[])colTrxVal.getTransactionHistory();
            if (historyLog == null || historyLog.length == 0) {
        %>
        <tr class="odd">
          <td colspan="4">No Comments</td>
        </tr>
        <%
            } else {
                for (int i = 0; i < historyLog.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td style="text-align:center" width="5%" class="index"><%=i + 1%></td>
          <td width="19%" ><integro:empty-if-null value="<%=historyLog[i].getLogDate()%>"/>&nbsp;</td>
          <td width="22%" ><integro:empty-if-null value="<%=historyLog[i].getLogUserName()%>"/>&nbsp;
          (<integro:empty-if-null value="<%=historyLog[i].getLogGroupName()%>"/>)
          </td>
          <%
                    String log = historyLog[i].getRemarks();
                    if (log != null && log.length() > 100) {
                        log = log.substring(0, 100);
                    }
          %>
          <td width="54%" style="text-align:left">
              <% if (log != null && log.length() > 0) { %>
                <a href="#" onclick="refreshPage(<%=i%>)"><integro:wrapper value="<%=log%>"/></a>
              <% } %>&nbsp;
          </td>
        </tr>
        <% } } } else {  %>
        <tr class="odd">
          <td colspan="4">No Comments</td>
        </tr>
        <% } %>
        <tr class="odd">
          <td class="Total" style="text-align:center" width="5%">&nbsp;</td>
          <td width="19%" class="Total">&nbsp;</td>
          <td width="22%" class="Total">&nbsp;</td>
          <td width="54%" class="Total" style="text-align:right">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<br/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tr>
    <td width="77%">
      <h3>Comments Selected</h3>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <tr class="odd">
      <%
          String indexID = request.getParameter("commentIndexID");
          if (indexID == null || indexID.length() == 0) {
      %>
      <td colspan="2">There is no comment selected.</td>
      <%
          } else {
              OBCMSTrxHistoryLog history = historyLog[Integer.parseInt(indexID)];
      %>
          <td class="fieldname" width="11%">
            <integro:empty-if-null value="<%=history.getLogUserName()%>"/>&nbsp;
            (<integro:empty-if-null value="<%=history.getLogGroupName()%>"/>)
          </td>
          <td width="89%"><integro:wrapper lineLength="85" value="<%=history.getRemarks()%>"/>&nbsp;
          </td>
        <%
          }
        %>
        </tr>
      </table>
    </td>
  </tr>
</table>