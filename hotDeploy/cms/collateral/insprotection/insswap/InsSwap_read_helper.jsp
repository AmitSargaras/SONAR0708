<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.insurance.ICDSItem,
                 com.integrosys.cms.app.collateral.bus.type.insurance.subtype.creditswaps.ICreditDefaultSwaps,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.ui.collateral.insprotection.NatureOfChargeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,				 
                 java.util.List,
                 java.util.ArrayList"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insprotection/insswap/InsSwap_read_helper.jsp,v 1.38 2006/07/27 01:59:11 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Insurance, Subtype - Credit Default Swaps
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.38 $
* Date: $Date: 2006/07/27 01:59:11 $
* Tag: $Name:  $
*/
%>

<%
    ICreditDefaultSwaps oldCollateral = (ICreditDefaultSwaps) itrxValue.getCollateral();
    ICreditDefaultSwaps newCollateral = (ICreditDefaultSwaps) itrxValue.getStagingCollateral();
    String formName = "InsSwapForm";
    String prefix = "Ins";
    String subtype = "InsSwap";
    String formActionName = subtype+"Collateral.do";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
<!--            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.security.fsv"/></td>
              <td>
              <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;
              </td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>          
          </tr>
            <tr class="even">
            <%@ include file="/collateral/common/common_security_custodian_read.jsp" %>
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
            </tr>-->
            <%
                ILimitCharge[] limit = iCol.getLimitCharges();
                ILimitCharge objLimit = null;
                if (limit != null && limit.length > 0) {
                    objLimit = limit[0];
                }
                ILimitCharge oldLimit = null;
                ILimitCharge newLimit = null;
                Amount oldChargeAmt = null;
                Amount newChargeAmt = null;
                if (isProcess) {
                    if (oldCollateral != null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                        oldLimit = oldCollateral.getLimitCharges()[0];
                    }
                    if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                        newLimit = newCollateral.getLimitCharges()[0];
                    }
                    if (oldLimit != null) {
                        oldChargeAmt = oldLimit.getChargeAmount();
                    }
                    if (newLimit != null) {
                        newChargeAmt = newLimit.getChargeAmount();
                    }
                }
                boolean isLimitNull = (objLimit == null);
            %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
  
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
			<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
		</tr>
		<tr>
			<td><hr/></td>
		</tr>
	</thead>
	<tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<% rowIdx++; %>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
               	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"description")?"fieldname":"fieldnamediff"):"fieldname"%>">
               		<bean:message key="label.credit.default.swap.desc"/></td>
               	<td colspan="3"><integro:wrapper value="<%=iCol.getDescription()%>" />&nbsp;</td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iSDADate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.isda.master.agreement.date"/>&nbsp;<span class="mandatory">*</span></td>
              	<td width="30%"><integro:date object="<%=iCol.getISDADate()%>" />&nbsp;</td>
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"treasuryDocDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.treasury.doc.date"/>&nbsp;<span class="mandatory">*</span></td>
              	<td width="30%"><integro:date object="<%=iCol.getTreasuryDocDate()%>" />&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isBankRiskConfirmation")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.bank.risk.approval.confirmation"/>&nbsp;<span class="mandatoryPerfection">*</span>&nbsp;</td>
              	<td><%  String bankRisk = "";
                  		if (iCol.getIsBankRiskConfirmation() != null) {
                  		if (iCol.getIsBankRiskConfirmation().equals(ICMSConstant.TRUE_VALUE)) {
                      		bankRisk = "Yes";
                  		} else if (iCol.getIsBankRiskConfirmation().equals(ICMSConstant.FALSE_VALUE)) {
                     	 	bankRisk = "No";
                  		} else if (iCol.getIsBankRiskConfirmation().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
                      		bankRisk = "Not Applicable";
                  		} } %>
              		<%=bankRisk%>&nbsp;</td>
  				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insurancePremium")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.insurance.premium.amount"/></td>
               <td><bean:write name ="<%=formName %>" property="premiumAmount"/>&nbsp;</td>
<!--              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=ExchangeControlList.getInstance().getExchangeControlItem(iCol.getIsExchangeCtrlObtained())%>"/>&nbsp;</td>-->
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.security.nature.charge"/>&nbsp;<span class="mandatoryPerfection">*</span>&nbsp;</td>
              	<td><% if (!isLimitNull) { %>
                		<integro:empty-if-null value="<%=NatureOfChargeList.getInstance().getNatureOfChargeItem(objLimit.getNatureOfCharge())%>"/>
                	<% } %> &nbsp; </td>

            		<%  boolean changed = false;
                		if (isProcess) {
                    		if (newChargeAmt != null && oldChargeAmt == null) {
                        		if (newChargeAmt.getAmount() != 0) {
                            		changed = true;
                        		}
                    		} else if (newChargeAmt != null && oldChargeAmt != null) {
                        		changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount");
                    		}
                		}
            		%>
            	<td  class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>">
            		<bean:message key="label.security.amount.charge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><% if (!isLimitNull && objLimit.getChargeAmount() != null &&
                      objLimit.getChargeAmount().getCurrencyCode() != null) { %>
              		<bean:write name="InsSwapForm" property="amtCharge"/>
              		<% } %> &nbsp;</td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.security.date.legal.charge"/>&nbsp;</td>
              	<td><% if (!isLimitNull) { %>
              			<integro:date object="<%=objLimit.getLegalChargeDate()%>" />
                	<% } %> &nbsp; </td>
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeConfirmationDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.confirmation.charge.date"/></td>
              	<td><% if (!isLimitNull) { %>
              			<integro:date object="<%=objLimit.getChargeConfirmationDate()%>" />
                	<% } %> &nbsp; </td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
            		<bean:message key="label.security.charge.type"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
            	<td><% if (!isLimitNull) { %>
            		<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
            		<% } %>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"arrInsurer")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.credit.arr.insurer"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ARR_INSURER, iCol.getArrInsurer())%>"/></td>
            </tr>
            
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
   			<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
  			<%@ include file="/collateral/common/common_fields_read.jsp" %>
             <!--<%@ include file="/collateral/common/view_security_instrument.jsp" %>-->

          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %> 


<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.credit.default.swap.details"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      	<td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
        	<tr>
            	<td width="5%"><bean:message key="label.global.sn"/></td>
                <td width="15%"><bean:message key="label.cds.ref"/></td>
                <td width="15%"><bean:message key="label.issuer.id"/></td>
                <td width="15%"><bean:message key="label.security.issuer"/></td>
                <td width="15%"><bean:message key="label.valuation.omv.amount"/>&nbsp;<font color="#00AAFF">* </font></td>
                <td width="15%"><bean:message key="label.valuation.fsv.amount"/></td>
                <td width="20%"><bean:message key="label.global.action"/></td>
            </tr>
        </thead>
        <tbody>
            <% if (from_event.equals("process")) {
            List res= new ArrayList() ;
            try{
               res = CompareOBUtil.compOBArray(newCollateral.getCdsItems(), ((oldCollateral==null)?null:oldCollateral.getCdsItems()));
//                System.out.println("CompareOBUtil.compOBArray " + " getCdsItems" );
            }catch (Exception e){
//                System.out.println("CompareOBUtil.compOBArray  " + e );
            }

            ArrayList list = new ArrayList(res);
            pageContext.setAttribute("cdsList",list);
            int counter = 0;
                if (list == null || list.size() == 0) { %>
                   <tr class="odd">
                   <td colspan="7"><bean:message key="label.credit.default.swap.infor.none"/></td>
                   </tr>
<%                }%>
		<logic:present name="cdsList" >
		   <logic:iterate id="compResult" name="cdsList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
           <%  ICDSItem item = (ICDSItem) compResult.getObj();
           %>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="<bean:write name='compResult' property='key' />"><%=counter + 1%></td>
              <td><integro:htmltext value="<%=item.getCdsRef()%>" lineLength="30"/>&nbsp;</td>
              <td><integro:htmltext value="<%=item.getIssuerID()%>" lineLength="30"/>&nbsp;</td>
              <td><integro:htmltext value="<%=item.getIssuer()%>" lineLength="30"/></td>
              <td>
              <%
              	IValuation cdsVal = item.getValuation();
              	if (cdsVal != null && cdsVal.getCMV() != null) {
              %>
              <integro:currency amount="<%=cdsVal.getCMV()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td>
              <% if (cdsVal != null && cdsVal.getFSV() != null) { %>
              <integro:currency amount="<%=cdsVal.getFSV()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td>
             	<a href="CDSItem.do?event=read&indexID=<%=item.getRefID()%>&from_event=<%=from_event%>">View</a>
			  </td>
            </tr>
			<%		
                	counter++;
	        %>
        </logic:iterate>
        </logic:present>
		<% } else {
            ICDSItem[] cdsList = iCol.getCdsItems();
            if (cdsList == null || cdsList.length == 0) {
		%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td colspan="8">
            	There is no credit default swaps information.
            </td>
            </tr>
		<%
			} else {
				for (int counter = 0; counter < cdsList.length; counter++) {
		%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="index"><%=counter + 1%></td>
              <td><integro:htmltext value="<%=cdsList[counter].getCdsRef()%>" lineLength="30"/>&nbsp;</td>
              <td><integro:htmltext value="<%=cdsList[counter].getIssuerID()%>" lineLength="30"/>&nbsp;</td>
              <td><integro:htmltext value="<%=cdsList[counter].getIssuer()%>" lineLength="30"/></td>
              <td>
              <%
              	IValuation cdsVal = cdsList[counter].getValuation();
              	if (cdsVal != null && cdsVal.getCMV() != null) {
              %>
              <integro:currency amount="<%=cdsVal.getCMV()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td>
              <% if (cdsVal != null && cdsVal.getFSV() != null) { %>
              <integro:currency amount="<%=cdsVal.getFSV()%>"/>&nbsp;
              <% } else { %> - <% } %>
              </td>
              <td>
              	<a href="CDSItem.do?event=read&indexID=<%=cdsList[counter].getRefID()%>&from_event=<%=from_event%>">View</a>
			  </td>
            </tr>
			<%		
            	}
            }
        }
	        %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>

<br>