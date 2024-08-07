<%@ page language="java"%>

<html>
<head>
<title>System Error</title>
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
	                    <td style="border:none" width="220"><strong><font size="2">Transaction Denied</font></strong></td>
                    </tr>
					<tr class="even">
						<td colspan="2" style="border:none;text-align:center">
							<%= new java.text.SimpleDateFormat("dd MMM yyyy hh:mm:ss a").format(new java.util.Date()) %>
						</td>
					</tr>
                    <tr class="even">
						<td colspan="2" style="border:none;text-align:center"><br />
							We apologise that we are not able to process your transaction 
							at this moment. 
							<p>Please try again later or <br />
							Contact your administrator if the problem persists.</p>
							<p><br>
						Root Cause : Error 500--Internal Server Error.<br>
						Error Message : Inavlid HTTP Method.<br></p>
						</td>
						</td>
                    </tr>
                    <tr class="even">
						<td style="border:none;text-align:center">
						<jsp:include page="/system/error_setup_trace.jsp" />
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


<!-- ********* Begin Exception Message ********* -->
<!-- ********* End Exception Message ********* -->
