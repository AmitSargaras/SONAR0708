<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetpostdatedchqs/AssetPostDatedChqs_close.jsp,v 1.10 2006/10/27 08:24:49 hmbao Exp $
    *
    * Purpose: Process to approve Collateral
    * Description: Asset Based
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.10 $
    * Date: $Date: 2006/10/27 08:24:49 $
    * Tag: $Name:  $
    */
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
    IAssetPostDatedCheque iCol = (IAssetPostDatedCheque) itrxValue.getStagingCollateral();
    String collateralID=(String)request.getParameter("collateralID");
    pageContext.setAttribute("obj", iCol);
    String from_event = "close";
    boolean isProcess = false;
    boolean isTrack = false;
    String trxID= (String)request.getAttribute("trxID");
    String forward_event = (String)request.getParameter("event");
    if (forward_event.equals("track") || forward_event.equals("track_return")) {
        from_event = "track";
        isTrack = true;
    }
 
    DateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
    String prefix1 = "Asset";
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="java.text.DateFormat"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage() {

    document.forms[0].submit();

}
//-->
</script>

</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="AssetPostDatedChqsCollateral.do">

<input type="hidden" name="event" value="close">

<input type="hidden" name="pdcEvent" value=<%="close_totrack" %> >

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<jsp:include page="/collateral/common/common_maker_header.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
	<jsp:param name="deletingInd" value="<%=String.valueOf(isDeleting) %>" />
	<jsp:param name="secType" value="AB"/>
</jsp:include>

<%@ include file="AssetPostDatedChqs_read_helper.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
     <tr>
       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
           <tbody>
             <tr>
               <td class="fieldname"><bean:message key="label.last.action.by"/></td>
               <td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
             </tr>
             <tr class="odd">
               <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
               <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
             </tr>
           </tbody>
         </table></td>
     </tr>
  </tbody>
</table>

<jsp:include page="/collateral/common/common_maker_button.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
</jsp:include>
</html:form>

</body>
</html>
