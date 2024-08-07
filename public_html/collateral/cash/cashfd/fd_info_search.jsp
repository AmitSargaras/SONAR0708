<%@ page import="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit,
				 com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositAction"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	ICashDeposit deposit = (ICashDeposit)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.depositObj");
	int index = 0;
%>
<script type="text/javascript" src="js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">
    <!--
    function submitPage(num) {

        enableAllFormElements();

        if (num == 1) {
            document.forms[0].event.value="<%=FixedDepositAction.EVENT_ADD_FD_INFO%>";
        }
        else if (num == 2) {
            document.forms[0].event.value="<%=FixedDepositAction.EVENT_CANCEL_FD_SEARCH%>";
        }
        document.forms[0].submit();
    }
    //-->
</script>

<html:form action="FixedDeposit.do">
<input type="hidden" name="event">
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<table class="tblFormSection" width="75%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><bean:message key="label.cash.group.account.no"/>:
				<integro:empty-if-null value="<%= deposit.getDepositRefNo()%>"/> 
			</td>
        </tr>
        <tr><td><html:errors property="stpError"/></td></tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<thead>
						<tr>
							<td width="10%"><bean:message key="label.global.sn"/></td>
							<td width="20%"><bean:message key="label.fd.retrieve.account.no"/></td>
							<td width="20%"><bean:message key="label.fd.retrieve.current.balance"/></td>
							<td width="15%"><bean:message key="label.fd.retrieve.maturity.date"/></td>
							<td width="15%"><bean:message key="label.fd.retrieve.hold.status"/></td>
                            <td width="10%"><bean:message key="label.fd.retrieve.collateral.exists"/></td>
                            <td width="10%"><bean:message key="label.select"/></td>
						</tr>
					</thead>
                    <tbody>
						<logic:present name="com.integrosys.cms.ui.collateral.cash.CashAction.fdInfoList" scope="session">
							<logic:iterate id="fdInfo" name="com.integrosys.cms.ui.collateral.cash.CashAction.fdInfoList" 
								type="com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit" scope="session">
								<tr class="<%=(index%2==0)?"even":"odd" %>">
									<td class="index"><%=index + 1 %></td>
									<td><integro:empty-if-null value="<%=fdInfo.getDepositReceiptNo()%>"/></td>
									<td><integro:amount amount="<%= fdInfo.getDepositAmount()%>"/></td>
									<td><integro:date object="<%=fdInfo.getDepositMaturityDate() %>"/></td>
									<td>
                                        <logic:notEmpty name="fdInfo" property="holdStatus">
                                            <integro:common-code categoryCode="FD_HOLD_STATUS" entryCode="<%=fdInfo.getHoldStatus()%>" display="true" descWithCode="false"/>
                                        </logic:notEmpty>
										<logic:empty name="fdInfo" property="holdStatus">
                                            <bean:message key="label.global.available"/>
										</logic:empty>
									</td>
                                    <%
                                        boolean collateralExists = false;
                                        if(StringUtils.equals("Y", fdInfo.getCollateralExists())){
                                            collateralExists = true;
                                        }
                                    %>
                                    <td><integro:boolean-display style="yn" value="<%=collateralExists%>"/></td>
                                    <td>
										<% if (!collateralExists &&
                                                ((StringUtils.equals("CC", request.getAttribute("applicationType").toString()) && (StringUtils.equals("C", fdInfo.getHoldStatus()) || StringUtils.isEmpty(fdInfo.getHoldStatus())))
                                                        ||
                                                        (!StringUtils.equals("CC", request.getAttribute("applicationType").toString()) && (StringUtils.equals("L", fdInfo.getHoldStatus()) || StringUtils.equals("M", fdInfo.getHoldStatus()) || StringUtils.isEmpty(fdInfo.getHoldStatus())))))
                                        { %>
											<input type="radio" name="fdInfoIndex" value="<%=index++ %>" />
										<% } else { %>
											<input type="radio" name="fdInfoIndex" value="<%=index++ %>" disabled/>
										<% } %>
									</td>       
								</tr>
							</logic:iterate>
						</logic:present>
						<logic:notPresent name="com.integrosys.cms.ui.collateral.cash.CashAction.fdInfoList">
							<td colspan="6"><bean:message key="label.global.not.found"/></td>
						</logic:notPresent>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
        <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>