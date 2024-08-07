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
                            <td width="20%" class="fieldname"> <bean:message key="label.security.combined.value.indicator"/></td>
                            <td width="30%">
                                <html:radio property="combinedValueIndicator" value="1"/> <bean:message key="label.common.yes"/>
                                <html:radio property="combinedValueIndicator" value="0"/> <bean:message key="label.common.no"/>
                            </td>
                            <td width="20%" class="fieldname"><bean:message key="label.security.combined.value.amount"/></td>
                            <td width="30%">
                                <html:text property="combinedValueAmount" maxlength="3" /><br>
                                <html:errors property="combinedValueAmount"/>
                            </td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname"><bean:message key="label.security.combined.value.no"/></td>
                            <td>
                                <html:text property="valueNumber" maxlength="15" /><br>
                                <html:errors property="valueNumber"/>
                            </td>
                            <td class="fieldname">&nbsp; </td>
                            <td >&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>