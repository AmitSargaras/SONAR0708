<%@ page import="
				 java.util.HashMap,
				 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoForm,
                 com.integrosys.cms.app.commodity.deal.bus.cash.IDealCashDeposit,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashTypeList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,
                 com.integrosys.cms.app.transaction.OBCMSTrxRouteInfo,
				 com.integrosys.component.commondata.app.CommonDataSingleton,      
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SubLimitUtils,				 
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %> 
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/generalinfo/general_info_view.jsp,v 1.33 2006/10/27 08:40:46 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.33 $
* Date: $Date: 2006/10/27 08:40:46 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityDeal dealObj;
    if (from_event.equals(GeneralInfoAction.EVENT_READ)) {
        dealObj = trxValue.getCommodityDeal();
    } else {
        dealObj = trxValue.getStagingCommodityDeal();
    }
    String dealTypeDesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.DEAL_TYPE, dealObj.getDealTypeCode());
    String title = "";
    if (dealObj.getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_COLLATERAL_POOL)) {
        title = "Collateral Pool Deal";
    }
    if (dealObj.getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_SPECIFIC_TRANSACTION)) {
        title = "Specific Transaction";
    }

    title = title + " Information";
    GeneralInfoForm aForm = (GeneralInfoForm)request.getAttribute("GeneralInfoForm");
    CashTypeList cashTypeList = CashTypeList.getInstance();
    CountryList countryList = CountryList.getInstance();

    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.ARM_Code");
    String fromToDo = (request.getAttribute("fromToDo") == null) ? null : (String)request.getAttribute("fromToDo");

%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
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
    if (num == '1') {
  	    document.forms[0].event.value="<%=GeneralInfoAction.EVENT_CLOSE%>";
    }
    if (num == '2') {
        document.forms[0].event.value="<%=GeneralInfoAction.EVENT_CLOSE_DEAL%>";
    }
    if (num == '3') {
        document.forms[0].action="CommodityDeal.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == '4') {
        document.forms[0].action="CommDealSearch.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST%>";
        document.forms[0].dealNo.value="<%=dealObj.getDealNo()%>";
    }
    if (num == '5') {
        document.forms[0].action="CommodityDeal.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST_CLOSED%>";
    }
    document.forms[0].submit();
}

function viewItem(index, type) {
    document.forms[0].event.value = type+"_<%=GeneralInfoAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function refreshPage(index) {
    document.forms[0].event.value="<%=CommodityDealAction.EVENT_REFRESH_COMMENT%>";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif','img/close2.gif','img/cancel2.gif')">
<html:form action="GeneralInfo.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=GeneralInfoAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="dealNo"/>
<input type="hidden" name="commentIndexID"/>

<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><a name="Top" id="Top"></a>View Security Details - Commodity </h3></td>
    </tr>
    <tr>
      <td>
      <h3><%=title%></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname">Customer ID</td>
          <td width="30%"><%=customer.getCMSLegalEntity().getLEReference()%></td>
          <td width="20%" class="fieldname">Customer Name</td>
          <td width="30%"><integro:empty-if-null value="<%=customer.getCustomerName()%>"/></td>
        </tr>
        <tr class="even">
          <td class="fieldname">Customer Legal Name</td>
          <td><integro:empty-if-null value="<%=customer.getCMSLegalEntity().getLegalName()%>"/><br />
          </td>
          <td  class="fieldname">FAM Code</td>
          <td><integro:empty-if-null value="<%=armCode%>"/></td>
        </tr>
        <tbody>
        <tr class="odd">
          <td class="fieldname">Deal No</td>
          <td><integro:empty-if-null value="<%=dealObj.getDealNo()%>"/></td>
          <td class="fieldname">TP Deal Reference&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="tpDealRef"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname">Security ID&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="securityID"/>&nbsp;</td>
          <td class="fieldname">Collateral Type</td>
          <td><integro:empty-if-null value="<%=dealTypeDesc%>"/></td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Limit ID&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="limitID"/>&nbsp;</td>
          <td class="fieldname">Contract No</td>
          <td><bean:write name="GeneralInfoForm" property="contractNo"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname">Limit CCY</td>
          <td><bean:write name="GeneralInfoForm" property="limitCcy"/>&nbsp;</td>
          <td class="fieldname">Available Operational Limit</td>
          <td><bean:write name="GeneralInfoForm" property="availableOpLimit"/>&nbsp;</td>
        </tr>
          <%          
          	if(dealObj!=null){
          		System.out.println(dealObj.getSubLimitID());
	        }
          	ISubLimit sl = (ISubLimit)request.getAttribute("originalSublimit");
  			StringBuffer sltNameBuffer = new StringBuffer();
  			if(sl==null){
	  			sl = (ISubLimit)request.getAttribute("selectedSublimit");
  			}
          	if(sl!=null){
	          	HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
	          	HashMap sltMap = SubLimitUtils.getSLTMap();
				ISubLimitType slt = (ISubLimitType)sltMap.get(sl.getSubLimitType());
				if(slt!=null){
		  			sltNameBuffer.append(slt.getSubLimitType());
		  			sltNameBuffer.append("(");
		  			sltNameBuffer.append(limitTypeMap.get(String.valueOf(slt.getLimitType())));
		  			sltNameBuffer.append(")");	 
  				}
      		}else{
	      		System.out.println("sl == null.");	
      		}
          %>
        <tr class="odd">
          <td class="fieldname">Sub Limit Type</td>
          <td>
	        <%--bean:write name="GeneralInfoForm" property="subLimitID"/--%>&nbsp;<%=sltNameBuffer.toString()%>
          </td>
          <%
          	//ISubLimit selectedSublimit= (ISubLimit)request.getAttribute("originalSublimit");
		  %>
          <td class="fieldname">Sub Limit Approved Amount</td>
          <td>
	          <%if(sl!=null){%>	
	          	<integro:empty-if-null value="<%=sl.getSubLimitAmount()%>"/>
	          <%}%>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Sub Limit CCY</td>
          <td>
	          <%if(sl!=null){%>	
	          <integro:empty-if-null value="<%=sl.getSubLimitCCY()%>"/>
	          <%}%>&nbsp;
          </td>
          <td class="fieldname">Sub Limit Activated Amount</td>
          <td>
	          <%if(sl!=null){%>	
	          	<integro:empty-if-null value="<%=sl.getActiveAmount()%>"/>
	          <%}%>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Deal Maturity Date&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="dealMaturityDate"/>&nbsp;</td>
          <td class="fieldname">Extended Deal Maturity Date</td>
          <td><bean:write name="GeneralInfoForm" property="extendedDealMaturityDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname">Original Face Value&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="originalFaceAmt"/>
          </td>
          <td class="fieldname">Percentage of Financing&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="percentageFinancing"/>&nbsp;%</td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Deal Amount (Activated Sub-Limit)</td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="dealAmount"/>
          </td>
          <td class="fieldname">Balance of Original Face Value</td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="balanceOrigFaceVal"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Cash Requirement&nbsp;<font color="#0000FF"><span id="spanCR">&nbsp;</span></font> </td>
          <td><bean:write name="GeneralInfoForm" property="cashRequirement"/>&nbsp;%</td>
          <td class="fieldname">Cash Requirement Amount</td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="cashReqAmt"/></td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Margin for Cash&nbsp;<font color="#0000FF"><span id="spanMC">&nbsp;</span></font></td>
          <td width="30%"><bean:write name="GeneralInfoForm" property="marginCash"/>&nbsp;% </td>
          <td class="fieldname">Actual Cash Received</td>
          <td>
            <bean:write name="GeneralInfoForm" property="actualCashReceive"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname">Total Cash Received Within Overall Requirement</td>
          <td><bean:write name="GeneralInfoForm" property="totalCashReceive"/>&nbsp;</td>
          <td class="fieldname">Deal Date</td>
          <td><bean:write name="GeneralInfoForm" property="dealDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Shipping Marks</td>
          <td width="30%"><bean:write name="GeneralInfoForm" property="shippingMarks"/>&nbsp;</td>
          <td width="30%" class="fieldname">Latest Shipment Date</td>
          <td width="30%"><bean:write name="GeneralInfoForm" property="latestShipmentDate"/>&nbsp;
        </tr>
        <tr class="even">
          <td class="fieldname">Container No.</td>
          <td><bean:write name="GeneralInfoForm" property="containerNo"/>&nbsp;</td>
          <td class="fieldname">Pre-sold</td>
          <td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getPreSold()).booleanValue()%>"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Enforceability Attained</td>
          <td>
          <%
              String yesNoVal = null;
              if (aForm.getEnforcibilityAtt() != null) {
                  if (aForm.getEnforcibilityAtt().equals(ICMSConstant.TRUE_VALUE)) {
                      yesNoVal = "Yes";
                  } else if (aForm.getEnforcibilityAtt().equals(ICMSConstant.FALSE_VALUE)) {
                      yesNoVal = "No";
                  }
              }
          %><integro:empty-if-null value="<%=yesNoVal%>"/>&nbsp;
          </td>
          <td class="fieldname">Date of Enforceability Attained</td>
          <td><bean:write name="GeneralInfoForm" property="enforcibilityAttDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname">Remarks</td>
          <td colspan="3"><integro:wrapper value="<%=aForm.getCommDealRemarks()%>"/>&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td width="77%">
      <h3>Cash Deposit Information</h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr />
    </td>
  </tr>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="4%">S/N</td>
          <td width="12%">Deposit/Source Ref No.</td>
          <td width="18%">Type of Cash Holding</td>
          <td width="7%">CCY</td>
          <td width="15%">Deposit Amount</td>
          <td width="15%">Cash Location</td>
          <td width="17%">Deposit Maturity Date</td>
          <td width="12%">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            IDealCashDeposit[] cashDeposit = dealObj.getCashDeposit();
            if (cashDeposit == null || cashDeposit.length == 0) {
        %>
        <tr class="odd"><td colspan="9">There is no Cash Deposit.</td></tr>
        <%
            } else {
                for (int i = 0; i <cashDeposit.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" width="4%"><%=i + 1%></td>
          <td width="12%"><integro:empty-if-null value="<%=cashDeposit[i].getReferenceNo()%>"/></td>
          <td class="amount" width="18%">
            <integro:empty-if-null value="<%=cashTypeList.getCashTypeItem(cashDeposit[i].getDepositType())%>"/>
          </td>
          <%
              Amount amount = cashDeposit[i].getAmount();
          %>
          <td width="7%"><%=amount!=null?amount.getCurrencyCode():""%></td>
          <td width="15%">
          <%
              if (amount != null && amount.getCurrencyCode() != null) {
          %><integro:currency amount="<%=amount%>" param="amount"/>
          <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="15%">
            <integro:empty-if-null value="<%=countryList.getCountryName(cashDeposit[i].getLocationCountryCode())%>"/>
          </td>
          <td style="text-align:center" width="17%"><integro:date object="<%=cashDeposit[i].getMaturityDate()%>"/></td>
          <td style="text-align:center" width="12%"><a href="javascript:viewItem(<%=i%>, '<%=CommodityDealConstant.CASH_DEPOSIT%>')">View</a></td>
        </tr>
        <%
                }
            }
        %>
        <tr class="odd">
          <td class="Total" style="text-align:center" width="4%">&nbsp;</td>
          <td width="10%" class="Total">&nbsp;</td>
          <td width="16%" class="Total">Total (Txn CCY Equiv)</td>
          <td width="7%" class="Total" style="text-align:right"><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;</td>
          <td width="11%" class="Total"><bean:write name="GeneralInfoForm" property="totalCashDeposit"/>&nbsp;</td>
          <td width="14%" class="Total">&nbsp;</td>
          <td width="17%" class="Total">&nbsp;</td>
          <td width="12%" class="Total">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  <thead>
  </thead> <tbody>
  </tbody>
</table>
<%
//    if (previous_event != null && previous_event.equals(GeneralInfoAction.EVENT_USER_TO_TRACK)) {
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td width="77%">
      <h3>History of Comments</h3>
    </td>
   </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="5%">S/N</td>
          <td width="19%"> Date/Time</td>
          <td width="22%">Made By</td>
          <td width="54%">Comments</td>
        </tr>
        </thead>
        <tbody>
        <%
            OBCMSTrxHistoryLog[] historyLog = (OBCMSTrxHistoryLog[])trxValue.getTransactionHistory();
            if (historyLog == null || historyLog.length == 0) {
        %>
        <tr class="odd">
          <td colspan="4">No Comments</td>
        </tr>
        <%
            } else {
                for (int i = 0; i < historyLog.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td style="text-align:center" width="5%" class="index"><%=i + 1%></td>
          <td width="19%" ><integro:empty-if-null value="<%=historyLog[i].getLogDate()%>"/>&nbsp;</td>
          <td width="22%" ><integro:empty-if-null value="<%=historyLog[i].getLogUserName()%>"/>&nbsp;
          (<integro:empty-if-null value="<%=historyLog[i].getLogGroupName()%>"/>)
          </td>
          <%
                    String log = historyLog[i].getRemarks();
                    if (log != null && log.length() > 100) {
                        log = log.substring(0, 100);
                    }
          %>
          <td width="54%" style="text-align:left">
              <% if (log != null && log.length() > 0) { %>
                <a href="#" onclick="refreshPage(<%=i%>)"><integro:wrapper value="<%=log%>"/></a>
              <% } %>&nbsp;
          </td>
        </tr>
        <% } } %>
        <tr class="odd">
          <td class="Total" style="text-align:center" width="5%">&nbsp;</td>
          <td width="19%" class="Total">&nbsp;</td>
          <td width="22%" class="Total">&nbsp;</td>
          <td width="54%" class="Total" style="text-align:right">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<br/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tr>
    <td width="77%">
      <h3>Comments Selected</h3>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr />
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <tr class="odd">
      <%
          String indexID = request.getParameter("commentIndexID");
          if (indexID == null || indexID.length() == 0) {
      %>
      <td colspan="2">There is no comment selected.</td>
      <%
          } else {
              OBCMSTrxHistoryLog history = historyLog[Integer.parseInt(indexID)];
      %>
          <td class="fieldname" width="11%">
            <integro:empty-if-null value="<%=history.getLogUserName()%>"/>&nbsp;
            (<integro:empty-if-null value="<%=history.getLogGroupName()%>"/>)
          </td>
          <td width="89%"><integro:wrapper lineLength="85" value="<%=history.getRemarks()%>"/>&nbsp;
          </td>
        <%
          }
        %>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <thead> </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname">Transaction is currently in To Do(Item)
            of </td>
          <td width="30%">
          <%
            String todoUser = null;
            if (trxValue.getToUserInfo() != null && trxValue.getToUserInfo().length() > 0) {
                todoUser = trxValue.getToUserInfo();
            }            
          %>
          <integro:empty-if-null value="<%=todoUser%>"/>
          </td>
        </tr>
        <tbody> </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<% // } %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (from_event.equals(GeneralInfoAction.EVENT_PREPARE_CLOSE)) {
    %>
        <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
   <% } else if (from_event.equals(GeneralInfoAction.EVENT_PREPARE_CLOSE_DEAL)) { %>
        <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <% if(fromToDo == null) { %>
        <td><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% } else { %>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% } %>
  <% } else if (from_event.equals(GeneralInfoAction.EVENT_TRACK)) { %>
        <td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <%
    } else {
        if (previous_event.equals(GeneralInfoAction.EVENT_LIST)) {
  %>
        <td colspan="2"><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else if (previous_event.equals(GeneralInfoAction.EVENT_LIST_CLOSED)) { %>
        <td colspan="2"><a href="javascript:submitPage(5)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else { %>
        <td colspan="2"><a href="javascript:submitPage(4)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } } %>
  </tr>
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
</table>
</html:form>
<script>
    var s = "<%=aForm.getColCashReqPct()%>";
    if(s == "Y") {
        document.getElementById('spanMC').innerText="* ";
       	document.getElementById('spanCR').innerText="* ";
    } else {
       document.getElementById('spanMC').innerText=" ";
       document.getElementById('spanCR').innerText=" ";
    }
</script>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
