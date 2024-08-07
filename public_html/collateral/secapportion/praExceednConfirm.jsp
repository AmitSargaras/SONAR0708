<%
  if (request.getAttribute("org.apache.struts.action.ERROR") !=null)
  {
     org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors)(request.getAttribute("org.apache.struts.action.ERROR"));
     if (errors.get("apportionmentError").hasNext())
     {
%>
  <script>
      document.location.hash = "apportionanchor"; 
      alert("Warning: Priority Ranking Amount exceeds FSV amount");  
      document.forms[0].action = document.forms[0].action + "?skipPraChecking=Y";
      enableAllFormElements();
      document.forms[0].event.value="submit";
      document.forms[0].submit();  
  </script>
<%
     } 
  }
%>