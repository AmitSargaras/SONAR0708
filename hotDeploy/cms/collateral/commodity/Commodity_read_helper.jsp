<%@ page import="com.integrosys.cms.ui.collateral.commodity.CommodityMainConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainForm,                 
                 com.integrosys.cms.ui.collateral.commodity.loanagency.FacilityTypeList,                 
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,                 
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.common.UIUtil,                                  
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.app.commodity.main.bus.profile.ISupplier,
                 com.integrosys.cms.app.commodity.CommodityConstant,                 
                 com.integrosys.cms.app.collateral.bus.type.commodity.*,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.customer.bus.OBCustomerSearchResult,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.base.businfra.currency.Amount,                 
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,                 
                 java.util.*,
                 java.math.BigDecimal,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
				 
<%
    ICommodityCollateral[] iCol = null;
    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");

    HashMap limitMap = new HashMap();
    if (from_event.equals(CommodityMainAction.EVENT_READ)) {
        iCol = (ICommodityCollateral[])trxValueMap.get("actual");
        limitMap = (HashMap)trxValueMap.get("actualLimit");
    } else {
        iCol = (ICommodityCollateral[])trxValueMap.get("staging");
        limitMap = (HashMap)trxValueMap.get("stageLimit");
    }
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.ARM_Code");
    CommodityMainForm aForm = (CommodityMainForm)request.getAttribute("CommodityMainForm");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    CommodityCategoryList categoryList  = CommodityCategoryList.getInstance();

    HashMap limitList = (HashMap)trxValueMap.get("limitList");
    HashMap limitOuterBCAMap = (HashMap)trxValueMap.get("limitOuterBCAMap");

    CountryList countryList = CountryList.getInstance();

%>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function viewLimitDetails(){
	document.forms[0].action = "CommoditySubLimit.do"
	document.forms[0].event.value = "view";
	document.forms[0].submit();
}
//-->
</script>
<input type="hidden" name="fromEvent" value="<%=from_event%>"/>

    <tbody>
      <tr>
        <td colspan="4">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.cust.id"/></td>
          <td width="30%"><%=customer.getCMSLegalEntity().getLEReference()%></td>
          <td width="20%" class="fieldname"><bean:mesage key="label.customer.name"/></td>
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
        <td> <h3><bean:message key="label.security.sec.details "/></h3></td>
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
          <td width="10%" rowspan="2"><bean:message key="label.security.approved.cust.diff"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.valuation.cmv"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.valuation.fsv"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.global.action"/></td>
        </tr>
        <tr>
          <td width="5%"><bean:message key="label.ccy"/></td>
          <td width="10%"><bean:mesage key="label.isda.deal.amount"/></td>
        </tr>
        </thead>
        <tbody>
        <%
            if (iCol == null || iCol.length == 0) {
        %>
        <tr class="odd"><td colspan="9"><bean:message key="label.security.none"/></td></tr>
        <%
            } else {
                for (int i = 0; i < iCol.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" valign="top"><%=i + 1%></td>
          <td><%=iCol[i].getSCISecurityID()%>&nbsp;
          <%
                    if (iCol[i].getStatus().equals(ICMSConstant.STATE_DELETED) ||
                            iCol[i].getStatus().equals(ICMSConstant.STATE_PENDING_DELETE)) {
          %>
          (<font color="#FF0000"><b>DELETED</b></font>)
          <% } %>
          </td>
          <% Amount secFSV = iCol[i].getSCIFSV(); %>
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
          <td><integro:empty-if-null value="<%=iCol[i].getCollateralSubType().getSubTypeName()%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol[i].getCollateralLocation())%>"/>&nbsp;</td>
		<% String securityOrg=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,iCol[i].getSecurityOrganization());%>
          <td><integro:empty-if-null value="<%=securityOrg%>"/>&nbsp;</td>
          <td>
            <%  if (iCol[i].getApprovedCustomerDifferentialSign() != null) {
                    if (iCol[i].getApprovedCustomerDifferentialSign().equals(CommodityConstant.SIGN_MINUS)) { %>
            -
            <% } else if (iCol[i].getApprovedCustomerDifferentialSign().equals(CommodityConstant.SIGN_PLUS)) { %>
            +
            <% } else if (iCol[i].getApprovedCustomerDifferentialSign().equals(CommodityConstant.SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
            <%
                    if (iCol[i].getApprovedCustomerDifferential() != null) {
                        String temp = UIUtil.formatNumber(iCol[i].getApprovedCustomerDifferential(), 6, locale);
            %>
            <integro:empty-if-null value="<%=temp%>"/>
            <%
                    }
            %>
          </td>
          <% IValuation val = iCol[i].getValuation();%>          
          <td><integro:currency amount="<%=(val!=null)?val.getCMV():null%>"/>&nbsp;</td>
          <td><integro:currency amount="<%=(val!=null)?val.getFSV():null%>"/>&nbsp;</td>
          <td><a href="javascript:viewItem('-1', <%=String.valueOf(i)%>, '<%=CommodityMainConstant.SECURITY_DETAILS%>')">View</a></td>
        </tr>
        <%
                }
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
  			<tr class="odd">
  				<td class="fieldname" width="20%"><bean:message key="label.security.precondition"/></td>
  				<%
  					if (from_event.equals(CommodityMainAction.EVENT_PREPARE_CLOSE)) {
  				%>
  				<td class="80%">
            		<html:textarea property="preConditions" rows="3" cols="80" style="width:100%" onkeyup="limitTextInput(this.form.preConditions, 1000, 'Pre-Conditions');"/>&nbsp;
            		<html:errors property="preConditions"/>  					
            	</td>
  				<% } else { %>
  				<td class="80%"><integro:wrapper value="<%=aForm.getPreConditions()%>"/>&nbsp;</td>
  				<% } %>
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
        <td  colspan="2">
		<%@ include file="Commodity_limit_details.jsp" %>
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
        <%  boolean hasApprovedComm = false;
            if (iCol != null) {
                for (int i = 0; !hasApprovedComm && i < iCol.length; i++) {
                    if (iCol[i].getApprovedCommodityTypes() != null &&
                            iCol[i].getApprovedCommodityTypes().length > 0) {
                        hasApprovedComm = true;
                    }
                }
            }
            if (!hasApprovedComm) {
        %>
        <tr class="odd"><td colspan="6"><bean:message key="label.security.approved.commodity.none"/></td></tr>
        <%
            } else {
                int count = 0;
                for (int i = 0; i < iCol.length; i++) {
                    IApprovedCommodityType[] approveCommList = iCol[i].getApprovedCommodityTypes();
                    if (approveCommList != null) {
                        for (int j = 0; j < approveCommList.length; j++) {
                            IProfile profile = approveCommList[j].getProfile();
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td width="9%" class="index"><%=count + 1%></td>
          <td><integro:empty-if-null value="<%=String.valueOf(iCol[i].getSCISecurityID())%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=categoryList.getCommCategoryItem(profile.getCategory())%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=categoryList.getCommProductItem(profile.getCategory(), profile.getProductType())%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=profile.getProductSubType()%>"/>&nbsp;</td>
          <td style="text-align:center" width="19%"><a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.APPROVED_COMMODITY%>')">View</a></td>
        </tr>
        <%
                            count++;
                        }
                    }
                }
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
            <h3><bean:message key="label.security.hedging.contract.infor"/></h3>
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
        <%  boolean hasContract = false;
            if (iCol != null) {
                for (int i = 0; !hasContract && i < iCol.length; i++) {
                    if (iCol[i].getContracts() != null &&
                            iCol[i].getContracts().length > 0) {
                        hasContract = true;
                    }
                }
            }
            if (!hasContract) {
        %>
        <tr class="odd"><td colspan="8"><bean:message key="label.security.contract.none"/></td></tr>
        <%
            } else {
                int count = 0;
                for (int i = 0; i < iCol.length; i++) {
                    IContract[] contractList = iCol[i].getContracts();
                    if (contractList != null) {
                        for (int j = 0; j < contractList.length; j++) {
                            ISupplier supplier = contractList[j].getSupplier();
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td width="3%" class="index"><%=count + 1%></td>
          <td><integro:empty-if-null value="<%=supplier!=null?supplier.getName():null%>"/>&nbsp;</td>
          <td>
          <% if (contractList[j].getMaturityDate() != null) { %>
            <integro:date object="<%=contractList[j].getMaturityDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td><integro:empty-if-null value="<%=contractList[j].getMainContractNumber()%>"/>&nbsp;</td>
          <td>
          <%  if (contractList[j].getMainContractAmount() != null &&
                  contractList[j].getMainContractAmount().getCurrencyCode() != null) {
          %>
          <integro:currency amount="<%=contractList[j].getMainContractAmount()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td>
            <% if (contractList[j].getQtyDifferential() != null &&
                    contractList[j].getQtyDifferential().getSign() != null) {
               if (CommodityConstant.SIGN_MINUS.equals(contractList[j].getQtyDifferential().getSign().getName())) { %>
            -
            <% } else if (CommodityConstant.SIGN_PLUS.equals(contractList[j].getQtyDifferential().getSign().getName())) { %>
            +
            <% } else if (CommodityConstant.SIGN_PLUS_OR_MINUS.equals(contractList[j].getQtyDifferential().getSign().getName())) { %>
            &plusmn;
            <% } } %>&nbsp;
          </td>
          <td class="amount">
          <%
            if (contractList[j].getQtyDifferential() != null &&
                    contractList[j].getQtyDifferential().getQuantity() != null) {
          %>
          <integro:empty-if-null value="<%=UIUtil.formatNumber(contractList[j].getQtyDifferential().getQuantity().getQuantity(), 0, locale)%>" />
          <% } %>&nbsp;
          </td>
          <td style="text-align:center"><a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.COMMODITY_CONTRACT%>')">View</a></td>
        </tr>
        <%
                            count++;
                        }
                    }
                }
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
        <%  boolean hasHedgedContract = false;
            if (iCol != null) {
                for (int i = 0; !hasHedgedContract && i < iCol.length; i++) {
                    if (iCol[i].getHedgingContractInfos() != null &&
                            iCol[i].getHedgingContractInfos().length > 0) {
                        hasHedgedContract = true;
                    }
                }
            }
            if (!hasHedgedContract) {
        %>
        <tr class="odd"><td colspan="10"><bean:message key="label.security.hedged.contract.none"/></td></tr>
        <%
            } else {
                int count = 0;
                for (int i = 0; i < iCol.length; i++) {
                    IHedgingContractInfo[] hedgedContractList = iCol[i].getHedgingContractInfos();
                    if (hedgedContractList != null) {
                        for (int j = 0; j < hedgedContractList.length; j++) {
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td width="3%" class="index"><%=count + 1%></td>
          <td width="12%"><%=iCol[i].getSCISecurityID()%>&nbsp;</td>
          <td width="12%"><integro:empty-if-null value="<%=hedgedContractList[j].getGlobalTreasuryReference()%>"/>&nbsp;</td>
          <td width="10%"><integro:date object="<%=hedgedContractList[j].getDateOfDeal()%>"/>&nbsp;</td>
          <td width="25%">
          <% if (hedgedContractList[j].getNameOfTheCounterParty() != null) { %>
          <integro:wrapper lineLength="30" value="<%=hedgedContractList[j].getNameOfTheCounterParty()%>"/>
          <% } else { %> - <% } %> &nbsp;
          </td>
          <td width="14%">
          <%  if (hedgedContractList[j].getDealAmount() != null &&
                  hedgedContractList[j].getDealAmount().getCurrencyCode() != null) {
          %>
          <integro:currency amount="<%=hedgedContractList[j].getDealAmount()%>"/>
          <% } else { %> - <% } %> &nbsp;
          </td>
          <td width="10%"><integro:empty-if-null value="<%=hedgedContractList[j].getHedgingAgreement()%>"/>&nbsp;</td>
          <td width="10%">
          <% if (hedgedContractList[j].getHedgingAgreementDate() != null) { %>
            <integro:date object="<%=hedgedContractList[j].getHedgingAgreementDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="8%"><%=hedgedContractList[j].getMargin()%>&nbsp;</td>
          <td style="text-align:center" width="8%"><a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.HEDGED_CONTRACT%>')">View</a></td>
        </tr>
        <%
                            count++;
                        }
                    }
                }
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
        <%  boolean hasLoanAgency = false;
            if (iCol != null) {
                for (int i = 0; !hasLoanAgency && i < iCol.length; i++) {
                    if (iCol[i].getLoans() != null &&
                            iCol[i].getLoans().length > 0) {
                        hasLoanAgency = true;
                    }
                }
            }
            if (!hasLoanAgency) {
        %>
        <tr class="odd"><td colspan="8"><bean:message key="label.security.syndicated.facility.none"/></td></tr>
        <%
            } else {
                FacilityTypeList facTypeList = FacilityTypeList.getInstance();
                int count = 0;
                for (int i = 0; i < iCol.length; i++) {
                    ILoanAgency[] loanAgencyList = iCol[i].getLoans();
                    if (loanAgencyList != null) {
                        for (int j = 0; j < loanAgencyList.length; j++) {
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td width="5%" class="index" height="22"><%=count + 1%></td>
          <td height="22" width="10%"><%=iCol[i].getSCISecurityID()%>&nbsp;</td>
          <td width="15%" height="22"><integro:empty-if-null value="<%=loanAgencyList[j].getAdministrativeAgentName()%>"/>&nbsp;</td>
          <td width="21%" height="22"><integro:empty-if-null value="<%=loanAgencyList[j].getCollateralAgentName()%>"/>&nbsp;</td>
          <td width="20%" height="22"><integro:empty-if-null value="<%=loanAgencyList[j].getDocumentAgent()%>"/>&nbsp;</td>
          <td width="19%" class="amount" height="22"><integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(loanAgencyList[j].getFacilityType())%>"/>&nbsp;</td>
          <td style="text-align:center" width="9%" height="22">
            <a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>,'<%=CommodityMainConstant.LOAN_AGENCY%>')">View</a></td>
          </td>
        </tr>
        <%
                            count++;
                        }
                    }
                }
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


