<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.*,
                 com.integrosys.cms.app.tradingbook.bus.OBISDACSADealDetail,
                 com.integrosys.cms.app.tradingbook.bus.IISDACSADeal"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For Maker to view the ISDA CSA Deal detail
* Description: view the ISDA CSA Deal detail value by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    IISDACSADeal parameters = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.ISDACSADealDetailTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm) request.getAttribute("ISDACSADealForm");
    OBISDACSADealDetail obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.ISDACSADealSummaryTrxValue");
        obTrxValue = (OBISDACSADealDetail)obj;
        parameters = obTrxValue.getISDACSADealDetail();
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'ISDACSADealSummaryTrxValue' ");
   }
   
   HashMap hm = new HashMap();

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

function gotoPreviousPage() {
    document.forms[0].action = "ISDACSADealVal.do?event=view_isda_deal_detail&limitProfileID=<%=obTrxValue.getLimitProfileID()%>&agreementID=<%=obTrxValue.getAgreementID()%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ISDACSADealVal.do">
<html:hidden property="limitProfileID" value="<%=String.valueOf(obTrxValue.getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>
<body>
<!-- InstanceBeginEditable name="Content" -->

<%@ include file="../deal_detail_common_page.jsp"%> 

<%if (parameters.getProductType().equals("IRS") || parameters.getProductType().equals("CIRS")) {%>
<%@ include file="deal_csa_irs_cirs_details.jsp"%> 
<%}else if (parameters.getProductType().equals("FX_SPOTS")) {%>
<%@ include file="deal_csa_fxspot_details.jsp"%> 
<%}else if (parameters.getProductType().equals("FX_SWAPS")) {%>
<%@ include file="deal_csa_fxswap_details.jsp"%> 
<%}else if (parameters.getProductType().equals("FX_OPTIONS") || parameters.getProductType().equals("LONG_FX_FWD")) {%>
<%@ include file="deal_csa_fxoption_ltfx_details.jsp"%> 
<%}%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" valign="baseline" align="center"> <a href="javascript:gotoPreviousPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
