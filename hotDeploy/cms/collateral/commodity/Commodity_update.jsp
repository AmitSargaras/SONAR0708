<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.type.commodity.*,
                 com.integrosys.cms.app.collateral.bus.LimitDetailsComparator,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.app.commodity.main.bus.profile.ISupplier,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.customer.bus.OBCustomerSearchResult,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.FacilityTypeList,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.math.BigDecimal,
                 java.util.*,
                 com.integrosys.cms.ui.collateral.commodity.*,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
				 
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/Commodity_update.jsp,v 1.54 2006/10/27 08:30:40 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.54 $
* Date: $Date: 2006/10/27 08:30:40 $
* Tag: $Name:  $
*/
%>
<%
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isCMTmaker=false;
  	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    isCMTmaker = true;
                    DefaultLogger.debug(this, "User is ssc maker checker...");
                    break TOP_LOOP;
                }
            }
        }
  	}

    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");

    ICommodityCollateral[] iCol = (ICommodityCollateral[])trxValueMap.get("staging");
    CommodityMainForm aForm = (CommodityMainForm)request.getAttribute("CommodityMainForm");

    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String armCode = (String)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.ARM_Code");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    CommodityCategoryList categoryList  = CommodityCategoryList.getInstance();
    boolean hasValidApproveComm = false;
    ICommodityCollateral[] actualCol = (ICommodityCollateral[])trxValueMap.get("actual");
    if (actualCol != null) {
        for (int i = 0; !hasValidApproveComm && i < actualCol.length; i++) {
            if (actualCol[i].getApprovedCommodityTypes() != null &&
                actualCol[i].getApprovedCommodityTypes().length > 0) {
                hasValidApproveComm = true;
            }
        }
    }
	String event = (String) request.getAttribute("event");
    HashMap limitList = (HashMap)trxValueMap.get("limitList");
    HashMap limitOuterBCAMap = (HashMap)trxValueMap.get("limitOuterBCAMap");

    CountryList countryList = CountryList.getInstance();
	HashMap limitMap = (HashMap)trxValueMap.get("stageLimit");    
	
%>


<html>
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--


function submitPage(num) {
    if (num == 1) {
  	    document.forms[0].event.value="<%=CommodityMainAction.EVENT_SUBMIT%>";
    }
    if (num == 2) {
  	    document.forms[0].event.value="<%=CommodityMainAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value="<%=CommodityMainAction.EVENT_EXPOSURE_SUMMARY%>";
    }
    if (num == 4) {
        document.forms[0].event.value="<%=CommodityMainAction.EVENT_READ%>";
    }
	enableAllFormElements();

    document.forms[0].submit();
}

function editItem(secIndex, index, type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_PREPARE_UPDATE_SUB%>";
    document.forms[0].secIndexID.value = secIndex;
    document.forms[0].indexID.value = index;
	enableAllFormElements();

    document.forms[0].submit();
}

function editLimitDetails(){
	document.forms[0].action = "CommoditySubLimit.do"
	document.forms[0].event.value = "prepare";
	document.forms[0].submit();
}

function viewLimitDetails(){
	document.forms[0].action = "CommoditySubLimit.do"
	document.forms[0].event.value = "view";
	document.forms[0].submit();
}

function viewItem(secIndex, index, type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_VIEW%>";
    document.forms[0].secIndexID.value = secIndex;
    document.forms[0].indexID.value = index;
	enableAllFormElements();

    document.forms[0].submit();
}

function addItem(type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_PREPARE%>";
    document.forms[0].indexID.value = "-1";
    document.forms[0].secIndexID.value = "-1";
	enableAllFormElements();

    document.forms[0].submit();
}

function deleteItem(type) {
    document.forms[0].event.value = type+"_<%=CommodityMainAction.EVENT_DELETE_ITEM%>";
	enableAllFormElements();

    document.forms[0].submit();
}

function changeCash() {
    if (document.forms[0].cash.length+'' == 'undefined') {
        if (document.forms[0].cash.checked) {
            document.forms[0].cashReq.disabled = false;
        } else {
            document.forms[0].cashReq.disabled = true;
            document.forms[0].cashReq.value = '';
        }
    } else {
        list = document.forms[0].cash;
        for (i = 0; i < list.length; i++) {
            if (list[i].checked) {
                document.forms[0].cashReq[i].disabled = false;
            } else {
                document.forms[0].cashReq[i].disabled = true;
                document.forms[0].cashReq[i].value = '';
            }
        }
    }
}
//-->
</script>

</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommodityMain.do">
<input type="hidden" name="event" value="<%=CommodityMainAction.EVENT_SUBMIT%>"/>
<input type="hidden" name="from_page" value="<%=CommodityMainAction.EVENT_PREPARE_UPDATE%>"/>
<input type="hidden" name="fromEvent" value="<%=CommodityMainAction.EVENT_PREPARE_UPDATE%>"/>
<input type="hidden" name="secIndexID"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="checkCMTmaker" value="<%=isCMTmaker?ICMSConstant.TRUE_VALUE:ICMSConstant.FALSE_VALUE%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><bean:message key="label.security.title.update.commodity"/></h3></td>
    </tr>
    <tr>
      <td width="82%"> <h3><bean:message key="label.security.general"/></h3></td>
      <td width="18%" align="right" valign="baseline">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100" valign="bottom" align="right">
                <input align="right" type="button" name="button42" id="button4" value="Exposure Summary" class="btnNormal" onclick="submitPage(3)"/>
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
          <td width="20%" class="fieldname"><bean:message key="label.security.cust.id"/></td>
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
          <td><integro:empty-if-null value="<%=countryList.getCountryName(limitProfile.getOriginatingLocation().getCountryCode())%>"/></td>
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
          <td width="10%"><bean:message key="label.isda.deal.amount"/></td>
        </tr>
        </thead>
        <tbody>
        <%
            if (iCol == null || iCol.length == 0) {
        %>
        <tr><td colspan="8">There is no Security.</td></tr>
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
          <td><integro:empty-if-null value="<%=countryList.getCountryName(iCol[i].getCollateralLocation())%>"/>&nbsp;</td>
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
          <td><a href="javascript:editItem('-1', <%=String.valueOf(i)%>, '<%=CommodityMainConstant.SECURITY_DETAILS%>')">View/Edit</a></td>
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
  				<td class="80%">
            		<html:textarea property="preConditions" rows="3" cols="80" style="width:100%" onkeyup="limitTextInput(this.form.preConditions, 1000, 'Pre-Conditions');" />&nbsp;
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
        	<%
        		if(isCMTmaker){
        	%>
           <input type="button" name="button23" id="button" value="Edit Limit Details" class="btnNormal" onclick="editLimitDetails()"/>
           <%
       			}else{
           %>
           <input type="button" name="button23" id="button" value="View Limit Details" class="btnNormal" onclick="viewLimitDetails()"/>
    	   <%
	   		    }
    	   %>
    	</td>
      </tr>
      <tr>
        <td colspan="2"> <hr/> </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2">
        <%@ include file="Commodity_limit_details.jsp" %>
      </td>
      </tr>
    </tbody>
  </table>

<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="68%">
      <h3><bean:message key="label.security.approved.commodity.type"/></h3>
    </td>
    <%
        if (isCMTmaker) {
    %>
    <td align="right" valign="bottom" width="20%">
      <input type="button" name="button23" id="button" value="Add New Approved Commodity" class="btnNormal" onclick="addItem('<%=CommodityMainConstant.APPROVED_COMMODITY%>')"/>
    </td>
    <td align="right" valign="bottom" width="12%">
      <input type="button" name="button2222" id="button2" value="Remove" class="btnNormal" onclick="deleteItem('<%=CommodityMainConstant.APPROVED_COMMODITY%>')"/>
    </td>
    <% } else { %>
    <td colspan="2">&nbsp;</td>
    <% } %>
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
          <td width="9%" class="fieldname"><bean:message key="label.global.sn"/></td>
          <td width="14%" class="fieldname"><bean:mesage key="label.security.id"/></td>
          <td width="32%"><bean:message key="label.security.sub.type"/></td>
          <td width="22%"><bean:message key="label.security.approved.commodity.product"/></td>
          <td width="22%"><bean:message key="label.security.commodity.prod.subtype"/></td>
          <td width="17%"><bean:message key="label.global.action"/></td>
          <td width="8%"><bean:message key="label.global.delete"/></td>
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
        <tr class="odd"><td colspan="7"><bean:message key="label.security.approved.commodity.none"/></td></tr>
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
          <td class="index"><%=count + 1%></td>
          <td><integro:empty-if-null value="<%=String.valueOf(iCol[i].getSCISecurityID())%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=categoryList.getCommCategoryItem(profile.getCategory())%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=categoryList.getCommProductItem(profile.getCategory(), profile.getProductType())%>"/>&nbsp;</td>
          <td><integro:empty-if-null value="<%=profile.getProductSubType()%>"/>&nbsp;</td>
          <td style="text-align:center" >
          <%
              if (isCMTmaker &&
                      (approveCommList[j].getApprovedCommodityTypeID() <= 0 ||
                    !CommodityMainUtil.hasActualAppCommType(actualCol[i], approveCommList[j].getCommonRef()))) {
          %>
            <a href="javascript:editItem(<%=String.valueOf(i)%>,<%=String.valueOf(j)%>, '<%=CommodityMainConstant.APPROVED_COMMODITY%>')"><bean:message key="label.view.edit"/></a>
          <% } else { %>
            <a href="javascript:viewItem(<%=String.valueOf(i)%>,<%=String.valueOf(j)%>, '<%=CommodityMainConstant.APPROVED_COMMODITY%>')"><bean:message key="label.view"/></a>
          <% } %>
          </td>
          <td>
          <%
            if (approveCommList[j].getApprovedCommodityTypeID() <= 0 ||
                    !CommodityMainUtil.hasActualAppCommType(actualCol[i], approveCommList[j].getCommonRef())) {
          %>
            <html:multibox property="deleteAppCommodity" value="<%=String.valueOf(count)%>" disabled="<%=!isCMTmaker%>"/>
          <% } %>&nbsp;
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
  </tbody>
</table>
<br />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableCell">
        <thead>
        <tr>
          <td width="75%">
            <h3><bean:message key="label.security.contract.infor"/></h3>
          </td>
          <%
              if (isCMTmaker && hasValidApproveComm) {
          %>
          <td align="right" valign="bottom" width="16%">
            <input type="button" name="button23" id="button" value="Add New Contract" class="btnNormal" onclick="addItem('<%=CommodityMainConstant.COMMODITY_CONTRACT%>')"/>
          </td>
          <td align="right" valign="bottom" width="9%">
            <input type="button" name="button2222" id="button2" value="Remove" class="btnNormal" onclick="deleteItem('<%=CommodityMainConstant.COMMODITY_CONTRACT%>')"/>
          </td>
          <% } else { %>
          <td colspan="2">&nbsp;</td>
          <% } %>
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
          <td width="3%" class="fieldname"><bean:message key="label.global.sn"/></td>
          <td width="20%" class="fieldname"><lbean:message key="label.security.supplier"/></td>
          <td width="13%"><bean:message key="label.security.maturity.date.contract"/></td>
          <td width="12%"><bean:message key="label.security.main.contract.no"/></td>
          <td width="15%"><bean:message key="label.security.main.contract.amount"/></td>
          <td width="7%"><bean:message key="label.cash.margin.plus.minus"/> or (&plusmn;)</td>
          <td width="8%"><bean:message key="label.security.contract.quantity.diff"/></td>
          <td width="8%"><bean:message key="label.global.action"/></td>
          <td width="7%"><bean:message key="label.global.delete"/></td>
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
        <tr class="odd"><td colspan="9"><bean:message key="label.security.contract.none"/></td></tr>
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
          <td class="index"><%=count + 1%></td>
          <td><integro:empty-if-null value="<%=supplier!=null?supplier.getName():null%>"/>&nbsp;</td>
          <td>
          <%
                            if (contractList[j].getMaturityDate() != null) {
          %>
            <integro:date object="<%=contractList[j].getMaturityDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td><integro:empty-if-null value="<%=contractList[j].getMainContractNumber()%>"/>&nbsp;</td>
          <td align="right">
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
          <td style="text-align:center">
          <% if (isCMTmaker &&
                  (contractList[j].getContractID() <= 0 ||
                    !CommodityMainUtil.hasActualContract(actualCol[i], contractList[j].getCommonRef()))) { %>
            <a href="javascript:editItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.COMMODITY_CONTRACT%>')">View/Edit</a>
          <% } else { %>
            <a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.COMMODITY_CONTRACT%>')">View</a>
          <% } %>
          </td>
          <td><html:multibox property="deleteContract" value="<%=String.valueOf(count)%>" disabled="<%=!isCMTmaker%>"/>
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
    <td width="70%">
      <h3><bean:message key="label.security.hedging.contract.infor"/></h3>
    </td>
    <%
        if (isCMTmaker) {
    %>
    <td align="right" valign="bottom" width="19%">
        <input type="button" name="button23" id="button" value="Add New Hedged Contract" class="btnNormal" onclick="addItem('<%=CommodityMainConstant.HEDGED_CONTRACT%>')"/>
    </td>
    <td align="right" valign="bottom" width="11%">
        <input type="button" name="button2222" id="button2" value="Remove" class="btnNormal" onclick="deleteItem('<%=CommodityMainConstant.HEDGED_CONTRACT%>')"/>
    </td>
    <% } else { %>
    <td colspan="2">&nbsp;</td>
    <% } %>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="10%"><bean:message key="label.security.id"/></td>
          <td width="10%"><bean:message key="label.security.global.treasury.ref.no"/></td>
          <td width="10%"><bean:message key="label.security.date.deal"/></td>
          <td width="18%"><bean:message key="label.security.name.counterparty"/></td>
          <td width="10%"><bean:message key="label.security.amount.deal"/></td>
          <td width="7%"><bean:message key="label.security.hedging.agreement.ref"/></td>
          <td width="9%"><bean:message key="label.security.date.hedging.agreement"/></td>
          <td width="6%"><bean:mesage key="label.security.margin"/></td>
          <td width="10%"><bean:message key="label.global.action"/></td>
          <td width="7%"><bean:message key="label.global.delete"/></td>
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
        <tr class="odd"><td colspan="11"><bean:message key="label.security.hedged.contract.none"/></td></tr>
        <%
            } else {
                int count = 0;
                for (int i = 0; i < iCol.length; i++) {
                    IHedgingContractInfo[] hedgeContractList = iCol[i].getHedgingContractInfos();
                    if (hedgeContractList != null) {
                        for (int j = 0; j < hedgeContractList.length; j++) {
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td class="index"><%=count + 1%></td>
          <td><%=iCol[i].getSCISecurityID()%>&nbsp;</td>
          <td><integro:empty-if-null value="<%=hedgeContractList[j].getGlobalTreasuryReference()%>"/>&nbsp;</td>
          <td><integro:date object="<%=hedgeContractList[j].getDateOfDeal()%>"/>&nbsp;</td>
          <td>
          <% if (hedgeContractList[j].getNameOfTheCounterParty() != null) {%>
          <integro:wrapper lineLength="30" value="<%=hedgeContractList[j].getNameOfTheCounterParty()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td class="amount">
          <%  if (hedgeContractList[j].getDealAmount() != null &&
                  hedgeContractList[j].getDealAmount().getCurrencyCode() != null) {
          %>
          <integro:currency amount="<%=hedgeContractList[j].getDealAmount()%>"/>
          <% } else { %> - <% } %> &nbsp;
          </td>
          <td><integro:empty-if-null value="<%=hedgeContractList[j].getHedgingAgreement()%>"/>&nbsp;</td>
          <td>
          <% if (hedgeContractList[j].getHedgingAgreementDate() != null) { %>
            <integro:date object="<%=hedgeContractList[j].getHedgingAgreementDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center"><%=hedgeContractList[j].getMargin()%>&nbsp;</td>
          <td style="text-align:center" >
          <%
            if (isCMTmaker) {
          %>
            <a href="javascript:editItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.HEDGED_CONTRACT%>')">View/Edit</a>
          <% } else { %>
            <a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>, '<%=CommodityMainConstant.HEDGED_CONTRACT%>')">View</a>
          <% } %>
          </td>
          <td><html:multibox property="deleteHedgeContract" value="<%=String.valueOf(count)%>" disabled="<%=!isCMTmaker%>"/>
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
    <td width="75%">
      <h3><bean:message key="label.security.syndicate.facility "/></h3>
    </td>
    <%
        if (isCMTmaker) {
    %>
    <td align="right" valign="bottom" width="16%">
        <input type="button" name="button23" id="button" value="Add New Details" class="btnNormal" onclick="addItem('<%=CommodityMainConstant.LOAN_AGENCY%>')"/>
    </td>
    <td align="right" valign="bottom" width="9%">
        <input type="button" name="button2222" id="button2" value="Remove" class="btnNormal" onclick="deleteItem('<%=CommodityMainConstant.LOAN_AGENCY%>')"/>
    </td>
    <% } else { %>
    <td colspan="2">&nbsp;</td>
    <% } %>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead>
    <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="3%" class="fieldname" height="58"><bean:message key="label.global.sn"/></td>
          <td width="8%" class="fieldname" height="58"><bean:message key="label.security.id"/></td>
          <td width="13%" class="fieldname" height="58"><bean:message key="label.security.admin.agent.name"/></td>
          <td width="20%" height="58"><bean:message key="label.security.col.agent.name"/></td>
          <td width="19%" height="58"><bean:message key="label.security.doc.agent"/></td>
          <td width="18%" height="58"><bean:message key="label.facilitytype.title"/></td>
          <td width="9%" height="58"><bean:message key="label.global.action"/></td>
          <td width="10%"><bean:message key="label.global.delete"/></td>
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
                            boolean limitSameBCA = true;
                            if (loanAgencyList[j].getLimitIDs() != null) {
                                ILoanLimit[] loanLimit = loanAgencyList[j].getLimitIDs();
                                for (int k = 0; limitSameBCA && k < loanLimit.length; k++) {
                                    if (limitMap.get(String.valueOf(loanLimit[k].getLimitID())) == null) {
                                        limitSameBCA = false;
                                    }
                                }
                            }
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td width="3%" class="index" height="22"><%=count + 1%></td>
          <td height="22" width="8%"><%=iCol[i].getSCISecurityID()%>&nbsp;</td>
          <td width="13%" height="22"><integro:empty-if-null value="<%=loanAgencyList[j].getAdministrativeAgentName()%>"/>&nbsp;</td>
          <td width="20%" height="22"><integro:empty-if-null value="<%=loanAgencyList[j].getCollateralAgentName()%>"/>&nbsp;</td>
          <td width="19%" height="22"><integro:empty-if-null value="<%=loanAgencyList[j].getDocumentAgent()%>"/>&nbsp;</td>
          <td width="18%" class="amount" height="22"><integro:empty-if-null value="<%=facTypeList.getFacilityTypeItem(loanAgencyList[j].getFacilityType())%>"/>&nbsp;</td>
          <td style="text-align:center" width="9%" height="22">
          <% if (isCMTmaker) { %>
            <a href="javascript:editItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>,'<%=CommodityMainConstant.LOAN_AGENCY%>')">View/Edit</a>
          <% } else { %>
            <a href="javascript:viewItem(<%=String.valueOf(i)%>, <%=String.valueOf(j)%>,'<%=CommodityMainConstant.LOAN_AGENCY%>')">View</a>
          <% } %>
          </td>
          <td>
          <%
             if (limitSameBCA) {
          %>
            <html:multibox property="deleteLoanAgency" value="<%=String.valueOf(count)%>" disabled="<%=!isCMTmaker%>"/>
          <% } else { %> &nbsp; <% } %>
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
</table>
<%
    ICollateralTrxValue[] trxValueList = (ICollateralTrxValue[])trxValueMap.get("trxValue");

    if (trxValueList[0].getStatus().equals(ICMSConstant.STATE_REJECTED)) {
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
<%
    }
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
        <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/save2.gif',1)"><img src="img/save1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <% if (trxValueList[0].getStatus().equals(ICMSConstant.STATE_DRAFT) ||
            trxValueList[0].getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
        <td><%if (event.equals("create")) {%>
				<a href="CollateralRedirect.do?event=prepare"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">
			<% } else { %>
				<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image52','','img/cancel2.gif',1)">
			<% } %>	
            <img src="img/cancel1.gif" name="Image52" width="70" height="20" border="0" id="Image52"/></a></td>
    <% } else { %>
        <td><a href="javascript:submitPage(4)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>

</html:form>
</body>
</html>