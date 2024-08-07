<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.ILimitCharge"%>
<%@ page import="com.integrosys.cms.ui.common.StringComparator"%>
<%@ page import="java.util.*"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ITATEntry"%>
<%@ page import="com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3>Deposit Information</h3></td>
        <td align="right" valign="baseline">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                    <tr>
                        <td width="5%"><bean:message  key="label.global.sn" /></td>
                        <!--<td width="20%"><bean:message key="label.cash.deposit.ref.no" /></td>-->
                        <!--<td width="24%"><bean:message key="label.cash.source.receipt.no" /></td>-->
                        <td width="20%"><bean:message key="label.cash.deposit.source.ref.no"/></td>
                        <td width="20%"><bean:message key="label.cash.deposit.amount" /></td>
                        <%
                        //if(subtype.equals("CashCash")){
                        	if (false) {
                        %>
                        <td width="20%"><bean:message key="label.cash.placement.date" /></td>
                        <%} else{%>
                        <td width="20%"><bean:message key="label.cash.deposit.maturity.date" /></td>
                        <%}%>
                        <td width="11%"><bean:message key ="label.global.action" /></td>
                    </tr>
                </thead>
                <tbody>
                    <% if (from_event.equals("process")) {

                        List res = CompareOBUtil.compOBArray( newCollateral.getDepositInfo(), ((oldCollateral==null)?null:oldCollateral.getDepositInfo()));
                        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
                        Arrays.sort(resultList, new Comparator(){
                                 public int compare(Object o1, Object o2) {
                                    CompareResult  obj1 = (CompareResult) o1;
                                    CompareResult  obj2 = (CompareResult) o2;
                                    ICashDeposit depositRefNo1 = (ICashDeposit) obj1.getObj();
                                    ICashDeposit depositRefNo2 = (ICashDeposit) obj2.getObj();
                                    if (depositRefNo1.getDepositRefNo() == null) {
                                        depositRefNo1.setDepositRefNo("");
                                    }
                                    if (depositRefNo2.getDepositRefNo() == null) {
                                        depositRefNo2.setDepositRefNo("");
                                    }
                                   return depositRefNo1.getDepositRefNo().compareTo(depositRefNo2.getDepositRefNo());
                                }
                            });

                        ArrayList list = new ArrayList(Arrays.asList(resultList));

                       pageContext.setAttribute("cashDeposit", list);

                        if (list == null || list.size() == 0) {
                    %>
                    <tr class="odd">
                        <td colspan="6"><bean:message key="label.cash.message" /></td>
                    </tr>
                    <% }
                      int counter = 0;
                    %>
                    <logic:present name="cashDeposit">
                        <logic:iterate id="compResult" name="cashDeposit" type="com.integrosys.base.techinfra.diff.CompareResult">
                            <% ICashDeposit deposit = (ICashDeposit) compResult.getObj(); %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="<bean:write name="compResult" property="key" />"><%=counter + 1%></ td>
                                <td >&nbsp;<integro:empty-if-null value="<%=deposit.getDepositReceiptNo()%>"/></td>
                         
                                <td valign="right">
                                    <% if (deposit.getDepositAmount() != null &&
                                            deposit.getDepositAmount().getCurrencyCode() != null &&
                                            deposit.getDepositAmount().getAmount() >= 0) { %>
                                    <integro:currency amount="<%=deposit.getDepositAmount()%>"/>
                                    <% } %> &nbsp;
                                </td>
                                <%
                                	//if(subtype.equals("CashCash")){
                                		if (false) {
                                %>
                                <td><integro:date object="<%=deposit.getDepositMaturityDate()%>"/>&nbsp;</td>  
                                <%} else{%>                       
                                <td ><integro:date object="<%=deposit.getDepositMaturityDate()%>"/>&nbsp;</td>
                                <%}%>
                                <td ><a href="CashDeposit.do?event=read&indexID=<%=deposit.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View</a>
                                </td>

                            </tr>
                            <%counter++;%>
                        </logic:iterate>
                    </logic:present>
                    <% } else {
                        ICashDeposit[] deposit = iCol.getDepositInfo();

                        if (deposit != null) {                        	
                            if (deposit.length == 0) {%>
                    <tr class="odd">
                        <td colspan="6"><bean:message key="label.cash.message" /></td>
                    </tr>
                    <% }

                       // sort the  array.
                            Arrays.sort(deposit, new Comparator() {
                                public int compare(Object a, Object b) {
                                    ICashDeposit depositRefNo1 = (ICashDeposit)a;
                                    ICashDeposit depositRefNo2 = (ICashDeposit)b;
                                    if (depositRefNo1.getDepositRefNo() == null) {
                                        depositRefNo1.setDepositRefNo("");
                                    }
                                    if (depositRefNo2.getDepositRefNo() == null) {
                                        depositRefNo2.setDepositRefNo("");
                                    }
                                    return depositRefNo1.getDepositRefNo().compareTo(depositRefNo2.getDepositRefNo());
                                }
                            });

                       /*  for ( int j=0; j < deposit.length;j++) {
                            ICashDeposit deposit1 = (ICashDeposit) deposit[j];
                        }*/

                        for (int counter = 0; counter < deposit.length; counter++) {
                            if (deposit[counter] == null)
                                continue;

                            %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="index"><%=counter + 1%></td>
                                <td >&nbsp;<integro:empty-if-null value="<%=deposit[counter].getDepositReceiptNo()%>"/></td>
                                <td valign="right">
                                    <% if (deposit[counter].getDepositAmount() != null &&
                                            deposit[counter].getDepositAmount().getCurrencyCode() != null &&
                                            deposit[counter].getDepositAmount().getAmount() >= 0) { %>
                                    <integro:currency amount="<%=deposit[counter].getDepositAmount()%>"/>
                                    <% } %> &nbsp;
                                </td>
                                <%	if (false) {
                                	//if(subtype.equals("CashCash")){
                                %>
                                    <td><integro:date object="<%=deposit[counter].getIssueDate()%>"/>&nbsp;</td>
                                    
                                 <%} else{%>
                                <td >
                                    <integro:date object="<%=deposit[counter].getDepositMaturityDate()%>"/>&nbsp;</td>
                                <%}%>
                                <td ><a href="CashDeposit.do?event=read&indexID=<%=deposit[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View</a>
                                </td>
                                

                            </tr>
                    <%
                        }
                    } else { %>
                    <tr class="odd">
                        <td colspan="5"><bean:message key="label.cash.message" /></td>
                    </tr>
                    <% }}%>
                </tbody>
            </table>
        </td>
    </tr>
</tbody>
</table>
