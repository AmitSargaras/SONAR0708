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
<%
if(obTrxValue.getCPAgreementDetail()!=null) {%>
            <tr class="even">
              <td class="fieldname" width="50%"><bean:message key="label.deal.counterparty.name"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getCPAgreementDetail().getCustomerName()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td  class="fieldname"><bean:message key="label.deal.agreement.number"/></td>
              <td><integro:empty-if-null value="<%=String.valueOf(obTrxValue.getCPAgreementDetail().getAgreementID())%>" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.deal.agreement.type"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getCPAgreementDetail().getAgreementType()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.deal.base.currency"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getCPAgreementDetail().getBaseCurrency()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.deal.closing.interest"/></td>
              <td>
              <%String closingCashInterest = null;
                if(obTrxValue.getCPAgreementDetail().getClosingCashInterest()!=null){
                  closingCashInterest = obTrxValue.getCPAgreementDetail().getClosingCashInterest().toString();
                  int closingLen = closingCashInterest.length()-2;
                  closingCashInterest = closingCashInterest.substring(0,closingLen);
                  System.out.println("closingCashInterest = " + closingCashInterest);
                }
                %>
              <integro:empty-if-null value="<%=closingCashInterest%>" />&nbsp;
              <integro:date object="<%=obTrxValue.getCPAgreementDetail().getClosingCashInterestDate()%>"/></td>
            </tr>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>
<%}%>
          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

