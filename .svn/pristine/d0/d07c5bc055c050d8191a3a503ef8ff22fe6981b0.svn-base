<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/liquidation/interest_rate_maker_list.jsp,v 1 2007/02/09 Lini Exp $
*
* Describe this JSP.
* Purpose: For Maker and checker Add edit the Income
*
* @author $Author: lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>


<%
    String recoveryType = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.recoveryType");
    System.out.println("recoveryType = " + recoveryType);
    recoveryType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE,recoveryType);
    
    String index = request.getParameter("index");
    System.out.println("index = " + index);
    String oindex = request.getParameter("oindex");
    System.out.println("oindex = " + oindex);
    
    String event = request.getParameter("event");
    String action = "";
    if (LiquidationAction.EV_PREPARE_ADD_RECOVERY_INCOME.equals(event))
        action = "label.add.new";
    else
        action = "label.edit";

    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    DefaultLogger.debug(this,  "Form = " +aForm );

    OBLiquidationTrxValue obTrxValue = null;
    DefaultLogger.debug(this, "Before get NPL");

/*
    OBRecoveryExpense recoveryExpense = (OBRecoveryExpense)request.getAttribute("recoveryExpense");
    if (recoveryExpense != null)
        pageContext.setAttribute("recoveryExpense",recoveryExpense);
*/

    if( obj!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.OBLiquidationTrxValue");
        obTrxValue = (OBLiquidationTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        DefaultLogger.debug(this,  "event = " +event );

    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'LiquidationTrxValue' ");
    }


    //todo get collateral location from security
    String[] securityLoc = new String[1];
    securityLoc[0]=(String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.collateralLoc");
    securityLoc[0]="SG";

    HashMap currency = (HashMap)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.currency.map");
    if (currency != null){
        System.out.println("currency Map  = " + currency );
        pageContext.setAttribute("currencyList", currency.get("Values"));
        pageContext.setAttribute("currencyDescList", currency.get("Labels"));
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
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" type="text/JavaScript">
<!--
function gotoListing() {
    <%--document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_LIST%>";--%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_PREPARE_EDIT_RECOVERY%>";
    document.forms[0].submit();
}
function addIncome() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_ADD_RECOVERY_INCOME%>";
    document.forms[0].submit();
}
function editIncome() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_EDIT_RECOVERY_INCOME%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%@include file="include_isChecker.jsp"%>
<html:form action="Liquidation.do">
<body>
<input type="hidden" name="index" value="<%=index%>"/>
<input type="hidden" name="oindex" value="<%=oindex%>"/>
<!-- InstanceBeginEditable name="Content" -->
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
        <tr class="even">
          <td width="30%" class="fieldname"><bean:message key="label.liquidation.npl.recovery.date"/><bean:message key="label.mandatory"/></td>
          <td width="70%">
              <html:text property="dateAmtRecovered" value="<%=aForm.getDateAmtRecovered()%>" maxlength="12" size="12"/>&nbsp;
              <img src="img/calendara.gif"  name="Image12" border="0" id="Image12" onclick="return showCalendar('dateAmtRecovered', 'dd/mm/y');" onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="dateAmtRecoveredError" />
              &nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.liquidation.npl.recovery.type"/><bean:message key="label.mandatory"/></td>
          <td>
              <integro:empty-if-null value="<%=recoveryType%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.total.amount.recovered"/> <bean:message key="label.mandatory"/></td>
          <td>
              <html:select property="amtRecoveredCurrency" > 
                 <option value="">Please Select </option>
                 <html:options name="currencyList" labelName="currencyDescList"/>
              </html:select>

              <html:text  property="amtRecovered"  value="<%=aForm.getAmtRecovered()%>" maxlength="30" size="30" />
	          <html:errors property="amtRecoveredError" />
              &nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.remarks"/> </td>
          <td><html:textarea  property="amtRecoveryRemarks" rows="4" style="width:95%" value="<%=aForm.getAmtRecoveryRemarks()%>" />
	          <html:errors property="amtRecoveryRemarksError" />&nbsp;</td>
        </tr>
        </tbody>
      </table>
      </td>
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
   <% if(LiquidationAction.EV_PREPARE_ADD_RECOVERY_INCOME.equals(event) || LiquidationAction.EV_ADD_RECOVERY_INCOME.equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:addIncome();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if(LiquidationAction.EV_PREPARE_EDIT_RECOVERY_INCOME.equals(event) || LiquidationAction.EV_EDIT_RECOVERY_INCOME.equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:editIncome();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if(LiquidationAction.EV_CHECKER_VIEW.equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="Liquidation.do?event=<%=LiquidationAction.EVENT_PREPARE%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
