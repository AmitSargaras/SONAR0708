<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.IRecoveryIncome"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBLiquidation"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecovery"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@include file="include_isChecker.jsp"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/liquidation/interest_rate_maker_list.jsp,v 1 2007/02/09 Lini Exp $
*
* Describe this JSP.
* Purpose: For Maker and checker Add view the Income
*
* @author $Author: lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    String action = "";
    
    String index = request.getParameter("index");
    System.out.println("index = " + index);
    String oindex = request.getParameter("oindex");
    System.out.println("oindex = " + oindex);
    
    if (LiquidationAction.EV_VIEW_RECOVERY_INCOME.equals(event))
        action = "label.view";
    else
        action = "label.add.new";

    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");

    OBLiquidationTrxValue obTrxValue = null;
    
    boolean isProcess = false;

    if (isSACChecker){
        isProcess = true;
    }
    
    boolean isToTrack = false;
    String toTrack = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isToTrack");
    if (toTrack != null && toTrack.equalsIgnoreCase("Yes")) {
    	isToTrack = true;
    	isProcess = false;
    } 
    
    boolean isMakerCloseLiq = false;
    String makerCloseLiq = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isMakerCloseLiq");
    if (makerCloseLiq != null && makerCloseLiq.equalsIgnoreCase("Yes")) {
    	isMakerCloseLiq = true;
    } 
    
    IRecoveryIncome actualRecoveryIncome = (IRecoveryIncome)request.getAttribute("actualRecoveryIncome");
    IRecoveryIncome stageRecoveryIncome = (IRecoveryIncome)request.getAttribute("stageRecoveryIncome");

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
function gotoListing() {
<%if (isSACChecker && !isToTrack){%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_VIEW_RECOVERY%>";
<%}else{%>
   <% if (isToTrack) { %>
    	<%--document.forms[0].action = "Liquidation.do?event=to_track";--%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_VIEW_RECOVERY%>";
    <%}else if (isMakerCloseLiq) {%>
    	<%--document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_CLOSE_LIQ%>";--%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_VIEW_RECOVERY%>";       	
    <%}else{%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_VIEW_RECOVERY%>";
    <%}%>
<%}%>
    document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_CLOSE_LIQ_CONFIRM%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="Liquidation.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<input type="hidden" name="index" value="<%=index%>"/>
<input type="hidden" name="oindex" value="<%=oindex%>"/>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.liquidation.npl.recovery.income"/>&nbsp;-&nbsp;<bean:message key="<%=action%>"/></h3></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.liquidation.npl.recovery.type"/></td>
          <td width="30%">
              <bean:write name="LiquidationForm" property="recoveryType"/>&nbsp;</td>
        </tr>
        <tr class="even">
        	<%
	        	boolean differenceFound = false;
	        	if (actualRecoveryIncome != null && stageRecoveryIncome != null && !differenceFound) {
					if (actualRecoveryIncome.getTotalAmountRecovered() != null) {
	        			if (actualRecoveryIncome.getTotalAmountRecovered().getAmountAsDouble() ==
	        				stageRecoveryIncome.getTotalAmountRecovered().getAmountAsDouble() &&
	        				actualRecoveryIncome.getTotalAmountRecovered().getCurrencyCode().equals(
	        						stageRecoveryIncome.getTotalAmountRecovered().getCurrencyCode())) 
	        		
	        				differenceFound = false;
	        			else
	        				differenceFound = true;
					} else
						differenceFound = true;
				}else 
					differenceFound = true;
        	%>
          <td class="<%=isProcess?((!differenceFound)?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.liquidation.npl.total.amount.recovered"/> </td>
          <td><bean:write name="LiquidationForm" property="amtRecoveredCurrency"/><bean:write name="LiquidationForm" property="amtRecovered"/>&nbsp;</td>
        </tr>
         <tr class="odd">
          <td class="<%=isProcess?(CompareOBUtil.compOB(actualRecoveryIncome,stageRecoveryIncome,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/> </td>
          <td><bean:write name="LiquidationForm" property="amtRecoveryRemarks"/>&nbsp;</td>
        </tr>

        </tbody>
      </table>    </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>
      </tbody>
    </table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
      <td> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
