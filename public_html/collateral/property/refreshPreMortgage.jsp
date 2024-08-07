<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="preMortgageDataList" scope="request" type="com.integrosys.cms.ui.collateral.property.propcommgeneral.PropCommGeneralForm">
   <option legalAuditDate="<%= curOp.getLegalAuditDate() %>"  interveingPeriSearchDate="<%= curOp.getInterveingPeriSearchDate() %>" 
    typeOfMargage="<%= curOp.getTypeOfMargage() %>" salePurchareAmount="<%= curOp.getSalePurchareAmount() %>" 
   dateOfCersaiRegisteration="<%= curOp.getDateOfCersaiRegisteration() %>"  cersaiId="<%= curOp.getCersaiId() %>" 
   cersaiTransactionRefNumber="<%= curOp.getCersaiTransactionRefNumber() %>"   >
	  
    </option>
 </logic:iterate> 
</optionlist>