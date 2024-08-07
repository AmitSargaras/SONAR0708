<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierForm" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyCode" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript">
    function switchBGEL(flag){
        document.forms[0].currencyCD.disabled = flag;
        document.forms[0].internalLmt.disabled = flag;
        document.forms[0].lastReviewDt.disabled = flag;
        document.forms[0].groupLmt.disabled = flag;
        document.forms[0].groupRemarks.disabled = flag;
    }
</script>
<table width="98%" align="center">
    <tr>
        <td><h3><bean:message key="label.group.mgel"/></h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>

<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
    <tbody>
        <tr>
            <td width="18%"></td>
            <td width="34%"></td>
            <td width="15%"></td>
            <td width="33%"></td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.group.bgel.ind"/> &nbsp;</td>
            <td>
                <html:radio property="isBGELInd" value="Y" onclick="switchBGEL(false)"/> Yes &nbsp;&nbsp;
                <html:radio property="isBGELInd" value="N" onclick="switchBGEL(true)"/> No &nbsp;&nbsp;
                <html:errors property="isBGELInd"/>
            </td>
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.group.currency"/> <span class="mandatory"> * </span> &nbsp;
            </td>
            <td width="34%">
                <html:select property="currencyCD">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="currencyCodes" labelName="currencyLabels"/>
                </html:select>
                <br><html:errors property="currencyCD"/>
            </td>
            <td class="fieldname"><bean:message key="label.group.internal.limit"/> <span class="mandatory"> * </span></td>
            <td>
                <html:select property="internalLmt" onchange="fnRefresh()">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="internalLmtCodes" labelName="internalLmtLabels"/>
                </html:select>
                <br><html:errors property="internalLmt"/>
            </td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.group.last.review.date"/> <span class="mandatory"> * </span>
                &nbsp;</td>
            <td>
                <html:text property="lastReviewDt" readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
                     onclick="showCalendar('lastReviewDt', 'dd/mm/y')"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                     onmouseout="MM_swapImgRestore()"/>
                <br><html:errors property="lastReviewDt"/>
            </td>
            <td class="fieldname"><bean:message key="label.group.limit"/> <span class="mandatory"> * </span> &nbsp;</td>
            <td><%=(new CurrencyCode(PropertyManager.getValue("baseExchangeCcy")))%> <html:text property="groupLmt" maxlength="20" size="20" readonly="true"/>
                <br><html:errors property="groupLmt"/></td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.security.remarks"/></td>
            <td colspan="3">
            <html:textarea property="groupRemarks" rows="6" style="width:100%;"/>
            <html:errors property="groupRemarks"/></tr>
</table>