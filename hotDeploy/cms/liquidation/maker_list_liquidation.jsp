<%@ page import="java.util.*,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.liquidation.LiquidationForm,
                 com.integrosys.cms.ui.liquidation.LiquidationAction,
                 com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome,
				 com.integrosys.cms.app.liquidation.bus.OBLiquidation,
				 com.integrosys.cms.ui.liquidation.LiquidationHelper"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/liquidation/liquidation_maker_list.jsp,v 1 2007/02/08 Lini Exp $
*
* Describe this JSP.
* Purpose: For Maker to Liquidation
*
* @author $Author: Lini$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<%
	
    String event = request.getParameter("event");
	System.out.println("event : " + event);
    OBLiquidation liquidation = (OBLiquidation)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.InitialLiquidation");
    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    Collection nplInfo = (Collection)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.nplInfo");
    if (nplInfo != null)
        pageContext.setAttribute("nplInfo",nplInfo);
    else 
    	DefaultLogger.debug(this, "******************* nplInfo is null **********************");
    
    OBLiquidationTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    Collection expense = null ;
    Collection recovery = null ;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.LiquidationTrxValue");
        obTrxValue = (OBLiquidationTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        
        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) ||
            (obTrxValue != null &&ICMSConstant.STATE_ND.equals(obTrxValue.getStatus())) ||
            isRejected ||
            event.equals(LiquidationAction.EVENT_LIST)) {
            entries_editable = true;
        }
        if (event.equals("to_track"))
            entries_editable = false;

        //todo move this check to Listcommand
        if( event.equalsIgnoreCase(LiquidationAction.EV_MKR_EDIT_LIQ_REJECT) || entries_editable) {
            if (obTrxValue.getStagingLiquidation() != null){
               expense = obTrxValue.getStagingLiquidation().getRecoveryExpense();
               recovery = obTrxValue.getStagingLiquidation().getRecovery();}
        } else{
            if (obTrxValue.getLiquidation() != null){
               expense = obTrxValue.getLiquidation().getRecoveryExpense();
               recovery = obTrxValue.getLiquidation().getRecovery();
            }
        }
    }
    else
    {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'LiquidationTrxValue' ");
    }
    
    DefaultLogger.debug(this, "liquidationTrxVal.getStatus() : " + obTrxValue.getStatus());
    		
    if (liquidation != null){
        expense = liquidation.getRecoveryExpense();
        recovery = liquidation.getRecovery();
    }
/*    if(event.equals(LiquidationAction.EVENT_LIST)) {
        entries_editable = true;
    }*/
    if( expense!=null ) {
        pageContext.setAttribute("expense",expense);
    }
    
    if( recovery!=null ) {
        pageContext.setAttribute("recovery",recovery);
    }
    
    String path = "ToDo.do?event=prepare&isMenu=Y";
    
    if (!isRejected) {
		String id = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.sess.collateralID");
		
		String flagString = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.flag1");
		int flag = (flagString == null) ? 2 : Integer.parseInt(flagString);
		
		path = LiquidationHelper.getCollateralViewPath(new Long(id).longValue(), flag);
    }
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<jsp:include page="include_js_function.jsp"/>

<script language="Javascript">
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


function submitPage() {
    <% if(isRejected ) { %>
      document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_EDIT_REJECT_LIQ_CONFIRM%>";
      document.forms[0].submit();
    <% } else { %>
      document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_EDIT_LIQ_CONFIRM%>";
      document.forms[0].submit();
    <% } %>
}
function gotoPreparePage() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_PREPARE%>";
    document.forms[0].submit();
}
</script>



<html:form action="Liquidation.do">
<html:hidden property="event" value=""/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>
<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">

<!-- InstanceEndEditable --><!-- InstanceBeginEditable name="Content" --> 
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


<%@include file="include_npl_info.jsp" %>


      <tr>
        <td colspan="2">
          <%
           if(isRejected ) {
              String paramUID = obTrxValue.getUserInfo();
              String paramRemarks = obTrxValue.getRemarks();
              if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
                  paramRemarks=" ";
              }%>
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
              <tr>
                <td width="43%" class="fieldname">Remarks</td>
                <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
              </tr>
              <tr>
                <td class="fieldname">Last Action By</td>
                <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
              </tr>
              <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
              </tr>
            </tbody>
          </table>
          <%}%>
        </td>
      </tr>
  </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>

    <tr>
      <td align="center">
        <table width="246" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
          <td width="96">&nbsp;</td>
          <td width="96">&nbsp;</td>
          <td width="54">&nbsp;</td>
          </tr>
        <tr>
          <td><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
          <td><a href="<%=isRejected?"ToDo.do?event=prepare&isMenu=Y": path %>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
        </tr>
        </table></td>
    </tr>
  </thead>
</table>
</body>
</html:form>
<!-- InstanceEndEditable -->
</head>

<!-- InstanceEnd --></html>
