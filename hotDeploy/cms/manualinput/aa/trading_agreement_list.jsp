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
     */
 %>
 
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Trading Agreement Details</h3></td>
      <td align="right" valign="baseline">
        <%ITradingAgreement agreementParameters = null;
        if(parameters != null){
          agreementParameters = parameters.getTradingAgreement();
        }
        if(agreementParameters == null){
        %>
            <input class="btnNormal" type="button" name="add_agree" value="Add New" onclick="javascript:submitPage(2)"/>
        <%}%>
        </td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td class="fieldname" width="3%">S/N</td>
              <td class="fieldname" width="37%">Agreement Type</td>
              <td class="fieldname" width="20%">Minimum Transfer Amount</td>
              <td class="fieldname" width="15%">Base Currency</td>
              <td class="fieldname" width="20%">Counterparty Threshold Amount</td>
              <%if(agreementParameters != null){%>
              <td class="fieldname" width="5%">Action</td>
              <%}%>
            </tr>
          </thead>
          <tbody>
            <%if(agreementParameters == null){
                if(agreementNull != null){%>
            <tr class="even">
              <td colspan="6"><font color="#FF0000" size="1">Trading Agreement is mandatory.</font>&nbsp;</td>
            </tr>    
            <%  } else {%>
            <tr class="even">
              <td colspan="6"><bean:message key="label.global.not.found"/></td>
            </tr>    
            <%  }
              }else{%>
            <tr class="even">
              <td class="index">1&nbsp;</font></td>
              <td>
              <%String agreementType = null;
                if(! ( agreementParameters.getAgreementType() == null || agreementParameters.getAgreementType() == "" ) ){
                  agreementType = AgreementTypeList.getInstance().getAgreementTypeName(agreementParameters.getAgreementType());
                }%>
                <integro:empty-if-null value="<%=agreementType%>"/>&nbsp;</td> 
              <td><integro:amount param="all" amount="<%=agreementParameters.getMinTransferAmount()%>" decimal="4"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=agreementParameters.getBaseCurrency()%>"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=agreementParameters.getCounterPartyThresholdAmount()%>" decimal="4"/>&nbsp;</td>
              <%if(agreementParameters != null){%>
              <td><a href="javascript:submitPage(5)">Edit</a></td>
              <%}%>
            </tr>
            <%}%>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
  </tbody>
</table>
