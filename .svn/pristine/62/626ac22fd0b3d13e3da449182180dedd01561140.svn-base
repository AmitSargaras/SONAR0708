<%@ page import="com.integrosys.cms.app.customer.bus.ICMSCustomer" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/ViewLimitProfile.jsp,v 1.66 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.66 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $

     * @author $Author: hmbao $<br>
     * @version $Revision: 1.66 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     * insert "STANDARD & POOR" credit grade
     * must display all four credit grades : "INTERNAL", "ORIGINAL", "MOODY'S", "STANDARD & POOR"
     */
 %>
 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<html:form  action="CustomerProcess.do?event=processcusdetails">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.global.borrower.information"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      	<table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
          	<tr>
          		<td width="5%"><bean:message key="label.global.sn"/></td>
          		<td width="30%"><bean:message key="label.todo.borrower.name"/></td>
          		<td width="30%"><bean:message key="label.customer.id"/><br/>
          		<td width="30%">ID No.</td>
          		<td width="5%"><bean:message key="label.global.action"/></td>
          	</tr>
          </thead>          
            <%
           		int rowIdx = 0;
            %>            
          <tbody>
            <logic:present name="borrowerList">
          	<logic:iterate id="customerOb" name="borrowerList"  type="ICMSCustomer">
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td width="5%" class="index"><%=rowIdx%></td>
              <td width="30%"><integro:empty-if-null value="<%=customerOb.getCustomerName()%>"/>&nbsp;</td>
              <td width="30%"><bean:write name="customerOb" property="CMSLegalEntity.LEReference"/></td>
              <td width="30%"><integro:empty-if-null value="<%=customerOb.getCMSLegalEntity().getLegalRegNumber()%>"/>&nbsp;</td>
          		<td width="5%"><a href="CustomerProcess.do?event=processcusdetails&sub_profile_id=<%=customerOb.getCustomerID()%>">View<a></td>
            </tr>
	          </logic:iterate>
            </logic:present>
          <tbody>
         </table>
       </td>
     </tr>
  </tbody>
</table>
</html:form>