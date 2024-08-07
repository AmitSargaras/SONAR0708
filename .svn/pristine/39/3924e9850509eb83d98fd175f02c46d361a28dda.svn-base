<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script language="Javascript">
	function setVisibility1(elementID){
		var str = document.getElementById("exchangeControlID").value;
		if(str=='Y'){
			document.getElementById(elementID).style.visibility = "visible";
		}else{
			document.getElementById(elementID).style.visibility = "hidden";
		}
	} 
</script>


		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.exchange.ctr.app" /></td>
			<td><html:select property="exchangeControl" onchange="setVisibility1('exchangeControlDateID')" styleId="exchangeControlID">
					<option value=""><bean:message key="label.please.select"/></option>
					<html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
				</html:select>&nbsp;</td>
			<td class="fieldname">
				<bean:message key="label.security.exchange.ctr.app.date" />&nbsp;
				<span class="mandatory" id="exchangeControlDateID" >*</span></td>
			<td><html:text property="exchangeControlDate" readonly="true" size="15" maxlength="11" />
				<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
					 onclick="showCalendar('exchangeControlDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
					 onmouseout="MM_swapImgRestore()"/>
				<html:errors property="exchangeControlDate"/>
			</td>
		</tr>

<script language="Javascript">
<!--
	setVisibility1('exchangeControlDateID');
-->
</script>
