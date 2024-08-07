<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.Locale,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.tradingbook.bus.ICashMargin,
                 com.integrosys.cms.app.tradingbook.trx.OBCashMarginTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For Maker and checker view the Cash Margin
* Description: view Cash Margin by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%

    String event = request.getParameter("event");
    ICashMargin[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginAction.CashMarginTrxValue");
    com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginForm aForm = (com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginForm) request.getAttribute("CashMarginForm");
    OBCashMarginTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.CashMarginTrxValue");
        obTrxValue = (OBCashMarginTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        DefaultLogger.debug(this,  "event = " +event );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_close_allcashmargin") || "to_track".equals(event)) {
           parametersArray = obTrxValue.getStagingCashMargin();
        } else {
           parametersArray = obTrxValue.getCashMargin();
        }
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'CashMarginTrxValue' ");
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

function closeEditRejected() {
    document.forms[0].action = "CashMargin.do?event=maker_close_allcashmargin_confirm";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="CashMargin.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:hidden property="lEID" value="<%=String.valueOf(obTrxValue.getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>

<%@ include file="../deal/cp_agreement_common_page.jsp"%> 

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.cash.margin.title"/></h3></td>
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
          <thead>
            <tr class="tblInfo">
              <td width="15%"><bean:message key="label.cash.margin.sn"/></td>
              <td width="30%"><bean:message key="label.cash.margin.transaction.date"/></td>
              <td width="15%"><bean:message key="label.cash.margin.plus.minus"/></td>
              <td width="20%"><bean:message key="label.cash.margin.net.act.principal"/></td>
              <td width="20%"><bean:message key="label.cash.margin.interest"/></td>
            </tr>
          </thead>
          <tbody>
          <%
          if( aForm != null )
          {
              String[] cashMarginID = aForm.getDisplayCashMarginID();
              String[] trxDate = aForm.getDisplayTrxDate();
              String[] napSignAddValue = aForm.getDisplayNapSignAddValue();
              String[] napAmount = aForm.getDisplayNapValue();
              String[] cashInterest = aForm.getDisplayCashInterest();
              for (int i = 0; i < cashMarginID.length; i++) {
                //ICashMargin parameter = parametersArray[i];
          %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
                <html:hidden property="cashMarginID" value="<%=cashMarginID[i]%>"/>
                <td class="index"><%=(i+1)%></td>
                <td><integro:empty-if-null value="<%=trxDate[i]%>"/>&nbsp;</td>
                <td>
                  <%if(napSignAddValue[i].equals("Y")){%>
                  +
                  <%}else{%>
                  -
                  <%}%>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=napAmount[i]%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=cashInterest[i]%>"/>&nbsp;</td>
            </tr>
          <%}
            String totalCashInterest = aForm.getDisplayTotalCashInterest();
          %>

            <tr class='even' >
                <td colspan="3" align="right">Total</td>
                <td>&nbsp;</td>
                <td><integro:empty-if-null value="<%=totalCashInterest%>"/>&nbsp;</td>
            </tr>
          <%} else { %>
          	<tr class="odd">                 
		    	td colspan="5">There is no cash margin information.</td>
            </tr>
          <% } %>
          </tbody>
          
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>

  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_allcashmargin".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
