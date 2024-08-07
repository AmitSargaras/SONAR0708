<%@ page import="com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.customer.bus.OBCMSLegalEntity,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: $
     *
     * Describe this JSP.
     * Purpose: For Maker and checker view the Customer Information
     * Description: view Customer Information by Maker and Checker
     *
     * @author $Author: jerlin $<br>
     * @version $Revision:$
     * @since $Date: $
     * Tag: $Name:  $
     */
 %>
<%
  ICMSCustomer obCMSCustomer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
  if(obCMSCustomer==null){
    obCMSCustomer = new OBCMSCustomer();
    obCMSCustomer.setCMSLegalEntity(new OBCMSLegalEntity());
  }
%>


    
<input type="hidden" name="leReference" value="<%=obCMSCustomer.getCMSLegalEntity().getLEReference()%>"/>
<input type="hidden" name="leID" value="<%=obCMSCustomer.getCustomerID()%>"/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Customer Information</h3></td>
     </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.customer.id"/></td>
              <td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getCMSLegalEntity().getLEReference()%>" />&nbsp;</td>
              <td class="fieldname" width="20%">LE ID Source</td>
              <td width="30%"><%if(obCMSCustomer!=null){%>
                <%=CommonDataSingleton.getCodeCategoryLabelByValue("37",obCMSCustomer.getCMSLegalEntity().getSourceID())%>
                <%}%>&nbsp;
              </td>
            </tr>    
            <tr class="odd">
              <td class="fieldname" width="20%">LE ID Type</td>
              <td width="30%"><%if(obCMSCustomer!=null){%>
                <%=CommonDataSingleton.getCodeCategoryLabelByValue("56",obCMSCustomer.getCMSLegalEntity().getLegalConstitution())%>
                <%}%>&nbsp;
              </td>
              <td class="fieldname">ID No.</td>
              <td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getCMSLegalEntity().getLegalRegNumber()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.global.legal.name"/></td>
              <td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getCMSLegalEntity().getLegalName()%>" />&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
