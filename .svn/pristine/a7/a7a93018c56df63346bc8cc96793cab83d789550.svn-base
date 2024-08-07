<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/checklist/previous_event_include.jsp,v 1.1 2006/06/26 10:30:49 czhou Exp $
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author: czhou $<br>
* @version $Revision: 1.1 $
* Date: $Date: 2006/06/26 10:30:49 $
* Tag: $Name:  $
*/
%>

<%
    String prevEvent = request.getParameter("prev_event");
    if(prevEvent == null) {
        prevEvent = request.getParameter("event");
    }
    DefaultLogger.debug(this, "Previous Event: " + prevEvent);
%>
<input type="hidden" name="prev_event" value="<%=prevEvent%>"/>