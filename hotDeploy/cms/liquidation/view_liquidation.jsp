<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.liquidation.bus.ILiquidation,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.integrosys.component.common.constant.ICompConstant"%>
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
* Purpose: For Maker and checker view the Interest Rates
* Description: view Interest Rates by Maker and Checker
*
* @author $Author: Lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>


<%
    String event = request.getParameter("event");
    System.out.println("******************************************** event = " + event);
    ILiquidation[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    OBLiquidationTrxValue obTrxValue = null;

    Collection nplInfo = (Collection)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.nplInfo");
    if (nplInfo != null)
        pageContext.setAttribute("nplInfo",nplInfo);
    String nplID = request.getParameter("nplID");

//    OBLiquidationTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    Collection expense = null ;
    Collection recovery = null ;

    boolean isToTrack = false;
    String toTrack = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isToTrack");
    if (toTrack != null && toTrack.equalsIgnoreCase("Yes")) {
    	isToTrack = true;
    }   
    DefaultLogger.debug(this,  "isToTrack = " + isToTrack );
 
    boolean isMakerCloseLiq = false;
    String makerCloseLiq = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isMakerCloseLiq");
    if (makerCloseLiq != null && makerCloseLiq.equalsIgnoreCase("Yes")) {
    	isMakerCloseLiq = true;
    }   
    DefaultLogger.debug(this,  "isMakerCloseLiq = " + isMakerCloseLiq );   
    
    if( obj!=null ) {
        obTrxValue = (OBLiquidationTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }
        if (event.equals("to_track")) 
            entries_editable = false;
        
        if (isMakerCloseLiq)
        	entries_editable = false;
        
        if( event.equalsIgnoreCase(LiquidationAction.EV_MKR_CLOSE_LIQ) || entries_editable ||
        		event.equalsIgnoreCase("to_track")) {
            if (obTrxValue.getStagingLiquidation() != null){
               expense = obTrxValue.getStagingLiquidation().getRecoveryExpense();
               recovery = obTrxValue.getStagingLiquidation().getRecovery();
               
                System.out.println("inside the getSTLiq");
            }
            System.out.println("getting from Staging");
        } else {
            if (obTrxValue.getLiquidation() != null){
               expense = obTrxValue.getLiquidation().getRecoveryExpense();
               recovery = obTrxValue.getLiquidation().getRecovery();
             
                System.out.println("inside the getLiq");
            }
            System.out.println("getting from Actual");
        }

   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'LiquidationTrxValue' ");
   }
    if (expense != null)
        pageContext.setAttribute("expense",expense);
    if (recovery != null)
        pageContext.setAttribute("recovery",recovery);

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

function callSubmit(selObj,ind) {
    temp = selObj.options[selObj.selectedIndex].value;
    if(temp=="") {
        return false;
    }else{
        document.forms[0].event.value = selObj.options[selObj.selectedIndex].value;
		document.forms[0].index.value = ind;
        document.forms[0].actionTypeName.value = selObj.options[selObj.selectedIndex].value;
		document.forms[0].submit();
    }
}

function closeEditRejected() {
    document.forms[0].action = "Liquidation.do?event=maker_close_liquidation_confirm";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="Liquidation.do">
<body>
<html:hidden property="event" value=""/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>
<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="58%" ><h3><bean:message key="label.liquidation.npl.npl.info"/></h3></td>
      <td width="42%" align="right" valign="bottom" >&nbsp; </td>
    </tr>
    <tr>
      <td colspan="2">
        <hr/></td>
    </tr>
  </thead>
  <tbody>

<%// Begin of NPL table%>

<%@include file="include_npl_info.jsp"%>


  <tbody>
  </table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_liquidation".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?event=prepare&isMenu=Y" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if("checker_view".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="Liquidation.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
