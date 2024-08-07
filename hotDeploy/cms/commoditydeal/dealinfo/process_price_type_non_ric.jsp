<tr>
  <td>
    <h3> Price Type - Non-RIC</h3>
  </td>
</tr>
<tr>
  <td>
    <hr/>
  </td>
</tr>
<tr>
  <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      <tbody>
      <tr class="even">
        <td class="<%=CompareOBUtil.compOB(staging, actual, "actualMarketPriceDate")?"fieldname":"fieldnamediff"%>">Date</td>
        <td>
        	<bean:write name="DealInfoForm" property="actNonRICDate"/>
        </td>
        <td class="fieldname">Market Price</td>
        <td>
        	<bean:write name="DealInfoForm" property="actNonRICMarketPrice"/>&nbsp;&nbsp;
        	<logic:notEmpty name="DealInfoForm" property="actNonRICMarketPrice">
	            <logic:present name="marketPriceUpdatedDate">
	                <logic:notEmpty name="marketPriceUpdatedDate">
	                    (Updated:<integro:date object="<%=marketPriceDate%>" simpleDateFormat="dd/MM/yyyy hh:mm a"/>)
	                </logic:notEmpty>
	            </logic:present>
        	</logic:notEmpty>
        </td>
      </tr>
      <tr class="odd">      
        <td width="20%" class="<%=isAmtSame?"fieldname":"fieldnamediff"%>" height="21"> Commodity Market
             Price (manual)</td>
        <td width="30%" height="21">
        	<bean:write name="DealInfoForm"  property="actNonRICMarketPriceCcy" />&nbsp;
          	<bean:write name="DealInfoForm"  property="actNonRICMarketPriceAmt" />
        </td>
        <td width="30%" class="fieldname" height="21">&nbsp;</td>
        <td width="30%" height="21">&nbsp;</td>
      </tr>
      <tr class="even">
        <td width="20%" class="fieldname" height="21">Buyer/Seller Agreed
          Differential
        </td>
        <td width="30%" height="21">
		    <% if (aForm.getActNonRICCmdtDiffSign() != null) {
		        if (aForm.getActNonRICCmdtDiffSign().equals(ICMSConstant.SIMPLE_SIGN_MINUS)) { %>
		    -
		    <% } else if (aForm.getActNonRICCmdtDiffSign().equals(ICMSConstant.SIMPLE_SIGN_PLUS)) { %>
		    +
		    <% } else if (aForm.getActNonRICCmdtDiffSign().equals(ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS)) { %>
		    &plusmn;
		    <% } } %>&nbsp;
		    <bean:write name="DealInfoForm" property="actNonRICCmdtDiff"/>
        </td>
        <td width="30%" class="fieldname" height="21">Adjusted Pricing</td>
        <td width="30%" height="21">
        	<bean:write name="DealInfoForm" property="actNonRICAdjustPrice"/>&nbsp;
        </td>
      </tr>
      </tbody>
    </table>
  </td>
</tr>