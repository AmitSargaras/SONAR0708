<%--
$Revision: 1.1 $
$Date: 2003/07/18 03:21:00 $
$Author: goutam $
--%>

<%-- IMPORTS ----------------------------------------------------------------%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.TreeSet" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.util.Vector" %>


<%-- DECLARATIONS -----------------------------------------------------------%>
<%!   
   private Set sortEnumeration(Enumeration en)
   {
   	TreeSet set = new TreeSet();
   	while(en.hasMoreElements())
   	{
   		set.add(en.nextElement());
   	}
   	return set;
   }
%>

<%-- SERVICE METHOD ---------------------------------------------------------%>
<%-- First check if in live mode --%>
<%
   // TODO - get this from environment property
  	boolean isLiveEnvironment = false;
   if (isLiveEnvironment)
   {
      return;
   }
%>

<hr>


</FONT>
<%="<B>" + request.getServerName() + "</B>"%>
<table border="0" cellpadding="0" cellspacing="4" WIDTH="100%">

<%-- REQUEST PARAMS ****************************************************** --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>Request Parameters</B></FONT></td></tr>
<%
	Enumeration en = request.getParameterNames();
	if(en.hasMoreElements()) 
   {
%>
  <tr>
   <TD>
    <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
     <TR>
      <TD>
      <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
       <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Value</FONT></TH></TR>
<%
		Set set = sortEnumeration(en);
		Iterator ii = set.iterator();
		while (ii.hasNext())
      {
			String paramName = (String) ii.next();
			String paramValue = (String) request.getParameter(paramName);
%>
       <TR>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= paramName %></FONT></td>
 	<td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= paramValue %></FONT></td>
       </TR>
<%
      }
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

<%-- PAGE ATTRIBUTES ***************************************************** --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>Page Attributes</B></FONT></td></tr>
<%
	en = pageContext.getAttributeNamesInScope(PageContext.PAGE_SCOPE);
	if (en.hasMoreElements()) 
   {
%>
 <tr>
  <TD>
   <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
    <TR>
     <TD>
      <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
       <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>String Value</FONT></TH></TR>
<%
		Set set = sortEnumeration(en);
		Iterator ii = set.iterator();
		while (ii.hasNext())
		{
			String pageAttribName = (String) ii.next();
			Object pageAttribValue = pageContext.getAttribute(pageAttribName, PageContext.PAGE_SCOPE);
%>
       <TR>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= pageAttribName %></FONT></td>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= pageAttribValue %></FONT></td>
       </TR>
<%
		}
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

<%-- REQUEST ATTRIBUTES ************************************************** --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>Request Attributes</B></FONT></td></tr>
<%
	en = pageContext.getAttributeNamesInScope(PageContext.REQUEST_SCOPE);
	if (en.hasMoreElements()) 
   {
%>
  <tr>
   <TD>
    <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
     <TR>
      <TD>
       <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
        <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Class</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>String Value</FONT></TH></TR>
<%
		Set set = sortEnumeration(en);
		Iterator ii = set.iterator();
		while (ii.hasNext())
		{
			String key = (String) ii.next();
			Object obj = request.getAttribute(key);
			String classString = obj.getClass().getName();
%>
       <TR>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= key %></FONT></td>
        <TD BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= classString %></FONT></TD>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= obj %></FONT></td>
       </TR>
<%
		}
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

<%-- SESSION ATTRIBUTES ************************************************** --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>Session Attributes</B></FONT></td></tr>
<%
	en = session.getAttributeNames();
	if (en.hasMoreElements()) 
   {
%>
  <tr>
   <TD>
    <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
     <TR>
      <TD>
      <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
       <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Class</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>String Value</FONT></TH></TR>
<%
		Set set = sortEnumeration(en);
		Iterator ii = set.iterator();
		while (ii.hasNext()) 
		{
			String key = (String) ii.next();
			Object obj = session.getAttribute(key);
			String classString = obj.getClass().getName();
%>
       <TR>
	 <TD BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= key %></FONT></TD>
	 <TD BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= classString %></FONT></TD>
	 <TD BGCOLOR=#FFFFFF><PRE><FONT SIZE=2><%= obj %></FONT></PRE></TD>
       </TR>
<%
		}
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

<%-- APPLICATION ATTRIBUTES ********************************************** --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>Application Attributes</B></FONT></td></tr>
<%
	en = application.getAttributeNames();
	if (en.hasMoreElements()) 
   {
%>
 <tr>
   <TD>
    <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
     <TR>
      <TD>
      <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
       <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Class</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>String Value</FONT></TH></TR>
<%
		Set set = sortEnumeration(en);
		Iterator ii = set.iterator();
		while (ii.hasNext())
		{
			String key = (String) ii.next();
			Object obj = application.getAttribute(key);
			String classString = obj.getClass().getName();
			
%>
       <TR>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= key %></FONT></td>
	<TD BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= classString %></FONT></TD>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= obj %></FONT></td>
       </TR>
<%
		}
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

<%-- HTTP HEADERS ******************************************************** --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>HTTP Headers</B></FONT></td></tr>
<%
	en = request.getHeaderNames();
	if (en.hasMoreElements()) 
   {
%>
 <tr>
  <TD>
   <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
    <TR>
     <TD>
      <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
       <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Value</FONT></TH></TR>
<%
		Set set = sortEnumeration(en);
		Iterator ii = set.iterator();
		while (ii.hasNext())
		{
			String headerName = (String) ii.next();
			String headerValue = (String) request.getHeader(headerName);
%>
       <TR>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= headerName %></FONT></td>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= headerValue %></FONT></td>
       </TR>
<%
		}
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

<%-- COOKIES ************************************************************* --%>

 <tr><td><FONT FACE="Verdana" SIZE=2><B><br>Cookies</B></FONT></td></tr>
<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) 
   {
%>
 <tr>
  <TD>
   <TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 BGCOLOR=#CCCC99>
    <TR>
     <TD>
      <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0>
       <TR><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Key</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>Value</FONT></TH><TH BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2>MaxAge</FONT></TH></TR>
<%
		for (int idx = 0; idx < cookies.length; ++idx)
		{
			String name = cookies[idx].getName();
			String value = cookies[idx].getValue();
			int maxAge = cookies[idx].getMaxAge();
%>
       <TR>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= name %></FONT></td>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= value %></FONT></td>
        <td BGCOLOR=#FFFFFF><FONT FACE="Lucida Console" SIZE=2><%= maxAge %></FONT></td>
       </TR>
<%
		}
%>
      </TABLE>
     </TD>
    </TR>
   </TABLE>
  </TD>
 </tr>
<%
	}
%>

</table>
