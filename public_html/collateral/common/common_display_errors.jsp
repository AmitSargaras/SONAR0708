<%@ page import="java.util.Iterator" %>
<%
	  if (request.getAttribute("org.apache.struts.action.ERROR") !=null)
	  {
	     org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors)(request.getAttribute("org.apache.struts.action.ERROR"));
	     if (errors.size()>0)
	     {
	    	Iterator propItr = errors.properties();
	    	while (propItr.hasNext()) {
	    		System.out.println(propItr.next().toString());
	    	}
	   		Iterator itr = errors.get();
	   		while (itr.hasNext()) {
	   			System.out.println(((org.apache.struts.action.ActionMessage)itr.next()).toString());
	   		}
	     }
	  }
%>
