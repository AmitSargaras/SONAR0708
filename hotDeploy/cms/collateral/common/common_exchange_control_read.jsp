<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script language="Javascript">
	function setVisibility1(elementID){
		var str = '<%=iCol.getIsExchangeCtrlObtained()%>';
		if(str=='Y'){
			document.getElementById(elementID).style.visibility = "visible";
		}else{
			document.getElementById(elementID).style.visibility = "hidden";
		}
	} 
</script>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
			<td><integro:empty-if-null value="<%=ExchangeControlList.getInstance().getExchangeControlItem(iCol.getIsExchangeCtrlObtained())%>"/>&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"exchangeCtrlDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.exchange.ctr.app.date" />&nbsp;<span class="mandatory" id="exchangeControlDateID" >*</span></td>
			<td ><integro:date object="<%=iCol.getExchangeCtrlDate()%>"/>
				&nbsp;</td>
		</tr>


<script language="JavaScript" type="text/JavaScript">
    <!--
	setVisibility1('exchangeControlDateID');
-->
</script>
