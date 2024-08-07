<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.app.limitbooking.bus.ILimitBooking,
                 com.integrosys.cms.app.limitbooking.trx.OBLimitBookingTrxValue"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* @author priya
*
*/
%>

<%
    
    OBLimitBookingTrxValue trxVal  = (OBLimitBookingTrxValue) session.getAttribute("com.integrosys.cms.ui.limitbooking.LimitBookingAction.sess.trxValue");

    ILimitBooking limitBooking =  trxVal.getLimitBooking();
    

%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


<!-- InstanceEndEditable -->
</head>
<html:form action="LimitBooking.do">
<body>
  
    <html:hidden property="event"/>
  
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
			<td height="111" class="odd" style="text-align:center"><strong>Your ticket number is :<integro:empty-if-null value="<%=limitBooking.getTicketNo()%>"/></strong><br />
				<strong>Please take note of this ticket number for later enquiry !!! </strong><br />
			    &nbsp;<br />
                The transaction has been submitted <br />
                Your Transaction ID is <b> <integro:empty-if-null value="<%=trxVal.getCurrentTrxHistoryID()%>"/></td>
            </tr>
            <tr>
              <td height="51" class="odd" style="text-align:center"> <script type="text/javascript">

			m = new Array("1","2","3","4","5","6","7","8","9","10","11","12");

			var a=new Date()
 	 		var hours=a.getHours()
 	 		var minutes=a.getMinutes()
 	 		var seconds=a.getSeconds()
			var day1 = a.getDate()-7;
			var dn="AM"
 	 		if (hours>12)
 	 		{
				dn="PM"
				hours=hours-12
 	 		}
 	 		if (hours==0)
 	 			hours=12
 	 		if (minutes<=9)
 	 			minutes="0"+minutes
			month = m[a.getMonth()];
			month1 = m[a.getMonth()];

		 	if(day1 < 1)
		 	{

			   day1 = 30 - (-day1);
			   month1 = month - 1;

		 	}


				var d = new Date();

				document.write(d.getDate())
				document.write(".")
				document.write(d.getMonth() + 1)
				document.write(".")
				document.write(d.getFullYear())
				document.write(" "+ " ")
				document.write(hours)
				document.write(".")
				document.write(minutes)
				document.write(".")
				document.write(seconds)
				document.write(" "+dn+" ")

			</script> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

</td>
</tr>
</tbody>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
