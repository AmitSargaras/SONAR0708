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
			<td width="20%" class="fieldname"><bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
			<td width="30%">
				<html:select property="xchangeCtrlObtained" onchange="setVisibility1('exchangeControlDateID')" styleId="exchangeControlID">
					<option value=""><bean:message key="label.please.select"/> </option>
					<html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
				</html:select>
				<html:errors property="xchangeCtrlObtained"/> </td>
			<td class="fieldname"><bean:message key="label.security.exchange.ctr.app.date"/><span class="mandatory" id="exchangeControlDateID" >*</span></td>
			<td><html:text property="xchangeCtrlDate" readonly="true"/>
				<img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('xchangeCtrlDate', 'dd/mm/y')"
					onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>					<html:errors property="xchangeCtrlDate" /></td>
		</tr>

<script language="Javascript">
<!--
	setVisibility1('exchangeControlDateID');
-->
</script>
