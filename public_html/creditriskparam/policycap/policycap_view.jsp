<%@ page import="com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapTrxValue,
				 com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapGroupTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCap,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCapGroup,
                 com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapConstants"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: Marketable Securities Policy Cap - View page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>
<%
    CommonCodeList boardDescList = (CommonCodeList)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.boardDescList");

    String event = request.getParameter("event");
    String isRejectedStr = request.getParameter("isRejected");
    boolean isRejected = !(isRejectedStr == null);

    DefaultLogger.debug(this,"in policycap checker..");
    IPolicyCapGroupTrxValue obTrxValue = (IPolicyCapGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.policyCapGroupTrxValue");
    IPolicyCap[] stagingParametersArray = null;
    DefaultLogger.debug(this,"obTrxValue="+obTrxValue);
    if(obTrxValue != null) {
        stagingParametersArray = obTrxValue.getStagingPolicyCapGroup().getPolicyCapArray();
    }
    
    String bankEntityName = (String)request.getAttribute("bankEntityName");
    DefaultLogger.debug(this, ">>>>>>> bank Entity name = " + bankEntityName);
    if(bankEntityName == null ) {     //get around method for when there is error when submitting (under maker edit rejected transaction)
    	bankEntityName = request.getParameter("bankEntityName");
    }    
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage() {
    document.forms[0].event.value="maker_close";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="PolicyCap.do">
<input type="hidden" name="event"/>
<html:hidden property="isBankGroup" />
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
    <td><h3>Policy Cap Limit - (<%=request.getAttribute("stockExchangeName")%>) - <%=bankEntityName %></h3></td>
    <td align="right" valign="bottom">
</tr>
<tr>
    <td colspan="2"><hr /> </td>
</tr>
</thead>
</table>

<table id="tblExchange" width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr style="text-align:center">
    <td width="3%">S/N</td>
    <td width="10%">Board Description</td>
    <!-- 
    <td width="12%">Maximum Trading Cap<br/>
    (excluding FI Shares) </td> -->
    <td width="11%">Maximum Collateral Cap<br/>
    (excluding FI Shares)</td>
    <td width="10%">Quota Collateral Cap<br/>
    (excluding FI Shares)</td>
    <td width="12%">Maximum Collateral Cap<br/>
    (for FI Shares Only)</td>
    <td width="11%">Quota Collateral Cap<br/>
    (for FI Shares Only)</td>
    <logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
    <%-- <td colspan="2">MOA</td> --%>
    <td width="15%">Maximum Price Cap</td>
    </logic:equal>
</tr>
</thead>
<tbody>
<%
if(stagingParametersArray!=null){
	String exemptedFI = "";
    for (int i = 0; i < stagingParametersArray.length; i++) {
        IPolicyCap stagingParameter = stagingParametersArray[i];
    	exemptedFI = (PolicyCapConstants.FI_SHARES_EXEMPTED_MAP.get(stagingParameter.getBoard()) == null) ? "No" : "Yes";
        %>
        <tr class='<%=(i%2==0?"even":"odd")%>' >
            <td rowspan="1" class="index"><%=(i+1)%></td>
            <td rowspan="1" style="text-align:center">
                <integro:empty-if-null value="<%=boardDescList.getCommonCodeLabel(stagingParameter.getBoard())%>" /></td>
            <!-- 
            <td rowspan="1" style="text-align:center">
                <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getMaxTradeCapNonFI()%>" /> %</td>
            -->
            <td rowspan="1" style="text-align:center">
                <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getMaxCollateralCapNonFI()%>" /> %</td>
            <td rowspan="1" style="text-align:center">
                <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getQuotaCollateralCapNonFI()%>" /> %</td>
            <td rowspan="1" style="text-align:center">
            	<% if (exemptedFI.equals("No")) { %>
                <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getMaxCollateralCapFI()%>" /> %
                <% } else { %>
                	&nbsp;
                <% } %>
                </td>
            <td rowspan="1" style="text-align:center">
            	<% if (exemptedFI.equals("No")) { %>
                <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getQuotaCollateralCapFI()%>" /> %
                <% } else { %>
                	&nbsp;
                <% } %>
                </td>
            <logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
            <%-- <td colspan="2" style="text-align:center">Liquid <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getLiquidMOA()%>" /> %</td> --%>
            <td rowspan="1" style="text-align:center">
            <%
                if (stagingParameter.getPriceCap() != null) {
                    %><integro:empty-if-null value="<%=stagingParameter.getPriceCap().getCurrencyCode()%>" />
                    <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getPriceCap().getAmount()%>" /><%
                }
            %>
            </td>
            </logic:equal>
        </tr>
		<%--
        <tr class='<%=(i%2==0?"even":"odd")%>'>
        	<logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
            <td colspan="2" style="text-align:center">Illiquid <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getIlliquidMOA()%>" />	%</td>
            </logic:equal>
        </tr>
        --%>
        <%
    }
}
else {
    %>
    <tr class="odd">
        <td colspan="10"><bean:message key="label.global.not.found"/></td>
    </tr>
    <%   
}
%>
</tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
	   <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else if (isRejected){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?event=prepare&isMenu=Y" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else { %>
	   <td width="100%" valign="baseline" align="center"> <a href="PolicyCap.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>

<!-- InstanceEnd --></html>