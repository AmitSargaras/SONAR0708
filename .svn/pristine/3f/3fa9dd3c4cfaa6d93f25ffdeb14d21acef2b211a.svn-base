<%@ page import="com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashfd.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.Collection,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.collateral.cash.cashfd.CashFdForm,
                 java.util.HashMap,
                 java.util.Iterator,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.serviceColObj");
    ICashFd iCol = (ICashFd) itrxValue.getStagingCollateral();
    pageContext.setAttribute("obj", iCol);
    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    boolean isEdit=false;
    String prefix = "Cash";
    String subtype = "CashFd";
    
    String formName = subtype + "Form";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";

    CashFdForm colForm = (CashFdForm) request.getAttribute(formName);
	String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.from");
	String systemName =  (String) request.getAttribute("systemName");
	String systemId =  (String) request.getAttribute("systemId");
	
	request.setAttribute("systemName",systemName);
	request.setAttribute("systemId",systemId);
	String prefix1 = "Cash";
	String spread = (String)request.getAttribute("spread");
	if(event.equalsIgnoreCase("update"))
	spread = String.valueOf(iCol.getSpread());
%>
<%@ include file="/collateral/locale.jsp" %>

<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
	<script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--

	/*function selectLists(){
	    List = document.forms[0].secInstrument;
	    for (i=0;i<List.length;i++){
		List.options[i].selected = true;
	    }
	}*/

	function submitPage(num, index) {
	    enableAllFormElements();
	    //selectLists();

            if (num == 1) {
                document.forms[0].event.value="submit";
            }
            if (num == 2) {
                document.forms[0].event.value="update";
            }
            if (num == 3) {
                document.forms[0].event.value="prepare";
                document.forms[0].indexID.value=index;
                document.forms[0].itemType.value="DEPOSIT";
            }
            if (num == 4) {
                document.forms[0].event.value="prepare_update_sub";
                document.forms[0].indexID.value=index;
                document.forms[0].itemType.value="DEPOSIT";
            }
            if (num == 5) {
                document.forms[0].event.value="itemDelete";
                document.forms[0].itemType.value="DEPOSIT";
            }
            if (num == 9) {
        		document.forms[0].event.value="update_read_valuation_from_los";
    			document.forms[0].indexID.value=index;
    			document.forms[0].from_page.value="prepare_update";
    		}
            document.forms[0].submit();


        }
	function submitPage1(num, index,ind) {
	    enableAllFormElements();
	    //selectLists();
           var type = document.getElementById("actionType"+ind).value;

	 if(type =="Edit"){
            
            if (num == 4) {
                document.forms[0].event.value="prepare_update_sub";
                document.forms[0].indexID.value=index;
                document.forms[0].itemType.value="DEPOSIT";
            }
	 }
	 if(type =="Delete"){
         
         if (num == 4) {
        	 
        		 document.forms[0].event.value="itemDelete";
             document.forms[0].itemType.value="DEPOSIT";
         }
	 }
           
            document.forms[0].submit();


        }

        function addDeposit(){
            window.location.href="CashDeposit.do?event=prepare&indexID=-1&subtype=CashFd";
        }

        function changeValAftMargin() {
            var margin = document.forms[0].margin.value.replace(',', '');
            var valBefMargin = 0;
            if (document.forms[0].valBefMargin.value != null && document.forms[0].valBefMargin.value != "") {
                valBefMargin = parseFloat(document.forms[0].valBefMargin.value.split(',').join(''));
            }
            document.forms[0].valAftMargin.value = Math.round((margin / 100) * valBefMargin);
        }
        function submitPage5(num, index ,sysName , sysId , cashDepositID ,recpNo) {
     	   // enableAllFormElements();
     	    //selectLists();
     //  alert('hi'+sysName);
                 if (num == 4) {
                     document.forms[0].event.value="prepare_update_sub";
                     document.forms[0].systemId.value=sysId;
                     document.forms[0].systemName.value=sysName;
                     document.forms[0].indexID.value=index;
                     document.forms[0].itemType.value="DEPOSIT";
                    document.forms[0].cashDepositID.value=cashDepositID;
                    document.forms[0].recpNo.value=recpNo;
                 }
                
                 document.forms[0].submit();


             }
        //-->
    </script>
</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/ssc.jsp" %>
<%@ include file="/collateral/check_user.jsp" %>

<html:form action="CashFdCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="indexID"/>
<input type="hidden" name="subtype" value="CashFd"/>
<input type="hidden" name="itemType"/>
<input type="hidden" name="from_page"/>
<input type="hidden" name="systemName" />
<input type="hidden" name="systemId" />
<input type="hidden" name="cashDepositID" />
<input type="hidden" name="recpNo" />
<%-- <input type="hidden" name="spread" value="<%= spread %>"/> --%>



<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.title.deposit.create"/>
			<% } else { %>
				<bean:message key="label.security.title.deposit.edit"/>
			<% } %>
		</h3></td>
    </tr>
</thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3><bean:message key="label.security.general"/></h3></td>
        <td width="50%" align="right">
            <% if (isDeleting) { %>
            <p class="deletedItem">
                DELETED
            </p>
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
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
<%@ include file="/collateral/collateral_general_common_field.jsp" %>
</tbody>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>

<%--<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <%@ include file="/collateral/common/common_legal_enforceability_update.jsp" %>
				<%@ include file="/collateral/common/common_exchange_control_update.jsp" %>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname" width="20%"><bean:message key="label.security.internet.capitalisation"/>&nbsp;<span class="mandatory">*</span></td>
                    <td width="30%">
                        <html:radio property="interest" value="true"/><bean:message key="label.common.yes"/>
                        &nbsp;&nbsp;
                        <html:radio property="interest" value="false"/><bean:message key="label.common.no"/></td>
                    <td class="fieldname" width="20%">
						<bean:message key="label.security.nature.pledge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
					<td><html:select property="natureOfCharge">
                            <option value=""><bean:message key="label.please.select"/></option>
                            <html:options name="natureOfChargeID" labelName="natureOfChargeValue"/>
                        </html:select>
                        <html:errors property="natureOfCharge"/></td>
                </tr>
				
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname"><bean:message key="label.security.amount.pledge"/>&nbsp;
                    	<span class="mandatoryPerfection">*</span></td>
                    <td><html:text property="amtCharge" size="15" maxlength="15"/>&nbsp;
                        <html:errors property="amtCharge"/> </td>
                    <td class="fieldname"><bean:message key="label.security.date.legal.pledge"/></td>
                    <td><html:text property="legalChargeDate" readonly="true" size="15" maxlength="11"/>
                        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('legalChargeDate', 'dd/mm/y')"
                             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                        <html:errors property="legalChargeDate"/></td>
						<html:hidden property="chargeId"/>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname"><bean:message key="label.security.pledge.type"/>&nbsp;
                    	<span class="mandatory">*</span></td>
                    <td><html:select property="chargeType">
                            <option value=""><bean:message key="label.please.select"/></option>
                            <html:options name="chargeID" labelName="chargeValue"/>
                        </html:select>
                        <html:errors property="chargeType"/></td>
					<td class="fieldname">
						<bean:message key="label.security.borrower.collateral" /> </td>
					<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
						<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
				</tr>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">
                    	<bean:message key="label.security.credit.card.fd"/></td>
                    <td width="30%"><html:text property="creditCardRefNumber" maxlength="50"/><html:errors property="creditCardRefNumber"/></td>
                    <td class="fieldname">
                    	<bean:message key="label.security.cgc.pledged"/></td>
                    <td width="30%">
                        <html:radio property="cgcPledged" value="<%=ICMSConstant.TRUE_VALUE%>"/><bean:message key="label.common.yes"/>
                        &nbsp;&nbsp;
                        <html:radio property="cgcPledged" value="<%=ICMSConstant.FALSE_VALUE%>"/><bean:message key="label.common.no"/>
                        <html:errors property="cgcPledged"/></td>
                </tr>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname">
                    	<span class="stp"><bean:message key="label.security.security.issuer"/></span>&nbsp;<span class="mandatory">*</span></td>
	                <td><html:text property="issuer"/>&nbsp;<html:errors property="issuer"/></td>
					<td class="fieldname">
						<bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
					<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
						<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
							 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
							 onmouseout="MM_swapImgRestore()"/>
						<html:errors property="perfectionDate"/>&nbsp;</td>
                </tr>
				
				<html:hidden property="priCaveatGuaranteeDate"/>
<!--                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
                    <td class="fieldname">
                    	<bean:message key="label.security.private.caveat"/></td>
					<td><html:text property="priCaveatGuaranteeDate" readonly="true" size="15" maxlength="11"/>
						<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
							 onclick="showCalendar('priCaveatGuaranteeDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
							 onmouseout="MM_swapImgRestore()"/>&nbsp;</td>
					<td class="fieldname">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>-->
				
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname"><bean:message key="label.security.description.fd"/>&nbsp;</td>
					<td colspan="3"><html:textarea property="description" rows="5" style="width:100%" />&nbsp;
						<html:errors property="description"/></td>
				</tr>
                <%@ include file="/collateral/common/update_security_instrument.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
<tr>
<td></td>
</tr>
</tbody>
</table>
<%@ include file="/collateral/common/update_valuation_input_into_gcms.jsp" %>

--%><%--<%@ include file="/collateral/view_pledgor.jsp" %>

<%@ include file="/collateral/view_pledge.jsp" %>

--%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
			<td width="20%"><h3>FD Rebooking</h3></td>
		<%
		System.out.println("colForm.getFdRebooking() "+itrxValue.getStagingCollateral().getFdRebooking());
		if(null!=itrxValue.getStagingCollateral().getFdRebooking() && "Y".equals(itrxValue.getStagingCollateral().getFdRebooking().trim())) {%>
		<td width="30%">
			<input type="radio" id="fdRebooking" name="fdRebooking" value="Yes" checked>Yes
            <input type="radio" id="fdRebooking" name="fdRebooking" value="No" >No 
            	</td>
            <%}else if(null!=itrxValue.getStagingCollateral().getFdRebooking() && "N".equals(itrxValue.getStagingCollateral().getFdRebooking().trim())){ %>
            <td width="30%">
			<input type="radio" id="fdRebooking" name="fdRebooking" value="Yes" >Yes
            <input type="radio" id="fdRebooking" name="fdRebooking" value="No" checked>No       
            	</td>      
            <%}else{ %>
            <td width="30%">
            <input type="radio" id="fdRebooking" name="fdRebooking" value="Yes" >Yes
            <input type="radio" id="fdRebooking" name="fdRebooking" value="No" >No   
            	</td>          
            <%} %>
		<td></td><td></td>
	</tr>
	<tr>
		<td colspan="4"><hr/></td>
	</tr>
</thead>
</table><%@ include file="/collateral/cash/cashfd/list_FixedDeposit_update.jsp" %>


<!--Update three valuation details-->
<%--<%@ include file="/collateral/common/view_system_valuation.jsp" %>
<%@ include file="/collateral/common/view_valuation_from_los.jsp" %>
<%@ include file="/collateral/common/update_netRV.jsp" %>

--%><jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>

<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>

</html:form>

<%--<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>--%>

</body>
<html:hidden name="CashFdForm" property="fdRebooking"/>
</html>
