<%@ page import="com.integrosys.cms.ui.custrelationship.CustRelUtils"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.shareholder.ICustShareholderTrxValue"%>
<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustShareholder"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>



<%
    ICustShareholderTrxValue custShareHolderTrxValue = (ICustShareholderTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction.CustShareHolderTrxValue");
    ICustShareholder[]  objArray = custShareHolderTrxValue.getCustShareholder();
    if (objArray == null)objArray = new ICustShareholder[0];
    pageContext.setAttribute("pageContext_custShareHolder", objArray);

%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td height="34" width="70%"><h3>Shareholder Information</h3></td>
            <td valign="baseline" style="text-align:right"> &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
<tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo">
                <thead>
                    <tr>
                        <td width="5%">S/N</td>
                        <td width="20%"><bean:message key="label.global.name"/>&nbsp;</td>
                        <td width="9%"><bean:message key="label.group.leid.source"/></td>
                        <td width="8%"><bean:message key="label.customer.id"/></td>
                        <td width="15%"><bean:message key="label.col.owner.id.no"/></td>
                        <td width="12%"><bean:message key="label.cust.relationship.id.country"/></td>
                        <td width="15%"><bean:message key="label.group.percentowned"/></td>
                    </tr>
                </thead>
                <tbody>

                    <%
                            // Check that offset + length cannot exceed the total.
                           CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
                            int iterateLength_1 = 0;
                            int  offset_1 =0;
                            int  length_1 =10;
                            int totalEntries = objArray.length;
                            if (offset_1 + length_1 > totalEntries){
                                iterateLength_1 = totalEntries - offset_1;
                            } else {
                                iterateLength_1 = length_1;
                            }
                        %>
                        <%
                            if (iterateLength_1 == 0){
                        %>
                        <tr>
                            <td colspan="8" class="odd">
                                <bean:message key="label.global.not.found"/>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                        <logic:iterate id="custShareHolder" name="pageContext_custShareHolder"
                                       offset="<%=String.valueOf(offset_1)%>"
                                       length="<%=String.valueOf(iterateLength_1)%>" indexId="counter"
                                       type="com.integrosys.cms.app.custrelationship.bus.ICustShareholder">
                            <%
                                Double percentageOwn = custShareHolder.getPercentageOwn();
                                String percentageOwnStr = (percentageOwn == null) ? "" : CustRelUtils.formatDouble("#0.00", percentageOwn);
                                //System.out.println("percentageOwnStr : " + percentageOwnStr);

                                String sourceId = custShareHolder.getCustomerDetails().getCMSLegalEntity().getSourceID();
                                sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);

                            %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=custShareHolder.getCustomerDetails().getCustomerName()%>"/></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=sourceId%>"/></td>
                                <td>&nbsp;<%=custShareHolder.getCustomerDetails().getCustomerID()%></td>
                                <td>&nbsp;<%=custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegNumber()%></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegCountry()%>"/></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=percentageOwnStr %>"/></td>
                            </tr>
                        </logic:iterate>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>