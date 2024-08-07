<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.Iterator"%>

<%
String bigErrorMessage;

	org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors)(request.getAttribute("org.apache.struts.action.ERROR"));	
	bigErrorMessage = null;
	if (errors != null && !errors.isEmpty()) {
		System.out.println("///////////////////////////////// Error Frame is ///////////////////////////// common_error_message.jsp");
		System.out.println(errors);
		bigErrorMessage = "&nbsp;There are validation errors in this page";
		
		if (errors.size() == 2) {
			String errNames;
			errNames = "";
	   		Iterator itr = errors.get();
	   		while (itr.hasNext()) {
	   			errNames = errNames + ((org.apache.struts.action.ActionMessage)itr.next()).toString();
	   		}

			if (errNames.equalsIgnoreCase("stop[]wip[]") || errNames.equalsIgnoreCase("wip[]stop[]")) {
				bigErrorMessage = null;
			}
		}

	}

	if (bigErrorMessage != null) {
%>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		    <tr>
		        <td nowrap="nowrap" width="100%">
					<SPAN onclick="scrollToElementFirstPos('span', 'errormsg', 0);" style="cursor:hand">
						<font face=Tahoma size=4 color="#FF0000"><%=bigErrorMessage%></font>
					</SPAN>
		        </td>
		    </tr>
		</table>
<%
	}
%>
