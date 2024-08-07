<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.resluxury.IResidentialLuxury"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/property/propreslux/PropResLux_close.jsp,v 1.11 2006/10/27 08:37:38 hmbao Exp $
    *
    * Purpose: Process to approve Collateral
    * Description: Type - Property, Subtype - Residential Luxury
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.11 $
    * Date: $Date: 2006/10/27 08:37:38 $
    * Tag: $Name:  $
    */
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj");

    IResidentialLuxury iCol = (IResidentialLuxury) itrxValue.getStagingCollateral();

    pageContext.setAttribute("obj", iCol);
    String from_event = "close";
    boolean isProcess = false;
    boolean isTrack = false;
    String forward_page = (String)request.getParameter("event");
    if (forward_page.equals("track") || forward_page.equals("track_return")) {
        from_event = "track";
        isTrack = true;
    }

%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
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
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="PropResLuxCollateral.do">
<input type="hidden" name="event" value="close">
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="PropResLux"/>
<input type="hidden" name="from_page"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<jsp:include page="/collateral/common/common_maker_header.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
	<jsp:param name="deletingInd" value="<%=String.valueOf(isDeleting) %>" />
	<jsp:param name="secType" value="PT"/>
</jsp:include>

<%@ include file="PropResLux_read_helper.jsp" %>

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

  </tbody>
</table>

<jsp:include page="/collateral/common/common_maker_button.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
</jsp:include>
</html:form>

</body>
</html>
