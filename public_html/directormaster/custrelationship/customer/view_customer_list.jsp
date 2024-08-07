<%@ page import="com.integrosys.cms.app.customer.bus.ICMSCustomer,
				com.integrosys.cms.ui.common.CommonCodeList,
				com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
%>

<html:form  action="CustomerProcess.do?event=processcusdetails">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Customer Information</h3></td>
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
          		<td width="25%"><bean:message key="label.customer.name"/></td>
          		<td width="15%"><bean:message key="label.group.leid.source"/><br/>
          		<td width="20%"><bean:message key="label.customer.id"/><br/>
          		<td width="30%"><bean:message key="label.col.owner.id.no" /></td>
          		<td width="5%"><bean:message key="label.global.action"/></td>
          	</tr>
          </thead>          
            <%
           		int rowIdx = 0;
            %>            
          <tbody>
            <logic:present name="borrowerList">
          	<logic:iterate id="customerOb" name="borrowerList"  type="ICMSCustomer">
          	<%
          		String sourceId = "";
          		String legalNumber = "";
          		String legalName = "";
          		
          		if (customerOb.getCMSLegalEntity() != null) {
					sourceId = customerOb.getCMSLegalEntity().getSourceID();
					sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
					legalName = customerOb.getCMSLegalEntity().getLegalName();

					//String newIdNo = customerOb.getCMSLegalEntity().getNewIDNumber();
					//if ((newIdNo != null) && (newIdNo.trim().length() > 0)) {
					//	legalNumber = newIdNo;
					//} else {
						legalNumber =  customerOb.getCMSLegalEntity().getLegalRegNumber();
					//}
          		}
          	%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td width="5%" class="index"><%=rowIdx%></td>
              <td align="center" width="25%"><integro:empty-if-null value="<%=legalName%>"/>&nbsp;</td>
              <td align="center" width="15%"><integro:empty-if-null value="<%=sourceId%>"/>&nbsp;</td>
              <td align="center" width="20%"><bean:write name="customerOb" property="CMSLegalEntity.LEReference"/></td>
              <td align="center" width="30%"><integro:empty-if-null value="<%=legalNumber%>"/>&nbsp;</td>
          		<td align="center" width="5%"><a href="CustRelationship.do?event=viewLimitProfile&sub_profile_id=<%=customerOb.getCustomerID()%>">View<a></td>
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