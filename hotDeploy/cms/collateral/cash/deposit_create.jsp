<%@ page import="com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.subtype.samecurrency.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 java.util.Collection,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 java.util.HashMap,
                 com.integrosys.cms.ui.collateral.cash.DepositForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>


<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function submitPage(num) {
            enableAllFormElements();

            if (num == 1) {
                document.forms[0].event.value="create";
            }
            if (num == 2) {
                document.forms[0].event.value="update";
            }
            if (num == 3) {
                document.forms[0].event.value="cancel";
            }

            document.forms[0].submit();


        }
        //-->
    </script>    
</head>

<%
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.serviceColObj");
    String subtype = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();

%>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/ssc.jsp" %>

<html:form action="CashDeposit.do">
<input type="hidden" name="event">
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>">
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>

<%
    int index = 2;
    if ("prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))) {
        index = 1;
    }
    int rowIdx = 0;

%>

<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3> <bean:message key="label.security.depoosit.infor"/> - 
				<% if (index == 1) { %> 
					<bean:message key="label.new"/> 
				<% } else { %> 
					<bean:message key="label.edit"/> 
				<% } %>
			</h3></td>
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
                            <td class="fieldname" nowrap="nowrap">
                                <span class=stp><bean:message key="label.cash.deposit.source.ref.no"/></span>&nbsp;
                                <span class="mandatoryPerfection">*</span></td>
                            <td ><html:text property="depositReceiptNo" maxlength="15"/><html:errors property="depositReceiptNo"/></td>
                        </tr>
						
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <bean:message key="label.cash.deposit.currency"/>&nbsp;
								<span class="mandatoryPerfection">*</span><span class="mandatory">*</span></td>
                            <td><html:select property="depCurr">
                                    <option value=""><bean:message key="label.please.select"/></option>
                                    <html:options name="currencyCode" labelName="currencyCode"/>
                                </html:select>&nbsp;
                                <html:errors property="depCurr"/></td>
                        </tr>
						
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class=stp><bean:message key="label.cash.deposit.amount"/></span>
								&nbsp;<span class="mandatoryPerfection">*</span>&nbsp;<span class="mandatory">*</span></td>
                            <td><html:text property="depAmt" maxlength="15"/>&nbsp;
                                <html:errors property="depAmt"/></td>
                        </tr>
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class=stp><bean:message key="label.cash.deposit.maturity.date"/></span>&nbsp;
                                <span class="mandatoryPerfection">*</span></td>
                            <td><html:text property="depMatDate" readonly="true" size="15" maxlength="11"/>
                                <img src="img/calendara.gif" name="Image73" border="0" id="Image73" onclick="showCalendar('depMatDate', 'dd/mm/y')"
                                     onmouseover="MM_swapImage('Image73','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                &nbsp; <html:errors property="depMatDate"/></td>
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
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(<%=index%>)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
        <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>

</body>
</html>
