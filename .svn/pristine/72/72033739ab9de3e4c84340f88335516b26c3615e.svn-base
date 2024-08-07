<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.cms.app.collateral.bus.type.marketable.subtype.otherlistedforeign.IOtherListedForeign,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.marketablesec.NatureOfChargeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/marketablesec/marksecotherlistedforeign/MarksecOtherListedForeign_read_helper.jsp,v 1.43 2006/07/27 02:07:32 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Marketable Securities, Subtype - Portfolio others
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.43 $
* Date: $Date: 2006/07/27 02:07:32 $
* Tag: $Name:  $
*/
%>

<%
    IOtherListedForeign oldCollateral = (IOtherListedForeign) itrxValue.getCollateral();
    IOtherListedForeign newCollateral = (IOtherListedForeign) itrxValue.getStagingCollateral();
    String formName = "MarksecOtherListedForeignForm";
    String prefix = "Mark";
    String subtype = "MarksecOtherListedForeign";

    String formActionName = subtype+"Collateral.do";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<!-- InstanceBeginEditable name="Content" -->
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>

<%--
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
  <td class="fieldname"><bean:message key="label.security.fsv"/></td>
  <td><integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;</td>
  <td class="fieldname">&nbsp;</td>
  <td>&nbsp;</td>
</tr>	
--%>

</tbody>
</table>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	    <tr>
			<td> <h3><bean:message key="label.security.additional.information"/></h3></td>
	    </tr>
	    <tr>
			<td colspan="2"> <hr/> </td>
	    </tr>
	</thead>
	<tbody>
    <tr>
		<td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>

	<tr class="odd">
		  	    	                  
		<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isLE")?"fieldname":"fieldnamediff"):"fieldname"%>">
		  <bean:message key="label.security.legal.enforceability"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
		  <td width="30%"><% if (!(iCol== null)) { %>
		    <integro:empty-if-null value="<%=LEList.getInstance().getLEItem(iCol.getIsLE())%>"/>
		  <% } %> &nbsp;</td>
	
		<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lEDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
		  <bean:message key="label.security.legal.enforceability.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
		  <td width="30%">
		  <% if (!(iCol== null)) { %>
		  <integro:date object="<%=iCol.getLEDate()%>" /> <% } %>&nbsp;</td>
	</tr>
	  <%@ include file="/collateral/common/common_fields_read.jsp" %>


      	<%@ include file="../view_common_charge.jsp" %>

	</tbody>
	</table>
	</td></tr>
  </tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
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
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="24%"><bean:message key="label.security.issuer.name"/></td>
              <td width="16%"><bean:message key="label.marketsec.port.detail.noofunits"/></td>
              <td width="20%"><bean:message key="label.predeal.unit.price"/></td>
              <td width="11%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>
            <%  String classtype = "odd";
                if (from_event.equals("process")) {
                List res = CompareOBUtil.compOBArray(newCollateral.getEquityList(),((oldCollateral==null)?null:oldCollateral.getEquityList()));
                ArrayList list = new ArrayList(res);
                pageContext.setAttribute("equity",list);
                int counter = 0;
                    if (list == null || list.size() == 0) {
%>                     <tr class="<%=classtype%>">
                <td colspan="5"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

<% } %>
		<logic:present name="equity" >
		   <logic:iterate id="compResult" name="equity"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
           <%  IMarketableEquity marketEquity = (IMarketableEquity) compResult.getObj();
               classtype = "odd";
           %>
                    <tr class="<%=classtype%>">
                      <td width="5%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
                      <td width="24%"><integro:empty-if-null value="<%=marketEquity.getIssuerName()%>"/>&nbsp;</td>
                      <td width="16%" valign="right">
                      <%=marketEquity.getNoOfUnits()%>
                        </td>
                      <td width="20%">
                      <% if (marketEquity.getUnitPrice() != null && marketEquity.getUnitPrice().getCurrencyCode() != null) { %>
                      <integro:empty-if-null value="<%=marketEquity.getUnitPrice().getCurrencyCode()%>"/>&nbsp;<%=marketEquity.getUnitPrice().getAmount()%>
                       <% } %>
                       &nbsp;</td>
                      <td width="11%"><a href="MarketPortItem.do?event=marksecotherlistedforeign_read&indexID=<%=marketEquity.getRefID()%>&subtype=MarksecOtherListedForeign&from_event=<%=from_event%>">View</a>
                      </td>
                    </tr>
					<%	if (classtype.equals("odd")) {
                        classtype = "even";
                    }
                    else {
                        classtype = "odd";
                    }
                        counter++;
%>
                    </logic:iterate>
                    </logic:present>
<%                } else {
                IMarketableEquity[] equity = iCol.getEquityList();
                 classtype = "odd";
                    if (equity != null) {
                        if (equity.length == 0) { %>
                <tr class="<%=classtype%>">
                <td colspan="5"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

				 <% } for (int counter = 0; counter < equity.length; counter++) {
                     if ( equity[counter] == null )
                         continue;
%>
                    <tr class="<%=classtype%>">
                      <td width="5%" class="index"><%=counter + 1%></td>
                      <td width="24%"><integro:empty-if-null value="<%=equity[counter].getIssuerName()%>"/>&nbsp;</td>

                      <td width="16%" valign="right">
                      <%=equity[counter].getNoOfUnits()%>
                        </td>
                      <td width="20%">
                      <% if (equity[counter].getUnitPrice() != null && equity[counter].getUnitPrice().getCurrencyCode() != null) { %>
                      <integro:empty-if-null value="<%=equity[counter].getUnitPriceCcyCode()%>"/>&nbsp;<%=equity[counter].getUnitPrice().getAmount()%>
                       <% } %>
                       &nbsp;</td>
                      <td width="11%"><a href="MarketPortItem.do?event=marksecotherlistedforeign_read&indexID=<%=equity[counter].getRefID()%>&subtype=MarksecOtherListedForeign&from_event=<%=from_event%>">View</a>
                      </td>

                    </tr>
					<%	if (classtype.equals("odd")) {
                            classtype = "even";
                        } else {
                            classtype = "odd";
                        }
                    }
                } else { %>
                <tr class="<%=classtype%>">
                <td colspan="5"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

                <% } }%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %> 


<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>

<br>