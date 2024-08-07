<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.tradingbook.bus.IISDACSADeal,
                 com.integrosys.cms.app.tradingbook.bus.IISDACSADealVal,
                 com.integrosys.cms.app.tradingbook.bus.OBISDACSADealSummary"%>
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
* Purpose: For Maker to view all ISDA CSA Deal detail
* Description: view all ISDA CSA Deal detail value by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String userMembershipID = (String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isMrMaker = false;

    if (userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_MR_MAKER))) {
      isMrMaker = true;
    }

    String limitProfileId = request.getParameter("limitProfileID");
    String event = request.getParameter("event");
    IISDACSADealVal[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.ISDACSADealSummaryTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm) request.getAttribute("ISDACSADealForm");
    OBISDACSADealSummary obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    boolean isDeleted = false;
    int totalEntries = 0;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.OBISDACSADealSummary");
        obTrxValue = (OBISDACSADealSummary)obj;
        parametersArray = obTrxValue.getISDACSADealSummary();
        pageContext.setAttribute("OBISDACSADealSummary", obTrxValue);

        totalEntries = parametersArray.length;

        if (obTrxValue.getBCAStatus() != null && 
                obTrxValue.getBCAStatus().equals (ICMSConstant.STATE_DELETED)) { 
            isDeleted = true;   
        }

        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parametersArray = "+parametersArray.length);
        }
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBISDACSADealSummary' ");
   }

    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.length")).intValue();

    String classEvent = "odd";
    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
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

function goToPage(index) {

    if(index == "1"){
      document.forms[0].action = "CashMargin.do?event=maker_view_cashmargin_isdacsa&agreementID=<%=obTrxValue.getAgreementID()%>";
    }else if(index == "2"){
      document.forms[0].action = "ISDACSADealVal.do?event=maker_bond_margin";
    }else if(index == "3"){
      document.forms[0].action = "ISDACSADealVal.do?event=maker_input_valuation";
    }else if(index == "4"){
      document.forms[0].action = "ISDACSADealVal.do?event=view&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=limitProfileId%>";
    }
      document.forms[0].submit();
}

function JumpOnSelectactive(selectObj,singleCMSDealID)
{

    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
    {
      location.href = "ISDACSADealVal.do?event=process_isda_dealdetails&singleCMSDealID=" +singleCMSDealID;
    }
}

function goPageIndex(targetOffset) {
    document.forms[0].action = "ISDACSADealVal.do?event=<%=event%>&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=limitProfileId%>&targetOffset="+targetOffset;
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
<html:form action="ISDACSADealVal.do">
<html:hidden property="limitProfileID" value="<%=String.valueOf(obTrxValue.getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>
<!-- InstanceBeginEditable name="Content" -->

<%@ include file="../deal_summary_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td width="40%" valign="baseline" align="right"> 
      <%if(isMrMaker){%>
      <input type="button" value="Cash Margin" class="btnNormal" onclick="goToPage(1)"/>
      <%}else{%>
      <input type="button" value="View Cash Margin" class="btnNormal" onclick="goToPage(1)"/>
      <%}%>
      <!--input type="button" value="Bond Margin" class="btnNormal" onclick="goToPage(2)"/-->
      <%if((!isDeleted && parametersArray.length != 0) && isMrMaker){%>
      <input type="button" value="Input Valuation" class="btnNormal" onclick="goToPage(3)"/>
      <%}else if(parametersArray.length != 0 && !isMrMaker){%>
      <input type="button" value="View Valuation" class="btnNormal" onclick="goToPage(4)"/>
      <%}%>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="5%"><bean:message key="label.isda.deal.sn"/></td>
              <td width="15%"><bean:message key="label.isda.deal.id"/></td>
              <td width="10%"><bean:message key="label.isda.deal.currency"/></td>
              <td width="10%"><bean:message key="label.isda.deal.trade.date"/></td>
              <td width="10%"><bean:message key="label.isda.deal.maturity.date"/></td>
              <td width="10%"><bean:message key="label.isda.deal.value.date"/></td>
              <td width="10%"><bean:message key="label.isda.deal.product.type"/></td>
              <td width="10%"><bean:message key="label.isda.deal.base.currency.npv"/></td>
              <td width="10%"><bean:message key="label.isda.deal.reference.currency.npv"/></td>
              <td width="10%"><bean:message key="label.isda.deal.action"/></td>
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
              <td colspan="10"><bean:message key="label.global.not.found"/></td>
            </tr>

            <%}%>
            <logic:iterate id="isdaCsaDeal" name="OBISDACSADealSummary" property="ISDACSADealSummary"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.cms.app.tradingbook.bus.IISDACSADealVal">
            <%
              DefaultLogger.debug(this, "counter is now " + counter.intValue());
			  String dealCurrencyCode = "";
			  if( isdaCsaDeal.getISDACSADealDetail().getDealAmount() != null )
			  {
				dealCurrencyCode = isdaCsaDeal.getISDACSADealDetail().getDealAmount().getCurrencyCode();
			  }
            %>
            <tr class="<%=classEvent%>">
              <td class="index"><%=counter.intValue()+1%></td>
              <td><integro:empty-if-null value="<%=isdaCsaDeal.getISDACSADealDetail().getDealID()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=dealCurrencyCode%>"/>&nbsp;</td>
              <td><integro:date object="<%=isdaCsaDeal.getISDACSADealDetail().getTradeDate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=isdaCsaDeal.getISDACSADealDetail().getMaturityDate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=isdaCsaDeal.getISDACSADealDetail().getValueDate()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=isdaCsaDeal.getISDACSADealDetail().getProductType()%>"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=isdaCsaDeal.getISDACSADealDetail().getNPVBaseAmount()%>" decimal="4"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=isdaCsaDeal.getISDACSADealDetail().getNPVAmount()%>" decimal="4"/>&nbsp;</td>
              <td>
                <select name="select3" onchange="JumpOnSelectactive(this,'<%=isdaCsaDeal.getISDACSADealDetail().getCMSDealID()%>')">
                  <option selected="selected" >Please Select</option>
                  <option value="view">View</option>
                </select>
              </td>
            </tr>
            <%
              if (classEvent.equals("odd")) {
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
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" valign="baseline" align="center"> <a href="CustomerSearch.do?event=return" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
  </tr>
</table>
</html:form>
</td>
</tr>

  <tr>
    <td height="25">
      <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
        <tr>
          <td valign="middle">
            <integro:pageindex
              pageIndex="<%=new PageIndex(offset, length, parametersArray.length)%>"
              url="GMRADeal.do" submitFlag="true"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd -->
</html>
