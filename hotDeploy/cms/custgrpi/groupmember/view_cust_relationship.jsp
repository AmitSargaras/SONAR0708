<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustRelationship" %>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.ICustRelationshipTrxValue" %>
<%@ page import="com.integrosys.cms.ui.custrelationship.CustRelUtils" %>
<%@ page import="java.util.Date" %>


<%
    ICustRelationshipTrxValue custRelTrxValue = (ICustRelationshipTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction.CustRelationshipTrxValue");
    ICustRelationship[] objArray1 = custRelTrxValue.getCustRelationship();
    if (objArray1 == null) objArray1 = new ICustRelationship[0];
    pageContext.setAttribute("pageContext_custRelationship", objArray1);

    int iterateLength_2 = 0;
    int offset_2 = 0;
    int length_2 = 10;
    int totalEntries_2 = objArray1.length;


%>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td height="34" width="70%"><h3>Director / Key Management Information </h3></td>
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
                            <td width="20%">Name&nbsp;<font color="#0000FF"></font></td>
                            <td width="9%">Date of Birth<br/>(DD/MM/YYYY)</td>
                            <td width="12%">Age</td>
                            <td width="16%">Entity Relationship</td>
                            <td width="12%">Incorporate Country / Citizenship Country</td>
                            <td width="15%">Remarks</td>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            // Check that offset + length cannot exceed the total.
                            if (offset_2 + length_2 > totalEntries_2){
                                iterateLength_2 = totalEntries_2 - offset_2;
                            } else {
                                iterateLength_2 = length_2;
                            }
                        %>
                        <% if (iterateLength_2 == 0){ %>
                        <tr>
                            <td colspan="7" class="odd">
                                <bean:message key="label.global.not.found"/>
                            </td>
                        </tr>
                        <% } %>
                        <logic:iterate id="custRelationship" name="pageContext_custRelationship" offset="<%=String.valueOf(offset_2)%>"
                                       length="<%=String.valueOf(iterateLength_2)%>" indexId="counter"
                                       type="com.integrosys.cms.app.custrelationship.bus.ICustRelationship">
                            <%
                                String entityRel = custRelationship.getRelationshipValue();                                
                                entityRel = commonCode.getCommonCodeLabel(entityRel);
                                Date dob = custRelationship.getCustomerDetails().getCMSLegalEntity().getRelationshipStartDate();
                                int ageInt = CustRelUtils.computeAge(dob);
                                String age = (ageInt == -1) ? "-" : String.valueOf(ageInt);
                            %>
                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                                <td>&nbsp;<integro:empty-if-null value="<%=custRelationship.getCustomerDetails().getCustomerName()%>"/></td>
                                <td>&nbsp;<integro:date object="<%=dob%>"/></td>
                                <td class="amount">&nbsp;<integro:empty-if-null value="<%=age %>"/></td>
                                 <td>&nbsp;<integro:empty-if-null value="<%=entityRel %>"/></td>
                                <td>&nbsp;<%=custRelationship.getCustomerDetails().getCMSLegalEntity().getLegalRegCountry() %></td>
                                <td>&nbsp;<%=custRelationship.getRemarks() %></td>
                            </tr>
                        </logic:iterate>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>