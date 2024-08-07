
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@page import="com.integrosys.cms.ui.collateral.pledge.PledgeForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap"%>
<%@page import="java.util.*"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	String[] style = { "even", "odd" };
	int count = 1;
	PledgeForm form = (PledgeForm) request.getAttribute("PledgeForm");
	Map limitMap = (Map) request.getAttribute("limitMap");
	List limitCode = null;
	List limitLabel = null;
	if (limitMap != null) {
		limitCode = (List)limitMap.get("limitCode");
		limitLabel = (List)limitMap.get("limitLabel");
	}
	String event = form.getEvent();
%>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function cancel_form() {
	   	document.forms[0].event.value="cancel";
	    document.forms[0].submit();
	}
	function create() {
		checkPledgeDrawAmount();
		document.forms[0].event.value="create_pledge";
		document.forms[0].submit();
	}
	function update() {
		checkPledgeDrawAmount();
		document.forms[0].event.value="update_pledge";
		document.forms[0].submit();
	}
    function refresh_form(str) {
		document.forms[0].limitId.value=str;
        document.forms[0].submit();
    }

    function selectRadio(rad, field) {
	    if (field == 'pledge') {
		   document.forms[0].chargeInfoUsageIndicator[rad].checked = true;
	    }
	    else if (field == 'draw') {
		    document.forms[0].amountDrawIndicator[rad].checked = true; 
	    }
    }
    
    function updateIndicator(field, value) {
	    if (field == 'pledge') {
		   document.forms[0].chargeInfoUsageIndicator.value = value;
	    }
	    else if (field == 'draw') {
		    document.forms[0].amountDrawIndicator.value = value; 
	    }
    }
    
    function checkPledgeDrawAmount() {
	    if (document.forms[0].chargeInfoUsageIndicator[0].checked) {
		    document.forms[0].pledgeAmount.value = '';
	    }
	    else {
		    document.forms[0].pledgeAmountPercentage.value = '';
	    }
	    
	   	if (document.forms[0].amountDrawIndicator[0].checked) {
		    document.forms[0].amountDraw.value = '';
	    }
	    else {
		    document.forms[0].amountDrawPercentage.value = '';
	    }
    }
</script>
<html:form action="<%=actionNameStr%>">
<html:hidden property="event" />
<html:hidden property="limitId" />
<html:hidden property="facilityId" />
<html:hidden property="sibsFacilityCode" />
<html:hidden property="sciSysGenId" />
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>">

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
		<td> <h3><bean:message key="label.pledge.add.linkage.title"/></h3></td>
		</tr>
		<tr>
		<td><hr/></td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td colspan="2">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td colspan="4"><bean:message key="label.facility.collateral.information"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname" width="20%"><bean:message key="label.collateral.type"/> </td>
				<td width="30%"><bean:write name="PledgeForm" property="collateralType"/>&nbsp;</td>
				<td class="fieldname" width="20%"><bean:message key="label.collateral.subtype"/></td>
				<td width="30%"><bean:write name="PledgeForm" property="collateralSubType"/>&nbsp;</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.collateral.id"/> </td>
				<td><bean:write name="PledgeForm" property="collateralId"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.collateral.sibs.id"/></td>
				<td><bean:write name="PledgeForm" property="sibsCollateralId"/>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td colspan="4"><bean:message key="label.facility.information"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname" width="20%"><bean:message key="label.pledge.facility.no"/> <bean:message key="label.mandatory" /></td>
				<td width="30%">
					 <html:select property="facilityNo" onchange="refresh_form(this.value);">
                     <option value="" selected><bean:message key="label.please.select"/></option>
                     <% for (int i = 0; i < limitCode.size(); i++) { %>
                     <option value="<%=limitCode.get(i)%>" <%=limitCode.get(i).equals(form.getFacilityNo()) ? "selected" : ""%>><%=limitLabel.get(i)%></option>
                     <% } %>
                     </html:select><html:errors property="facilityNo"/>
				</td>
				<td class="fieldname" width="20%"><bean:message key="label.facility.description"/></td>
				<td width="30%"><%if (form.getFacilityDescription() != null) { %><integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=form.getFacilityDescription() %>" display="true"/><%}else { %>-<%} %></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.sibs.application.no"/> </td>
				<td><bean:write name="PledgeForm" property="sibsApplicationNo"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.pledge.sibs.facility.code"/></td>
				<td><bean:write name="PledgeForm" property="sibsFacilityCode"/>&nbsp;</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.sibs.facility.seq"/> </td>
				<td><bean:write name="PledgeForm" property="sibsFacilitySeq"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.pledge.activate.limit"/></td>
				<td><bean:write name="PledgeForm" property="activatedLimit"/>&nbsp;</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.approved.limit"/> </td>
				<td><bean:write name="PledgeForm" property="approvedLimit"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td colspan="4"><bean:message key="label.security.charge.infor"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname" width="15%"><bean:message key="label.pledge.amount"/> <bean:message key="label.mandatory" /></td>
				<td width="85%">
					<html:radio property="chargeInfoUsageIndicator" 
						value="<%=String.valueOf(ICollateralLimitMap.CHARGE_INFO_PERCENTAGE_USAGE) %>" 
						onclick="updateIndicator('pledge', this.value)"></html:radio>
					<html:text property="pledgeAmountPercentage" size="12" onkeyup="selectRadio(0, 'pledge');"></html:text>&nbsp;%&nbsp;
					<html:errors property="pledgeAmountPercentage"/>
					<html:radio property="chargeInfoUsageIndicator" 
						value="<%=String.valueOf(ICollateralLimitMap.CHARGE_INFO_AMOUNT_USAGE) %>"
						onclick="updateIndicator('pledge', this.value)"></html:radio>
					<bean:write name="PledgeForm" property="currency"/>&nbsp;<html:text property="pledgeAmount" size="12" onkeyup="selectRadio(1, 'pledge');"></html:text>
					<html:errors property="pledgeAmount"/>
				</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.amount.draw"/> <bean:message key="label.mandatory" /></td>
				<td>
					<html:radio property="amountDrawIndicator" 
						value="<%=String.valueOf(ICollateralLimitMap.CHARGE_INFO_PERCENTAGE_USAGE) %>"
						onclick="updateIndicator('draw', this.value)"></html:radio>
					<html:text property="amountDrawPercentage" size="12" onkeyup="selectRadio(0, 'draw');"></html:text>&nbsp;%&nbsp;
					<html:errors property="amountDrawPercentage"/>
					<html:radio property="amountDrawIndicator" 
						value="<%=String.valueOf(ICollateralLimitMap.CHARGE_INFO_AMOUNT_USAGE) %>"
						onclick="updateIndicator('draw', this.value)"></html:radio>
					<bean:write name="PledgeForm" property="currency"/>&nbsp;<html:text property="amountDraw" size="12" onkeyup="selectRadio(1, 'draw');"></html:text>
					<html:errors property="amountDraw"/>
				</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		</tr>
		<tr valign="top">
		<td align="center">
		<%if (CollateralAction.EVENT_PREPARE_ADD_PLEDGE.equals(event)) { %>
			<a href="#" onclick="create()" onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
			src="img/ok1.gif" name="Image3311" border="0" id="Image331"
			width="60" height="22" /></a>
		<%} else {%>
			<a href="#" onclick="update()" onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
			src="img/ok1.gif" name="Image3311" border="0" id="Image331"
			width="60" height="22" /></a>
		<%} %>

			<a href="javascript:cancel_form();" onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
			src="img/cancel1.gif" name="Image2" width="70" height="20"
			border="0" id="Image2" /></a>
		</td>
		</tr>
	</tbody>
</table>
</html:form>