<tr>
        <td colspan=3 width="75%">
            <h3><bean:message key="label.liquidation.npl.recovery.income.details"/></h3>
        </td>
      </tr>
      <tr>
        <td colspan=3><hr/></td>
      </tr>
      <tr>
        <td colspan="3">
          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
              <tr class="even">
                <td class="fieldname" width="1%" >S/N</td>
                <td class="fieldname" width="46%"><bean:message key="label.liquidation.npl.recovery.type"/></td>
                <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.amount.recovered"/></td>
                <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
              </tr>
            </thead>
            <tbody>
            <%  DefaultLogger.debug(this, " >>>DEBUG:::007 number of  stagingIncArray elements are : "+stagingIncArray );

                if (stagingIncArray != null)
                for (int i = 0; i < stagingIncArray.length; i++) {
                    IRecoveryIncome stageRecoveryIncome = stagingIncArray[i];
                    boolean differenceFound = false;
                    if(incArray!=null && incArray.length!=0){
                        IRecoveryIncome recoveryIncome = incArray[i];
                        differenceFound = !( CompareOBUtil.compOB(stageRecoveryIncome,recoveryIncome,"recoveryType") );
                    } else {
                        if(stageRecoveryIncome.getTotalAmountRecovered()!=null)
                            differenceFound = true;
                    }
                    DefaultLogger.debug(this, ">>>Debug::: FROM JSP - Liquidation liquidation_checker_edit.jsp : parameterDifferenceFound ? = " + differenceFound );
            %>

                <tr class='<%=(i%2==0?"even":"odd")%>' >
                  <%if(obTrxValue!= null && obTrxValue.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)){%>
                  <td class='<%=differenceFound?"indexdiff":"index"%>'><%=(i+1)%></td>
                  <%}else {%>
                  <td><%=(i+1)%></td>
                  <%}%>
                  <td>&nbsp;</td>
                  <td>
                      <integro:currency amount="<%=stageRecoveryIncome.getTotalAmountRecovered()%>" param="amount" />&nbsp;
                  </td>
                  <td style="text-align:center">
                    <select name="actionTypeName" onchange="callSubmit(this,'<%=i%>')">
                      <option>Please Select</option>
                      <option value="<%=LiquidationAction.EV_VIEW_RECOVERY%>">View</option>
                    </select>
                  </td>
                </tr>
                <%}%>

            <% if (stagingIncArray == null || stagingIncArray.length == 0) {%>
              <tr class="odd">
                <td colspan="4"><bean:message key="label.no.records.found"/></td>
              </tr>
            <%}%>
              <tr class="even">
                <td class="total" >&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>