<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% boolean isInternal=false;%>
    <%--<td width="20%" class="fieldname">
        <span><bean:message key="label.security.custodian"/></span></td>
    <td colspan="3">
		<% 
			//if (!event.equals("create")) 
				isInternal = ICMSConstant.INTERNAL_COL_CUSTODIAN.equals(colForm.getSecCustodianType());
        %>
           Govind S:For HDFC 30/06/2011
           <html:radio property="secCustodianType" value="<%=ICMSConstant.INTERNAL_COL_CUSTODIAN%>" onclick="fnSecCustodianType('int')"> Internal </html:radio>
         
        <html:select property="secCustodianInt" disabled="<%=!isInternal%>">
         
         <html:select property="secCustodianInt" disabled="true">
			<integro:common-code categoryCode="<%= ICMSConstant.CATEGORY_CODE_BKGLOC%>" descWithCode="true"/>

            <option value=""><bean:message key="label.please.select"/> </option>
            <html:options name="organizationValues" labelName="organizationLabels"/>

        </html:select>
        <html:errors property="secCustodianInt"/>
        Govind S:For HDFC 30/06/2011
        <br>
        <html:radio property="secCustodianType" value="<%=ICMSConstant.EXTERNAL_COL_CUSTODIAN%>" onclick="fnSecCustodianType('ext')"> External </html:radio>
        <html:text property="secCustodianExt" size="30" maxlength="50" disabled="<%=isInternal%>"/>&nbsp;
        <html:errors property="secCustodianExt"/>
        
    </td>

--%>
 <td class="fieldname">

                     <bean:message key="label.security.custodian1" /></td>
                     <td width="30"><html:text property="custodian1" styleId="custodian1"  disabled="true" value="<%=custodian1%>" />
											</td>
                     <td class="fieldname">
                    <bean:message key="label.security.custodian2" /></td>
                     <td width="30"><html:text property="custodian2" styleId="custodian2"  disabled="true" value="<%=custodian2%>" /></td>
                    <%--
                <td colspan="3">
                    <%  if (iCol.getCollateralCustodianType() != null && iCol.getCollateralCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) { %>
                            <bean:message key="label.security.custodian.internal" />&nbsp;&nbsp;
							<integro:common-code categoryCode="<%= ICMSConstant.CATEGORY_CODE_BKGLOC%>" descWithCode="true" entryCode="<%=iCol.getCollateralCustodian()%>" display="true"/>

                          <integro:empty-if-null  value="<%=CommonCodeList.getInstance(iCol.getCollateralLocation(), ICMSConstant.CATEGORY_CODE_BKGLOC).getCommonCodeLabel(iCol.getCollateralCustodian())%>"/> 
                    <% } else {  %>
                            <bean:message key="label.security.custodian.external" /> &nbsp;&nbsp;
                            <integro:empty-if-null value="<%=iCol.getCollateralCustodian()%>"/>
                    <% } %>
                </td>
--%><script language="Javascript">
    <!--

function fnSecCustodianType(str){
    if (str=='int'){
        document.forms[0].secCustodianExt.value = '';
        document.forms[0].secCustodianExt.disabled = true;
        document.forms[0].secCustodianInt.disabled = false;
    }else{
        document.forms[0].secCustodianInt.value = '';
        document.forms[0].secCustodianInt.disabled = true;
        document.forms[0].secCustodianExt.disabled = false;
    }

}

 -->
</script>


