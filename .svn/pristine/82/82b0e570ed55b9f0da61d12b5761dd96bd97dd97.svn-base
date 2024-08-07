<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.integrosys.cms.ui.common.StringComparator" %>
<%@ page import="com.integrosys.cms.ui.common.CurrencyComparator" %>
<%@ page import="java.util.Comparator" %>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.util.*,java.text.*"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>

<%
Format formatter;
  Date date = new Date();
  formatter = new SimpleDateFormat("dd/MMM/yyyy");
 // Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
 %>

<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.ILienMethod"%><script type="text/javascript">
window.onload = function() {
		resize();
		var temp=parseFloat(document.getElementById('spread').value)+parseFloat(document.getElementById('wtd').value)
		document.getElementById('eff_rate').value = formatAmountAsCommaSeparated1(temp);
}
    <!--
      var subtype ='<%=subtype%>';
      
        function addDeposit(){
            window.location.href="CashDeposit.do?event=prepare&indexID=-1&subtype= "+subtype;
        } 
        function effec(a){ 
        if(a.value==''){
         var wtdValue=document.getElementById('wtd').value;
        	
         document.getElementById('eff_rate').value=formatAmountAsCommaSeparated1(wtdValue);
         document.getElementById('spread').value='0.0';
         }
         else{
         document.getElementById('spread').value=a.value;
         var t = parseFloat(document.getElementById('spread').value)+parseFloat(document.getElementById('wtd').value);
         document.getElementById('eff_rate').value=Math.round(t*100)/100;
         var strvar = document.getElementById('eff_rate').value;
           if(strvar=='NaN')
          {             
        	  document.getElementById('eff_rate').value ='0.00';
              }else{
			var effRateValue=document.getElementById('eff_rate').value;
			document.getElementById('eff_rate').value=formatAmountAsCommaSeparated1(effRateValue);
              }
        }
        }
    -->
</script>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.security.depoosit.infor"/></h3></td>
            <td align="right" valign="baseline">
            <%
                            ICashDeposit[] deposit1;
							deposit1	= iCol.getDepositInfo();

                        %>
                <% if (!isSSC) { %>
                <input class="btnNormal" type="button" name="depositSubmit123" value="Add New" onclick="javascript:submitPage(3, <%=deposit1.length%>)"/>
                <%--<input class="btnNormal" type="button" name="depositSubmit1" value="Add New" onclick="javascript:submitPage(3, -1)"/>
                &nbsp; --%><input name="depositRemove1" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(5, 0)"/>
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
                    <%-- 1--%>    <td width="4%"><bean:message  key="label.global.sn"/> </td>
                   <%-- 2--%>     <td width="9%"><bean:message key="label.cash.deposit.ref.no"/></td>
                    <%-- 3--%>     <%-- 1 --%> <td width="14%">Depositor name </td>
                   <%-- 4--%>     <td width="8%" style="text-align: center;" ><bean:message key="label.cash.deposit.amount"/></td>
                   <%-- 5--%>    <%-- 2 --%> <td width="8%" style="text-align: center;" >Lien Amount </td>
                    <%-- 6--%>    <td width="7%" style="text-align: center;" ><bean:message key="label.cash.interest.rate"/></td>
                    <%-- 7--%>     <%-- 3 --%> <td width="8%">Deposit Date </td>
                    <%-- 8--%>    <td width="8%">Maturity Date</td>
                    <%-- 9--%>    <%-- 4  <td width="8%">System </td>--%>
                     <%-- 11--%>     <%-- 6 --%> <td width="9%">Line </td> 
                    <%-- 10--%>    <%-- 5 --%> <td width="7%">Serial </td>  
                     <%-- 10--%>    <%-- 5 --%> <td width="10%">Remark </td>
                      	<!-- 13 -->			<td width="8%">LCN No.</td>                                                             
                    <%-- 14--%>    <td width="15%"><bean:message key ="label.global.action"/></td>
                    <%-- 15--%>    <td width="05%"><bean:message key="label.global.delete"/></td>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        double FDinterest=0;
                        //double FDamount=0;
                        double totNoFD=0;
                        double FDAllTotal=0;
                        double amt=0.0;
                         %>
                        <%
                            ICashDeposit[] deposit;
							deposit	= iCol.getDepositInfo();

                            if (deposit != null) {
								Arrays.sort(deposit, new StringComparator());
                                if (deposit.length == 0) {
                        %>
                        
                        <tr class="odd">
                            <td colspan="14" style="text-align:center"><bean:message key="label.cash.message"/></td>
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

                            for (int counter = 0; counter < deposit.length; counter++) { %>
                        <% if (deposit[counter] == null)
                            continue;
                        %>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="index"><%=counter + 1%></td>
                            <td>&nbsp;<integro:empty-if-null value="<%=deposit[counter].getDepositRefNo()%>"/></td>
                            <td>
                                <%if(deposit[counter].getOwnBank()){%>
                                <%= itrxValue.getLegalName()%>
                                <%}else{ %>
                                <%= deposit[counter].getDepositorName()%>
                                <%} %>
                                </td> <%-- depositor name --%>
                            <td style="text-align: right" >
                            <%-- Calculate total FD Amt.--%>
                            <%
                            if(deposit[counter].getDepositAmount() != null)
                            	if (deposit[counter].getActive().equalsIgnoreCase("Active"))
                            	{
                            amt=deposit[counter].getDepositAmount().getAmount()+amt;
                            	}
                             %>
                                <% if (deposit[counter].getDepositAmount() != null &&
                                        deposit[counter].getDepositAmount().getCurrencyCode() != null &&
                                        deposit[counter].getDepositAmount().getAmount() >= 0) { %>
                              
								<%--<integro:amount amount="<%=deposit[counter].getDepositAmount()%>" param="currency" />
								--%>
                                

                                    								
								 <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(), String.valueOf(deposit[counter].getDepositAmount().getAmountAsBigDecimal()))%>" />

                                <% 
                           //     FDamount = deposit[counter].getDepositAmount().getAmount();
                                 FDinterest = deposit[counter].getDepositeInterestRate();
                                ILienMethod[] ilien = (ILienMethod[])deposit[counter].getLien();
                                if(ilien!= null){
                                Arrays.sort(ilien, new Comparator() {
                                    public int compare(Object a, Object b) {
                                    	ILienMethod depositRefNo1 = (ILienMethod)a;
                                    	ILienMethod depositRefNo2 = (ILienMethod)b;
                                        return depositRefNo1.getSerialNo().compareTo(depositRefNo2.getSerialNo());
                                    }
                                });
                                }
                                deposit[counter].setLien(ilien);
                                
                               double lienTotal = 0;
                               double FDTotal=0;
                               double lienAllTotal = 0;
                               if (deposit[counter].getActive().equalsIgnoreCase("Active"))
                           	{
                              if(ilien != null){
                                for(int i = 0 ; i<ilien.length ;i++)
                                {
                                	lienTotal = ilien[i].getLienAmount();
                                	lienAllTotal = lienAllTotal+lienTotal;
                                	FDTotal = FDTotal+ (lienTotal * FDinterest);
                                }
                              }
                                FDAllTotal = FDAllTotal+ (FDTotal);
                                totNoFD = totNoFD + lienAllTotal;
                           	}
                                } %> &nbsp;
                            </td>
                            <td style="text-align: right" >
                                <%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){%>
                                <%for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                   
                                   <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf((deposit[counter].getLien()[i].getLienAmount())))%>" />
                                   <br>
                                <%} %>
                                <%}else{ %>
                                <integro:empty-if-null value="-"/>
                                <%}
                                }else{ %> <integro:empty-if-null value="-"/><%} %>
                                </td><%-- total lien amt. --%>
                            <td style="text-align: right" ><integro:empty-if-null value="<%=Double.toString(deposit[counter].getDepositeInterestRate())%>" /> </td>
                            <td>&nbsp;<integro:empty-if-null value="<%=formatter.format(deposit[counter].getIssueDate())%>"/></td><%-- Deposit Date  --%>
                            <td>&nbsp;<integro:date object="<%=deposit[counter].getDepositMaturityDate()%>"/>&nbsp;</td>
                           <%-- <td>&nbsp;<integro:empty-if-null value="<%=deposit[counter].getSystemName()%>"/></td> system name --%>
                            <td>
                                 <%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){%>
                                <%for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                   <integro:empty-if-null value="<%= deposit[counter].getLien()[i].getLienNumber() %>"/><br>
                                <%} %>
                                <%}
                                else{ %>
                                 <integro:empty-if-null value="-"/>
                                <%}
                                }else{ %> <integro:empty-if-null value="-"/><%} %>
                                </td><%-- line--%>
                            <td><%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){%>
                                <%for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                   <integro:empty-if-null value="<%= deposit[counter].getLien()[i].getSerialNo() %>"/><br>
                                   
                                <%} %>
                                <%} else{ %>
                                <integro:empty-if-null value="-"/>
                                <%}
                                }else{ %> <integro:empty-if-null value="-"/><%} %>
                               </td><%-- serial no. name --%>
                                
                                    
                                <td>
                                <%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){
                                for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                <% 
                                int lenCount = 0;
                                String remark =  deposit[counter].getLien()[i].getRemark();
                                if (null != deposit[counter].getLien()[i].getRemark())
                                {
                                	lenCount = deposit[counter].getLien()[i].getRemark().length();
                                	if(lenCount > 10)
                                	{
                                		lenCount = 10;
                                	}
                                	if(null != remark && !("").equals(remark))
                                	{
                                	remark = remark.substring(0,lenCount);
                                	}
                                }
                                %>
                                   <integro:empty-if-null value="<%= remark %>"/><br>
                                <%} %>
                                <%}
                                else{ %>
                                 <integro:empty-if-null value="-"/>
                                <%}
                                }else{ %> <integro:empty-if-null value="-"/><%} %>
                                </td>    
                                <td>
                                <%
                                if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){
                                for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                <% 
                                int lenCount = 0;
                                String lcnNo =  deposit[counter].getLien()[i].getLcnNo();
                                if (null != deposit[counter].getLien()[i].getLcnNo())
                                {
                                	lenCount = deposit[counter].getLien()[i].getLcnNo().length();
                                	if(null != lcnNo && !("").equals(lcnNo))
                                	{
                                		lcnNo = lcnNo.substring(0,lenCount);
                                	}
                                }
                                %>
                                   <integro:empty-if-null value="<%= lcnNo %>"/><br>
                                <%} %>
                                <%}else{%>
                                 <integro:empty-if-null value="-"/><br>
                                <%}}else{ %><integro:empty-if-null value="-"/><%} %>
								</td>       
                            <td>&nbsp;
                            <%String sysName = deposit[counter].getSystemName();
                            String sysId = deposit[counter].getSystemId();
                            String cashDepositID=String.valueOf(deposit[counter].getCashDepositID());
                            
                            String recpNo =deposit[counter].getDepositRefNo();
                            %>
                            <a href="javascript:submitPage5(4, <%=counter%> ,'<%=sysName %>' ,'<%=sysId %>','<%=cashDepositID %>','<%=recpNo %>')">View / Edit</a></td>
                            <%--<td>
                            <center><select id="actionType<%=counter%>" 
													onchange="javascript:submitPage1(4, '<%=counter%>' ,'<%=counter%>')">
													<option value="">-Select-</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
                            </td>
                            --%><td>&nbsp;<html:multibox property="deleteItem" value="<%=String.valueOf(counter)%>" />
                            
                            </td>
                        </tr>
                        <%
                            }
                        } else {%>
                        <tr class="odd">
                            <td colspan="14" style="text-align:center"><bean:message key="label.cash.message"/></td>
                        </tr>
                        <% } %>
                        
                    </tbody>
                </table>
                <%-- total of amounts--%>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                 <tr >
               <td width="25%"></td>
                <td class="even" style="text-align: right"  width="7.5%"><integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(amt))%>" /></td>
                <td class="even" style="text-align: right"  width="7.5%"><integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(totNoFD))%>" /></td>
                <td width="30%"></td>
                <td class="even" width="28%"><b>Weighted average Interest</b>&nbsp;&nbsp;<%
                        DecimalFormat dft = new DecimalFormat("#0.00");
                        double d =FDAllTotal/totNoFD; 
                        if(FDAllTotal==0.0 && totNoFD==0.0)
                        d=0.0;
                        %>
                        <%--  <%=dft.format(d)%><input id="wtd" value="<%= dft.format(d) %>" type="hidden">--%>
                        <%=UIUtil.customDecimalFormater(d) %><input id="wtd" value="<%=UIUtil.customDecimalFormater(d) %>" type="hidden"/>
                        </td>             
                 
                <tr >
                <td width="25%"></td>
                <td class="even" width="7%"><b>Total FD Amount</b></td>
                <td class="even" width="7%"><b>Total Lien Amount</b></td>
                <td width="30%"></td>
                <td class="even" width="29%"><b>Spread</b>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="spread" name="spread" value="<%= spread %>" maxlength="5" onkeyup="effec(this)"/><html:errors property="spread"/></td>
                        </tr>
                        
                         <tr >
                <td width="25%"></td>
                <td width="7%"></td>
                <td width="7%"></td>
                <td width="30%"></td>
                <td class="even" width="29%"><b>Effective Rate</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="eff_rate" disabled="disabled"></td>
                        </tr>
                </table>
                <%-- total of amounts--%>
                <br>
            </td>
        </tr>
    </tbody>
    <tr>
        <td colspan="2"><html:errors property="valBefMargin"/></td>
    </tr>
</table>
