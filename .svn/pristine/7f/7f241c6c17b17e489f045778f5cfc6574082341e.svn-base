<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSErrorCodes"%>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/genreqdefer/info.jsp,v 1.6 2006/10/27 08:45:50 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.6 $
 * @since $Date: 2006/10/27 08:45:50 $
 * Tag: $Name:  $
 */
 -->

 <%
	String errCode = (String)request.getAttribute("error");
	String errorMsg = "";
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
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr>
      <td><h3>Request For Deferral Information
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
    <%       if (ICMSErrorCodes.DEFERRAL_NOT_REQUIRED.equals(errCode))
	         {
    %>
                
              <td height="200" class="odd" style="text-align:left;padding:20"> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <thead>
                  </thead>
                  <tbody>
                    <tr class="odd"> 
                      <td colspan="2" style="border right left top bottom:none">&nbsp;</td>
                    </tr>
                    <tr class="odd"> 
                      <td colspan="2" style="border right left top bottom:none">The 
                        Request for Deferral is not accessible due to one of the 
                        following reasons : </td>
                    </tr>
                    <tr class="odd"> 
                      <td width="9%" style="border right left top bottom:none">&nbsp;</td>
                      <td width="91%" style="border right left top bottom:none">&nbsp;</td>
                    </tr>
                    <tr class="odd"> 
                      <td style="border right left top bottom:none" valign="top">(1)</td>
                      <td style="border right left top bottom:none">There are 
                        no document items requested for deferral or </td>
                    </tr>
                    <tr class="odd"> 
                      <td style="border right left top bottom:none">&nbsp;</td>
                      <td style="border right left top bottom:none">&nbsp;</td>
                    </tr>
                    <tr class="odd"> 
                      <td style="border right left top bottom:none" valign="top">(2)</td>
                      <td style="border right left top bottom:none">One or more 
                        document checklist(s) you are trying to access has &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;been 
                        sent for Request for Deferral. Please ensure that the 
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Request for Deferral is 
                        approved before proceeding. </td>
                    </tr>
                    <tr class="odd"> 
                      <td style="border right left top bottom:none">&nbsp;</td>
                      <td style="border right left top bottom:none">&nbsp;</td>
                    </tr>
                  </tbody>
                </table>
              </td>    
    <%      }
            else
            {
    %>          <td height="111" class="odd" style="text-align:center"><%=PropertyManager.getValue(errCode)%>.</td>
    
    <%      }%>
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
