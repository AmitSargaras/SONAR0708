<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.vessel.IVessel"%>

<%
    /**
    *
    * Description: Asset Based
    *
    * @author $Author: Naveen $<br>
    * @version $Revision: 1.9 $
    * Date: $Date: 2007/03/02 08:25:41 $
    * Tag: $Name:  $
    */
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");

    IVessel iCol = (IVessel) itrxValue.getStagingCollateral();

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
</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="AssetVesselCollateral.do">
<input type="hidden" name="event" value="close">
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="AssetVessel"/>
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<jsp:include page="/collateral/common/common_maker_header.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
	<jsp:param name="deletingInd" value="<%=String.valueOf(isDeleting) %>" />
	<jsp:param name="secType" value="AB"/>
</jsp:include>

<%@ include file="AssetVessel_read_helper.jsp" %>

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
