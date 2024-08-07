<%@page import="com.integrosys.cms.app.customer.proxy.CustomerProxyFactory"%>
<%@page import="com.integrosys.cms.app.customer.bus.CustomerSearchCriteria"%>
<%@page import="com.integrosys.cms.app.customer.proxy.ICustomerProxy"%>
<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%><html>
<head>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">

	function downloadReport(){ //v3.0
		var aLocation = 'poiReport.do?event=downloadReport'; 
		window.location.href = aLocation ;
		//document.forms[0].submit();
	}

</script>
</head>
<body>
<html:form action="poiReport.do">
 <html:hidden property="event" value="downloadReport" />
 <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
        <thead>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <h3>
                  		Report has been generated successfully click here to <a href="#" onclick="downloadReport()">Download</a>
                  	</h3>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            
        </tbody>
    </table>
<br> 
 <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="85">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr >
    <td colspan="2">
        <a href="user.do?event=maker_prepare_upload_user" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
			<img src="img/return1.gif" name="Image1"border="0" id="Image1" />
		</a>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
 </html:form>
</body>
</html>

