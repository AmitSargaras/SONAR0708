<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.collateral.CollateralAction" %>
<%	
	String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
	String fromPage = (String)session.getAttribute(ipinPath+".from_page");
	String from = (String) session.getAttribute(ipinPath+".from");	
	String trxStatus = request.getParameter("trxStatus");	
%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3" align="center">
            <html:errors property="chargeError"/>
        </td>
    </tr>
    <tr><td colspan="3">&nbsp;</td></tr>
    <tr>
        <td><a href="javascript:submitPage(1, 0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)"><img
                src="img/submit1.gif" name="Image142" width="75" height="22" border="0" id="Image142"/></a></td>
          <% if (!ICMSConstant.STATE_DRAFT.equals(trxStatus) &&
	            !ICMSConstant.STATE_REJECTED.equals(trxStatus) &&
				!ICMSConstant.STATE_REJECTED_CREATE.equals(trxStatus) &&
				!ICMSConstant.STATE_PENDING_PERFECTION.equals(trxStatus)) { %>
        <td><a href="javascript:submitPage(2, 0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img
                src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4"/></a></td>
              <% }%>  
                
        <% if (CollateralAction.COLLATERALLOADING.equals(from)) { %>
        <td><a href="CollateralLoading.do?event=list" onmouseout="MM_swapImgRestore()"
            onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">
         <img src="img/cancel1.gif" name="Image52" width="70" height="20" border="0" id="Image52"/></a></td>
		<% } else if (CollateralAction.EVENT_PREPARE_CREATE.equals(fromPage)) { %>
			<td><a href="CollateralRedirect.do?event=prepare"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image52" width="70" height="20" border="0" id="Image52"/></a></td>
	    <% } else if (ICMSConstant.STATE_DRAFT.equals(trxStatus) ||
	            ICMSConstant.STATE_REJECTED.equals(trxStatus) ||
				ICMSConstant.STATE_REJECTED_CREATE.equals(trxStatus) ||
				ICMSConstant.STATE_PENDING_PERFECTION.equals(trxStatus)) { %>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">			
            <img src="img/cancel1.gif" name="Image52" width="70" height="20" border="0" id="Image52"/></a></td>
     <%} else {%>
        <td><a href='<%=request.getParameter("actionName") %>?event=read&collateralID=<%=request.getParameter("collateralID")+"&from="+CollateralAction.READ_SECURITIES_2%>'
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image1"/></a></td>
        <% } %>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
	<tr><td height="70">&nbsp;</td></tr>
</table>