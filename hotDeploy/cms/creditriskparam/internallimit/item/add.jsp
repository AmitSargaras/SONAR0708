<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.Collection,
                 com.integrosys.base.businfra.currency.ICurrency,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.creditriskparam.internallimit.item.InternalLimitItemAction" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	try{
	CurrencyList currencyList = CurrencyList.getInstance();
	pageContext.setAttribute("currencyLabels", currencyList.getCurrencyLabels());
	pageContext.setAttribute("currencyValues", currencyList.getCurrencyValues());
%>

<script language="JavaScript" type="text/JavaScript">
<!--
	function submitForm() {
	    document.forms[0].event.value = "<%=InternalLimitItemAction.CONFIRM_ADD%>";
	    document.forms[0].submit();
	}

	function cancelForm() {
	    document.forms[0].event.value = "<%=InternalLimitItemAction.CANCEL_ADD%>";
	    document.forms[0].submit();
	}
//-->
</script>
<br>

<html:form action="InternalLimitItem.do">
<input type="hidden" name="event"/>
<%--p class="required"><font color="#0000FF">*</font> <bean:message key="title.internallimit.list"/></p--%>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">	
	<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
		<thead>
			<tr>
				<td width="83%"><h3><bean:message key="title.internallimit.item"/></h3></td>
				<td width="17%" align="right" valign="bottom"></td>
			</tr>
			<tr>
				<td colspan="2"><hr/></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
						<thead></thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname"  width="45%"><bean:message key="label.group.description"/></td>
								<td width="55%">
									<html:text property="description"/>
									<html:errors property="description"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname" ><bean:message key="label.crp.internal.limit.percentage"/></td>
								<td  id="descriptionText">
									<html:text property="internalLimitPercentage"/>&nbsp;%&nbsp;
									<html:errors property="internalLimitPercentage"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.currency"/> &nbsp;<font color="#0000FF">* </font></td>
								<td>
									<html:select property="currency">
										<html:options name="currencyValues" labelName="currencyLabels"/>
									</html:select>
									<html:errors property="currency"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname" ><bean:message key="label.crp.capital.fund.amt"/></td>
								<td>
									<html:text property="capitalFundAmount"/>
									<html:errors property="capitalFundAmount"/>
								</td>
							</tr>
						</tbody>
		            </table>
		        </td>
		    </tr>
		</tbody>
	</table>
	<table width="180" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	        <td >&nbsp;</td>
	        <td >&nbsp;</td>
	    </tr>
	    <tr>
	        <td><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();" onmouseover="MM_swapImage('Image1','','img/add2.gif',1)">
	            <img src="img/add1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a></td>
	        <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
	            <img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2"/></a></td>
	    </tr>
	    <tr>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
	    </tr>
	</table>
   </td>
</tr>
</table>
</html:form>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>