<%if(obTrxValue.getCPAgreementDetail()!=null) {%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.deal.counterparty.detail"/></h3></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="30%"><bean:message key="label.deal.le.id"/></td>
              <td width="20%"><integro:empty-if-null value="<%=obTrxValue.getCPAgreementDetail().getLEID()%>" />&nbsp;</td>
              <td  class="fieldname"><bean:message key="label.deal.relationship.start.date"/></td>
              <td><integro:date object="<%=obTrxValue.getCPAgreementDetail().getRelationshipStartDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.deal.customer.name"/></td>
              <td><integro:empty-if-null value="<%=obTrxValue.getCPAgreementDetail().getCustomerName()%>" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.deal.incorporate.country"/></td>
              <td>
                <%String incorpCountry = null;
                System.out.println("obTrxValue.getCPAgreementDetail().getIncorpCountry() : " + obTrxValue.getCPAgreementDetail().getIncorpCountry());
                  if(! (obTrxValue.getCPAgreementDetail().getIncorpCountry() == null || obTrxValue.getCPAgreementDetail().getIncorpCountry() == "") ){
                    incorpCountry = CountryList.getInstance().getCountryName(obTrxValue.getCPAgreementDetail().getIncorpCountry());
                    System.out.println("incorpCountry : " + incorpCountry);
                  }
                %>
                <integro:empty-if-null value="<%=incorpCountry%>" />&nbsp;
              </td>
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

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.deal.agreement.detail"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="30%"><bean:message key="label.deal.agreement.number"/></td>
              <td width="20%"><integro:empty-if-null value="<%=String.valueOf(obTrxValue.getCPAgreementDetail().getAgreementID())%>" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.deal.agreement.name"/></td>
              <td>
                <%String agreementType = null;
                  hm = CommonDataSingleton.getCodeCategoryValueLabelMap("AGREEMENT_TYPE");
                  if(! (obTrxValue.getCPAgreementDetail().getAgreementType() == null || obTrxValue.getCPAgreementDetail().getAgreementType() == "") ){
                    agreementType = (String) hm.get(obTrxValue.getCPAgreementDetail().getAgreementType());
                    System.out.println("agreementType : " + agreementType);
                  }%>
                <integro:empty-if-null value="<%=agreementType%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.deal.min.transfer.amt"/></td>
                <td><integro:amount param="all" amount="<%=obTrxValue.getCPAgreementDetail().getMinTransferAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.deal.counterparty.rating"/></td>
              <td>
                <%String cpRating = null;
                  System.out.println("obTrxValue.getCPAgreementDetail().getCPRating() : " + obTrxValue.getCPAgreementDetail().getCPRating());
                  hm = CommonDataSingleton.getCodeCategoryValueLabelMap("RATING");
                  if(! (obTrxValue.getCPAgreementDetail().getCPRating() == null || obTrxValue.getCPAgreementDetail().getCPRating() == "") ){
                    cpRating = (String) hm.get(obTrxValue.getCPAgreementDetail().getCPRating());
                    System.out.println("cpRating : " + cpRating);
                  }
                %>
                <integro:empty-if-null value="<%=cpRating%>" />&nbsp;
              </td>
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

<%}%>
