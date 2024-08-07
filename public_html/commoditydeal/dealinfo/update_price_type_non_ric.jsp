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
        <td class="fieldname">Date&nbsp;<%=isManual?"<font color=#0000FF>* </font>":""%></td>
        <td>
        	<html:text property="actNonRICDate" readonly="true" size="15" maxlength="11" />
	        <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=isManual?"onclick=\"return showCalendar('actNonRICDate', 'dd/mm/y')\"":""%> onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	        <html:errors property="actNonRICDate"/>
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
        	<html:hidden property="actNonRICMarketPrice"/>
        	<html:errors property="actNonRICMarketPrice"/>
        </td>
      </tr>
      <tr class="odd">
        <td width="20%" class="fieldname" height="21">Commodity Market
          Price (manual)&nbsp;<%=isManual?"<font color=#0000FF>* </font>":""%>
        </td>
        <td width="30%" height="21">
        	<html:select property="actNonRICMarketPriceCcy"  disabled="<%=!isManual%>" >
            	<option value="" >Please Select </option>
              	<html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>
            <html:errors property="actNonRICMarketPriceCcy"/>
          	<html:text property="actNonRICMarketPriceAmt" maxlength="27"  disabled="<%=!isManual%>"/>
          	<html:errors property="actNonRICMarketPriceAmt"/>
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
		    <html:hidden property="actNonRICCmdtDiffSign"/>
		    <html:hidden property="actNonRICCmdtDiff"/>
        </td>
        <td width="30%" class="fieldname" height="21">Adjusted Pricing</td>
        <td width="30%" height="21">
        	<bean:write name="DealInfoForm" property="actNonRICAdjustPrice"/>&nbsp;
        	<html:hidden property="actNonRICAdjustPrice"/>
        </td>
      </tr>
      </tbody>
    </table>
  </td>
</tr>