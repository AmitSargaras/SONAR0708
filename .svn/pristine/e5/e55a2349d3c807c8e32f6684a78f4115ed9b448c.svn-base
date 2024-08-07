<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierForm" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
        <tbody>
            <tr>
                <td width="18%"></td>
                <td width="34%"></td>
                <td width="15%"></td>
                <td width="33%"></td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.group.id"/></td>
                <td><%=grpNo%>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.group.name"/> <span class="mandatory"> * </span></td>
                <td>
                    <html:text name="CustGrpIdentifierForm" property="groupName" maxlength="100" size="20"/>
                    <html:errors property="groupName"/>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.group.master.group"/> <span class="mandatory"> * </span></td>
                <td>
                    <html:radio property="masterGroupInd" value="Y"/> Yes &nbsp;&nbsp;
                    <html:radio property="masterGroupInd" value="N"/> No &nbsp;&nbsp;
                    <br><html:errors property="masterGroupInd"/>
                </td>
                <td class="fieldname"><bean:message key="label.group.manager"/><span class="mandatory"> * </span></td>
                <td><html:text property="groupAccountMgrCode" maxlength="20"></html:text>
                 <html:errors property="groupAccountMgrCode"/>
                </td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.group.type"/><span class="mandatory"> * </span></td>
                <td>
                    <html:select property="groupTypeCD">
                        <option value=""><bean:message key="label.please.select"/></option>
                        <html:options name="groupTypeCodes" labelName="groupTypeLabels"/>
                    </html:select>
                     <html:errors property="groupTypeCD"/>
                </td>
                <td class="fieldname"><bean:message key="label.group.country"/><span class="mandatory"> * </span></td>
                <td>
                    <html:select name="CustGrpIdentifierForm" property="countyCD">
                        <option value=""><bean:message key="label.please.select"/></option>
                        <html:options name="countryCodes" labelName="countryLabels"/>
                    </html:select>
                     <html:errors property="countyCD"/>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.group.account.mgmt"/><span class="mandatory"> * </span></td>
                <td><html:select property="accountMgmtCD">
                    <option value=""><bean:message key="label.please.select"/></option>
                    <html:options name="accountMgmtCodes" labelName="accountMgmtLabels"/>
                </html:select>
                 <html:errors property="accountMgmtCD"/>
                </td>
               <td class="fieldname"><bean:message key="label.group.business.unit"/>  <span class="mandatory"> * </span> &nbsp;</td>
            <td><html:select property="businessUnit">
                <option value=""><bean:message key="label.please.select"/></option>
                <html:options name="businessUnitCodes" labelName="businessUnitLabels"/>
                </html:select>
                <br><html:errors property="businessUnit"/>
            </td>
            </tr>
    </table>