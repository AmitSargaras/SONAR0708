<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome" %>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryExpense" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.ui.common.ForexHelper"%>
<%@ page import="com.integrosys.base.uiinfra.mapper.MapperUtil"%>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.base.uiinfra.common.Constants"%>

<%@include file="include_isChecker.jsp"%>
<%DefaultLogger.debug(this, "isSACMaker " + isSACMaker);%>
<%DefaultLogger.debug(this, "entries_editable " + entries_editable);
Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
%>

    <tr>
      <td colspan="2">
          <table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
            <tbody>
              <tr>
                <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="npl">
                    <thead>
                      <tr>
                        <td class="fieldname" width="1%" >S/N</td>
                        <td class="fieldname" width="27%"><bean:message key="label.liquidation.npl.account.no"/> </td>
                        <td class="fieldname" width="19%"><bean:message key="label.liquidation.npl.npldate"/></td>
                        <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.nplstatus"/></td>
                        <td class="fieldname" width="33%"><bean:message key="label.global.action"/></td>
                      </tr>
                    </thead>
                    <tbody>
                        <% int rowIdx = 0; %>
                        <logic:present name="nplInfo" >
                        <logic:iterate id="obNPL" name="nplInfo"  type= "com.integrosys.cms.app.liquidation.bus.OBNPLInfo">
	                      <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	                        <td class="index"><%=rowIdx%></td>
	                        <td><integro:empty-if-null value="<%=obNPL.getAccountNo()%>"/>&nbsp;</td>
	                        <td><integro:date object="<%=obNPL.getNplDate()%>" />&nbsp;</td>
	                        <td><%=obNPL.getStatus()%>&nbsp;</td>
	                        <td style="text-align:center">
	                          <select name="actionTypeName" onchange="callSubmit(this,'<%=obNPL.getNplID()%>')">
	                            <option>Please Select</option>
	                            <option value="<%=LiquidationAction.EV_VIEW_NPL_INFO%>">View</option>
	                         </select>
	                        </td>
	                      </tr>
                        </logic:iterate>
                        </logic:present>
                   <% if (nplInfo == null || nplInfo.size() == 0) {%>
                      <tr class="odd">
                          <td colspan="5"><bean:message key="label.no.records.found"/></td>
                      </tr>
                    <%}%>
                    </tbody>
                </table>
              </td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>

<tr>
      <td colspan="2"><table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
        <thead>
          <tr>
            <td width="75%">
                <h3><bean:message key="label.liquidation.npl.recovery.expense.details"/></h3></td>
            <% if (isSACMaker && entries_editable){%>
            <td width="25%" align="right" valign="bottom"><input type="button" value='<bean:message key="label.add.new"/>' class="btnNormal" onclick="addExpense()"/>
            <input type="button" onclick="removeExpense()" value='<bean:message key="label.remove"/>' class="btnNormal"/>
            </td>
            <%}%>
          </tr>
          <tr>
            <td colspan="2"><hr/></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                        <thead>
                          <tr>
                            <td class="fieldname" width="1%" >S/N</td>
                            <td class="fieldname" width="27%"><bean:message key="label.liquidation.npl.expense.type"/></td>
                            <td class="fieldname" width="19%"><bean:message key="label.liquidation.npl.date.of.expense"/></td>
                            <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.amount"/></td>
                            <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.settled"/></td>
                            <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
                            <% if (isSACMaker && entries_editable){%>
                            <td class="fieldname" width="13%"><bean:message key="label.global.delete"/></td> <%}%>
                          </tr>
                        </thead>
                        <tbody>

                     <% rowIdx = 0;
                        Amount totalExpense = null;
//                        if (expense != null)
//                            for(  Iterator itr = expense.iterator(); itr.hasNext(); ) {
//                                System.out.println("Expense "+ itr.next());
//                            }
                     %>
                        <logic:present name="expense" >
                        <% //logic:iterate id="obRecoveryExpense" name="expense"  type= "com.integrosys.cms.app.liquidation.bus.OBRecoveryExpense">
                           for (Iterator i = expense.iterator(); i.hasNext();) {
                        	   
                        	   OBRecoveryExpense obRecoveryExpense = (OBRecoveryExpense) i.next();
                        		if (totalExpense == null)
                                    totalExpense = obRecoveryExpense.getExpenseAmount();
                                else
                                	totalExpense = ForexHelper.addAmount(totalExpense, obRecoveryExpense.getExpenseAmount());
								
                        		String expenseAmount = "-";
                        		
                        		if (obRecoveryExpense.getExpenseAmount() != null) {
                        			expenseAmount = obRecoveryExpense.getExpenseAmtCurrency();
                        			expenseAmount += " " + MapperUtil.mapDoubleToString(obRecoveryExpense.getExpenseAmount().getAmount(), 3, locale);
                        		}
                            %>
                      <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index"><%=rowIdx%></td>
                        <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_LIQ_EXPENSE_TYPE,obRecoveryExpense.getExpenseType())%>"/>&nbsp;</td>
                        <td><integro:date object="<%=obRecoveryExpense.getDateOfExpense()%>" />&nbsp;</td>
                        <td><integro:empty-if-null value="<%=expenseAmount%>"/>&nbsp;</td>
                        <td>&nbsp;<%=(obRecoveryExpense.getSettled() == null) ? "No" : ((obRecoveryExpense.getSettled().equals("Y")) ? "Yes" : "No") %></td>
                        <td style="text-align:center">
                          <select name="actionTypeName" onchange="callSubmit(this,'<%=rowIdx-1%>')">
                            <option>Please Select</option>
                            <%--<option value="<%=LiquidationAction.EV_VIEW_RECOVERY_EXPENSE%>">View</option>--%>
                            <% if (isSACMaker && entries_editable){%>
                            <option value="<%=LiquidationAction.EV_PREPARE_EDIT_RECOVERY_EXPENSE%>">View/Edit</option>
                            <%} else { %>
                            <option value="<%=LiquidationAction.EV_VIEW_RECOVERY_EXPENSE%>">View</option>
                            <%}%>
                         </select>
                        </td>
                            <% if (isSACMaker && entries_editable){%>
                          <td style="text-align:center"><input type="checkbox" name="check1" value='<%=rowIdx-1%>'/></td>
                            <%}%>
                      </tr>
                        <% } // /logic:iterate %>
                        </logic:present>
                        <% if (expense == null || expense.size() == 0) {%>
                      <tr class="odd">
                            <% if (isSACMaker && entries_editable){%>
                          <td colspan="7"><bean:message key="label.no.records.found"/></td>
                            <%}else{%>
                          <td colspan="6"><bean:message key="label.no.records.found"/></td>
                            <%}%>
                      </tr>
                    <%}%>
                        </tbody>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
    </tr>
    <tr>
      <td colspan="2"><table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:30px">
        <thead>
          <tr>
            <td width="76%"><h3><bean:message key="label.liquidation.npl.recovery.details"/></h3></td>
            <% if (isSACMaker && entries_editable){%>
            <td width="24%" align="right" valign="bottom"><input type="button" value='<bean:message key="label.add.new"/>' class="btnNormal" onclick="addRecovery()"/>
              <input type="button" onclick="removeRecovery()" value='<bean:message key="label.remove"/>' class="btnNormal"/>
            </td>
            <%}%>
          </tr>
          <tr>
            <td colspan="2"><hr/></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="2">
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                  <tr class="even">
                    <td class="fieldname" width="1%" >S/N</td>
                    <td class="fieldname" width="46%"><bean:message key="label.liquidation.npl.recovery.type"/></td>
                    <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.total.amount.recovered"/></td>
                    <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
                    <% if (isSACMaker && entries_editable){%>
                    <td class="fieldname" width="13%"><bean:message key="label.global.delete"/></td>
                    <%}%>
                  </tr>
                </thead>
                <tbody>

                <%rowIdx = 0;
                  Amount totalIncome = null;
                  Amount grandTotalIncome = null;
                %>
                <logic:present name="recovery" >
                  <logic:iterate id="obRecovery" name="recovery"  type= "com.integrosys.cms.app.liquidation.bus.OBRecovery">
                      <%
                      
                      totalIncome = null;
                      if (obRecovery.getRecoveryIncome() != null)
                          for (Iterator iterator = obRecovery.getRecoveryIncome().iterator(); iterator.hasNext();) {
                              OBRecoveryIncome oincome = (OBRecoveryIncome) iterator.next();
                              if (grandTotalIncome != null && oincome.getTotalAmountRecovered() != null)
                                  grandTotalIncome = ForexHelper.addAmount(grandTotalIncome, oincome.getTotalAmountRecovered());
                              else if (grandTotalIncome == null )
                              	grandTotalIncome = new Amount (oincome.getTotalAmountRecovered().getAmount(), oincome.getTotalAmountRecovered().getCurrencyCode());
                              
                              if (totalIncome != null && oincome.getTotalAmountRecovered() != null)
                              	totalIncome = ForexHelper.addAmount(totalIncome, oincome.getTotalAmountRecovered());
                              else if (totalIncome == null )
                                  totalIncome = new Amount (oincome.getTotalAmountRecovered().getAmount(), oincome.getTotalAmountRecovered().getCurrencyCode());
                              
                          }
                          System.out.println("totalIncome = " + totalIncome);
                      %>


                      <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=rowIdx%></td>
                      <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE,obRecovery.getRecoveryType())%>"/>&nbsp;</td>
                      <td align="right"><integro:currency amount="<%=totalIncome%>"/>&nbsp;</td>
                      <td style="text-align:center">
                        <select name="actionTypeName" onchange="callSubmit(this,'<%=rowIdx-1%>')">
                          <option>Please Select</option>
                            <% if (isSACMaker && entries_editable){%>
                          		<option value="<%=LiquidationAction.EV_PREPARE_EDIT_RECOVERY%>">View/Edit</option>
                            <%} else {%>
                            	<option value="<%=LiquidationAction.EV_VIEW_RECOVERY%>">View</option>
                            <% } %>
                        </select>
                      </td>
                        <% if (isSACMaker && entries_editable){%>
                        <td style="text-align:center"><input type="checkbox" name="check3" value='<%=rowIdx-1%>'/></td>
                        <%}%>
                    </tr>
                  </logic:iterate>
                </logic:present>
                <% if (recovery == null || recovery.size() == 0) {%>
                  <tr class="odd">
                    <% if (isSACMaker && entries_editable){%>
                    <td colspan="5"><bean:message key="label.no.records.found"/></td>
                    <%}else{%>
                    <td colspan="4"><bean:message key="label.no.records.found"/></td>
                    <%}%>
                  </tr>
                <%}%>

                  <tr class="even">
                    <td class="total" >&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <td class="total" align="right"><integro:currency amount="<%=grandTotalIncome%>"/>&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <% if (isSACMaker && entries_editable){%>
                    <td class="total">&nbsp;</td>
                    <%}%>
                  </tr>
                </tbody>
              </table>
			</td>
          </tr>
        </tbody>
      </table>
      </td>
    </tr>
    
