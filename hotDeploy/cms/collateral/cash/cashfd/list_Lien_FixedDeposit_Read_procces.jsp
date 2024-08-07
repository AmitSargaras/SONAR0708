<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.integrosys.cms.ui.common.StringComparator" %>
<%@ page import="com.integrosys.cms.ui.common.CurrencyComparator" %>
<%@ page import="java.util.Comparator" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.ILienMethod"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.OBLien"%>
<%@page import="com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositForm"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="java.text.DecimalFormat,com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale,com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashfd.ICashFd,com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%
List lienList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.lienList");

Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
//pageContext.setAttribute("lienList", lienList);



List res = CompareOBUtil.compOBArrayLien(iLienMethods,iActualLienMethods);

ArrayList list = new ArrayList(res);

pageContext.setAttribute("lienList", list); 
/*if (!(lienList == null)) {

		pageContext.setAttribute("lienList", lienList);
		//request.setAttribute("systemList", systemList);
	}*/

 %>
 
 <%
 int sno = 0;
	int no = 0;
	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	FixedDepositForm value = (FixedDepositForm) request
			.getAttribute("FixedDepositForm");
%>

<%@page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="java.util.ArrayList"%><script type="text/javascript">
    <!--
      var subtype ='<%=subtype%>';
      
        function addDeposit(){
            window.location.href="CashDeposit.do?event=prepare&indexID=-1&subtype= "+subtype;
        } 
    -->
    
    function addSystem(name){
   // alert("addSystem");
	document.forms[0].action="CashDeposit.do?event="+name;
	
    document.forms[0].submit();
}

function addLien(){
//alert('ryr');
	/*document.forms[0].action = "CashDeposit.do";
	document.forms[0].event.value = "add_lien";
    document.forms[0].submit();*/
}
function getAction(id,name,ind,srl,rem) {
//alert("getAction");
	
	var type = document.getElementById("actionType"+ind).value;

	 if(type =="Edit"){
		document.forms[0].action = "CashDeposit.do?lienNo=" +id +"&lienAmount="+name+"&index="+ind+"&serialNo="+srl+"&remark="+rem;		
    	document.forms[0].event.value = "edit_lien";
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "CashDeposit.do?lienNo=" +id +"&lienAmount="+name+"&index="+ind+"&serialNo="+srl+"&remark="+rem;		
    	document.forms[0].event.value = "delete_lien";
    	document.forms[0].submit();
	}	    
}
</script>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <%--<tr>
            <td><h3><bean:message key="label.security.depoosit.infor"/></h3></td>
            <td align="right" valign="baseline">
                <% if (!isSSC) { %>
                <input class="btnNormal" type="button" name="depositSubmit123" value="Add New 1" onclick="javascript:submitPage(5, -1)"/>
                <input class="btnNormal" type="button" name="depositSubmit1" value="Add New" onclick="javascript:submitPage(5, -1)"/>
                &nbsp; <input name="depositRemove1" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(5, 0)"/>
                <% } %>
            </td>
        </tr>
        --%><%--<tr id="addSystemDetails" >
							<td align="right">
							<h3 align="left">Lien Details</h3>
							<input onclick="javascript:submitPage(5)"
								name="AddNew12" type="button" id="AddNew12"
								value="Add Lien Details" class="btnNormal" /></td>
						</tr>
						<tr id="hrline" style="display: none;">
							<td>
							<hr />
							</td>
						</tr>
        --%>
        <tr>
       <td align="right">
							<h3 align="left">Lien Details</h3>
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
                        <%--<tr>
                            <td width="05%"><bean:message key="label.global.sn"/></td>
                            <td width="20%"><bean:message key="label.cash.deposit.ref.no"/></td>
                            <td width="20%"><bean:message key="label.cash.deposit.fdref.no"/></td>
                            <td width="20%"><bean:message key="label.cash.deposit.amount"/></td>
                            <td width="15%"><bean:message key="label.cash.deposit.maturity.date"/></td>
                            <td width="10%"><bean:message key="label.global.action"/></td>
                            <td width="05%"><bean:message key="label.global.delete"/></td>
                        </tr>
                    --%>
                    <tr>
										<td>S/N</td>
										<td>Serial No</td>
										<td>Line Number</td>
										<td>Lien Amount</td>
										<td>Action</td>
									</tr>
                    </thead>
                    <tbody>     
                    <%double total = 0;
                    DecimalFormat dft = new DecimalFormat("#0.00"); %>                  
                   <logic:present name="lienList">
										<logic:iterate id="compResult" name="lienList"
											type="com.integrosys.base.techinfra.diff.CompareResult"
											scope="page">
											<%
											ILienMethod ob = (ILienMethod) compResult.getObj();
												String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											<tr class="<%=rowClass%>">
												<td class="<bean:write name="compResult" property="key" />"><%=no%></td>
												<td>
												<%
												String srNoStr = "-";
												if(ob.getSerialNo()!=null){
													srNoStr=ob.getSerialNo();
												}else{
													srNoStr = "-";
												}
												%>
												<%=srNoStr%> 
												</td>
												<td>
												<%
												String lnNoStr = "-";
												if(ob.getLienNumber()!=null){
													lnNoStr=ob.getLienNumber();
												}else{
													lnNoStr = "-";
												}
												%>
												<%=lnNoStr%> 
												</td>
												<td>
												
												<integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getLienAmount()))%>" />
												<%total= total + ob.getLienAmount();%> 
												<%
												String remStr = "";
												if(ob.getRemark() != null)
												{
													
													remStr = ob.getRemark().trim();
													remStr = remStr.replaceAll("\'","&appos;");
													remStr = remStr.replaceAll("\"","&quot;");
													remStr = remStr.replaceAll("\\n|\\r"," ");
												}
												%>
												</td>
												<td>
												<center><select id="actionType<%=no%>"
													onchange="javascript:submitPage1(9,'<%=lnNoStr%>','<%=dft.format(ob.getLienAmount())%>','<%=no%>','<%=srNoStr%>','<%=remStr%>','<%= ob.getBaselSerial() %>','<%= ob.getFacilityName() %>','<%= ob.getFacilityId() %>','<%= ob.getLcnNo() %>')">

													<option value="">-Select-</option>													
													<option value="View">View</option>													
												</select></center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
									<logic:notPresent name="lienList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
                    
                    <%--
                        <%
                            ICashDeposit[] deposit;
							deposit	= iCol.getDepositInfo();

                            if (deposit != null) {
								Arrays.sort(deposit, new StringComparator());
                                if (deposit.length == 0) {
                        %>
                        <tr class="odd">
                            <td colspan="7"><bean:message key="label.cash.message"/></td>
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
                            <td>&nbsp;<integro:empty-if-null value="<%=deposit[counter].getDepositReceiptNo()%>"/></td>
                            <td valign="right">
                                <% if (deposit[counter].getDepositAmount() != null &&
                                        deposit[counter].getDepositAmount().getCurrencyCode() != null &&
                                        deposit[counter].getDepositAmount().getAmount() >= 0) { %>
                              
								<integro:currency amount="<%=deposit[counter].getDepositAmount()%>" param="currency"/>
								<integro:amount amount="<%=deposit[counter].getDepositAmount()%>" param="amount" decimal="2" />
                                <% } %> &nbsp;
                            </td>
                            <td>&nbsp;<integro:date object="<%=deposit[counter].getDepositMaturityDate()%>"/>&nbsp;</td>
                            <td>&nbsp;<a href="javascript:submitPage(4, <%=counter%>)">View / Edit</a></td>
                            <td>&nbsp;<html:multibox property="deleteItem" value="<%=String.valueOf(counter)%>"/></td>
                        </tr>
                        <%
                            }
                        } else {%>
                        <tr class="odd">
                            <td colspan="7"><bean:message key="label.cash.message"/></td>
                        </tr>
                        <% } %>
                    --%></tbody>
                </table>
                <br>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <%int k=0;
                %>
               
                <tr class="<%=(k++)%2==0?"even":"odd"%>">
									
									<td class="fieldname">Lien Amount Total : </td>
									
									<td>
									
									
									<html:text property="lienTotal"  value="<%=UIUtil.formatWithCommaAndDecimal(dft.format(total))%>" disabled="true"/>
									<html:errors property="lienTotal"/>
									</td>
									</tr>
                </table>
            </td>
        </tr>
    </tbody>
    <tr>
        <td colspan="2"><html:errors property="valBefMargin"/></td>
    </tr>
</table>