<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.sblcdiffccy.ISBLCDifferentCurrency,
                 java.util.Date,
                 com.integrosys.cms.app.common.util.CommonUtil"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/guarantees/gteslcdiff/GteSLCDiff_read.jsp,v 1.18 2006/10/27 08:33:34 hmbao Exp $
*
* Purpose: Read Collateral
* Description: Type - Guarantee, Subtype - Standby LC-Different CC
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:33:34 $
*/
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");

    ISBLCDifferentCurrency iCol = (ISBLCDifferentCurrency) itrxValue.getCollateral();
    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    //boolean isExpired = false;
    boolean isExpired = true;
    if (iCol.getCollateralMaturityDate() != null) {
        Date current = DateUtil.getDate();
        DateUtil.clearTime(current);
        Date maturity = (Date) CommonUtil.deepClone(iCol.getCollateralMaturityDate());
        DateUtil.clearTime(maturity);

        if (maturity.before(current)) {
            isExpired = true;
        }
    }
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");

%>
<%@ include file="/collateral/checkIsSSC.jsp"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>

</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="GteSLCDiff"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.title.view.guarantees"/></h3></td>
      <td width="50%" align="right" valign="baseline">
	    <%	    			
			hasReminder = isExpired;
	    %>
		<%@ include file="/collateral/common/common_buttons.jsp"%> 
      </td>
    </tr>
</thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
</thead>

	<%@ include file="GteSLCDiff_read_helper.jsp" %>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
