<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.integrosys.cms.ui.common.StringComparator" %>
<%@ page import="com.integrosys.cms.ui.common.CurrencyComparator" %>
<%@ page import="java.util.Comparator" %>

<script type="text/javascript">
    <!--
      var subtype ='<%=subtype%>';
        function addDeposit(){
            window.location.href="CashDeposit.do?event=prepare&indexID=-1&subtype= "+subtype;
        }

  -->
</script>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.security.depoosit.infor"/></h3></td>
            <td align="right" valign="baseline">
                <% if (!isSSC) { %>
                <input class="btnNormal" type="button" name="depositSubmit1" value="Add New" onclick="javascript:submitPage(3, -1)"/>
                &nbsp; <input name="depositRemove1" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(5, 0)"/>
                <% } %>
            </td>
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
                            <td width="05%"><bean:message key="label.global.sn"/></td>
                            <!--<td width="20%"><bean:message key="label.cash.deposit.ref.no"/></td>-->
                            <!--<td width="20%"><bean:message key="label.cash.source.receipt.no"/></td>-->
                            <td width="20%"><bean:message key="label.cash.deposit.source.ref.no"/></td>
                            <td width="20%"><bean:message key="label.cash.deposit.amount"/></td>
                            <td width="20%"><bean:message key="label.cash.deposit.interest.rate"/></td>
                            
                            <%
                        	  //if(subtype.equals("CashCash")){
                        		  if (false) {
                        	%>
                            <td width="20%"><bean:message key="label.cash.placement.date" /></td>
                        	<%} else{%>
                        	<td width="20%"><bean:message key="label.cash.deposit.maturity.date" /></td>
                        	<%}%>
                            <td width="10%"><bean:message key="label.global.action"/></td>
                            <td width="05%"><bean:message key="label.global.delete"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%	ICashDeposit[] deposit=null;
							if (iCol!=null && iCol.getDepositInfo()!=null) {
								deposit = iCol.getDepositInfo();
								Arrays.sort(deposit, new StringComparator());
							}

                            if (deposit != null) {
                                if (deposit.length == 0) {
		                        %>
		                        <tr class="odd">
		                            <td colspan="7"><bean:message key="label.cash.message" /></td>
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
							}	

							if (deposit!=null) {
								for (int counter = 0; counter < deposit.length; counter++) { %>
									<% if (deposit[counter] == null) continue;  %>
									<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
										<td class="index"><%=counter + 1%></td>
										 <!--<td>&nbsp;<integro:empty-if-null value="<%=deposit[counter].getDepositRefNo()%>"/></td>-->
										<td>&nbsp;<integro:empty-if-null value="<%=deposit[counter].getDepositReceiptNo()%>"/></td>
										<td valign="right">
											<% if (deposit[counter].getDepositAmount() != null &&
													deposit[counter].getDepositAmount().getCurrencyCode() != null &&
													deposit[counter].getDepositAmount().getAmount() >= 0) { %>
										  
													<integro:currency amount="<%=deposit[counter].getDepositAmount()%>" param="currency"/>
													<integro:amount amount="<%=deposit[counter].getDepositAmount()%>" param="amount" decimal="2" />
											<% } %> &nbsp;
										</td>
										
										<td><integro:empty-if-null value="<%=Double.toString(deposit[counter].getDepositeInterestRate())%>" /> </td>
										
										<% //if(subtype.equals("CashCash")){
											if (false) {
										%>
											<td>&nbsp;<integro:date object="<%=deposit[counter].getIssueDate()%>"/>&nbsp;</td>
										<%} else{%>
											<td>&nbsp;<integro:date object="<%=deposit[counter].getDepositMaturityDate()%>"/>&nbsp;</td>
										<%}%>
										<td>&nbsp;<a href="javascript:submitPage(4, <%=counter%>)">View / Edit</a></td>
										<td>&nbsp;<html:multibox property="deleteItem" value="<%=String.valueOf(counter)%>"/></td>
									</tr>
							<% } 
							} else { %>
								<tr class="odd">
									<td colspan="7"><bean:message key="label.cash.message" /></td>
								</tr>
							<% } %>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
    <tr>
        <td colspan="2"><html:errors property="valBefMargin"/></td>
    </tr>
</table>
