<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.corprelated.ICorporateRelated"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gtecorprel/GteCorpRel_close.jsp,v 1.11 2006/10/27 08:33:02 hmbao Exp $
*
* Purpose: Process to approve Collateral
* Description: Type - Guarantee, Subtype - Corporate - Related
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.11 $
* Date: $Date: 2006/10/27 08:33:02 $
*/
%>

<%	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.serviceColObj");

    ICorporateRelated iCol = (ICorporateRelated) itrxValue.getStagingCollateral();

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

<html:form action="GteCorpRelCollateral.do">
<input type="hidden" name="event" value="close">
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="GteCorpRel"/>
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<jsp:include page="/collateral/common/common_maker_header.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
	<jsp:param name="deletingInd" value="<%=String.valueOf(isDeleting) %>" />
	<jsp:param name="secType" value="GT"/>
</jsp:include>

<%@ include file="GteCorpRel_read_helper.jsp" %>

<jsp:include page="/collateral/common/common_maker_button.jsp">
	<jsp:param name="trackInd" value="<%=String.valueOf(isTrack) %>"/>
</jsp:include>
</html:form>

</body>
</html>

