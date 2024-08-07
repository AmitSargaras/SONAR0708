<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.ILimitCharge"%>
<%@ page import="com.integrosys.cms.ui.common.StringComparator"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="com.integrosys.cms.app.limit.bus.ITATEntry"%>
<%@ page import="com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.ILienMethod"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<script>
window.onload = function() {
		resize();
		var t = parseFloat(document.getElementById('spread').value)+parseFloat(document.getElementById('wtd').value);
		var s=Math.round(t*100)/100;
		
        document.getElementById('eff_rate').value=formatAmountAsCommaSeparated1(s);
		}
</script>
<%
Format formatter;
  Date date = new Date();
  formatter = new SimpleDateFormat("dd/MMM/yyyy");
  Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
  String event= request.getParameter("event");
  
  
  
  
 %>
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
                    <%-- 1--%>    <td width="4%"><bean:message  key="label.global.sn"/> </td>
                   <%-- 2--%>     <td width="9%"><bean:message key="label.cash.deposit.ref.no"/></td>
                    <%-- 3--%>     <%-- 1 --%> <td width="14%">Depositor name </td>
                   <%-- 4--%>     <td width="8%" style="text-align: center;" ><bean:message key="label.cash.deposit.amount"/></td>
                   <%-- 5--%>    <%-- 2 --%> <td width="8%" style="text-align: center;" >Lien Amount </td>
                    <%-- 6--%>    <td width="7%" style="text-align: center;" ><bean:message key="label.cash.interest.rate"/></td>
                    <%-- 7--%>     <%-- 3 --%> <td width="8%">Deposit Date </td>
                    <%-- 8--%>    <td width="8%">Maturity Date</td>
                    <%-- 9--%>    <%-- 4 <td width="8%">System </td>  --%>
                    <%-- 11--%>     <%-- 6 --%> <td width="9%">Line </td>
                    <%-- 10--%>    <%-- 5 --%> <td width="7%">Serial </td>
                     
                      <%-- 12   --%>   <td width="10%">Remarks </td>
                      	<!-- 13 -->			<td width="8%">LCN No.</td>
                    <%-- 14--%>    <td width="10%"><bean:message key ="label.global.action"/></td>
                    </tr>
                </thead>
                <tbody>
                <%
               double amt=0.0;
               // double FDTotal=0;
                        double FDinterest=0;
                        //double FDamount=0;
                        double totNoFD=0;
                        double FDAllTotal=0;
                         %>
                    <% if (from_event.equals("process")||from_event.equals("track")||from_event.equals("close")) {
                    	
                    	ICashDeposit[] workingCollateralDeposits = (oldCollateral == null) ? null : oldCollateral.getDepositInfo();

                        List res = CompareOBUtil.compOBArrayFD( newCollateral.getDepositInfo(), workingCollateralDeposits);
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
                        <td colspan="13" style="text-align:center"><bean:message key="label.cash.message" /></td>
                    </tr>
                    <% }
                        else{  
                        	
                      int counter = 0;
                      int counterRec = 0;
                     
                    %>
                    <logic:present name="cashDeposit">
                    
                        <logic:iterate  id="compResult" name="cashDeposit" type="com.integrosys.base.techinfra.diff.CompareResult">
                            <%
                         String keyVal = compResult.getKey();
                            ICashDeposit deposit = (ICashDeposit) compResult.getObj();
                           // if(deposit.getDepositRefNo().equals("50300004823250") || deposit.getDepositRefNo().equals("06345050001150"))
                           // { System.out.println("deposit===>"+keyVal);}
                           ICashDeposit[] deposit1 = iCol.getDepositInfo();
                           
                             %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
                                <td >&nbsp;<integro:empty-if-null value="<%=deposit.getDepositRefNo()%>"/></td>
                                <td>
                                <%if(deposit.getOwnBank()){%>
                                <%= itrxValue.getLegalName()%>
                                <%}else{ %>
                                <%= deposit.getDepositorName()%>
                                <%} %>
                                </td><%-- depositor name --%>
                                <td style="text-align: right" >
                                <%
                            if(deposit.getDepositAmount() != null)
                            	if(!keyVal.equals("indexdel")){
                            		if (deposit.getActive().equalsIgnoreCase("Active"))
                                	{
                            amt=deposit.getDepositAmount().getAmount()+amt;}}
                             %>
                                    <% if (deposit.getDepositAmount() != null &&
                                            deposit.getDepositAmount().getCurrencyCode() != null &&
                                            deposit.getDepositAmount().getAmount() >= 0) { 
                                            %>

                                 
                                    <%String depTotal1 = String.valueOf(deposit.getDepositAmount().getAmountAsBigDecimal());
                                    	
                                      String loaMasterError = deposit.getRefID()+"loaMasterError";
                                    %>
                                 <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),depTotal1)%>" />
                                  <br>
								<html:errors property="<%=loaMasterError%>"/>                                  
                                    <% 
                                //FDamount = deposit1[counterRec].getDepositAmount().getAmount();
                                   
                                    if(!keyVal.equals("indexdel")){
                                    FDinterest = deposit.getDepositeInterestRate();
                                 
                                 ILienMethod[] ilien = (ILienMethod[])deposit.getLien();
                                 if(ilien!=null){
                                 Arrays.sort(ilien, new Comparator() {
                                     public int compare(Object a, Object b) {
                                     	ILienMethod depositRefNo1 = (ILienMethod)a;
                                     	ILienMethod depositRefNo2 = (ILienMethod)b;
                                         return depositRefNo1.getSerialNo().compareTo(depositRefNo2.getSerialNo());
                                     }
                                 });
                                 }
                                deposit.setLien(ilien);
                                 double lienTotal = 0;
                                 double FDTotal=0;
                                 double lienAllTotal = 0;
                                 if (deposit.getActive().equalsIgnoreCase("Active"))
                             	{
                                 if(ilien != null){
                                  for(int i = 0 ; i<ilien.length ;i++)
                                  {
                                  	lienTotal = ilien[i].getLienAmount();
                                  	lienAllTotal = lienAllTotal+lienTotal;
                                  	FDTotal = FDTotal+ (lienTotal * FDinterest);}
                                  
                                 }
                                
                                  FDAllTotal = FDAllTotal+ (FDTotal);
                                  totNoFD = totNoFD + lienAllTotal;
                             	}
                                 }
                               // FDTotal = FDTotal+ (FDamount * FDinterest);
                                   
                               // totNoFD = totNoFD + FDamount;
                                    
                                } 
                                %> &nbsp;
                                </td>
                                 <td style="text-align: right" >
                                <%if(null!=deposit.getLien()){
                                if(deposit.getLien().length!=0){%>
                                <%for(int i=0;i<deposit.getLien().length;i++){
                                %>                                   
                                    <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(deposit.getLien()[i].getLienAmount()))%>" />
                                    <br>
                                <%} %>
                                <%}else{ %>
                                <integro:empty-if-null value="-" />
                                 <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                                </td><%-- total lien amt. --%>
                                <td style="text-align: right" ><integro:empty-if-null value="<%=Double.toString(deposit.getDepositeInterestRate())%>" /> </td>
                                <td>&nbsp;<integro:empty-if-null value="<%=formatter.format(deposit.getIssueDate())%>"/></td><%-- Deposit Date  --%>
                                <td >
                                    <integro:date object="<%=deposit.getDepositMaturityDate()%>"/>&nbsp;</td>
                              <%--  <td>&nbsp;<integro:empty-if-null value="<%=deposit.getSystemName()%>"/></td> system name --%>
                                 <td>
                                <%if(null!=deposit.getLien()){
                                if(deposit.getLien().length!=0){%>
                                <%for(int i=0;i<deposit.getLien().length;i++){%>
                                   <integro:empty-if-null value="<%= deposit.getLien()[i].getLienNumber() %>"/><br>
                                <%} %>
                                <%}else{ %>
                                <integro:empty-if-null value="-" />
                                <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                                </td><%-- line--%> 
                                
                                <td><%if(null!=deposit.getLien()){
                                if(deposit.getLien().length!=0){%>
                                <%for(int i=0;i<deposit.getLien().length;i++){%>
                                    <integro:empty-if-null value="<%= deposit.getLien()[i].getSerialNo() %>" /><br>
                                <%} %>
                                <%}else{ %>
                                 <integro:empty-if-null value="-" />
                                <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                               </td><%-- serial no. name --%>
                                   
                                <td>
                                <%if(null!=deposit.getLien()){
                                if(deposit.getLien().length!=0){%>
                                <%for(int i=0;i<deposit.getLien().length;i++){%>
                                <% 
                                int lenCount = 0;
                                String remark =  deposit.getLien()[i].getRemark();
                                if (null != deposit.getLien()[i].getRemark())
                                {
                                	lenCount = deposit.getLien()[i].getRemark().length();
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
                                <%}else{ %>
                                <integro:empty-if-null value="-" />
                                 <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                                </td> 
                                <td>
                                 <!-- LCN No -->
								<%if(null!=deposit.getLien()){
                                if(deposit.getLien().length!=0){%>
                                <%for(int i=0;i<deposit.getLien().length;i++){%>
                                <% 
                                int lenCount = 0;
                                String lcnNo =  deposit.getLien()[i].getLcnNo();
                                if (null != deposit.getLien()[i].getLcnNo())
                                {
                                	lenCount = deposit.getLien()[i].getLcnNo().length();
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
                                 <td>
                                <a href="FixedDeposit.do?event=read&indexID=<%=counter%>&subtype=<%=subtype%>&from_event=<%=from_event%>&cashId=<%=deposit.getCashDepositID()%>&ref_id=<%=deposit.getDepositRefNo() %>">View</a>
                                </td>

                            </tr>
                            <%
                            counter++;
                            %>
                        </logic:iterate>
                    </logic:present>
                    <%} %>
                    <% } else {
                    	
                        ICashDeposit[] deposit = iCol.getDepositInfo();

                        if (deposit != null) {
                            if (deposit.length == 0) {%>
                    <tr class="odd">
                        <td colspan="13" style="text-align:center"><bean:message key="label.cash.message"/></td>
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
                        
                        int counterRec = 0;
                        for (int counter = 0; counter < deposit.length; counter++) {
                            if (deposit[counter] == null)
                                continue;
                            %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="index"><%=counter + 1%></td>
                                <td >&nbsp;<integro:empty-if-null value="<%=deposit[counter].getDepositRefNo()%>"/></td>
                                <td>
                                <%if(deposit[counter].getOwnBank()){%>
                                <%= itrxValue.getLegalName()%>
                                <%}else{ %>
                                <%= deposit[counter].getDepositorName()%>
                                <%} %>
                                </td><%-- depositor name --%>
                                
                                <td style="text-align: right" >
                                <%
                            if(deposit[counter].getDepositAmount() != null)
                            	if (deposit[counter].getActive().equalsIgnoreCase("Active"))
                            	{
                            amt=deposit[counter].getDepositAmount().getAmount()+amt;}
                             %>
                                    <% 
                                    if( counter < deposit.length )
                                    {
                                    if (deposit[counter].getDepositAmount() != null &&
                                            deposit[counter].getDepositAmount().getCurrencyCode() != null &&
                                            deposit[counter].getDepositAmount().getAmount() >= 0) {
                                    	
                                    	%>

                                

                                     <%String depTotal = String.valueOf(deposit[counter].getDepositAmount().getAmountAsBigDecimal());%>
                                 <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),depTotal)%>" />

                                     <% 
                                     
                              //  FDamount = deposit[counterRec].getDepositAmount().getAmount();
                                 FDinterest = deposit[counter].getDepositeInterestRate();
                            //    FDTotal = FDTotal+ (FDamount * FDinterest);
                           //     totNoFD = totNoFD + FDamount;
                                
                                ILienMethod[] ilien = (ILienMethod[])deposit[counter].getLien();
                                if(ilien!=null){
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
                                    }
                                } %> &nbsp;
                                </td>
                                <td style="text-align: right" >
                                <%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){%>
                                <%for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                    <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(deposit[counter].getLien()[i].getLienAmount()))%>" />
                                    <br>
                                <%} %>
                                <%}else{ %>
                                <integro:empty-if-null value="-"/>
                                 <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                                </td><%-- total lien amt. --%>
                                <td style="text-align: right" ><integro:empty-if-null value="<%=Double.toString(deposit[counter].getDepositeInterestRate())%>" /> </td>
                                <td>&nbsp;<integro:empty-if-null value="<%=formatter.format(deposit[counter].getIssueDate())%>"/></td><%-- Deposit Date  --%>
                                <td >
                                    <integro:date object="<%=deposit[counter].getDepositMaturityDate()%>"/>&nbsp;</td>

                            <%--    <td>&nbsp;<integro:empty-if-null value="<%=deposit[counter].getSystemName()%>"/></td> system name --%>
                                
                                <td>
                                <%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){%>
                                <%for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                   <integro:empty-if-null value="<%= deposit[counter].getLien()[i].getLienNumber() %>"/><br>
                                <%} %>
                                <%}else{ %>
                                <integro:empty-if-null value="-"/><br>
                                 <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                                </td><%-- line--%> 
                                
                                <td><%if(null!=deposit[counter].getLien()){
                                if(deposit[counter].getLien().length!=0){%>
                                <%for(int i=0;i<deposit[counter].getLien().length;i++){%>
                                   <integro:empty-if-null value="<%= deposit[counter].getLien()[i].getSerialNo() %>" /><br>
                                <%} %>
                                <%}else{ %>
                                 <integro:empty-if-null value="-"/><br>
                                <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                               </td><%-- serial no. name --%>
                                    
                               <%-- remarks  --%>
                               <td>
                                <%
                                if(null!=deposit[counter].getLien()){
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
                                <%}else{%>
                                 <integro:empty-if-null value="-"/><br>
                                <%}}else{ %><integro:empty-if-null value="-"/><%} %>
                                </td>
                                <td>
                                <!-- LCN No -->
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
                                	if(lenCount > 10)
                                	{
                                		lenCount = 10;
                                	}
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
                                <td ><a href="FixedDeposit.do?event=read&indexID=<%=counter%>&subtype=<%=subtype%>&from_event=<%=from_event%>&cashId=<%=deposit[counter].getCashDepositID()%>&ref_id=<%=deposit[counter].getDepositRefNo() %>"><bean:message key="label.view"/></a>

                             
                                </td>
                                

                            </tr>
                    <%
                        }
                    } else { %>
                    <tr class="odd">
                        <td colspan="13" style="text-align:center"><bean:message key="label.cash.message"/></td>
                    </tr>
                    <% }} %>
                </tbody>
            </table>
             <%-- total of amounts--%>
                 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                 <tr >
   <td width="27%"><html:errors property="notAllowedError"/></td>
                <td class="even" style="text-align: right"  width="7.5%"><integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(amt))%>" /></td>
                <td class="even" style="text-align: right"  width="7.5%"><integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(totNoFD))%>" /></td>
                <td width="32%"></td>
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
