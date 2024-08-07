<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="facDetailList" scope="request" type="com.integrosys.cms.app.limit.bus.OBLimit">
   <option facilityType="<%= curOp.getFacilityType() %>" facilitySystem="<%= curOp.getFacilitySystem() %>" 
   lineNo="<%= curOp.getLineNo() %>" purpose="<%= curOp.getPurpose() %>" facilitySystemID="<%= curOp.getFacilitySystemID() %>"
     facilityCode="<%= curOp.getFacilityCode() %>" relationShipManager="<%=curOp.getRelationShipManager() %>" 
     grade="<%=curOp.getGrade() %>" isLoanOptionAvailable="<%=curOp.getRiskType() %>" 
     <%if("-".equals(curOp.getCurrencyCode()) || "".equals(curOp.getCurrencyCode()) || null==curOp.getCurrencyCode()){%>
     	currencyCode="INR"
     <%}else{%>
     	currencyCode="<%= curOp.getCurrencyCode() %>" 
     <%}%> 
     >
	 
    </option>
 </logic:iterate> 
</optionlist>
