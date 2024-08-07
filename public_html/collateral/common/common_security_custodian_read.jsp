<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %><%--

                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    --%>
                 <td class="fieldname">
                    <bean:message key="label.security.custodian1" /></td>
                <td width="30">
                <integro:empty-if-null value="<%=custodian1%>"/>
               
                </td>
                 <%--<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralCustodian")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    --%>
                 <td class="fieldname">    
                    <bean:message key="label.security.custodian2" /></td>
                <td width="30">
               <integro:empty-if-null value="<%=custodian2%>"/>
                </td>
                <%--<td>
                    <%  if (iCol.getCollateralCustodianType() != null && iCol.getCollateralCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN)) { %>
                            <bean:message key="label.security.custodian.internal" />&nbsp;&nbsp;
							<integro:common-code categoryCode="<%= ICMSConstant.CATEGORY_CODE_BKGLOC%>" descWithCode="true" entryCode="<%=iCol.getCollateralCustodian()%>" display="true"/>

                          <integro:empty-if-null  value="<%=CommonCodeList.getInstance(iCol.getCollateralLocation(), ICMSConstant.CATEGORY_CODE_BKGLOC).getCommonCodeLabel(iCol.getCollateralCustodian())%>"/> 
                    <% } else {  %>
                            <bean:message key="label.security.custodian.external" /> &nbsp;&nbsp;
                            <integro:empty-if-null value="<%=iCol.getCollateralCustodian()%>"/>
                    <% } %>
                </td>
--%>