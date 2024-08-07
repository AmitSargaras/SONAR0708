<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.*,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADeal,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADealVal,
                 com.integrosys.cms.app.tradingbook.trx.OBGMRADealValTrxValue"%>
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
* Purpose: For Checker to approve and reject GMRA Deal Valaution
* Description: approve and reject the GMRA Deal Valaution that being change by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date:$
* Tag: $Name$
*/
%>

<%
    String TrxId = request.getParameter("TrxId");
    String event = request.getParameter("event");
    OBGMRADealValTrxValue obTrxValue = null;
    Object trxObjFromSession = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.GMRADealValTrxValue");
    DefaultLogger.debug(this,">>>Debug:::003 ");
    IGMRADealVal[]  parametersArray = null ;
    IGMRADealVal[]  stagingParametersArray = null ;
    DefaultLogger.debug(this,">>>Debug:::004 ");

    if( trxObjFromSession ==null ) {
        out.println("Expected session parameter 'IGMRADealValTrxValue' is missing.");
        return;
    }

    DefaultLogger.debug(this,">>>Debug:::005 ");
    obTrxValue = (OBGMRADealValTrxValue)trxObjFromSession;

    pageContext.setAttribute("OBGMRADealVal", obTrxValue);

    parametersArray = obTrxValue.getGMRADealValuation();

    stagingParametersArray = obTrxValue.getStagingGMRADealValuation();
    DefaultLogger.debug(this,">>>Debug:::006 ");

    int offset = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.offset")).intValue();
    int length = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.length")).intValue();
    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);

    String classEvent = "odd";

    List compareResultsList = (List)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.compareResultsList");
    pageContext.setAttribute("compareResultsList", compareResultsList);

    int totalEntries = compareResultsList.size();

    DefaultLogger.debug(this, "total entries = " + totalEntries);

    String paramUID = obTrxValue.getUserInfo();
    String paramRemarks = obTrxValue.getRemarks();
    if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
       paramRemarks=" ";
    }

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

function approvePage() {
    document.forms[0].action = "GMRADealVal.do?event=checker_approve_edit_valuation";
    document.forms[0].submit();
}

function rejectPage() {
    document.forms[0].action = "GMRADealVal.do?event=checker_reject_edit_valuation";
    document.forms[0].submit();
}

function goPageIndex(targetOffset) {
    document.forms[0].action = "GMRADealVal.do?event=<%=event%>&targetOffset="+targetOffset+"&TrxId=<%=TrxId%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<html:form action="GMRADeal.do">
<!-- InstanceBeginEditable name="Content" -->

<%@ include file="../cp_agreement_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="3%" rowspan="2"><bean:message key="label.gmra.deal.sn"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.id"/></td>
              <td width="15%" rowspan="2"><bean:message key="label.gmra.deal.security"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.isin.code"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.notinal"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.trade.price"/></td>
              <td width="15%" rowspan="2"><bean:message key="label.gmra.deal.market.price"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.haircut"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.deal.rate"/></td>
              <td width="10%" colspan="2"><bean:message key="label.gmra.deal.tenor"/></td>
            </tr>
            <tr class="tblInfo">
              <td><bean:message key="label.gmra.deal.start.date"/></td>
              <td><bean:message key="label.gmra.deal.maturity.date"/></td>
            </tr>
          </thead>
          <tbody>
            <%
              // Check that offset + length cannot exceed the total.
              int iterateLength = 0;
              if (offset + length > totalEntries) {
                iterateLength = totalEntries - offset;
              } else {
                iterateLength = length;
              }

            %>
            <%if(iterateLength == 0){%>
            <tr class="odd">
              <td colspan="10">There is no ISDA CSA Deal Valuation information.&nbsp;</td>
            </tr>

            <%}%>
            <logic:iterate id="result" name="compareResultsList"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
              IGMRADealVal gmraDealVal = (IGMRADealVal)result.getObj();

              DefaultLogger.debug(this, "counter is now " + counter.intValue());

              DefaultLogger.debug(this, "ref id of getObj = " +  gmraDealVal.getDealValuationID());
            %>
              <tr class="<%=classEvent%>">
                <td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
                <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getDealID()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getSecDesc()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getISINCode()%>"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=gmraDealVal.getGMRADealDetail().getNotionalAmount()%>" decimal="4"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=gmraDealVal.getGMRADealDetail().getDealAmount()%>" decimal="4"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=gmraDealVal.getMarketValue()%>" decimal="4"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getHaircut()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getDealRate()%>"/>&nbsp;</td>
                <td><integro:date object="<%=gmraDealVal.getGMRADealDetail().getTradeDate()%>"/>&nbsp;</td>
                <td><integro:date object="<%=gmraDealVal.getGMRADealDetail().getMaturityDate()%>"/>&nbsp;</td>
              </tr>
              <%if (classEvent.equals("odd")) { 
                  classEvent = "even";
                } else {
                  classEvent = "odd";
                }
              %>
            </logic:iterate>

          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td><font color="#0000FF">*</font>&nbsp;Updating of Market Price will always be based on previous system day till report generation. 
        After the reports has been generated, system will auto-update to current system date and any updating of 
        market price will be based on current system date.
      </td>
    </tr>

    <tr>
      <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr>
              <td width="43%" class="fieldname">Remarks</td>
              <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
            </tr>
            <tr>
              <td class="fieldname">Last Action By</td>
              <td class="even"><integro:empty-if-null value="<%=paramUID%>"/>&nbsp; </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Last Remarks Made</td>
              <td><integro:wrapper value='<%=paramRemarks%>' />&nbsp;&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</td>
</tr>

  <tr>
    <td height="25">
      <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
        <tr>
          <td valign="middle">
            <integro:pageindex
              pageIndex="<%=new PageIndex(offset, length, compareResultsList.size())%>"
              url="GMRADealVal.do" submitFlag="true"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>

<!-- InstanceEnd -->
</html>
