<%@ page import="com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%
    String from_event = request.getParameter("from_event");
    boolean isProcess = (from_event.equals("process"));
    ICashDeposit stagingOB = (ICashDeposit) request.getAttribute("stageDeposit");
    ICashDeposit originOB = (ICashDeposit) request.getAttribute("actualDeposit");
    int rowIdx = 0;

%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.serviceColObj");
    String subtype = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
    boolean isDiffCurr = false;
    if (subtype.equals(ICMSConstant.COLTYPE_CASH_DIFFCCY)) {
        isDiffCurr = true;
    }

%>

<table class="tblFormSection" width="60%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3>Deposit Information - View</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td nowrap="nowrap" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositReceiptNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <span class=stp><bean:message key="label.cash.deposit.source.ref.no"/></span>&nbsp;
								<span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="DepositForm" property="depositReceiptNo"/>&nbsp;</td>
                        </tr>

                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <% if (isDiffCurr) { %>
	                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB, originOB,  "depositCcyCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                                <bean:message key="label.cash.deposit.currency"/>&nbsp;
	                                	<span class="mandatoryPerfection">*</span></td>
	                            <td>
                            <% } else { %>
	                            <td class="fieldname">
	                                 <bean:message key="label.cash.deposit.currency"/>&nbsp;
	                                 	<span class="mandatoryPerfection">*</span></td>
	                            <td>
                            <% } %>
                                <bean:write name="DepositForm" property="depCurr"/>&nbsp;
                            </td>
                        </tr>
                        <% Amount oldDepAmt = null;
                            Amount newDepAmt = null;
                            if (stagingOB != null)
                                newDepAmt = stagingOB.getDepositAmount();
                            if (originOB != null)
                                oldDepAmt = originOB.getDepositAmount();
                        %>
                        <% boolean unchanged = true;
                            if (isProcess) {
                                if (newDepAmt != null && oldDepAmt == null) {
                                    if (newDepAmt.getAmount() != 0) {
                                        unchanged = false;
                                    }
                                } else if (newDepAmt != null && oldDepAmt != null) {
                                    unchanged = CompareOBUtil.compOB(newDepAmt, oldDepAmt, "amount");
                                }
                            }
                        %>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <span class=stp><bean:message key="label.cash.deposit.amount"/></span>&nbsp;
                                <span class="mandatoryPerfection">*</span>&nbsp;<span class="mandatory">*</span></td>
                            <td><bean:write name="DepositForm" property="depAmt"/>&nbsp;</td>
                        </tr>
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <span class=stp><bean:message key="label.cash.deposit.maturity.date"/></span>
                                &nbsp;<span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="DepositForm" property="depMatDate"/>&nbsp;</td>
                        </tr>
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
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="CashDeposit.do?event=read_return&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>"
                onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
        </td>

    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</body>

</html>
