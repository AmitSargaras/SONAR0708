<%@ page import="java.text.*,
                 com.integrosys.cms.ui.common.UIUtil"%>

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  </thead>
  <tbody>

    <tr>
      <td>&nbsp;
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.deal.counterparty.name"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getCustomerName()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td  class="fieldname"><bean:message key="label.deal.agreement.number"/></td>
              <td><integro:empty-if-null value="<%=String.valueOf(obTrxValue.getAgreementID())%>" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.deal.agreement.type"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getAgreementType()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.deal.base.currency"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getBaseCurrency()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.deal.closing.interest"/></td>
              <td>
              <%String closingCashInterest = null;
                if(obTrxValue.getClosingCashInterest()!=null){
                  closingCashInterest = obTrxValue.getClosingCashInterest().toString();
                  int closingLen = closingCashInterest.length()-2;
                  closingCashInterest = closingCashInterest.substring(0,closingLen);
                  System.out.println("closingCashInterest = " + closingCashInterest);
                }
                %>
              <integro:empty-if-null value="<%=closingCashInterest%>" />&nbsp;
              <integro:date object="<%=obTrxValue.getClosingCashInterestDate()%>"/></td>
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

