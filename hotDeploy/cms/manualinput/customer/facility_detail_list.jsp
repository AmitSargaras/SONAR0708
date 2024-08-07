<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="serialNoList" scope="request" type="org.apache.struts.util.LabelValueBean">
 <%System.out.println(curOp.getLabel()+"   "+curOp.getValue()); %>
   <option label="<%= curOp.getLabel() %>" value="<%= curOp.getValue() %>"></option>	
 </logic:iterate> 
<%String facilityAmount = (String)request.getAttribute("facilityAmount");
String lineNo = (String)request.getAttribute("lineNo");
 %>
<crifac facilityAmount='<%=facilityAmount %>' lineNo='<%=lineNo %>' /> 
</optionlist>