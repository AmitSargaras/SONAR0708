<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>
<optionlist>
   <option coordinator1Name="<%= request.getAttribute("coordinator1Name") %>" coordinator2Name="<%= request.getAttribute("coordinator2Name") %>" ></option>
</optionlist>