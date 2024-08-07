<!--Modified by Pratheepa for CR129-->
<%@ page import="com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.app.commodity.deal.bus.cash.IDealCashDeposit,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashTypeList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.ui.common.ForexHelper,
                 java.util.StringTokenizer,
                 java.math.BigDecimal,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
		 		 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoForm,
                 java.util.Locale,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.collateral.bus.OBValuation,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ICommodityCollateral,
                 com.integrosys.cms.app.commodity.common.AmountConversion,
                 com.integrosys.cms.app.commodity.common.AmountConversionException"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/generalinfo/general_info_update.jsp,v 1.47 2006/10/27 08:40:46 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.47 $
* Date: $Date: 2006/10/27 08:40:46 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityDeal dealObj = trxValue.getStagingCommodityDeal();
    String checkDealAmtAgainstCMVFlag = (String)request.getAttribute("checkDealAmtAgainstCMVFlag");
    String checkDealAmtAgainstCMVMsg = (String)request.getAttribute("checkDealAmtAgainstCMVMsg");
    String currentEventNum = (String)request.getAttribute("currentEventNum");

    String dealTypeDesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.DEAL_TYPE, dealObj.getDealTypeCode());
    String title = "";
    if (dealObj.getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_COLLATERAL_POOL)) {
        title = "Collateral Pool Deal";
    }
    if (dealObj.getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_SPECIFIC_TRANSACTION)) {
        title = "Specific Transaction";
    }

    title = title + " Information - ";
    if (from_event.equals(CommodityDealAction.EVENT_PREPARE_ADD_DEAL)) {
        title = title + "Add New";
    } else {
        title = title + "Edit";
    }

    boolean isNewDeal = false;
    if (trxValue.getCommodityDeal() == null) {
        isNewDeal = true;
    }

    CashTypeList cashTypeList = CashTypeList.getInstance();
    CountryList countryList = CountryList.getInstance();

    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.ARM_Code");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    GeneralInfoForm aForm = (GeneralInfoForm) request.getAttribute("GeneralInfoForm");

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
<script type="text/javascript" src="js/NumberFormat.js"></script><!--ck-->


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
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}

    if (num == '1') {
	     	document.forms[0].event.value = "submit";
	     	document.forms[0].currentEventNum.value = '1';
	}

    if (num == '2') {
        document.forms[0].event.value = "update";
    	document.forms[0].currentEventNum.value = '2';
    }

    if (num == '3') {
        document.forms[0].event.value = "<%=CommodityDealConstant.CASH_DEPOSIT%>"+"_"+"<%=GeneralInfoAction.EVENT_PREPARE%>";
        document.forms[0].indexID.value = "-1";
    }

    if (num == '4') {
        var delObj = document.forms[0].deleteCashDeposit;
		if(typeof(delObj)=='undefined')
		{
		   alert('At least one cash deposit must be checked');
           return false;
		}
        var valid = false;
        if (!delObj.length) {
            valid = delObj.checked;
        } else {
            for (i = 0; i < delObj.length; i++) {
                if (delObj[i].checked) {
                    valid = true;
                }
            }
        }
        if (!valid) {
            alert('At least one cash deposit must be checked');
            return false;
        }

        document.forms[0].event.value = "<%=CommodityDealConstant.CASH_DEPOSIT%>"+"_"+"<%=GeneralInfoAction.EVENT_DELETE_ITEM%>";
    }

    if (num == '5') {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == '6') {
        document.forms[0].event.value="<%=GeneralInfoAction.EVENT_EDIT%>";
    }
    if (num == '7') {
        document.forms[0].action="CommDealSearch.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == '8') {
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_REFRESH%>";
        document.forms[0].subLimitID.value = "";
    }
    if (num == '9') {
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_REFRESH%>";
        document.forms[0].changeLimit.value="<%=ICMSConstant.TRUE_VALUE%>";
        document.forms[0].subLimitID.value = "";
    }
    if (num == '10') {
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_REFRESH%>";
        document.forms[0].changeLimit.value="<%=ICMSConstant.TRUE_VALUE%>";
    }
    document.forms[0].submit();
}

function refreshPage(index) {
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}
    document.forms[0].event.value="<%=CommodityDealAction.EVENT_REFRESH%>";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

function editItem(index) {
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}

    document.forms[0].event.value = "<%=CommodityDealConstant.CASH_DEPOSIT%>"+"_"+"<%=GeneralInfoAction.EVENT_PREPARE_UPDATE_SUB%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function dealAmtBiggerOpLimit() {
<% try {

	System.out.println( aForm.getOriginalFaceCcy());
   CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
   ForexHelper fr = new ForexHelper();
//BigDecimal dealAmt = CommonUtil.calcAfterPercent(dealObj.getOrigFaceValue().getAmountAsBigDecimal(), dealObj.getFinancingPct());
//   Amount a = new Amount();
//   a.setAmount(dealAmt);
//   a.setCurrencyCode(new CurrencyCode(aForm.getOriginalFaceCcy()));
//   fr.convertAmount(a, usd);
   String dealcc = null;
   String dealStr = null;
   dealcc = aForm.getOriginalFaceCcy();
   dealStr = aForm.getDealAmount();
   double USDdAmt = 0.0;
   if (dealStr != null && dealcc != null) {
     Amount a = UIUtil.convertToAmount(locale, dealcc, dealStr);
     USDdAmt = fr.convertAmount(a, usd);
   }
System.out.println("~~~usd amount= " + USDdAmt);

   StringTokenizer st = new StringTokenizer(aForm.getAvailableOpLimit());
   String cc = null;
   String opsLimitStr = null;
   if (st.hasMoreTokens())
     cc = st.nextToken();
   if (st.hasMoreTokens())
     opsLimitStr = st.nextToken();
   double USDOpsLimit = 0.0;
   if (opsLimitStr != null && cc != null) {
     Amount aa = UIUtil.convertToAmount(locale, cc, opsLimitStr);
     USDOpsLimit = fr.convertAmount(aa, usd);
   }
System.out.println("~~~usd limit amount= " + USDOpsLimit);
   if (USDdAmt > USDOpsLimit) {
%>
	alert("Please note that the Deal Amount exceeds the Available Operational Limit.");

<% }
   } catch (Exception e) {System.out.println("````` " + e.getMessage()); e.printStackTrace(); }
%>
}
function dealAmtBiggerCmv() {

    var flag = document.forms[0].checkDealAmtAgainstCMVFlag.value;
    var msg = document.forms[0].checkDealAmtAgainstCMVMsg.value;

    if((flag == "<%=CommodityDealConstant.CHECK_AMT_GREATER_THAN_CMV%>") ||
    (flag == "<%=CommodityDealConstant.CHECK_AMT_AMOUNT_CONVERSION_ERROR%>")) {
        if (confirm(msg)) {
            document.forms[0].checkDealAmtAgainstCMVFlag.value = "<%=CommodityDealConstant.CHECK_AMT_AGAINST_CMV_NOT_REQUIRED%>";
            submitPage(document.forms[0].currentEventNum.value);
        } else {
            document.forms[0].checkDealAmtAgainstCMVFlag.value = "<%=CommodityDealConstant.CHECK_AMT_AGAINST_CMV_REQUIRED%>";
        }
    }
}


	function dealAmtBiggerSubLimitActive(){
		<%
			boolean alertFlag = false;
			try{
	  			String dealStr = aForm.getDealAmount();
	   			String dealcc = aForm.getOriginalFaceCcy();
	  			double dealAmt = 0;
	   			if (dealStr != null) {
		   			dealAmt = Double.parseDouble(dealStr);
	 			}
	 			double slActiveAmt = 0;
	 			ISubLimit sl = (ISubLimit)request.getAttribute("selectedSublimit");
	 			if(sl!=null){
		 			double slAmountD = Double.parseDouble(sl.getActiveAmount());
		 			String slCCYStr = sl.getSubLimitCCY();
		 			slActiveAmt = ForexHelper.getInstance().convertAmount(new Amount(slAmountD,slCCYStr),new CurrencyCode(dealcc)) ;
	 			}
	 			if(slActiveAmt<dealAmt) {
			 		alertFlag = true;
	 			}
			}catch(Exception e){
				System.out.println("Exception occurs in general_info_update.jsp.");
			}
			//System.out.println("Flag : "+alertFlag);
		%>
		<%
			if(alertFlag){
		%>
			alert('Please note that the Deal Amount exceeds the Sub Limit Activated Amount !');
		<%
			}
		%>
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>

<html:form action="GeneralInfo.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=GeneralInfoAction.EVENT_EDIT%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="changeLimit"/>
<input type="hidden" name="commentIndexID"/>
<input type="hidden" name="checkDealAmtAgainstCMVFlag" value="<%=checkDealAmtAgainstCMVFlag%>"/>
<input type="hidden" name="checkDealAmtAgainstCMVMsg" value="<%=checkDealAmtAgainstCMVMsg%>"/>
<input type="hidden" name="currentEventNum" value="<%=currentEventNum%>"/>
<html:hidden property="colCashReqPct"/>

<input type="hidden" name="isNewDeal" value="<%=isNewDeal?ICMSConstant.TRUE_VALUE:ICMSConstant.FALSE_VALUE%>"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><a name="Top" id="Top"></a>Edit Security Details - Commodity</h3></td>
    </tr>
    <tr>
      <td><h3><%=title%></h3></td>
      <td align="right" valign="bottom">
        <input type="button" name="button3" id="refresh" value="Refresh" class="btnNormal" onClick="submitPage(10)"/>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
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
          <td>
            <html:text property="tpDealRef"  maxlength="20"/>
            <html:errors property="tpDealRef"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Security ID&nbsp;<font color="#0000FF">* </font></td>
          <td>
              <html:select property="securityID" onchange="submitPage(8)" disabled="<%=!isNewDeal%>">
	              <option value="" >Please Select </option>
	              <html:options name="secID" labelName="secValue"/>
              </html:select>
              <html:errors property="securityID"/>
          </td>
          <td class="fieldname">Collateral Type</td>
          <td><integro:empty-if-null value="<%=dealTypeDesc%>"/></td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Limit ID&nbsp;<font color="#0000FF">* </font></td>
          <td><html:select property="limitID" onchange="submitPage(9)" disabled="<%=!isNewDeal%>">
	              <option value="" >Please Select </option>
	              <html:options name="limitIDValues" labelName="limitIDLabels"/>
              </html:select>
              <html:errors property="limitID"/>
          </td>
          <td class="fieldname">Contract No</td>
          <td>
              <html:select property="contractNo" disabled="<%=!isNewDeal%>">
	              <option value="" >Please Select </option>
	              <html:options name="contractNoID" labelName="contractNoValue"/>
              </html:select>
              <html:errors property="contractNo"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Limit CCY</td>
          <td><bean:write name="GeneralInfoForm" property="limitCcy"/>&nbsp;
            <html:hidden property="limitCcy"/>
          </td>
          <td class="fieldname">Available Operational Limit</td>
          <td><bean:write name="GeneralInfoForm" property="availableOpLimit"/>&nbsp;
          <html:hidden property="availableOpLimit"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Sub Limit Type</td>
          <td>
            <html:select property="subLimitID" onchange="submitPage(10)" disabled="<%=!isNewDeal%>">
	        	<option value="" >Please Select </option>
	            <html:options name="subLimitIDValues" labelName="subLimitIDLabels"/>
            </html:select>
          </td>
          <%
          	ISubLimit selectedSublimit= (ISubLimit)request.getAttribute("selectedSublimit");
          	if(selectedSublimit==null){
	          	selectedSublimit= (ISubLimit)request.getAttribute("originalSublimit");
          	}
          	if(selectedSublimit==null){
          		System.out.println("selectedSublimit==null");
	        }
		  %>
          <td class="fieldname">Sub Limit Approved Amount</td>
          <td>
	          <%if(selectedSublimit!=null){%>
	          	<integro:empty-if-null value="<%=selectedSublimit.getSubLimitAmount()%>"/>
	          <%}%>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Sub Limit CCY</td>
          <td>
	          <%if(selectedSublimit!=null){%>
	          <integro:empty-if-null value="<%=selectedSublimit.getSubLimitCCY()%>"/>
	          <%}%>&nbsp;
          </td>
          <td class="fieldname">Sub Limit Activated Amount</td>
          <td>
	          <%if(selectedSublimit!=null){%>
	          	<integro:empty-if-null value="<%=selectedSublimit.getActiveAmount()%>"/>
	          <%}%>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Deal Maturity Date&nbsp;<font color="#0000FF">* </font></td>
          <td>
			  <html:text property="dealMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('dealMaturityDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="dealMaturityDate"/>
          </td>
          <td class="fieldname">Extended Deal Maturity Date</td>
          <td>
              <html:text property="extendedDealMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('extendedDealMaturityDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="extendedDealMaturityDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Original Face Value&nbsp;<font color="#0000FF">* </font></td>
          <td>
          	       <html:select property="originalFaceCcy" disabled="<%=!isNewDeal%>">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="originalFaceCcy"/>
            <html:text property="originalFaceAmt" maxlength="27"/>
            <html:errors property="originalFaceAmt"/>
          </td>
          <td class="fieldname">Percentage of Financing&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="percentageFinancing" maxlength="3" size="5"/>%
            <html:errors property="percentageFinancing"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Deal Amount </td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
              <bean:write name="GeneralInfoForm" property="dealAmount"/>
              <html:hidden property="dealAmount"/>
          </td>
          <td class="fieldname">Balance of Original Face Value</td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="balanceOrigFaceVal"/>
            <html:hidden property="balanceOrigFaceVal"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Cash Requirement&nbsp;<font color="#0000FF"><span id="spanCR">&nbsp;</span></font></td>
          <td>
            <html:text property="cashRequirement" maxlength="3" size="5"/>%
            <html:errors property="cashRequirement"/>
          </td>
          <td class="fieldname">Cash Requirement Amount</td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
              <bean:write name="GeneralInfoForm" property="cashReqAmt"/>&nbsp;
            <html:hidden property="cashReqAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Margin for Cash&nbsp<font color="#0000FF"><span id="spanMC">&nbsp;</span></font></td>
          <td width="30%">
            <html:text property="marginCash" maxlength="3" size="5"/>%
            <html:errors property="marginCash"/>
          </td>
          <td class="fieldname">Actual Cash Received</td>
          <td>
            <bean:write name="GeneralInfoForm" property="actualCashReceive"/>&nbsp;
            <html:hidden property="actualCashReceive"/>
          </td>
        </tr>
        <tr class="even">
          <td  class="fieldname">Total Cash Received Within Overall Requirement</td>
          <td><bean:write name="GeneralInfoForm" property="totalCashReceive"/>&nbsp;
          <html:hidden property="totalCashReceive"/>
          </td>
          <td  class="fieldname">Deal Date</td>
          <td>
			  <html:text property="dealDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('dealDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="dealDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Shipping Marks</td>
          <td width="30%">
            <html:text property="shippingMarks" maxlength="20"/>
            <html:errors property="shippingMarks"/>
          </td>
          <td width="30%" class="fieldname">Latest Shipment Date</td>
          <td width="30%">
			  <html:text property="latestShipmentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('latestShipmentDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="latestShipmentDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Container No.</td>
          <td>
            <html:text property="containerNo" maxlength="20"/>
            <html:errors property="containerNo"/>
          </td>
          <td class="fieldname">Pre-sold</td>
          <td>
              <html:radio property="preSold" value="<%=ICMSConstant.TRUE_VALUE%>" />Yes
              &nbsp;&nbsp;
              <html:radio property="preSold" value="<%=ICMSConstant.FALSE_VALUE%>" />No
              <html:errors property="preSold"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Enforceability Attained</td>
          <td>
              <html:radio property="enforcibilityAtt" value="<%=ICMSConstant.TRUE_VALUE%>" />Yes
              &nbsp;&nbsp;
              <html:radio property="enforcibilityAtt" value="<%=ICMSConstant.FALSE_VALUE%>" />No
              <html:errors property="enforcibilityAtt"/>
          </td>
          <td class="fieldname">Date of Enforceability Attained</td>
          <td>
			  <html:text property="enforcibilityAttDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('enforcibilityAttDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="enforcibilityAttDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Remarks</td>
          <td colspan="3">
            <html:textarea property="commDealRemarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="commDealRemarks"/>
          </td>
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
     <td width="8%" valign="baseline" align="right">
         <input name="Submit2" type="button" class="btnNormal" value="Delete" onClick="javascript:submitPage(4)"/>
    </td>
    <td align="right" valign="bottom" width="8%">
         <input name="Submit2" type="button" class="btnNormal" value="Add New" onClick="javascript:submitPage(3)"/>
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
          <td width="4%">S/N</td>
          <td width="10%">Deposit/Source Ref No.</td>
          <td width="16%">Type of Cash Holding</td>
          <td width="7%">CCY</td>
          <td width="11%">Deposit Amount</td>
          <td width="14%">Cash Location</td>
          <td width="17%">Deposit Maturity Date</td>
          <td width="12%">Action</td>
          <td width="9%" class="tblInput">Remove</td>
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
          <td width="10%"><integro:empty-if-null value="<%=cashDeposit[i].getReferenceNo()%>"/></td>
          <td width="16%">
            <integro:empty-if-null value="<%=cashTypeList.getCashTypeItem(cashDeposit[i].getDepositType())%>"/>
          </td>
          <%
              Amount amount = cashDeposit[i].getAmount();
          %>
          <td width="7%"><%=amount!=null?amount.getCurrencyCode():""%></td>
          <td width="11%">
          <%
              if (amount != null && amount.getCurrencyCode() != null) {
          %><integro:currency amount="<%=amount%>" param="amount"/>
          <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="14%">
            <integro:empty-if-null value="<%=countryList.getCountryName(cashDeposit[i].getLocationCountryCode())%>"/>
          </td>
          <td style="text-align:center" width="17%">
            <integro:date object="<%=cashDeposit[i].getMaturityDate()%>"/>
          </td>
          <td style="text-align:center" width="12%"><a href="javascript:editItem(<%=i%>)">View/Edit</a></td>
          <td style="text-align:center" width="9%">
            <html:multibox property="deleteCashDeposit" value="<%=String.valueOf(i)%>"/>
          </td>
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
          <td width="11%" class="Total">
            <bean:write name="GeneralInfoForm" property="totalCashDeposit"/>&nbsp;
            <html:hidden property="totalCashDeposit"/>
          </td>
          <td width="14%" class="Total">&nbsp;</td>
          <td width="17%" class="Total">&nbsp;</td>
          <td width="12%" class="Total">&nbsp;</td>
          <td width="9%" class="Total">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<%
    if (ICMSConstant.STATE_REJECTED.equals(trxValue.getStatus())) {
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td width="77%">
      <h3>Comments</h3>
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
          <td class="fieldname" width="11%">Comments</td>
          <td width="89%">
            <html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="remarks"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<br/>
<% } %>
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
                <a href="#" onClick="refreshPage(<%=i%>)"><integro:wrapper value="<%=log%>"/></a>
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

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="100%" align="center">
<html:errors property="validateOpLimit"/>
<html:errors property="overallError1"/>
<html:errors property="overallError2"/>
<html:errors property="overallError3"/>
</td>
</tr>
</table>
<table width="214" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage(1)"   onmouseout="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31" border="0" id="Image3" /></a></td>
    <%
        if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
    %>
    <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
        } else {
            String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
            if (previous_event != null &&
                    previous_event.equals(GeneralInfoAction.EVENT_LIST)) {
    %>
    <td><a href="javascript:submitPage(5)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
            } else {
    %>
    <td><a href="javascript:submitPage(7)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } } %>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
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

<script>
dealAmtBiggerCmv();
dealAmtBiggerOpLimit();
dealAmtBiggerSubLimitActive();

</script>
<!-- InstanceEnd --></html>
