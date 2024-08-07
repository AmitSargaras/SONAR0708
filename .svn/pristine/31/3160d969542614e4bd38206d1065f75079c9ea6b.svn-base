<%@ page import="com.integrosys.cms.ui.reassignment.ReassignmentConstant,
                 com.integrosys.cms.ui.reassignment.ReassignmentAction,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.cms.app.commodity.deal.bus.OBCommodityDealSearchResult,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.checklist.CheckListAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.checklist.bus.CCCheckListSummary,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.checklist.bus.CollateralCheckListSummary,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 java.util.Vector"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    String reassignmentType = (String)request.getParameter("reassignmentType");

    SearchResult summaryObj = (SearchResult)session.getAttribute("com.integrosys.cms.ui.reassignment.ReassignmentAction.reassignmentSearchSummary");
    Vector summaryList = new Vector();
    if (summaryObj != null) {
//        System.out.println("summary obj is not null");
        summaryList = (Vector)summaryObj.getResultList();
    }

    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/reassignment/reassignment_deal.jsp,v 1.3 2006/10/27 08:47:01 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.3 $
     * @since $Date: 2006/10/27 08:47:01 $
     * Tag: $Name:  $
     */
%>


<!-- InstanceBeginEditable name="head" -->
<script>
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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

function submitPage(num, trxID, customerID, limitProfileID) {
    if (num == 0) {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_USER_PROCESS%>";
        document.forms[0].trxID.value = trxID;
    }
    document.forms[0].customerID.value = customerID;
    document.forms[0].limitProfileID.value = limitProfileID;

    document.forms[0].submit()

}
-->
</script>


<!-- InstanceEndEditable -->
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="Reassignment.do">
<input type="hidden" name="event" value="<%=ReassignmentAction.EVENT_FORWARD%>"/>
<input type="hidden" name="reassignmentType" value="<%=reassignmentType%>"/>
<input type="hidden" name="previous" value="<%=ReassignmentConstant.TASK_EVENT%>"/>
<input type="hidden" name="trxID"/>
<input type="hidden" name="customerID"/>
<input type="hidden" name="limitProfileID"/>
<%
    if (summaryList != null && !summaryList.isEmpty()) {
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  >
    <thead>
    <tr>
        <td><h3>Pending Multi-level Approval Deal Found</h3></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="6%">Type</td>
                    <td width="8%">Commodity Product Type/Sub-Type</td>
                    <td width="6%">TP Deal Reference</td>
                    <td width="12%">Deal No</td>
                    <td width="10%">Deal Amount</td>
                    <td width="6%">Market Price</td>
                    <td width="9%">Qty</td>
                    <td width="10%">Deal <bean:message key="label.valuation.omv"/></td>
                    <td width="6%">Deal FSV</td>
                    <td width="5%">Deal <br>
                    Secure Status</td>
                    <td width="3%">Deal<br>
                    Closed </td>
                    <td width="12%">Cash Reqmt Amount</td>
                    <td width="7%">Action</td>
                </tr>
                </thead>
                <tbody>
                <%
                    OBCommodityDealSearchResult deal = (OBCommodityDealSearchResult)summaryList.get(0);
                    ICommodityDealTrxValue trxValue = deal.getTrxValue();
                %>
    		    <tr class="odd">
                    <td width="6%">
                <%
                        if(deal.getDealTypeCode() !=null) {
                %>
                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.DEAL_TYPE, deal.getDealTypeCode())%>"/>
                <%} else {%> - <% } %> &nbsp;
                    </td>
                    <td width="8%">
                <%
                        if (deal.getProdTypeCode() != null && deal.getCategoryCode() != null) {
                %>
                    <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(deal.getCategoryCode(), deal.getProdTypeCode())%>"/>
                <%} else {%> - <% } %> &nbsp; /
                    <integro:empty-if-null value="<%=deal.getProdSubtypeCode()%>"/>
                    </td>
                    <td width="6%">
                        <integro:empty-if-null value="<%=deal.getDealReferenceNo()%>"/>&nbsp;
                    </td>
                    <td width="12%">
                        <integro:empty-if-null value="<%=deal.getDealNo()%>"/>&nbsp;
                    </td>
                    <td width="10%">
                        <integro:amount amount="<%=deal.getDealAmt()%>" locale="<%=locale%>" />&nbsp;
                    </td>
                    <td width="6%">
                        <integro:amount amount="<%=deal.getMarketPrice()%>" locale="<%=locale%>" decimal="6" />&nbsp;
                    </td>
                    <td width="9%">
                <% if (deal != null && deal.getQuantity() != null &&
                        deal.getQuantity().getUnitofMeasure() != null &&
                        deal.getQuantity().getQuantity() != null &&
                        deal.getQuantity().getQuantity().doubleValue() > 0) {
                %>
                    <%=UIUtil.formatNumber(deal.getQuantity().getQuantity(),4,locale)%>&nbsp;
                <% } else { %> - <% } %>
                <% if (deal != null && deal.getQuantity() != null &&
                        deal.getQuantity().getUnitofMeasure() != null &&
                        deal.getQuantity().getUnitofMeasure().getLabel() != null) {
                %>
                    <%=deal.getQuantity().getUnitofMeasure().getLabel()%>
                <% } %>
                    </td>
                    <td width="10%">
                        <integro:amount amount="<%=deal.getDealCMV()%>" locale="<%=locale%>" />&nbsp;
                    </td>
                    <td width="6%">
                        <integro:amount amount="<%=deal.getDealFSV()%>" locale="<%=locale%>" />&nbsp;
                    </td>
                    <td width="5%" style="text-align:center">
                        <integro:boolean-display style="yn" value="<%=deal.getIsDealSecured()%>"/>&nbsp;
                    </td>
                    <td width="3%" style="text-align:center">
                        <integro:boolean-display style="yn" value="<%=deal.getIsDealClosed()%>"/>&nbsp;
                    </td>
                    <td width="12%">
                        <integro:amount amount="<%=deal.getCashReqAmt()%>" locale="<%=locale%>" />&nbsp;
                    </td>
                    <td style="text-align:center" width="7%">
                        <a href="#" onclick="submitPage(0, '<%=deal.getTrxID()%>', '<%=trxValue.getCustomerID()%>', '<%=trxValue.getLimitProfileID()%>')">View</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr class="odd">
        <td class="fieldname" width="40%">Transaction is currently in To Do(Item) of</td>
        <td width="60%">
          <%
            String todoUser = null;
            if (trxValue.getToUserInfo() != null && trxValue.getToUserInfo().length() > 0) {
                todoUser = trxValue.getToUserInfo();
            }
          %>
          <integro:empty-if-null value="<%=todoUser%>"/>&nbsp;
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname">Status</td>
        <td>
        <%
            String status = null;
            if (ICMSConstant.STATE_PENDING_CLOSE_VERIFY.equals(trxValue.getStatus())) {
                status = "Forward Close";
            } else if (ICMSConstant.STATE_PENDING_CREATE_VERIFY.equals(trxValue.getStatus())) {
                status = "Forward Create";
            } else if (ICMSConstant.STATE_PENDING_UPDATE_VERIFY.equals(trxValue.getStatus())) {
                status = "Forward Update";
            }
        %>
        <integro:empty-if-null value="<%=status%>"/>&nbsp;
        </td>
    </tr>
    </tbody>
</table>
<br/>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
        <a href="javascript:submitPage(1, -1, '<%=trxValue.getCustomerID()%>', '<%=trxValue.getLimitProfileID()%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)">
        <img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" />
        </a>
    </td>
    <td>
        <a href="Reassignment.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
        <img src="img/cancel1.gif" name="Image1"border="0" id="Image1" />
        </a>
    </td>
  </tr>
</table>
<%
    } else {
%>
<table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
    <tbody>
    <tr class="odd">
        <td style="text-align:center" valign="middle">
            <table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                <tbody>
                <tr>
                    <td class="even" style="text-align:center" valign="middle">
                        <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                        <tr class="even">
                            <td style="border:none;text-align:center">
                                <strong><img src="img/info.gif" /></strong>
                            </td>
                        </tr>
                        <tr class="even">
                            <td style="border:none;text-align:center">
                                <strong><font size="2"><br />
                                Sorry, there are no pending multi-level approval deal records found.
                                </font></strong>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
            <br>
            <a href="Reassignment.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a>
        </td>
    </tr>
    </tbody>
</table>

<% } %>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->