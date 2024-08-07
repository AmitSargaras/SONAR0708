<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashfd.ICashFd,
                 com.integrosys.cms.ui.collateral.CheckEditable,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile"%>

<%
    /**
    *
    * Purpose: Read Collateral
    * Description: Type - Cash, Subtype - Deposit, Fd
    *
    * @author $Author: Naveen $<br>
    * @version $Revision: 1.23 $
    * Date: $Date: 2006/10/27 08:26:42 $
    * Tag: $Name:  $
    */
%>

<%	
	String actionStr = "com.integrosys.cms.ui.collateral.cash.CashAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
    ICashFd iCol = (ICashFd) itrxValue.getCollateral();
   String prefix1 = "Cash";
    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;
    String liquidationIsNPL = (String)session.getAttribute(actionStr+".liquidationIsNPL");
ICashFd stage_iCol = (ICashFd) itrxValue.getStagingCollateral();
String spread=Float.toString(stage_iCol.getSpread());
%>

<%@ include file="/collateral/checkIsSSC.jsp"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<script language="JavaScript" type="text/JavaScript">

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

</script>
</head>

<body>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="CashFd"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.title.deposit.view"/></h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right" valign="baseline">
		<%@ include file="/collateral/common/common_buttons.jsp"%>  
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>

  </thead>
 <%@ include file="Cashfd_read_helper.jsp" %>

<%@ include file="/collateral/common/common_read_button.jsp" %>

</body>
</html>
