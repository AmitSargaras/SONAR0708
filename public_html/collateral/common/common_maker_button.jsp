<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.collateral.CollateralAction" %>
<%

	boolean isTrack = (new Boolean(request.getParameter("trackInd"))).booleanValue();

	String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
	String fromPage = (String)session.getAttribute(ipinPath+".from_page");
	System.out.println("-------------------- fromPage: "+fromPage);
	boolean isPrepareDelete = CollateralAction.EVENT_PREPARE_DELETE.equals(fromPage);
	
	String event = request.getParameter("event");

%>
<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num) {

	if(num == 1) {
    	document.forms[0].event.value = '<%=CollateralAction.EVENT_DELETE%>';
	} 
		
	document.forms[0].submit();

}
//-->
</script>
<table width="90" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <% if (isTrack) { %>
    <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
	<% } else if (isPrepareDelete) { %>
	    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>
	    <% if ("process_update".equals(event)) {%>
	    	<td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    	<% } else { %>
	    <td><a href="CollateralLoading.do?event=list" onmouseout="MM_swapImgRestore()"
           onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">
    	    <img src="img/cancel1.gif" name="Image52" width="70" height="20" border="0" id="Image52"/></a></td>
    	<% } %>
    <% } else { %>
    	<td><a href="javascript:submitPage(0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
    	<td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } %>

  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr><td height="70">&nbsp;</td></tr>
</table>