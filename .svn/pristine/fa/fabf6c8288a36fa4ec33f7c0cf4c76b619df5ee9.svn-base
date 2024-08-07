<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>

<%


//System.out.println("branch object ::::::::::::::::::"+request.getAttribute("branchDetailsList"));
%>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="branchDetailsList" scope="request" type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch">
   <option custodian1="<%= curOp.getCustodian1()!=null?curOp.getCustodian1():"-" %>" custodian2="<%= curOp.getCustodian2()!=null?curOp.getCustodian2():"-" %>" >
  </option>
   

 </logic:iterate> 
</optionlist>