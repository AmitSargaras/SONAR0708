<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryExpense"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.ILiquidation"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
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
<%@include file="include_isChecker.jsp"%>

<%
    String event = request.getParameter("event");
    String action = "label.view";
    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    OBLiquidationTrxValue obTrxValue = (OBLiquidationTrxValue)obj;
    String strIndex = request.getParameter("index");

    int index = 0;
    try{index=Integer.parseInt(strIndex);}catch(Exception e){}
    
    boolean isMakerCloseLiq = false;
    String makerCloseLiq = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isMakerCloseLiq");
    if (makerCloseLiq != null && makerCloseLiq.equalsIgnoreCase("Yes")) {
    	isMakerCloseLiq = true;
    }      
    
    boolean isProcess = false;
    
    if (isSACChecker){
        isProcess = true;
    }
    
    OBRecoveryExpense obExpense = null;
    OBRecoveryExpense obStageExpense = null;
    
    if (isProcess){
        obExpense = (OBRecoveryExpense)request.getAttribute("actualExpense");
        obStageExpense = (OBRecoveryExpense)request.getAttribute("stageExpense");
    	
    }
    
    boolean isToTrack = false;
    String toTrack = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isToTrack");
    if (toTrack != null && toTrack.equalsIgnoreCase("Yes")) {
    	isToTrack = true;
    	isProcess = false;
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
<script type="text/javascript" >
function gotoListing() {
<%if (isSACChecker && !isToTrack){%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_CHKR_EDIT_LIQ%>";
<%}else{%>
   <% if (isToTrack) { %>
    	document.forms[0].action = "Liquidation.do?event=to_track";
    <%}else if (isMakerCloseLiq) {%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_CLOSE_LIQ%>";    	
    <%}else{%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_LIST%>";
    <%}%>
<%}%>
    document.forms[0].submit();
}
</script>

<!-- InstanceEndEditable -->
</head>
<html:form action="Liquidation.do">
<body>
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
          <td width="10%" class="<%=isProcess?(CompareOBUtil.compOB(obExpense,obStageExpense,"expenseType")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.liquidation.npl.expense.type"/></td>
          <td width="30%">
              <integro:empty-if-null value="<%=aForm.getExpenseType()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="<%=isProcess?(CompareOBUtil.compOB(obExpense,obStageExpense,"dateOfExpense")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.liquidation.npl.date.of.expense"/> </td>
          <td>
            <integro:empty-if-null value="<%=aForm.getDateOfExpense()%>"/>&nbsp;</td>
        </tr>
        <tr class="odd">
        	<%
        		String classStyle = "";
        		System.out.println(isToTrack + " " + isProcess);
        		System.out.println("obExpense " + obExpense);
        		if (isToTrack || !isProcess)
        			classStyle = "fieldname";
        		else { 
        			if (obExpense != null && obStageExpense != null) {
        				if (obExpense.getExpenseAmount() != null) {
        			
		        			if (obExpense.getExpenseAmount().getAmountAsDouble() ==
		        				obStageExpense.getExpenseAmount().getAmountAsDouble() &&
		        				obExpense.getExpenseAmount().getCurrencyCode().equals(
		            				obStageExpense.getExpenseAmount().getCurrencyCode())) 
		        		
								classStyle = "fieldname";
		        			else
		        				classStyle = "fieldnamediff";
        				} else
        					classStyle = "fieldnamediff";
        			}else 
        				classStyle = "fieldnamediff";
        		}
        	%>
        	
          <td class="<%=classStyle%>">
          		<bean:message key="label.liquidation.npl.amount"/> 
          </td>          
          <td>
          	  <%=aForm.getExpenseAmtCurrency()%>&nbsp;<integro:empty-if-null value="<%=aForm.getExpenseAmt()%>"/>
          </td>
        </tr>
        <tr class="even">
        	<td class="<%=isProcess?(CompareOBUtil.compOB(obExpense,obStageExpense,"settled")?"fieldname":"fieldnamediff"):"fieldname"%>">
          		<bean:message key="label.liquidation.npl.settled"/>
          </td>
           <td>
              <%=(aForm.getSettled() == null) ? "No" : ((aForm.getSettled().equals("Y")) ? "Yes" : "No") %>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=isProcess?(CompareOBUtil.compOB(obExpense,obStageExpense,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.remarks"/> </td>
          <td>                         
              <integro:empty-if-null value="<%=aForm.getExpenseRemarks()%>"/>&nbsp;</td>
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
     <td> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
