<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.liquidation.bus.ILiquidation,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBNPLInfo"%>
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
<%@include file="include_isChecker.jsp"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/systemparameters/assetlife/assetlife_maker_view.jsp,v 1 2007/01/30 Lini Exp $
*
* Describe this JSP.
* Purpose: For Maker and Checker to view Maintain Asset Life Parameters
* Description: view the detail of Maintain Asset Life Parameters
*
* @author $Author: Lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/01/30$
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    OBLiquidationTrxValue obTrxValue = null;

    OBNPLInfo npl = (OBNPLInfo)request.getAttribute("npl");
    if (npl != null) {
        pageContext.setAttribute("npl",npl);
    }
    
    String nplID = request.getParameter("nplID");

    boolean isToTrack = false;
    String toTrack = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isToTrack");
    if (toTrack != null && toTrack.equalsIgnoreCase("Yes")) {
    	isToTrack = true;
    } 
    System.out.println("ToTrack : " + isToTrack); 

    boolean isMakerCloseLiq = false;
    String makerCloseLiq = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isMakerCloseLiq");
    if (makerCloseLiq != null && makerCloseLiq.equalsIgnoreCase("Yes")) {
    	isMakerCloseLiq = true;
    }   
    DefaultLogger.debug(this,  "isMakerCloseLiq = " + isMakerCloseLiq );   
    
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
    document.forms[0].action = "Liquidation.do?event=maker_close_liquidation_confirm";
    document.forms[0].submit();
}
function gotoListing() {
<%if (isSACChecker && !isToTrack){%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_CHKR_EDIT_LIQ%>";
<%}else{%>
   <% if (isToTrack) { %>
    	document.forms[0].action = "Liquidation.do?event=to_track";
    <%}else if (isMakerCloseLiq) {%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_CLOSE_LIQ%>";
    <%} else {%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_LIST%>";
    <%}%>
<%}%>
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="Liquidation.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3>NPL Details</h3></td>
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
          <td width="20%" class="fieldname"><bean:message key="label.liquidation.npl.account.no"/></td>
          <td width="30%"><integro:empty-if-null value="<%=npl.getAccountNo()%>"/></td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.nplstatus"/> </td>
          <td><integro:empty-if-null value="<%=npl.getStatus()%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.npldate"/> </td>
          <td><integro:date object="<%=npl.getNplDate()%>" />&nbsp;</td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.carcode"/> </td>
          <td><integro:empty-if-null value="<%=npl.getCarCode()%>"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.liquidation.npl.cardate"/> </td>
          <td><integro:date object="<%=npl.getCarDate()%>" />&nbsp;</td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.amount.partial.written.off"/> </td>
          <td><integro:empty-if-null value="<%=String.valueOf(npl.getAmountPartialWrittenOff())%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.settled"/> </td>
          <td><integro:empty-if-null value="<%=npl.getSettled()%>"/>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.interest.suspense"/> </td>
          <td><integro:empty-if-null value="<%=String.valueOf(npl.getInterestinSuspense())%>"/>&nbsp;</td>
        </tr>
        <%--         
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.interest.suspense"/> </td>
          <td>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.date.vehicle.disposed"/> </td>
          <td><!--  integro:date object="<% // npl.getDateVehicleDisposed()%>" / - ></td>
        </tr>
        --%>
        <tr class="odd">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.date.npl.account.regularised"/> </td>
          <td><integro:date object="<%=npl.getDateNPLRegularised()%>" /></td>
          <td  class="fieldname"><bean:message key="label.liquidation.npl.facility.type"/> </td>
          <td><% 
          		if (npl.getFacilityTypeList() != null && npl.getFacilityTypeList().size() > 0) {
          			Collection list = npl.getFacilityTypeList();
          			int count = 0;
          			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
          				out.println((String)iterator.next());
          				if (++count != list.size())
          					out.println("<br>");
          			}
	          	 } else {
	          	 	out.println("-");
	          	 }
          	  %>
          </td>
        </tr>
		<%--
        <tr class="even">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.date.repossesed"/> </td>
          <td><!-- integro:date object="<% // npl.getDateRepossesed()%>" / ></td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.facility.type"/> </td>
          <td><integro:empty-if-null value="<%=npl.getFacilityType()%>"/>&nbsp;</td>
        </tr>
		--%>
        <tr class="odd">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.specific.charge.account"/> </td>
          <td><integro:empty-if-null value="<%=String.valueOf(npl.getSpecProvisionChrgAcc()) %>"/>&nbsp;</td>
          <td  class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>		
        <tr class="odd">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.account.status"/> </td>
          <td><integro:empty-if-null value="<%=npl.getAccountStatus()%>"/>&nbsp;</td>
          <td  class="fieldname"><bean:message key="label.liquidation.npl.part.payment.received"/> </td>
          <td><integro:empty-if-null value="<%=new Long(npl.getPartPaymentReceived())%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.latest.date.doubtful"/> </td>
          <td><integro:date object="<%=npl.getLatestDateDoubtful()%>" /></td>
          <td  class="fieldname"><bean:message key="label.liquidation.npl.judgement.date"/> </td>
          <td><integro:date object="<%=npl.getJudgementDate()%>" /></td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.liquidation.npl.judgement.sum"/> </td>
          <td><integro:empty-if-null value="<%=new Long(npl.getJudgementSum())%>"/>&nbsp;</td>
          <td  class="fieldname"><bean:message key="label.liquidation.npl.date.write.off"/> </td>
          <td><integro:date object="<%=npl.getDateWriteOff()%>" /></td>     
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.amount.written.off"/></td>
          <td><integro:empty-if-null value="<%=new Long(npl.getAmountWrittenOff())%>"/>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.liquidation.npl.months.instalment.arrears"/> </td>
          <td><integro:empty-if-null value="<%=new Long(npl.getMonthsInstalmentsArrears())%>"/>&nbsp;</td>     
        </tr>
		<%-- 
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.liquidation.npl.civil.suit.no"/> </td>
          <td><integro:empty-if-null value="<% // npl.getCivilSuitNo()%>"/>&nbsp;</td>
          <td  class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        --%>
        <tr class="odd">
          <td  class="fieldname"><bean:message key="label.liquidation.npl.months.interest.arrears"/> </td>
          <td><integro:empty-if-null value="<%=new Long(npl.getMonthsInterestArrears())%>"/>&nbsp;</td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
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
   <%if("to_track".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_liquidation".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if("checker_view".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="Liquidation.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%} else { %>
   		<!-- td width="100%" valign="baseline" align="center"> <a href="Liquidation.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td> -->
   		<td width="100%" valign="baseline" align="center" > <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /></a></td>
   <% } %>

  </tr>
</table>
<!-- InstanceEndEditable -->
<input type="hidden" value="" />
</body>
</html:form>

<!-- InstanceEnd -->
</html>
