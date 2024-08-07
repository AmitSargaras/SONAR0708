<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td>
                <h3> <bean:message key="label.security.formal.group.report"/></h3>
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
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="25%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"combinedValueIndicator")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.security.combined.value.indicator"  />
                            </td>
                            <td width="25%">                                
                                <% if (iCol.getCombinedValueIndicator() !=null && iCol.getCombinedValueIndicator().trim().equals("1")) {%>
                                Yes
                                <% } else { %>
                                No
                                <% }%>
                            </td>
                            <td width="25%"  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"combinedValueAmount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.security.combined.value.amount" />
                            </td>
                            <td width="25%"><%= iCol.getCombinedValueAmount() %>&nbsp;</td>
                        </tr>

                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="25%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"valueNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
                               <bean:message key="label.security.combined.value.no"/>
                            </td>
                            <td ><%= iCol.getValueNumber() %> &nbsp;</td>
                            <td class="fieldname">&nbsp;</td>
                            <td >&nbsp;</td>
                        </tr>

                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>