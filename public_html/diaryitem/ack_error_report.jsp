<%@ page import="com.integrosys.cms.ui.diaryitem.DiaryItemAction,
                 com.integrosys.base.techinfra.util.DateUtil,
                   java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.diaryitem.DiaryItemForm,
                 java.util.Date,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<html><!-- InstanceBegin template="../Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<%
DiaryItemForm diaryForm = (DiaryItemForm) request.getAttribute("DiaryItemForm");
String fromPage = (String) request.getAttribute("frompage");

if (fromPage == null) {
    fromPage = request.getParameter("frompage");
}

String startIndex = (String) request.getAttribute("startIndex");
if (startIndex == null) {
    startIndex = request.getParameter("startIndex");
}

String customerIndex = (String) request.getAttribute("customerIndex");
if (customerIndex == null) {
    customerIndex = diaryForm.getCustomerIndex();
}

String genericCount = (String) request.getAttribute("genericCount");
String odCount = (String) request.getAttribute("odCount");
String totalCount = (String) request.getAttribute("totalCount");
String segment = (String) request.getAttribute("segment");
String segmentName = (String) request.getAttribute("segmentName");
String overDueCount = (String) request.getAttribute("overDueCount");

pageContext.setAttribute("genericCount", genericCount);
pageContext.setAttribute("odCount", odCount);
pageContext.setAttribute("totalCount", totalCount);
pageContext.setAttribute("segment", segment);
pageContext.setAttribute("segmentName", segmentName);
pageContext.setAttribute("overDueCount", overDueCount);
%>
<Script>
function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}



</Script>
<input type="hidden" name="frompage" value="<%=fromPage%>" />
<input type="hidden" name="startIndex" value="<%=startIndex%>" />
<%System.out.println("************"+startIndex); %>
<input type="hidden" name="customerIndex" value="<%=customerIndex%>" />
<input type="hidden" name="genericCount" value='<%=genericCount %>'/>
<input type="hidden" name="odCount" value='<%=odCount %>'/>
<input type="hidden" name="totalCount" value='<%=totalCount %>'/>
<input type="hidden" name="segment" value='<%=segment %>'/>
<input type="hidden" name="segmentName" value='<%=segmentName %>'/>
<input type="hidden" name="overDueCount" value='<%=overDueCount %>'/>
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
              <td height="111" class="odd" style="text-align:center">Uploaded OD file is not in proper format.</td>
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
            <tr>
             <%
             String cancelURL = "DiaryItem.do?event="+fromPage+"&genericCount="+genericCount+"&odCount="+odCount+"&totalCount="+totalCount+"&segment="+segment+"&segmentName="+segmentName+"&overDueCount="+overDueCount+"&startIndex="+startIndex;
    %>
    <td width="72" ><a href="<%=cancelURL%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" /></a></td>
  </tr>
            
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
