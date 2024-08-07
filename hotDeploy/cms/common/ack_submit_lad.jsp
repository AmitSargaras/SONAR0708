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
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%>
<%@page import="java.math.BigDecimal"%><html>
<head>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<%
	String fileName = (String)request.getAttribute("fileName");
	//int count = Integer.parseInt((String)request.getAttribute("count"));
	System.out.println("fileName :"+fileName);
	String event = (String)request.getAttribute("event");
	
%>
<script language="JavaScript" type="text/JavaScript">
	function download(fileName){
		var aLocation = 'GenerateLAD.do?event=download_lad_doc&fileName=' + fileName; 
		window.location.href = aLocation ;
	}
</script>


</head>
<body>


<html:form action="GenerateLAD">
 <html:hidden property="event" value="download_lad_doc" />
 <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
        <thead>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody>
        	<tr align="left">
        		<td><h3>LAD Document</h3>
        		</td>
        	</tr>
        	<tr>
        		<td><hr/></td>
        	</tr>
            <tr>
	                <td>
	                    <h3>
	                  		LAD Document has been generated successfully click here to <a onclick="download('<%=fileName%>')" href="#" >Download</a>
	                  	</h3>
	                </td>
                	
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            
        </tbody>
    </table>
<br> 
 
 </html:form>
</body>
</html>

