<%@ page import="com.integrosys.cms.ui.diaryitem.DiaryItemAction,
                 com.integrosys.base.techinfra.util.DateUtil,
                   java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.diaryitem.DiaryItemForm,
                 java.util.Date,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<html><!-- InstanceBegin template="../Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>
<%
	DiaryItemForm diaryForm = (DiaryItemForm) request.getAttribute("DiaryItemForm");
    System.out.println("customerName :"+diaryForm.getCustomerName());
	//String customerName = (String)request.getAttribute("customerName");
	//int count = Integer.parseInt((String)request.getAttribute("count"));
	//System.out.println("customerName :"+customerName);
	
%>
<script language="JavaScript" type="text/JavaScript">



</script>
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="DiaryItem">
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
          <%if(diaryForm.getEvent().equals("create") && "N".equals(diaryForm.getDropLineOD())){ %>
            <tr>
              <td height="111" class="odd" style="text-align:center">New Diary Created for Party: <%=diaryForm.getCustomerName() %> </td>
            </tr>
            <%} %>
             <%if(diaryForm.getEvent().equals("create") && "Y".equals(diaryForm.getDropLineOD())){ %>
            <tr>
              <td height="111" class="odd" style="text-align:center">New Diary Created for Party: <%=diaryForm.getCustomerName() %> Upload in Process, please visit All Diary Item to know the status. </td>
            </tr>
            <%} %>
             <%if(diaryForm.getEvent().equals("update")){ %>
            <tr>
              <td height="111" class="odd" style="text-align:center">Diary Modified for Party: <%=diaryForm.getCustomerName() %> </td>
            </tr>
            <%} %>
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
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
