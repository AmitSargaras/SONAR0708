<%@ page import="com.integrosys.cms.ui.collateral.CollateralSearchForm"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% int rowIdx = 1;
   CollateralSearchForm basicSearchForm = (CollateralSearchForm) request.getAttribute("CollateralSearchForm");
%>

<SPAN style="color:red">- Do note that advanced search may return a lot of results, which may slow down the server</SPAN><br>
<SPAN style="color:red">- Use it only when there are enough search criteria</SPAN><br>
<br>

<table class="tblInput" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td width="40%" class="fieldname"><bean:message key="label.global.aa.number" /></td>
        <td width="60%">
			<html:select property="aaSearchType">
				<integro:common-code categoryCode="<%= ICMSConstant.COMMON_CODE_SEARCH_TYPE_AA%>" descWithCode="false" />
			</html:select>
			<html:errors property="aaSearchType"/>
        	<html:text property="aaNumber" maxlength="99"/>
		</td>
    </tr>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.branch.name" /></td>
        <td>
        	<html:select property="branchCode">
		    	<integro:common-code categoryCode="<%=ICMSConstant.CATEGORY_CODE_BKGLOC%>"/>
			</html:select>
        </td>
    </tr>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td width="40%" class="fieldname"><bean:message key="label.col.owner.name" /></td>
        <td width="60%"><html:text property="customerName" maxlength="99"/></td>
    </tr>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.col.owner.leid.type" /></td>
        <td><html:select property="leIDType">
            <option value="" selected><bean:message key="label.please.select"/></option>
            <html:options name="leTypeValue" labelName="leTypeLabel"/>
        </html:select>
        </td>
    </tr>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message  key="label.col.owner.leid" /></td>
        <td><html:text property="legalID" maxlength="10"/></td>
    </tr>
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
        <td><html:text property="idNO" maxlength="41"/></td>
    </tr>
   <% if ((ICMSConstant.SECURITY_TYPE_GUARANTEE.equals(basicSearchForm.getAdvanceSearchType()))){  %>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="fieldname"><bean:message key="label.security.issuer"/></td>
            <td><html:text property="issuer" maxlength="10"/></td>
        </tr>
   <% } %>
</table>
<br>

