<%@ page language="java"%>

<html>
<head>
<title>Bad Flow Error</title>
</head>

<body>
<table width="460" height="260" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd">
      <td style="text-align:center" valign="middle">
		<table width="400" height="200" border="0" cellpadding="10" cellspacing="0" class="tblInfo" style="margin:30px">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td class="even" style="text-align:center" valign="middle">
                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo" style="margin:40px">
					<tr class="even">
						<td style="border:none;text-align:right;padding-right:5px" width="80"><img src="img/stoplit.gif" width="25" height="32" /></td>
						<td style="border:none" width="220"><strong><font size="2">Unexpected page flow</font></strong></td>
                    </tr>
					<tr class="even">
						<td colspan="2" style="border:none;text-align:center">
							<%= new java.text.SimpleDateFormat("dd MMM yyyy hh:mm:ss a").format(new java.util.Date()) %>
						</td>
					</tr>
                    <tr class="even">
	                    <td colspan="2" style="border:none;text-align:center"><br />
	                      An unexpected application flow has been detected in the system.  If this problem persists please report to administrator.
						</td>
                    </tr>
					<tr class="even">
						<td colspan="2" style="border:none;text-align:center">
						<jsp:include page="/system/error_log_popup_setup.jsp" />
						</td>
					</tr>
                </table>
			  </td>
            </tr>
          </tbody>
        </table>
	  </td>
    </tr>
  </tbody>
</table>
</body>
</html>
