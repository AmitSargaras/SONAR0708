<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td>
                <h3><bean:message key="label.group.sub.limit"/></h3></td>
            <td style="text-align:right;" valign="bottom">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right">
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
                       style="margin-top:10px">
                    <tbody>
                        <tr>
                            <td>
                            <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0" width="100%">
                                <thead>
                                    <tr>
                                        <td width="3%"  align="center">S/N</td>
                                        <td width="16%" align="center"><bean:message key="label.sub.limit.type"/></td>
                                        <td width="12%" align="center"><bean:message key="label.group.description"/></td>
                                        <td width="12%" align="center"><bean:message key="label.limit.amount"/></td>
                                        <td width="12%" align="center"><bean:message key="label.group.limit.last.reviewed.date"/></td>
                                        <td width="25%" align="center"><bean:message key="label.security.remarks"/></td>
                                        <td width="15%" class="center"><bean:message key="label.global.action"/></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd">
                                        <td class="index">1</td>
                                        <td>Sector</td>
                                        <td>Manufacturing</td>
                                        <td>MYR 100,500,000</td>
                                        <td>01/01/2006</td>
                                        <td>&nbsp;</td>
                                        <td style="text-align:center"><select name="SelectAct6" disabled="disabled">
                                            <option selected="selected">Please Select</option>
                                            <option>Edit</option>
                                        </select></td>
                                    </tr>
                                </tbody>
                            </table>
                </table>
            </td>
        </tr>
    </tbody>
</table>
