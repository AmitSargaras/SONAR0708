<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.gtegovtlink.IFeeDetails" %>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode" %>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult" %>
<%@ page import="java.util.*" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    Locale localy1 = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

%>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.fee.details" /></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" id="FeeDetailsInput">
                    <thead>
                        <tr>
                            <td width="5%"><bean:message key="label.global.sn"/></td>
                            <td width="20%"><bean:message key="label.fee.details.effective.date"/></td>
                            <td width="27%"><bean:message key="label.fee.details.expiration.date"/></td>
                            <td width="28%"><bean:message key="label.fee.details.guarantee.amount"/></td>
                            <td width="20%"><bean:message key="label.global.action" /></td>
                        </tr>
                    </thead>
                    <tbody>
               <% if (from_event.equals("process")) {
                            String conversion1 = SecuritySubTypeUtil.getConversionCcy(newCollateral);
                            CurrencyCode curencycy1 = new CurrencyCode(conversion1);

                            List res =  CompareOBUtil.compOBArray(newCollateral.getFeeDetails(), (oldCollateral==null)?null:oldCollateral.getFeeDetails());
                            CompareResult[] resultList = (CompareResult[]) res.toArray(new CompareResult[0]);

                            ArrayList list = new ArrayList(Arrays.asList(resultList));
                            pageContext.setAttribute("ListFeeDetails", list);
                            int counter = 0;

                            if (list == null || list.size() == 0) { %>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td colspan="5"><bean:message key="label.no.records.found" /></td>
                        </tr>
                        <% } %>
                        <logic:present name="ListFeeDetails">
                            <logic:iterate id="compResult" name="ListFeeDetails" type="com.integrosys.base.techinfra.diff.CompareResult">
                                <% IFeeDetails iFeeDetails = (IFeeDetails) compResult.getObj(); %>
                                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                    <td width="3%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></ td>
                                    <td width="20%"><integro:date object="<%=iFeeDetails.getEffectiveDate()%>"/>&nbsp;</td>
                                    <td width="27%"><integro:date object="<%=iFeeDetails.getExpirationDate()%>"/>&nbsp;</td>
                                    <td width="28%">
                                            <%  if (iFeeDetails.getAmountFee() != null && iFeeDetails.getAmountFee().getAmount() > 0 ){  %>
                                                <integro:amount param="amount" amount="<%=iFeeDetails.getAmountFee()%>"/>
                                            <% } %> &nbsp;</td>
                                    <td width="20%" style="text-align: center;">
                                        <a href="FeeDetails.do?&formActionName=<%=formActionName %>&event=read&indexID=<%=iFeeDetails.getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View</a>
                                    </td>
                                </tr>
                                <% counter++;%>
                            </logic:iterate>
                        </logic:present>
                <%
                } else {
                            String conversion1 = SecuritySubTypeUtil.getConversionCcy(iCol);
                            CurrencyCode curencycy1 = new CurrencyCode(conversion1);

                            IFeeDetails[] iFeeDetails = iCol.getFeeDetails();
                            if (iFeeDetails != null) {
                                if (iFeeDetails.length == 0) {
                        %>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td colspan="5"><bean:message key="label.no.records.found" /></td>
                        </tr>
                        <% }
                            for (int counter = 0; counter < iFeeDetails.length; counter++) { %>

                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="5%" class="index"><%=counter + 1%></td>
                            <td width="20%"><integro:date object="<%=iFeeDetails[counter].getEffectiveDate()%>"/>&nbsp;</td>
                            <td width="27%"><integro:date object="<%=iFeeDetails[counter].getExpirationDate()%>"/>&nbsp;</td>
                            <td width="28%">
                                <%  if (iFeeDetails[counter].getAmountFee() != null && iFeeDetails[counter].getAmountFee().getAmount() > 0 ){  %>
                                      <integro:amount param="amount" amount="<%=iFeeDetails[counter].getAmountFee()%>"/>
                                 <% } %> &nbsp;</td>
                            <td width="20%" style="text-align: center;">
                                <a href="FeeDetails.do?&formActionName=<%=formActionName %>&event=read&indexID=<%=iFeeDetails[counter].getRefID()%>&subtype=<%=subtype%>&from_event=<%=from_event%>">View</a>
                            </td>
                        </tr>
                        <%
                            }
                        } else { %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td colspan="5"><bean:message key="label.no.records.found" /></td>
                            </tr>
                        <% }
                        }%>
                    </tbody>
                </table></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>
