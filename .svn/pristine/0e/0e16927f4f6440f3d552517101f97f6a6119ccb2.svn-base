<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.deal.detail.title"/></h3></td>
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
              <td class="fieldname" width="30%"><bean:message key="label.isda.deal.id"/></td>
              <td width="20%"><integro:empty-if-null value="<%=String.valueOf(parameters.getDealID())%>" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.isda.deal.facility.desc"/></td>
              <td><integro:empty-if-null value="<%=parameters.getProductType()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.isda.deal.trade.date"/></td>
              <td><integro:date object="<%=parameters.getTradeDate()%>"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.isda.deal.maturity.date"/></td>
              <td><integro:date object="<%=parameters.getMaturityDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.isda.deal.near.amt"/></td>
              <td><integro:amount param="all" amount="<%=parameters.getNearAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.isda.deal.far.amt"/></td>
              <td><integro:amount param="all" amount="<%=parameters.getFarAmount()%>" decimal="4"/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.isda.deal.npv.base"/></td>
              <td><integro:amount param="all" amount="<%=parameters.getNPVBaseAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.isda.deal.npv.reference"/></td>
              <td><integro:amount param="all" amount="<%=parameters.getNPVAmount()%>" decimal="4"/>&nbsp;</td>
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
