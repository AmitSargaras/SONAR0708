<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script language="Javascript">
	function setVisibility1(elementID){
		var str = '<%=aForm.getXchangeCtrlObtained()%>';
		if(str=='Y'){
			document.getElementById(elementID).style.visibility = "visible";
		}else{
			document.getElementById(elementID).style.visibility = "hidden";
		}
	} 
</script>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%"
					class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
				<td width="30%">
					<integro:empty-if-null   value="<%=ExchangeControlList.getInstance().getExchangeControlItem(aForm.getXchangeCtrlObtained())%>"/>
					&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"exchangeCtrlDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exchange.ctr.app.date"/>&nbsp;<span class="mandatory" id="exchangeControlDateID" >*</span></td>
				<td><integro:empty-if-null value="<%=aForm.getXchangeCtrlDate()%>"/></td>
			</tr>


<script language="JavaScript" type="text/JavaScript">
    <!--
	setVisibility1('exchangeControlDateID');
-->
</script>
