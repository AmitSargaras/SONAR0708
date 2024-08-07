<%@ page import="com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainConstant,
                 com.integrosys.cms.ui.collateral.CollateralHelper,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.FacilityTypeList,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,                 
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,                 
                 com.integrosys.cms.app.commodity.main.bus.profile.ISupplier,                                  
                 com.integrosys.cms.app.commodity.CommodityConstant,                 
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,                 
                 com.integrosys.cms.app.customer.bus.OBCustomerSearchResult,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,                 
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.commodity.*,
                 com.integrosys.cms.app.collateral.bus.LimitDetailsComparator,
                 java.math.BigDecimal,
                 java.util.*,                 
				 com.integrosys.cms.ui.collateral.commodity.sublimit.SubLimitUtils,
                 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,                
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/Commodity_process.jsp,v 1.51 2006/10/27 08:30:40 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.51 $
* Date: $Date: 2006/10/27 08:30:40 $
* Tag: $Name:  $
*/
%>

<%
    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");
    int counter = 0;
    ICommodityCollateral[] actual = (ICommodityCollateral[])trxValueMap.get("actual");
    ICommodityCollateral[] stage = (ICommodityCollateral[])trxValueMap.get("staging");

    HashMap secApprovedComm = (HashMap)request.getAttribute("secApprovedCommMap");
    HashMap secHedgeContract = (HashMap)request.getAttribute("secHedgeContractMap");
    HashMap secLoanAgency = (HashMap)request.getAttribute("secLoanAgencyMap");

    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();

    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.ARM_Code");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    HashMap limitList = (HashMap)trxValueMap.get("limitList");
    HashMap limitOuterBCAMap = (HashMap)trxValueMap.get("limitOuterBCAMap");

    ICollateralTrxValue itrxValue = (ICollateralTrxValue) trxValueMap.get("trxValue");
    String collateralTrxToState = "";
    if (itrxValue != null)
        itrxValue.getToState();
    CountryList countryList = CountryList.getInstance();
%>
<%!
    private Object[] combineArray(Object[] origArray, Object[] addArray) {
        int arrayLength = 0;
        if (origArray == null && addArray == null) {
            return null;
        }
        if (origArray != null) {
            arrayLength = origArray.length;
        } else {
            return addArray;
        }
        if (addArray != null) {
            arrayLength = arrayLength + addArray.length;
        } else {
            return origArray;
        }
        Object[] newArray = new Object[arrayLength];
        if (arrayLength != 0) {
            System.arraycopy(origArray, 0, newArray, 0, origArray.length);
            System.arraycopy(addArray, 0, newArray, origArray.length, addArray.length);
        }

        if (newArray != null) {
            for (int i = 0; i < newArray.length; i++) {
            }
        }
        return newArray;
    }
%>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--


function submitPage(num) {
    if (num == 1) {
  	    document.forms[0].event.value="<%=CommodityMainAction.EVENT_APPROVE%>";
    }
    if (num == 2) {
  	    document.forms[0].event.value="<%=CommodityMainAction.EVENT_REJECT%>";
    }
    if (num == 3) {
        document.forms[0].event.value="<%=CommodityMainAction.EVENT_EXPOSURE_SUMMARY%>";
    }
    document.forms[0].submit();
}

function viewItem(index, type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function viewLimitDetails(){
	document.forms[0].action = "CommoditySubLimit.do"
	document.forms[0].event.value = "checker_process_view";
	document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="CommodityMain.do">

<input type="hidden" name="event" value="<%=CommodityMainAction.EVENT_CLOSE%>"/>
<input type="hidden" name="from_page" value="<%=CommodityMainAction.EVENT_PROCESS%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="fromEvent" value="<%=CommodityMainAction.EVENT_PROCESS%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td ><h3><bean:message key="label.security.title.process.commodity"/></h3></td>
      <td width="50%" align="right" valign="baseline">
        <table width="150" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" width="75">
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right" valign="baseline">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="164" valign="bottom" align="right">
                <input type="button" name="button42" id="button4" value="Exposure Summary" class="btnNormal" onclick="submitPage(3)"/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
    <tbody>
      <tr>
        <td colspan="4">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:mesage key="label.security.cust.id"/></td>
          <td width="30%"><%=customer.getCMSLegalEntity().getLEReference()%></td>
          <td width="20%" class="fieldname"><bean:message key="label.customer.name"/></td>
          <td width="30%"><integro:empty-if-null value="<%=customer.getCustomerName()%>"/></td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.cust.legal.name"/></td>
          <td><integro:empty-if-null value="<%=customer.getCMSLegalEntity().getLegalName()%>"/>
          </td>
          <td  class="fieldname"><bean:message key="label.security.fam.code"/></td>
          <td><integro:empty-if-null value="<%=armCode%>"/></td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.type"/></td>
          <td>Commodity</td>
          <td class="fieldname"><bean:message key="label.security.bca.booking.loc"/></td>
          <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(limitProfile.getOriginatingLocation().getCountryCode())%>"/></td>
        </tr>
        </tbody>
      </table>
    </td>
      </tr>
    </tbody>
  </table>
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
      <tr>
        <td> <h3><bean:message key="label.security.sec.details"/></h3></td>
      </tr>
      <tr>
        <td> <hr/> </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr>
          <td width="5%" rowspan="2"><bean:message key="label.global.sn"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.id"/></td>
          <td colspan="2"><bean:message key="label.security.fsv"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.sub.type"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.loc"/></td>
		  <td width="10"  rowspan="2"><bean:message key="label.org.code "/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.approved.cust.diff.eod.price"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.val.cmv"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.valuation.fsv.amount"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.global.action"/></td>
        </tr>
        <tr>
          <td width="5%"><bean:message key="label.ccy"/></td>
          <td width="10%"><bean:message key="label.isda.deal.amount"/></td>
        </tr>
        </thead>
        <tbody>
<%
        List res = CompareOBUtil.compOBArray(stage, actual);
        CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new Comparator() {
        public int compare(Object o1, Object o2) {
            long int1 = ((ICommodityCollateral)((CompareResult)o1).getObj()).getSCISecurityID();
            long int2 = ((ICommodityCollateral)((CompareResult)o2).getObj()).getSCISecurityID();
            if (int1 - int2 > 0)
                return 1;
            if (int1 - int2 < 0)
                return -1;
            return 0;
        }});

        ArrayList list = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("securityList",list);
        if (list == null || list.size() == 0) {
%>
        <tr><td colspan="9">There is no Security.</td></tr>
<%
        } else {
            counter = 0;
%>
		<logic:present name="securityList" >
        <logic:iterate id="compResult" name="securityList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ICommodityCollateral colObj = (ICommodityCollateral)compResult.getObj();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" valign="top"><%=counter + 1%></td>
          <td><%=colObj.getSCISecurityID()%>&nbsp;
          <%
              if (colObj.getStatus().equals(ICMSConstant.STATE_DELETED) ||
                      colObj.getStatus().equals(ICMSConstant.STATE_PENDING_DELETE)) {
          %>
          (<font color="#FF0000"><b>DELETED</b></font>)
          <% } %>
          </td>
          <% Amount secFSV = colObj.getSCIFSV(); %>
          <td>
          <% if (secFSV != null) { %>
              <integro:empty-if-null value="<%=secFSV.getCurrencyCode()%>"/>
          <% } %>&nbsp;
          </td>
          <td>
          <% if (secFSV != null) { %>
              <integro:currency amount="<%=secFSV%>" param="amount"/>
          <% } %>&nbsp;
          </td>
          <td><integro:empty-if-null value="<%=colObj.getCollateralSubType().getSubTypeName()%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(colObj.getCollateralLocation())%>"/>&nbsp;</td>
		  <td>
<% String securityOrg=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,colObj.getSecurityOrganization());%>
		  
		  <integro:empty-if-null value="<%=securityOrg%>"/>&nbsp;</td> 
		  
		  
          <td>
            <%  if (colObj.getApprovedCustomerDifferentialSign() != null) {
                    if (colObj.getApprovedCustomerDifferentialSign().equals(CommodityConstant.SIGN_MINUS)) { %>
            -
            <% } else if (colObj.getApprovedCustomerDifferentialSign().equals(CommodityConstant.SIGN_PLUS)) { %>
            +
            <% } else if (colObj.getApprovedCustomerDifferentialSign().equals(CommodityConstant.SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
            <%
                    if (colObj.getApprovedCustomerDifferential() != null) {
                        String temp = UIUtil.formatNumber(colObj.getApprovedCustomerDifferential(), 6, locale);
            %>
            <integro:empty-if-null value="<%=temp%>"/>
            <%
                    }
            %>
          </td>
          <% IValuation val = colObj.getValuation();%>          
          <td><integro:currency amount="<%=(val!=null)?val.getCMV():null%>"/>&nbsp;</td>
          <td><integro:currency amount="<%=(val!=null)?val.getFSV():null%>"/>&nbsp;</td>                    
          <td><a href="javascript:viewItem(<%=String.valueOf(colObj.getSCISecurityID())%>, '<%=CommodityMainConstant.SECURITY_DETAILS%>')">View</a></td>
        </tr>
<%
            counter++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>
        </tbody>
      </table>
    </td>
      </tr>
    </tbody>
  </table>
  <br>
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  	<tbody>
  		<tr>
  		<td>
  			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
  			<tr class= "odd">
  			<%
  				IPreCondition actualPreConditions = null;
                IPreCondition stagePreConditions = null;
                if (actual[0]!= null) {
                    actualPreConditions = actual[0].retrievePreCondition(limitProfile.getLimitProfileID());
                }
                if (stage[0]!= null) {
                    stagePreConditions = stage[0].retrievePreCondition(limitProfile.getLimitProfileID());
                }
               %>


<td class="<%=CompareOBUtil.compOB(stagePreConditions, actualPreConditions, "preCondition")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.precondition"/>
  				</td>				
  				<td class="80%" color="blue">
  				 	<html:textarea property="preConditions" rows="3" cols="80" style="width:100%" onkeyup="limitTextInput(this.form.preConditions, 1000, 'Pre-Conditions');"/>&nbsp;
            		<html:errors property="preConditions"/>
            	</td>
  			</tr>
  			<tr class="even">
  				<td class="fieldname"><bean:message key="label.security.precondition.last.updated.by"/></td>
  				<td><bean:write name="CommodityMainForm" property="preCondLastUpdatedBy"/>&nbsp;</td>
  			</tr>
  			<tr class="odd">
  				<td class="fieldname"><bean:message key="label.security.precondition.date.updated"/></td>
  				<td><bean:write name="CommodityMainForm" property="preCondUpdatedDate"/>&nbsp;</td>
  			</tr>
  			</table>
  		</td>
  		</tr>
  	</tbody>
  </table>  
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
      <tr>
        <td> <h3><bean:message key="title.limit.viewlimits"/></h3></td>
        <td align="right" valign="baseline">
          <input type="button" name="button23" id="button" value="View Limit Details" class="btnNormal" onclick="viewLimitDetails()"/>
    	</td>
      </tr>
      <tr>
        <td colspan="2"> <hr/> </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr>
          <td width="2%" rowspan="2"><bean:message key="label.global.sn"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.limit.id"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.cmdt.lmt.detail.lmt.pro.type"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.outer.limit"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.le.id"/>/<br><bean:message key="label.customer.name"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.bca.ref"/>/<br><bean:message key="label.security.bca.booking.loc"/></td>
          <td colspan="2"><bean:message key="label.limit.approved.limit"/></td>
          <td width="25%" rowspan="2"><bean:message key="label.security.sublimit.type"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.sublimit.curr"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.sublimit.amt"/></td>          
          <td width="7%" rowspan="2"><bean:message key="label.security.coll.pool"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.cmdt.lmt.detail.lmt.spec.trx"/></td>
          <td width="14%" rowspan="2"><bean:message key="label.security.cash.requirement"/></td>   
        </tr>
        <tr>
          <td width="4%"><bean:message key="label.ccy"/></td>
          <td width="8%"><bean:message key="label.isda.deal.amount"/></td>
        </tr>
        </thead>
        <tbody>
<%      ICollateralLimitMap[] actualLimit = null;
        ICollateralLimitMap[] stageLimit = null;
        HashMap actuallimitMap = (HashMap)trxValueMap.get("actualLimit");
		Collection valueSet = actuallimitMap.values();
		if (valueSet != null) {
			actualLimit = (ICollateralLimitMap[])valueSet.toArray(new ICollateralLimitMap[0]);
		}

        HashMap stagelimitMap = (HashMap)trxValueMap.get("stageLimit");
		valueSet = stagelimitMap.values();
		if (valueSet != null) {
			stageLimit = (ICollateralLimitMap[])valueSet.toArray(new ICollateralLimitMap[0]);
		}

    if (stageLimit != null || actualLimit != null ) {
        res = CompareOBUtil.compOBArray(stageLimit, actualLimit);
        resultList = (CompareResult[])res.toArray(new CompareResult[0]);
        Arrays.sort(resultList, new LimitDetailsComparator());

        list = new ArrayList(Arrays.asList(resultList));
        pageContext.setAttribute("limitList",list);
    } else {
        list = null;
    }
        if (list == null || list.size() == 0) {
%>
        <tr class="odd"><td colspan="14"><bean:message key="label.security.none.limit"/></td></tr>
<%
        } else {
            counter = 0;
	      	HashMap sltMap = SubLimitUtils.getSLTMap();
	      	HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
                    
%>
		<logic:present name="limitList" >
        <logic:iterate id="compResult" name="limitList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ICollateralLimitMap colLimitMap  = (ICollateralLimitMap)compResult.getObj();
            String limitID = CollateralHelper.getColLimitMapLimitID(colLimitMap);
            String limitStatus = null;
            long sciLimitID = 0;                    
            Amount approvedLimit = null;
            boolean isInnerOuterSameBCA = true;
			boolean isInnerLimit = false;
			String outerLimitRef = "";
            if (ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER.equals(limitID.substring(0,2))) {
				ILimit limit = (ILimit)limitList.get(limitID);
				limitStatus = limit.getLimitStatus();
				sciLimitID = colLimitMap.getSCILimitID();
				approvedLimit = limit.getApprovedLimitAmount();
				isInnerOuterSameBCA = limit.getIsInnerOuterSameBCA();
            	isInnerLimit = (limit.getOuterLimitRef() != null &&
                                    limit.getOuterLimitRef().length() > 0 &&
                                    !limit.getOuterLimitRef().equals("0"));
				outerLimitRef = limit.getOuterLimitRef();                                           
				
			} else {
				ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitID);
				limitStatus = colmt.getStatus();
				sciLimitID = colLimitMap.getSCICoBorrowerLimitID();
				approvedLimit = colmt.getApprovedLimitAmount();
            	isInnerLimit = (colmt.getOuterLimitRef() != null &&
                                    colmt.getOuterLimitRef().length() > 0 &&
                                    !colmt.getOuterLimitRef().equals("0"));						
                outerLimitRef = colmt.getOuterLimitRef();
			}
			OBCustomerSearchResult obCustomer = (OBCustomerSearchResult)limitOuterBCAMap.get(limitID.substring(2, limitID.length()));            
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" valign="top" width="2%"><%=counter + 1%></td>
          <td valign="top" width="6%">
          <%
            if (limitStatus.equals(ICMSConstant.STATE_DELETED)) {
          %>
          		<%=sciLimitID%>&nbsp;
          		(<font color="#FF0000"><b>DELETED</b></font>)
          <% 
          	} else{	          	
	      %>
	      		<%=sciLimitID%>&nbsp;
	      <%  	
          	}
          %>          
          </td>
          <td valign="top" width="16%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, colLimitMap.getLimitType())%>"/>&nbsp;</td>
          <td <%=isInnerOuterSameBCA?"":"class=outerlimit"%> valign="top"><integro:empty-if-null value="<%=isInnerLimit?outerLimitRef:null%>"/></td>
		  <td>
		  <% if (obCustomer != null) { %>
		  <integro:empty-if-null value="<%=obCustomer.getLegalReference()%>"/>
		  <br>
		  <integro:empty-if-null value="<%=obCustomer.getLegalName()%>"/>
		  <% } else { %>-<% } %>&nbsp;
		  </td>
		  <td>
		  <% if (obCustomer != null) { %>
		  <integro:empty-if-null value="<%=obCustomer.getInstructionRefNo()%>"/>
		  <br>
		  <integro:empty-if-null value="<%=countryList.getCountryName(obCustomer.getOrigLocCntry())%>"/>
		  <% } else { %>-<% } %>&nbsp;
		  </td>
          <td valign="top"><integro:empty-if-null value="<%=approvedLimit!=null?approvedLimit.getCurrencyCode():null%>"/>&nbsp;</td>
          <td class="amount" valign="top">
          <%
                    if (approvedLimit != null && approvedLimit.getCurrencyCode() != null) {
          %>
          <%=isInnerLimit?"(":""%>
          <integro:currency amount="<%=approvedLimit%>" param="amount"/>
          <%=isInnerLimit?")":""%>
          <% } %>&nbsp;
          </td>
          <%              		
				StringBuffer slTypeBuffer= new StringBuffer();
				StringBuffer slCCYBuffer= new StringBuffer();
				StringBuffer slAmountBuffer= new StringBuffer();
				try{
	          		ISubLimit[] subLimitArray = colLimitMap.getSubLimit();
					if(subLimitArray==null||subLimitArray.length==0){
						slTypeBuffer.append("-");
						slCCYBuffer.append("-");
						slAmountBuffer.append("-");
					}else{					
	          			for(int index=0;index<subLimitArray.length;index++){
	          				if(index!=0){
	          					slTypeBuffer.append("<br>");
	          					slCCYBuffer.append("<br>");
	          					slAmountBuffer.append("<br>");
		          			}	
		          			ISubLimitType slt = (ISubLimitType)sltMap.get(subLimitArray[index].getSubLimitType());
		          			if(slt!=null){
			          			StringBuffer sltNameBuffer = new StringBuffer();
			          			sltNameBuffer.append(slt.getSubLimitType());
			          			sltNameBuffer.append("(");	          			
			          			sltNameBuffer.append(slt.getLimitType());//dipslay code.
			          			sltNameBuffer.append(")");	          
			          			slTypeBuffer.append(sltNameBuffer);
	          				}else{
		          				slTypeBuffer.append("-");
		          				System.out.println("Error occurs.....Cann't find name for slt : "+subLimitArray[index].getSubLimitType());
	          				}
	          				slCCYBuffer.append(subLimitArray[index].getSubLimitCCY());
	          				if(subLimitArray[index].isInnerLimit()){
		          				slAmountBuffer.append("(");
	          				}
	          				String slAmtStr = UIUtil.formatNumber(new BigDecimal(subLimitArray[index].getSubLimitAmount()),0,locale);
          					slAmountBuffer.append(slAmtStr);
          					//slAmountBuffer.append(subLimitArray[index].getSubLimitAmount());
	          				if(subLimitArray[index].isInnerLimit()){
		          				slAmountBuffer.append(")");
	          				}
		          		}
					}
				}catch(Exception e){
					e.printStackTrace();
				}
          %>
          <td nowrap="nowrap" valign="top"><%=slTypeBuffer.toString()%></td>
          <td nowrap="nowrap" valign="top"><%=slCCYBuffer.toString()%></td>
          <td nowrap="nowrap" valign="top"><%=slAmountBuffer.toString()%></td>
         
          <td style="text-align:center" valign="top">
            <input type="checkbox" name="collateralPool" value="<%=limitID%>" <%=colLimitMap.getIsCollateralPool()?"checked":""%> disabled/>
          </td>
          <td style="text-align:center" valign="top">
            <input type="checkbox" name="specificTrans" value="<%=limitID%>" <%=colLimitMap.getIsSpecificTrx()?"checked":""%> disabled/>
          </td>
          <td style="text-align:center" valign="top">
            <input type="checkbox" name="cash" value="<%=limitID%>" <%=colLimitMap.getCashReqPct()>0?"checked":""%> disabled/>
            &nbsp;
            <html:hidden property="limitIDList" value="<%=limitID%>"/>
            <%=colLimitMap.getCashReqPct()>0?String.valueOf((int)colLimitMap.getCashReqPct()):"-"%>
          </td>
        </tr>
<%
            counter++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>
        </tbody>
      </table>
      </td>
      </tr>
    </tbody>
  </table>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.approved.commodity.type"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="9%" class="fieldname"><bean:message key="label.global.sn"/></td>
          <td width="14%" class="fieldname"><bean:message key="label.security.id"/></td>
          <td width="34%"><bean:message key="label.security.sub.type"/></td>
          <td width="24%"><bean:message key="label.security.approved.commodity.product"/></td>
          <td width="24%"><bean:message key="label.security.commodity.prod.subtype"/></td>
          <td width="19%"><bean:message key="label.global.action"/></td>
        </tr>
        </thead>
        <tbody>
<%      IApprovedCommodityType[] actualAppComm = null;
        IApprovedCommodityType[] stageAppComm = null;
    if (actual != null && actual.length > 0) {
        actualAppComm = actual[0].getApprovedCommodityTypes();
        for (int i = 1; i < actual.length; i++) {
            Object[] tempArray = combineArray(actualAppComm, actual[i].getApprovedCommodityTypes());
            if (tempArray != null) {
                actualAppComm = new IApprovedCommodityType[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    actualAppComm[j] = (IApprovedCommodityType)tempArray[j];
                }
            }
        }
    }
    if (stage != null && stage.length > 0) {
        stageAppComm = stage[0].getApprovedCommodityTypes();
        for (int i = 1; i < stage.length; i++) {
            Object[] tempArray = combineArray(stageAppComm, stage[i].getApprovedCommodityTypes());
            if (tempArray != null) {
                stageAppComm = new IApprovedCommodityType[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    stageAppComm[j] = (IApprovedCommodityType)tempArray[j];
                }
            }
        }
    }
    if (stageAppComm != null || actualAppComm != null) {
        res = CompareOBUtil.compOBArray(stageAppComm, actualAppComm);
        list = new ArrayList(res);
        pageContext.setAttribute("approvedCommList",list);
    } else {
        list = null;
    }
        if (list == null || list.size() == 0) {
%>
        <tr class="odd"><td colspan="6"><bean:message key="label.security.approved.commodity.none"/></td></tr>
<%
        } else {
            counter = 0;
%>
		<logic:present name="approvedCommList" >
        <logic:iterate id="compResult" name="approvedCommList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IApprovedCommodityType obj = (IApprovedCommodityType)compResult.getObj();
            IProfile profile = obj.getProfile();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td width="9%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
          <td width="14%"><integro:empty-if-null value="<%=secApprovedComm.get(String.valueOf(obj.getCommonRef()))%>"/>&nbsp;</td>
          <td width="34%"><integro:empty-if-null value="<%=categoryList.getCommCategoryItem(profile.getCategory())%>"/>&nbsp;</td>
          <td width="24%"><integro:empty-if-null value="<%=categoryList.getCommProductItem(profile.getCategory(), profile.getProductType())%>"/>&nbsp;</td>
          <td width="24%"><integro:empty-if-null value="<%=profile.getProductSubType()%>"/>&nbsp;</td>
          <td style="text-align:center" width="19%"><a href="javascript:viewItem(<%=String.valueOf(obj.getCommonRef())%>, '<%=CommodityMainConstant.APPROVED_COMMODITY%>')">View</a></td>
        </tr>
<%
            counter++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableCell">
        <thead>
        <tr>
          <td>
            <h3><bean:message key="label.security.contract.infor"/></h3>
          </td>
        </tr>
        <tr>
          <td>
            <hr/>
          </td>
        </tr>
        </thead> <tbody>
        <tr>
          <td>

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="3%" class="fieldname"><bean:message key="label.global.sn"/></td>
          <td width="23%" class="fieldname"><bean:message key="label.security.supplier"/></td>
          <td width="14%"><bean:message key="label.security.maturity.date.contract"/></td>
          <td width="13%"><bean:message key="label.security.main.contract.no"/></td>
          <td width="15%"><bean:message key="label.security.main.contract.amount"/></td>
          <td width="7%"><bean:message key="label.cash.margin.plus.minus"/> or (&plusmn;)</td>
          <td width="9%"><bean:message key="label.security.contract.quantity.diff"/></td>
          <td width="9%"><bean:message key="label.global.action"/></td>
        </tr>
        </thead>
        <tbody>
<%      IContract[] actualContract = null;
        IContract[] stageContract = null;
    if (actual != null && actual.length > 0) {
        actualContract = actual[0].getContracts();
        for (int i = 1; i < actual.length; i++) {
            Object[] tempArray = combineArray(actualContract, actual[i].getContracts());
            if (tempArray != null) {
                actualContract = new IContract[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    actualContract[j] = (IContract)tempArray[j];
                }
            }
        }
    }
    if (stage != null && stage.length > 0) {
        stageContract = stage[0].getContracts();
        for (int i = 1; i < stage.length; i++) {
            Object[] tempArray = combineArray(stageContract, stage[i].getContracts());
            if (tempArray != null) {
                stageContract = new IContract[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    stageContract[j] = (IContract)tempArray[j];
                }
            }
        }
    }

    if (stageContract != null || actualContract != null) {
        res = CompareOBUtil.compOBArray(stageContract, actualContract);
        list = new ArrayList(res);
        pageContext.setAttribute("contractList",list);
    } else {
        list = null;
    }
        if (list == null || list.size() == 0) {
%>
        <tr class="odd"><td colspan="8">There is no Contract.</td></tr>
<%
        } else {
            counter = 0;
%>
		<logic:present name="contractList" >
        <logic:iterate id="compResult" name="contractList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IContract contract = (IContract)compResult.getObj();
            ISupplier supplier = contract.getSupplier();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td width="3%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
          <td width="23%"><integro:empty-if-null value="<%=supplier!=null?supplier.getName():null%>"/>&nbsp;</td>
          <td>
          <% if (contract.getMaturityDate() != null) { %>
            <integro:date object="<%=contract.getMaturityDate()%>"/>
          <% } else { %> - <% } %> &nbsp;
          </td>
          <td><integro:empty-if-null value="<%=contract.getMainContractNumber()%>"/>&nbsp;</td>
          <td>
          <%  if (contract.getMainContractAmount() != null &&
                  contract.getMainContractAmount().getCurrencyCode() != null) {
          %>
          <integro:currency amount="<%=contract.getMainContractAmount()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td>
            <% if (contract.getQtyDifferential() != null &&
                    contract.getQtyDifferential().getSign() != null) {
               if (CommodityConstant.SIGN_MINUS.equals(contract.getQtyDifferential().getSign().getName())) { %>
            -
            <% } else if (CommodityConstant.SIGN_PLUS.equals(contract.getQtyDifferential().getSign().getName())) { %>
            +
            <% } else if (CommodityConstant.SIGN_PLUS_OR_MINUS.equals(contract.getQtyDifferential().getSign().getName())) { %>
            &plusmn;
            <% } } %>&nbsp;
          </td>
          <td class="amount">
          <%
            if (contract.getQtyDifferential() != null &&
                    contract.getQtyDifferential().getQuantity() != null) {
          %>
          <integro:empty-if-null value="<%=UIUtil.formatNumber(contract.getQtyDifferential().getQuantity().getQuantity(), 0, locale)%>" />
          <% } %>&nbsp;
          </td>
          <td style="text-align:center"><a href="javascript:viewItem(<%=String.valueOf(contract.getCommonRef())%>, '<%=CommodityMainConstant.COMMODITY_CONTRACT%>')">View</a></td>
        </tr>
<%
            counter++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>
        </tbody>
      </table>
      </td>
    </tr>
    </tbody>
</table>
<br/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="75%">
      <h3><bean:message key="label.security.hedging.contract.infor"/></h3>
    </td>
    <td align="right" valign="bottom" width="16%">&nbsp;</td>
    <td align="right" valign="bottom" width="9%">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="12%"><bean:message key="label.security.id"/></td>
          <td width="12%"><bean:message key="label.security.global.treasury.ref.no"/></td>
          <td width="10%"><bean:message key="label.security.date.deal"/></td>
          <td width="25%"><bean:message key="label.security.name.counterparty"/></td>
          <td width="14%"><bean:message key="label.security.amount.deal"/></td>
          <td width="10%"><bean:message key="label.security.hedging.agreement.ref"/></td>
          <td width="10%"><bean:message key="label.security.date.hedging.agreement"/></td>
          <td width="8%"><bean:message key="label.security.margin"/></td>
          <td width="8%"><bean:message key="label.global.action"/></td>
        </tr>
        </thead>
        <tbody>
<%      IHedgingContractInfo[] actualHedgeContract = null;
        IHedgingContractInfo[] stageHedgeContract = null;
    if (actual != null && actual.length > 0) {
        actualHedgeContract = actual[0].getHedgingContractInfos();
        for (int i = 1; i < actual.length; i++) {
            Object[] tempArray = combineArray(actualHedgeContract, actual[i].getHedgingContractInfos());
            if (tempArray != null) {
                actualHedgeContract = new IHedgingContractInfo[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    actualHedgeContract[j] = (IHedgingContractInfo)tempArray[j];
                }
            }
        }
    }
    if (stage != null && stage.length > 0) {
        stageHedgeContract = stage[0].getHedgingContractInfos();
        for (int i = 1; i < stage.length; i++) {
            Object[] tempArray = combineArray(stageHedgeContract, stage[i].getHedgingContractInfos());
            if (tempArray != null) {
                stageHedgeContract = new IHedgingContractInfo[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    stageHedgeContract[j] = (IHedgingContractInfo)tempArray[j];
                }
            }
        }
    }
    if (stageHedgeContract != null || actualHedgeContract != null) {
        res = CompareOBUtil.compOBArray(stageHedgeContract, actualHedgeContract);
        list = new ArrayList(res);
        pageContext.setAttribute("hedgeContractList",list);
    } else {
        list = null;
    }
        if (list == null || list.size() == 0) {
%>
        <tr class="odd"><td colspan="10">There is no Hedged Contract.</td></tr>
<%
        } else {
            counter = 0;
%>
		<logic:present name="hedgeContractList" >
        <logic:iterate id="compResult" name="hedgeContractList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            IHedgingContractInfo hedgeContract = (IHedgingContractInfo)compResult.getObj();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td width="3%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
          <td width="12%"><integro:empty-if-null value="<%=secHedgeContract.get(String.valueOf(hedgeContract.getCommonRef()))%>"/>&nbsp;</td>
          <td width="12%"><integro:empty-if-null value="<%=hedgeContract.getGlobalTreasuryReference()%>"/>&nbsp;</td>
          <td width="10%"><integro:date object="<%=hedgeContract.getDateOfDeal()%>"/>&nbsp;</td>
          <td width="27%">
          <% if (hedgeContract.getNameOfTheCounterParty() != null) { %>
          <integro:wrapper lineLength="30" value="<%=hedgeContract.getNameOfTheCounterParty()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td width="14%" class="amount">
          <%  if (hedgeContract.getDealAmount() != null &&
                  hedgeContract.getDealAmount().getCurrencyCode() != null) {
          %>
          <integro:currency amount="<%=hedgeContract.getDealAmount()%>"/>
          <% } else { %> - <% } %> &nbsp;
          </td>
          <td width="7%"><integro:empty-if-null value="<%=hedgeContract.getHedgingAgreement()%>"/>&nbsp;</td>
          <td width="9%">
          <% if (hedgeContract.getHedgingAgreementDate() != null) { %>
            <integro:date object="<%=hedgeContract.getHedgingAgreementDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="6%"><%=hedgeContract.getMargin()%>&nbsp;</td>
          <td style="text-align:center" width="15%"><a href="javascript:viewItem(<%=String.valueOf(hedgeContract.getCommonRef())%>, '<%=CommodityMainConstant.HEDGED_CONTRACT%>')">View</a></td>
        </tr>
<%
            counter++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>
        </tbody>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.syndicate.facility"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead>
    <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="5%" class="fieldname" height="58"><bean:message key="label.global.sn"/></td>
          <td width="10%" class="fieldname" height="58"><bean:message key="label.security.id"/></td>
          <td width="15%" class="fieldname" height="58"><bean:message key="label.security.admin.agent.name"/></td>
          <td width="21%" height="58"><bean:message key="label.security.col.agent.name"/></td>
          <td width="20%" height="58"><bean:message key="label.security.doc.agent"/></td>
          <td width="19%" height="58"><bean:message key="label.facilitytype.title"/></td>
          <td width="9%" height="58"><bean:message key="label.global.action"/></td>
        </tr>
        </thead>
        <tbody>
<%      ILoanAgency[] actualLoanAgency = null;
        ILoanAgency[] stageLoanAgency = null;
    if (actual != null && actual.length > 0) {
        actualLoanAgency = actual[0].getLoans();
        for (int i = 1; i < actual.length; i++) {
            Object[] tempArray = combineArray(actualLoanAgency, actual[i].getLoans());
            if (tempArray != null) {
                actualLoanAgency = new ILoanAgency[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    actualLoanAgency[j] = (ILoanAgency)tempArray[j];
                }
            }
        }
    }
    if (stage != null && stage.length > 0) {
        stageLoanAgency = stage[0].getLoans();
        for (int i = 1; i < stage.length; i++) {
            Object[] tempArray = combineArray(stageLoanAgency, stage[i].getLoans());
            if (tempArray != null) {
                stageLoanAgency = new ILoanAgency[tempArray.length];
                for (int j = 0; j < tempArray.length; j++) {
                    stageLoanAgency[j] = (ILoanAgency)tempArray[j];
                }
            }
        }
    }
    if (stageLoanAgency != null || actualLoanAgency != null) {
        res = CompareOBUtil.compOBArray(stageLoanAgency, actualLoanAgency);
        list = new ArrayList(res);
        pageContext.setAttribute("loanAgencyList",list);
    } else {
        list = null;
    }
        if (list == null || list.size() == 0) {
%>
        <tr class="odd"><td colspan="7"><bean:message key="label.security.syndicated.facility.none"/></td></tr>
<%
        } else {
            counter = 0;
            FacilityTypeList facTypeList = FacilityTypeList.getInstance();
%>
		<logic:present name="loanAgencyList" >
        <logic:iterate id="compResult" name="loanAgencyList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ILoanAgency loanAgency = (ILoanAgency)compResult.getObj();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td width="5%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
          <td height="22" width="10%"><integro:empty-if-null value="<%=secLoanAgency.get(String.valueOf(loanAgency.getCommonRef()))%>"/>&nbsp;</td>
          <td width="15%" height="22"><integro:empty-if-null value="<%=loanAgency.getAdministrativeAgentName()%>"/>&nbsp;</td>
          <td width="21%" height="22"><integro:empty-if-null value="<%=loanAgency.getCollateralAgentName()%>"/>&nbsp;</td>
          <td width="20%" height="22"><integro:empty-if-null value="<%=loanAgency.getDocumentAgent()%>"/>&nbsp;</td>
          <td width="19%" class="amount" height="22"><integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(loanAgency.getFacilityType())%>"/>&nbsp;</td>
          <td style="text-align:center" width="9%" height="22">
            <a href="javascript:viewItem(<%=String.valueOf(loanAgency.getCommonRef())%>, '<%=CommodityMainConstant.LOAN_AGENCY%>')">View</a></td>
          </td>
        </tr>
<%
            counter++;
%>
        </logic:iterate>
        </logic:present>
<%
        }
%>        </tbody>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  </tbody>
</table>
<%
    ICollateralTrxValue[] trxValueList = (ICollateralTrxValue[])trxValueMap.get("trxValue");
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td class="fieldname" width="39%"><bean:message key="label.remarks"/></td>
        <td class="odd" width="61%">
            <html:textarea property="remarks" rows="3" cols="80" style="width:100%" />&nbsp;
            <html:errors property="remarks"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
        <td class="even"><%=trxValueList[0]!=null?trxValueList[0].getUserInfo():""%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
        <td><% if (trxValueList[0] != null) { %>
            <integro:wrapper value="<%=trxValueList[0].getRemarks()%>"/>
            <% } %>&nbsp;
       </td>
    </tr>
    </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
        <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <% if (!StringUtils.equals(collateralTrxToState, ICMSConstant.STATE_PENDING_RETRY)) { //If not pending retry %>
            <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
        <% } %>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>

</html:form>
</body>
</html>