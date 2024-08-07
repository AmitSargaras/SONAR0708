<%@ page import="com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.search.SearchResult,
                 java.util.Collection,
                 com.integrosys.cms.app.commodity.deal.bus.OBCommodityDealSearchResult,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.ui.common.ForexHelper,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commodity_deal_list.jsp,v 1.34 2006/10/27 08:38:43 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.34 $
* Date: $Date: 2006/10/27 08:38:43 $
* Tag: $Name:  $
*/
%>
<%
 ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
 int teamMembershipID = 0;

  TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_CMT_MAKER;
                    break TOP_LOOP;
                } else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_CHECKER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_CMT_CHECKER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_FAM_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_FAM_USER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_GAM_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_GAM_USER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_RCO_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_RCO_USER;
                    break TOP_LOOP;
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SCO_USER){
                    teamMembershipID = ICMSConstant.TEAM_TYPE_SCO_USER;
                    break TOP_LOOP;
                } else {
                    teamMembershipID = 0;
                }
            }
        }
  }

    SearchResult rs = (SearchResult) request.getAttribute("dealList");
    Collection col ;
    if(rs!=null)
     col = (Collection) rs.getResultList();
    else col=null;
 %>

 <% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_PREPARE_CAL_POSITION%>";
    }
    if (num == 2) {
        document.forms[0].dealType.value = "<%=ICMSConstant.DEAL_TYPE_COLLATERAL_POOL%>";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_PREPARE_ADD_DEAL%>";
    }
    if (num == 3) {
        document.forms[0].dealType.value = "<%=ICMSConstant.DEAL_TYPE_SPECIFIC_TRANSACTION%>";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_PREPARE_ADD_DEAL%>";
    }
    if (num == 4) {
        document.forms[0].action = "CommodityMain.do";
        document.forms[0].event.value = "<%=CommodityMainAction.EVENT_READ%>";
    }
    if (num == 5) {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST_CLOSED%>";
    }
    if (num == 6) {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_REVALUE_DEALS%>";
    }
    document.forms[0].submit();
}

function viewDeal(dealNo) {
    document.forms[0].event.value = "<%=CommodityDealAction.EVENT_READ%>";
    document.forms[0].dealID.value = dealNo;
    document.forms[0].submit();
}

function forwardPage(selObj) {
    if (selObj.selectedIndex == 0) {
        return false;
    }
    if (selObj.selectedIndex == 1) {
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_PREPARE_UPDATE%>";
    }
    if (selObj.selectedIndex == 2) {
        document.forms[0].event.value= "<%=CommodityDealAction.EVENT_PREPARE_CLOSE_DEAL%>";
    }
    document.forms[0].dealID.value = selObj.options[selObj.selectedIndex].value;
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityDeal.do">
<input type="hidden" name="event"/>
<input type="hidden" name="dealType"/>
<input type="hidden" name="previous" value="<%=CommodityDealAction.EVENT_LIST%>"/>
<input type="hidden" name="dealID"/>

  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td><h3><legend>Edit Security Details - Commodity</legend></h3></td>
        <td align="right" valign="bottom">
        <%
          if (teamMembershipID == ICMSConstant.TEAM_TYPE_CMT_MAKER) {
        %>
          <input type="button" name="button42" id="button4" value="Revalue Security" class="btnNormal" onclick="submitPage(6)"/>
          <input type="button" name="button42" id="button4" value="View Closed Deal" class="btnNormal" onclick="submitPage(5)"/>
        <% } %>
        </td>
      </tr>
      <tr>
        <td> <h3>Commodities Deal Information</h3></td>
      <td align="right" valign="bottom">
      <%
          if (teamMembershipID == ICMSConstant.TEAM_TYPE_CMT_MAKER) {
      %>
        <input type="button" name="button3" id="pool" value="Calculate Existing/Proposed Position" class="btnNormal" onclick="submitPage(1)"/>
        <input type="button" name="button" id="pool" value="Add Collateral Pool Deal" class="btnNormal" onclick="submitPage(2)"/>
        <input type="button" name="button2" id="button" value="Add Specific Transaction" class="btnNormal" onclick="submitPage(3)"/>
     <% } else if(teamMembershipID == ICMSConstant.TEAM_TYPE_CMT_CHECKER) { %>
        <input type="button" name="button42" id="button4" value="Revalue Security" class="btnNormal" onclick="submitPage(6)"/>
        <input type="button" name="button42" id="button4" value="View Closed Deal" class="btnNormal" onclick="submitPage(5)"/>
     <% } else if(teamMembershipID == ICMSConstant.TEAM_TYPE_RCO_USER || teamMembershipID == ICMSConstant.TEAM_TYPE_SCO_USER || teamMembershipID == ICMSConstant.TEAM_TYPE_GAM_USER || teamMembershipID == ICMSConstant.TEAM_TYPE_FAM_USER) { %>
        <input type="button" name="button42" id="button4" value="View Closed Deal" class="btnNormal" onclick="submitPage(5)"/>
     <% } %>  
     </td>
      </tr>
      <tr>
        <td colspan="2"><hr/></td>
      </tr>
      <tr>
        <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          <tr>
            <td width="2%">S/N</td>
            <td width="4%">Type</td>
            <td width="5%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>/<bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/></td>
            <td width="4%">TP Deal Reference</td>
            <td width="4%">Status of Deal</td>
            <td width="7%">Deal No</td>
            <td width="8%">Deal Amount</td>
            <td width="5%">Market Price</td>
            <td width="8%">Qty</td>
            <td width="9%">Deal CMV</td>
            <td width="9%">Deal FSV</td>
            <td width="4%">Deal Secure Status</td>
            <td width="4%">% Cash Req (at <br>
              Cust Level)</td>
            <td width="4%">% Cash Req <br>
              (at Deal Level)</td>
            <td width="5%">% Actual<br> Cash Recd</td>
            <td width="8%">Cash Req<br>Recd Amt </td>
            <td width="10%">Action</td>
          </tr>
          </thead> <tbody>
       <%    if(col!=null && col.size()!=0){%>
          <% double USDdealAmt =0;
             double USDdealCMV =0;
             double USDdealFSV =0;
             double USDcadshReqAmt=0;
             CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
             ForexHelper fr = new ForexHelper();
          %>
        <% if(col!=null && col.size()!=0)  {%>
       <%
             OBCommodityDealSearchResult deal[] = (OBCommodityDealSearchResult[])col.toArray(new OBCommodityDealSearchResult[0]);
             if(deal!=null && deal.length!=0)
               {
      %>
      <%
            for (int i = 0 ; i < deal.length; i++) {
                if(deal[i]!=null) {
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
            <td class="index" width="2%"><%=i + 1%></td>
            <td width="4%">
            <% if(deal[i].getDealTypeCode()!=null){%>
            <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.DEAL_TYPE, deal[i].getDealTypeCode())%>"/>
        <%} else {%>-
         <%}%>&nbsp;</td>
            <td width="5%">
             <% if(deal[i].getProdTypeCode()!=null && deal[i].getCategoryCode()!=null)  {%>
               <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(deal[i].getCategoryCode(), deal[i].getProdTypeCode())%>"/>
             <%} else {%>
              -
           <% }%>
        &nbsp;/<integro:empty-if-null value="<%=deal[i].getProdSubtypeCode()%>"/>&nbsp;
            </td>
            <td width="4%"><integro:empty-if-null value="<%=deal[i].getDealReferenceNo()%>"/>&nbsp;</td>
            <td width="4%"><integro:empty-if-null value="<%=deal[i].getDealStatus()%>"/>&nbsp;</td>
            <td width="7%"><integro:empty-if-null value="<%=deal[i].getDealNo()%>"/>&nbsp;</td>
            <td class="amount" width="10%"><integro:amount amount="<%=deal[i].getDealAmt()%>" locale="<%=locale%>" decimal="2"/>&nbsp;
            </td>
            <td class="amount" width="6%"><integro:amount amount="<%=deal[i].getMarketPrice()%>" locale="<%=locale%>" decimal="6" />&nbsp;</td>
            <td class="amount" width="8%">
             <% if((deal!=null) && (deal[i].getQuantity()!=null) && (deal[i].getQuantity().getUnitofMeasure()!=null) &&
                     (deal[i].getQuantity().getQuantity() != null && deal[i].getQuantity().getQuantity().doubleValue() > 0) ) {%>
              <integro:empty-if-null value="<%=UIUtil.formatNumber(deal[i].getQuantity().getQuantity(),4 ,locale)%>"/>&nbsp;
             <%} else { %>
                     -
            <%}%>
            <% if((deal!=null) && (deal[i].getQuantity()!=null) && (deal[i].getQuantity().getUnitofMeasure()!=null) && (deal[i].getQuantity().getUnitofMeasure().getLabel()!=null) ) {%>
            <integro:empty-if-null value="<%=deal[i].getQuantity().getUnitofMeasure().getLabel()%>"/>
            <%}%>
            </td>
            <td class="amount" width="10%"><integro:amount amount="<%=deal[i].getDealCMV()%>" locale="<%=locale%>" />&nbsp;</td>
            <td class="amount" width="6%"><integro:amount amount="<%=deal[i].getDealFSV()%>" locale="<%=locale%>" />&nbsp;</td>
              <td width="5%" style="text-align:center"><integro:boolean-display style="yn" value="<%=deal[i].getIsDealSecured()%>"/>&nbsp;</td>
            <%if(deal[i].getCustCashReqPct()>0){%>

            <td class="amount" width="4%"><integro:empty-if-null value="<%=MapperUtil.mapDoubleToString(deal[i].getCustCashReqPct(),0,locale)%>"/>&nbsp;</td>
            <%} else {    %>
              <td class="amount" width="4%">-</td>
          <%  }    %>
           <%if(deal[i].getDealCashReqPct()>0){%>
            <td class="amount" width="4%"><integro:empty-if-null value="<%=MapperUtil.mapDoubleToString(deal[i].getDealCashReqPct(),0,locale)%>"/>&nbsp;</td>
            <%} else {    %>
              <td class="amount" width="4%">-</td>
          <%  }    %>
          <%if(deal[i].getActualCashReqRecdPct()>0){%>
            <td class="amount" width="4%"><integro:empty-if-null value="<%=MapperUtil.mapDoubleToString(deal[i].getActualCashReqRecdPct(),0,locale)%>"/>&nbsp;</td>
            <%} else {    %>
              <td class="amount" width="4%">-</td>
          <%  }    %>
          <% if (deal[i].getActualCashReqRecdAmt() != null && deal[i].getActualCashReqRecdAmt().getAmountAsDouble() == ICMSConstant.DOUBLE_INVALID_VALUE && deal[i].getActualCashReqRecdAmt().getCurrencyCode().length() == 0) { %>
            <td class="amount" width="8%">Forex Error</td>
        <% } else { %>
            <td class="amount" width="8%"><integro:amount amount="<%=deal[i].getActualCashReqRecdAmt()%>" locale="<%=locale%>" />&nbsp;</td>
        <% } %>
            <td style="text-align:center" width="10%">
            <%
              if (teamMembershipID == ICMSConstant.TEAM_TYPE_CMT_MAKER) {
            %>
              <select name="select" onchange="forwardPage(this)">
                <option selected>Please Select</option>
                <option value="<%=deal[i].getDealID()%>">View/Edit</option>
                <option value="<%=deal[i].getDealID()%>">Close</option>
              </select>
            <%
              } else {
            %>
            <a href="#" onclick="javascript:viewDeal(<%=deal[i].getDealID()%>)">View</a>
            <% } %>
              </td>
          </tr>
          <%
                }  //   if(deal[i]!=null)
          %>
          <%
                try {
                    if(USDdealAmt!=ICMSConstant.LONG_INVALID_VALUE)
                        USDdealAmt = USDdealAmt + fr.convertAmount(deal[i].getDealAmt(),usd);
                } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDdealAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }
                try {
                 if(USDdealCMV!=ICMSConstant.LONG_INVALID_VALUE)
                        USDdealCMV = USDdealCMV + fr.convertAmount(deal[i].getDealCMV(),usd);
                  } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDdealCMV = ICMSConstant.LONG_INVALID_VALUE;
                     }
                try {
                if(USDdealFSV!=ICMSConstant.LONG_INVALID_VALUE)
                        USDdealFSV = USDdealFSV + fr.convertAmount(deal[i].getDealFSV(),usd);

                 } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDdealFSV = ICMSConstant.LONG_INVALID_VALUE;
                     }
                 try {
               if(USDcadshReqAmt!=ICMSConstant.LONG_INVALID_VALUE) {
                    USDcadshReqAmt = USDcadshReqAmt + fr.convertAmount(deal[i].getActualCashReqRecdAmt(),usd);
               }

               } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDcadshReqAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }

            } %>
           <% Amount USDdealAmount = new Amount(USDdealAmt,usd);
              Amount USDdealCMVAmount = new Amount(USDdealCMV,usd);
              Amount USDdealFSVAmount = new Amount(USDdealFSV,usd);
              Amount USDcadshReqAmount = new Amount(USDcadshReqAmt,usd);
           %>
                 <tr class="odd">
            <td class="total" width="2%">&nbsp;</td>
            <td class="total" width="4%">&nbsp;</td>
            <td class="total" width="5%">&nbsp;</td>
            <td class="total" width="4%">&nbsp;</td>
            <td class="total" width="4%">&nbsp;</td>
            <td class="total" width="7%">Total :</td>
            <td class="total" style="text-align:left" width="8%">
             <%
                if(USDdealAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDdealAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                Forex Error
              <% } %>

            </td>
            <td class="total" width="5%">&nbsp;</td>
            <td width="8%" class="total">&nbsp;</td>
            <td width="9%" class="total">
             <%
                if(USDdealCMVAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDdealCMVAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                Forex Error
              <% } %>
            </td>
            <td class="total" style="text-align:right" width="9%">
            <%
                if(USDdealFSVAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDdealFSVAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                Forex Error
              <% } %>
            </td>
            <td class="total" style="text-align:right" width="4%">&nbsp;</td>
            <td class="total" style="text-align:right" width="4%">&nbsp;</td>
            <td class="total" style="text-align:right" width="4%">&nbsp;</td>
            <td class="total" style="text-align:right" width="5%">&nbsp;</td>
            <td class="total" style="text-align:right" width="8%">
             <%
                if(USDcadshReqAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcadshReqAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                Forex Error
              <% } %>
            </td>
            <td class="total"  style="text-align:center" width="10%">&nbsp;</td>
          </tr>
        <%     }       // end  of    if(deal!=null && deal.length!=0)
             }
          %>
<% }else{%>
        <tr class="odd"><td colspan="17">There is no Deal.</td></tr>
<% } %>
          </tbody>

        </table>
      </td>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>

  <table width="54" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="54">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="javascript:submitPage(4)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/return2.gif',1)"><img src="img/return1.gif" name="Image51" border="0" id="Image5" /></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
