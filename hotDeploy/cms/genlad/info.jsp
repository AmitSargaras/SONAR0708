<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/genddn/info.jsp,v 1.6 2006/11/15 12:50:37 jychong Exp $
 * @author $Author: jychong $<br>
 * @version $Revision: 1.6 $
 * @since $Date: 2006/11/15 12:50:37 $
 * Tag: $Name: DEV_20061123_B286V1 $
 */
 -->

 <%
	String errCode = (String)request.getAttribute("error");
	String errorMsg = PropertyManager.getValue(errCode);

 %>




<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr>
      <td><h3>DDN Information
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
              <%
              	if ("error".equals(errorMsg)) {
              %>
              DDN is not Required.
              <%
          		} else {
			  %>
			  <%=errorMsg%>
			  <%			
          		}
              %>
              </td>
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
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
