<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryExpense"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBLiquidation"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.ILiquidation"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
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
* Purpose: For Maker and checker view the Expenses
*
* @author $Author: lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>

<%
    String strIndex = request.getParameter("index");
    System.out.println("strIndex = " + strIndex);
    int index = 0;
    try{index=Integer.parseInt(strIndex);}catch(Exception e){}
    
    String event = request.getParameter("event");
    System.out.println("event " + event);
    String action = "";
    
    if (LiquidationAction.EV_PREPARE_ADD_RECOVERY_EXPENSE.equals(event))
        action = "label.add.new";
    else
        action = "label.edit";
    
    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    DefaultLogger.debug(this,  "Form = " +aForm );

    OBLiquidationTrxValue obTrxValue = null;
    DefaultLogger.debug(this, "Before get NPL");
    boolean isError=false;  //if validation error...
    if(event.equals(LiquidationAction.EV_ADD_RECOVERY_EXPENSE)||event.equals(LiquidationAction.EV_EDIT_RECOVERY_EXPENSE)){
        isError=true;
    }
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
    Collection expenseTypeList = CommonCodeList.getInstance(null,null, ICMSConstant.CATEGORY_LIQ_EXPENSE_TYPE).getCommonCodeValues();
    Collection expenseTypeDescList =  CommonCodeList.getInstance(null,null,ICMSConstant.CATEGORY_LIQ_EXPENSE_TYPE).getCommonCodeLabels();;
    pageContext.setAttribute("expenseTypeList", expenseTypeList);
    pageContext.setAttribute("expenseTypeDescList", expenseTypeDescList);

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
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_LIST%>";
    document.forms[0].submit();
}
function addExpense() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_ADD_RECOVERY_EXPENSE%>";
    document.forms[0].submit();
}
function editExpense() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_EDIT_RECOVERY_EXPENSE%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="Liquidation.do">
<body>
<input type="hidden" name="index" value="<%=index%>"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.liquidation.npl.recovery.expense"/>&nbsp;-&nbsp;<bean:message key="<%=action%>"/></h3></td>
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
          <td width="20%" class="fieldname"><bean:message key="label.liquidation.npl.expense.type"/>
            <bean:message key="label.mandatory"/>
          </td>
          <td width="80%">
             <html:select property="expenseType" value="<%=aForm.getExpenseType()%>">
                <option value="">Please Select </option>
                <html:options name="expenseTypeList" labelName="expenseTypeDescList"/>
             </html:select>

          <html:errors property="expenseTypeError" />
              &nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.date.of.expense"/>
            <bean:message key="label.mandatory"/>
          </td>
          <td>
              <html:text  property="dateOfExpense"  value="<%=aForm.getDateOfExpense()%>" maxlength="12" size="11" />
              <img src="img/calendara.gif"  name="Image12" border="0" id="Image12" onclick="return showCalendar('dateOfExpense', 'dd/mm/y');" onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="dateOfExpenseError" />
          </td>
        </tr>
        <tr class="odd">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.amount"/>
            <bean:message key="label.mandatory"/>
          </td>
          <td>
              <html:select property="expenseAmtCurrency" value="<%=aForm.getExpenseAmtCurrency()%>">
                 <option value="">Please Select </option>
                 <html:options name="currencyList" labelName="currencyDescList"/>
              </html:select>

              <html:text  property="expenseAmt"  value="<%=aForm.getExpenseAmt()%>" maxlength="30" size="30" />
	          <html:errors property="expenseAmtError" />
          </td>
        </tr>
        <tr class="even">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.settled"/> </td>
          <td>
              <html:radio property="settled" value="Y" />Yes
              <html:radio property="settled" value="N" />No
	          <html:errors property="settled" />
          </td>
        </tr>
        <tr class="even">
          <td  class="fieldname"><bean:message key="label.remarks"/> </td>
          <td>
              <html:textarea  property="expenseRemarks"  rows="4"  style="width:95%" value="<%=aForm.getExpenseRemarks()%>" />
	          <html:errors property="expenseRemarksError" />
          </td>
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
   <% if(LiquidationAction.EV_PREPARE_ADD_RECOVERY_EXPENSE.equals(event) || LiquidationAction.EV_ADD_RECOVERY_EXPENSE.equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:addExpense();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else if(LiquidationAction.EV_PREPARE_EDIT_RECOVERY_EXPENSE.equals(event) || LiquidationAction.EV_EDIT_RECOVERY_EXPENSE.equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:editExpense();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
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
