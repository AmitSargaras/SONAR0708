<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>

<%


System.out.println("branch object ::::::::::::::::::"+request.getAttribute("branchDetailsList"));
%>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="branchDetailsList" scope="request" type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch">
   <option cityTown="<%= curOp.getCityTown().getCityName() %>" state="<%= curOp.getState().getStateName() %>" 
   region="<%= curOp.getRegion().getRegionName() %>" country="<%= curOp.getCountry().getCountryName() %>"  ></option>
   
   %>	
 </logic:iterate> 
</optionlist>