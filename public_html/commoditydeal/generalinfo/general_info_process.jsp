<%@ page import="
				 java.util.HashMap,
				 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoForm,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.cash.IDealCashDeposit,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashTypeList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant,
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
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/generalinfo/general_info_process.jsp,v 1.38 2006/10/27 08:40:46 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.38 $
* Date: $Date: 2006/10/27 08:40:46 $
* Tag: $Name:  $
*/
%>
<%
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityDeal actual = trxValue.getCommodityDeal();
    ICommodityDeal staging = trxValue.getStagingCommodityDeal();
    String previous = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");

    String dealTypeDesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.DEAL_TYPE, staging.getDealTypeCode());
    String title = "";
    if (staging.getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_COLLATERAL_POOL)) {
        title = "Collateral Pool Deal";
    }
    if (staging.getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_SPECIFIC_TRANSACTION)) {
        title = "Specific Transaction";
    }

    title = title + " Information";

    GeneralInfoForm aForm = (GeneralInfoForm)request.getAttribute("GeneralInfoForm");

    CashTypeList cashTypeList = CashTypeList.getInstance();
    CountryList countryList = CountryList.getInstance();

    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.ARM_Code");
    String isNewDeal = (trxValue.getCommodityDeal() != null)?ICMSConstant.FALSE_VALUE:ICMSConstant.TRUE_VALUE;

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
    if (num == 1) {
    	document.forms[0].event.value="approve";
    }
	if (num == 2) {
    	document.forms[0].event.value="reject";
    }
    if (num == 3) {
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_FORWARD_DEAL%>";
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
<input type="hidden" name="commentIndexID"/>
<input type="hidden" name="isNewDeal" value="<%=isNewDeal%>"/>
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
        <%
            boolean isSame = true;
            if (staging.getContractID() > 0 && 
                    (actual == null || actual.getContractID() <= 0)) {
                isSame = false;
            } else if (staging.getContractID() <= 0 && actual != null &&
                    actual.getContractID() > 0) {
                isSame = false;
            } else if (staging.getContractID() > 0 && actual != null &&
                    actual.getContractID() > 0 && 
                    staging.getContractID() != actual.getContractID()) {
                isSame = false;
            }
        %>
        <tr class="odd">
          <td class="fieldname">Deal No</td>
          <td><integro:empty-if-null value="<%=staging.getDealNo()%>"/></td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "dealReferenceNo")?"fieldname":"fieldnamediff"%>">TP Deal Reference&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="tpDealRef"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "collateralID")?"fieldname":"fieldnamediff"%>">Security ID&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="securityID"/>&nbsp;</td>
          <td class="fieldname">Collateral Type</td>
          <td><integro:empty-if-null value="<%=dealTypeDesc%>"/></td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "limitID")?"fieldname":"fieldnamediff"%>">Limit ID&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="limitID"/>&nbsp;</td>
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Contract No</td>
          <td><bean:write name="GeneralInfoForm" property="contractNo"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname">Limit CCY</td>
          <td><bean:write name="GeneralInfoForm" property="limitCcy"/>&nbsp;</td>
          <td class="fieldname">Available Operational Limit</td>
          <td><bean:write name="GeneralInfoForm" property="availableOpLimit"/>&nbsp;</td>
        </tr>
          <%
          	ISubLimit sl = (ISubLimit)request.getAttribute("originalSublimit");
  			StringBuffer sltNameBuffer = new StringBuffer();
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
      		}	 
      		
      		String sltClass = "fieldname";
      		//System.out.println("s: "+staging.getSubLimitID());
      		if(actual!=null){
      			//System.out.println("a: "+actual.getSubLimitID());
      			sltClass = CompareOBUtil.compOB(staging, actual, "subLimitID")?"fieldname":"fieldnamediff";
  			}else if(staging.getSubLimitID()!=ICMSConstant.LONG_INVALID_VALUE){
	  			sltClass = "fieldnamediff";
	  		}
          %>
        <tr class="odd">
          <td class="<%=sltClass%>">Sub Limit Type</td>
          <td>
          	&nbsp;<%=sltNameBuffer.toString()%>
          </td>
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
          <td class="<%=CompareOBUtil.compOB(staging, actual, "dealMaturityDate")?"fieldname":"fieldnamediff"%>">Deal Maturity Date&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="dealMaturityDate"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "extendedDealMaturityDate")?"fieldname":"fieldnamediff"%>">Extended Deal Maturity Date</td>
          <td><bean:write name="GeneralInfoForm" property="extendedDealMaturityDate"/>&nbsp;</td>
        </tr>
        <%
            Amount actualAmt = null;
            Amount stageAmt = null;
            if (actual != null) {
                actualAmt = actual.getOrigFaceValue();
            }
            if (staging != null) {
                stageAmt = staging.getOrigFaceValue();
            }
            isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Original Face Value&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="originalFaceAmt"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "financingPct")?"fieldname":"fieldnamediff"%>">Percentage of Financing&nbsp;<font color="#0000FF">* </font></td>
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
        <%
            isSame = true;
            if (actual == null) {
                //since cash requirement is a mandatory field and
                // when its not null nor its initialised value, it will always be "edited"
                if (staging != null && staging.getCashReqPct() != ICMSConstant.DOUBLE_INVALID_VALUE) {
                    isSame = false;
                }
            } else {
                isSame = CompareOBUtil.compOB(staging, actual, "cashReqPct");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Cash Requirement&nbsp;<font color="#0000FF"><span id="spanCR">&nbsp;</span></font></td>
          <td><bean:write name="GeneralInfoForm" property="cashRequirement"/>&nbsp;%</td>
          <td class="fieldname">Cash Requirement Amount</td>
          <td><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;
            <bean:write name="GeneralInfoForm" property="cashReqAmt"/>
          </td>
        </tr>
        <%
            isSame = true;
            if (actual == null) {
                if (staging != null && staging.getCashMarginPct() != ICMSConstant.DOUBLE_INVALID_VALUE) {
                    isSame = CompareOBUtil.compOB(staging, actual, "cashMarginPct");
                }
            } else {
                isSame = CompareOBUtil.compOB(staging, actual, "cashMarginPct");
            }
        %>
        <tr class="odd">
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>">Margin for Cash&nbsp;<font color="#0000FF"><span id="spanMC">&nbsp;</span></font></td>
          <td width="30%"><bean:write name="GeneralInfoForm" property="marginCash"/>&nbsp;% </td>
          <td class="fieldname">Actual Cash Received</td>
          <td>
          <bean:write name="GeneralInfoForm" property="actualCashReceive"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Total Cash Received Within Overall Requirement</td>
          <td><bean:write name="GeneralInfoForm" property="totalCashReceive"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "dealDate")?"fieldname":"fieldnamediff"%>">Deal Date</td>
          <td><bean:write name="GeneralInfoForm" property="dealDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td width="20%" class="<%=CompareOBUtil.compOB(staging, actual, "shippingMarks")?"fieldname":"fieldnamediff"%>">Shipping Marks</td>
          <td width="30%"><bean:write name="GeneralInfoForm" property="shippingMarks"/>&nbsp;</td>
          <td width="30%" class="<%=CompareOBUtil.compOB(staging, actual, "latestShipDate")?"fieldname":"fieldnamediff"%>">Latest Shipment Date</td>
          <td width="30%"><bean:write name="GeneralInfoForm" property="latestShipmentDate"/>&nbsp;
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "containerNo")?"fieldname":"fieldnamediff"%>">Container No.</td>
          <td><bean:write name="GeneralInfoForm" property="containerNo"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "IsPreSold")?"fieldname":"fieldnamediff"%>">Pre-sold</td>
          <td>
          <%
              String yesNoVal = null;
              if (aForm.getPreSold() != null) {
                  if (aForm.getPreSold().equals(ICMSConstant.TRUE_VALUE)) {
                      yesNoVal = "Yes";
                  } else if (aForm.getPreSold().equals(ICMSConstant.FALSE_VALUE)) {
                      yesNoVal = "No";
                  }
              }
          %><integro:empty-if-null value="<%=yesNoVal%>"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "isEnforceAttained")?"fieldname":"fieldnamediff"%>">Enforceability Attained</td>
          <td>
          <%
              yesNoVal = null;
              if (aForm.getEnforcibilityAtt() != null) {
                  if (aForm.getEnforcibilityAtt().equals(ICMSConstant.TRUE_VALUE)) {
                      yesNoVal = "Yes";
                  } else if (aForm.getEnforcibilityAtt().equals(ICMSConstant.FALSE_VALUE)) {
                      yesNoVal = "No";
                  }
              }
          %><integro:empty-if-null value="<%=yesNoVal%>"/>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "enforceAttainedDate")?"fieldname":"fieldnamediff"%>">Date of Enforceability Attained</td>
          <td><bean:write name="GeneralInfoForm" property="enforcibilityAttDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "remarks")?"fieldname":"fieldnamediff"%>">Remarks</td>
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
        IDealCashDeposit[] actualCash = null;
        IDealCashDeposit[] stagingCash = null;
    if (actual != null) {
        actualCash = actual.getCashDeposit();
    }
    if (staging != null) {
        stagingCash = staging.getCashDeposit();
    }
        List res = CompareOBUtil.compOBArray(stagingCash,actualCash);
        ArrayList list = new ArrayList(res);
        pageContext.setAttribute("cashDeposit",list);
        if (list == null || list.size() == 0) {
%>
        <tr class="odd"><td colspan="8">There is no Cash Deposit.</td></tr>
<%
        } else {
            int count = 0;
%>
		<logic:present name="cashDeposit" >
        <logic:iterate id="compResult" name="cashDeposit"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IDealCashDeposit obj = (IDealCashDeposit)compResult.getObj();
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" width="4%"><%=count + 1%></td>
          <td width="12%"><integro:empty-if-null value="<%=obj.getReferenceNo()%>"/>&nbsp;</td>
          <td width="18%"><integro:empty-if-null value="<%=cashTypeList.getCashTypeItem(obj.getDepositType())%>"/>&nbsp;</td>
          <%
              Amount amount = obj.getAmount();
          %>
          <td width="7%"><%=amount!=null?amount.getCurrencyCode():""%>&nbsp;</td>
          <td width="15%">
          <%
              if (amount != null && amount.getCurrencyCode() != null) {
          %><integro:currency amount="<%=amount%>" param="amount"/>
          <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="15%">
            <integro:empty-if-null value="<%=countryList.getCountryName(obj.getLocationCountryCode())%>"/>
          </td>
          <td style="text-align:center" width="17%"><integro:date object="<%=obj.getMaturityDate()%>"/></td>
          <td style="text-align:center" width="12%"><a href="javascript:viewItem(<%=String.valueOf(obj.getCommonReferenceID())%>, '<%=CommodityDealConstant.CASH_DEPOSIT%>')">View</a></td>
        </tr>
<%
            count++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>
        <tr class="odd">
          <td class="Total" style="text-align:center" width="4%">&nbsp;</td>
          <td width="12%" class="Total">&nbsp;</td>
          <td width="18%" class="Total">Total (Txn CCY Equiv)</td>
          <td width="7%" class="Total" style="text-align:right"><bean:write name="GeneralInfoForm" property="originalFaceCcy"/>&nbsp;</td>
          <td width="15%" class="Total"><bean:write name="GeneralInfoForm" property="totalCashDeposit"/>&nbsp;</td>
          <td width="15%" class="Total">&nbsp;</td>
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
    if (previous == null || !previous.equals(ReassignmentConstant.TASK_EVENT)) {
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
          <%
            if (previous != null && previous.equals(GeneralInfoAction.EVENT_USER_PROCESS)) {
          %>
              <% if (log != null && log.length() > 0) { %>
                <a href="#" onclick="refreshPage(<%=i%>)"><integro:wrapper value="<%=log%>"/></a>
              <% } %>&nbsp;
          <% } else { %>
                <integro:wrapper value="<%=log%>"/>&nbsp;
          <% } %>
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
<br>
<%
        if (previous != null && (previous.equals(GeneralInfoAction.EVENT_USER_PROCESS) ||
                previous.equals(ReassignmentConstant.TASK_EVENT))) {
%>
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
<%
            if (!previous.equals(ReassignmentConstant.TASK_EVENT) &&
                    !trxValue.getStatus().equals(ICMSConstant.STATE_PENDING_REJECT)) {
%>
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0" dwcopytype="CopyTableRow">
  <tr>
    <td width="125">&nbsp;</td>
    <td width="115">&nbsp;</td>
  </tr>
  <tr>
    <td width="125">
              <html:select property="forwardUser">
	              <option value="" >Please Select </option>
	              <html:options name="forwardID" labelName="forwardValue"/>
              </html:select>
              <html:errors property="forwardUser"/>
    </td>
    <td>
        <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)"><img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" /></a>
    </td>
  </tr>
</table>
<%  } } else { %>
<table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="94">
        <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)">
        <img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" />
        </a>
    </td>
  </tr>
</table>
<%
        }
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
        <%
            if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
        %>
        <td colspan="3"><a href="Reassignment.do?event=search&reassignmentType=<%=ReassignmentConstant.TASK_TYPE_DEAL%>&searchType=<%=ReassignmentConstant.TASK_SEARCH_KEY%>&dealNo=<%=staging.getDealNo()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a>
        </td>
        <% } else { %>
        <td>
        <%
            if (!trxValue.getStatus().equals(ICMSConstant.STATE_PENDING_REJECT)) {
        %>
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a>
        <% } %>
        </td>
        <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% } %>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>

</html:form>
<!-- InstanceEndEditable -->
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

</body>
<!-- InstanceEnd --></html>
