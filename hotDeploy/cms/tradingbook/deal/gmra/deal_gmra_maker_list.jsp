<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADeal,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADealVal,
                 com.integrosys.cms.app.tradingbook.bus.OBGMRADealSummary"%>
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
* Purpose: For Maker and Checker to view the summary of all GMRA Deal detail
* Description: view the summary of all GMRA Deal detail value by Maker and Checker
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

    String event = request.getParameter("event");
    IGMRADealVal[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealAction.GMRADealSummaryTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealForm) request.getAttribute("GMRADealForm");
    OBGMRADealSummary obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    boolean isDeleted = false;
    int totalEntries = 0;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.OBGMRADealSummary");
        obTrxValue = (OBGMRADealSummary)obj;
        parametersArray = obTrxValue.getGMRADealSummary();
        pageContext.setAttribute("OBGMRADealSummary", obTrxValue);

        totalEntries = parametersArray.length;
        
        if (obTrxValue.getBCAStatus() != null && 
                obTrxValue.getBCAStatus().equals (ICMSConstant.STATE_DELETED)) { 
            isDeleted = true;   
        }

        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parametersArray = "+parametersArray.length);
        }
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBGMRADealSummary' ");
   }
   System.out.println("obTrxValue.getAgreementID() : " + obTrxValue.getAgreementID());

    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealAction.length")).intValue();

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
      document.forms[0].action = "CashMargin.do?event=maker_view_cashmargin_gmra&agreementID=<%=obTrxValue.getAgreementID()%>";
    }else if(index == "2"){
      document.forms[0].action = "GMRADeal.do?event=maker_bond_margin";
    }else if(index == "3"){
      document.forms[0].action = "GMRADealVal.do?event=maker_update_valuation&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=obTrxValue.getLimitProfileID()%>";
    }else if(index == "4"){
      document.forms[0].action = "GMRADeal.do?event=maker_add_deal";
    }else if(index == "5"){
      document.forms[0].action = "GMRADealVal.do?event=view&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=obTrxValue.getLimitProfileID()%>";
    }
      document.forms[0].submit();
}

function JumpOnSelectactive(selectObj,singleCMSDealID)
{

    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view"){
      location.href = "GMRADeal.do?event=process_gmra_dealdetails&cmsDealID=" +singleCMSDealID;
    }else if(selectObj.options[selectIndex].value == "edit"){
      location.href = "GMRADeal.do?event=edit_gmra_dealdetails&cmsDealID=" +singleCMSDealID;
    }else if(selectObj.options[selectIndex].value == "delete"){
      location.href = "GMRADeal.do?event=delete_gmra_dealdetails&cmsDealID=" +singleCMSDealID;
    }
}

function goPageIndex(targetOffset) {
    document.forms[0].action = "GMRADeal.do?event=paginate&targetOffset="+targetOffset;
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
<html:hidden property="limitProfileID" value="<%=String.valueOf(obTrxValue.getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>

<%@ include file="../deal_summary_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td width="40%" valign="baseline" align="right"> 
      <%if(!isDeleted && isMrMaker){%>
      <input type="button" value="Add Deal" class="btnNormal" onclick="goToPage(4)"/>
      <%}
        if(isMrMaker){%>
      <input type="button" value="Cash Margin" class="btnNormal" onclick="goToPage(1)"/>
      <%}else{%>
      <input type="button" value="View Cash Margin" class="btnNormal" onclick="goToPage(1)"/>
      <%}%>
      <!--input type="button" value="Bond Margin" class="btnNormal" onclick="goToPage(2)"/-->
      <%if((!isDeleted && parametersArray.length != 0) && isMrMaker){%>
      <input type="button" value="Input Valuation" class="btnNormal" onclick="goToPage(3)"/>
      <%}else if(parametersArray.length != 0 && !isMrMaker){%>
      <input type="button" value="View Valuation" class="btnNormal" onclick="goToPage(5)"/>
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
              <td width="5%" rowspan="2"><bean:message key="label.gmra.deal.sn"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.id"/></td>
              <td width="15%" rowspan="2"><bean:message key="label.gmra.deal.security"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.isin.code"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.trade.price"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.haircut"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.deal.rate"/></td>
              <td width="20%" colspan="2"><bean:message key="label.gmra.deal.tenor"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.action"/></td>
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
              <td colspan="10"><bean:message key="label.global.not.found"/></td>
            </tr>

            <%}%>
            <logic:iterate id="gmraDeal" name="OBGMRADealSummary" property="GMRADealSummary"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.cms.app.tradingbook.bus.IGMRADealVal">
            <%
              DefaultLogger.debug(this, "counter is now " + counter.intValue());

            %>
            <tr class="<%=classEvent%>">
              <td class="index"><%=counter.intValue()+1%></td>
              <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getDealID()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getSecDesc()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getISINCode()%>"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=gmraDeal.getGMRADealDetail().getDealAmount()%>" decimal="4"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getHaircut()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getDealRate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=gmraDeal.getGMRADealDetail().getTradeDate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=gmraDeal.getGMRADealDetail().getMaturityDate()%>"/>&nbsp;</td>
              <td>
                <select name="select3"  onchange="JumpOnSelectactive(this, '<%=gmraDeal.getGMRADealDetail().getCMSDealID()%>')">
                  <option selected="selected" >Please Select</option>
                  <option value="view">View</option>
                  <%if(!isDeleted && isMrMaker){%>
                  <option value="edit">Edit</option>
                  <option value="delete">Delete</option>
                  <%}%>
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
<!-- InstanceEndEditable -->
</html:form>
</td>
</tr>

<!-- InstanceEnd -->
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
</body>
<!-- InstanceEnd -->
</html>
