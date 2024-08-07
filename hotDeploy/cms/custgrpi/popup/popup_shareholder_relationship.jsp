<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustRelationship" %>
<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustShareholder" %>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.ICustRelationshipTrxValue" %>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.OBCustRelationshipTrxValue" %>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.shareholder.ICustShareholderTrxValue" %>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.shareholder.OBCustShareholderTrxValue" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custrelationship.CustRelUtils" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper"%>
<%@ page import="com.integrosys.base.techinfra.util.SortUtil"%>
<%@ page import="com.integrosys.cms.app.custrelationship.bus.OBCustRelationship"%>


<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>



<%

    System.out.println("Loading popup_shareholder_relationship.jsp");
    String context = request.getContextPath() + "/";

    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    int rowIdx = 0;
    String sub_profile_id = (String) request.getParameter("sub_profile_id");
    System.out.println("sub_profile_id = " + sub_profile_id);


    ICustRelationshipTrxValue custRelTrxValue =   new OBCustRelationshipTrxValue();
    ICustShareholderTrxValue custShareHolderTrxValue = new OBCustShareholderTrxValue();

    HashMap result = new HashMap();
    if (sub_profile_id != null){
        result = CustGroupUIHelper.getShareholder(sub_profile_id);
        if (result != null && !result.isEmpty()){
          custShareHolderTrxValue =(ICustShareholderTrxValue) result.get("CustShareHolderTrxValue") ;
          custRelTrxValue = (ICustRelationshipTrxValue) result.get("CustRelationshipTrxValue") ;
        }

    }

    if (custRelTrxValue ==null) {
          custRelTrxValue = new OBCustRelationshipTrxValue();;
    }


     if (custShareHolderTrxValue ==null) {
          custShareHolderTrxValue = new OBCustShareholderTrxValue();;
    }

    // get tenor Type
    CommonCodeList commonCode = CommonCodeList.getInstance(CategoryCodeConstant.TIME_FREQ);
    List tenorUnitID = (List) commonCode.getCommonCodeValues();
    List tenorUnitValue = (List) commonCode.getCommonCodeLabels();

    pageContext.setAttribute("tenorUnitID", tenorUnitID);
    pageContext.setAttribute("tenorUnitValue", tenorUnitValue);

    ICustRelationship[] objArray1 = custRelTrxValue.getCustRelationship();
    if (objArray1 == null) 
	{
    objArray1 = new ICustRelationship[0];
	}else
	{
        System.out.println("**********************************objArray1.length: "+objArray1.length);
		for(int i=0;i<objArray1.length;i++)
		{
		OBCustRelationship obCrs=(OBCustRelationship)objArray1[i];
		if(obCrs!=null&&obCrs.getCustomerDetails()!=null){
		String custName = obCrs.getCustomerDetails().getCustomerName();
		obCrs.setCustomerName(custName);
		}
		}
		String[] param = {"CustomerName"};
        if (objArray1.length != 0)
            SortUtil.sortObject(objArray1, param);   
	}
	
    pageContext.setAttribute("pageContext_custRelationship", objArray1);

    int iterateLength_2 = 0;
    int offset_2 = 0;
    int length_2 = objArray1.length; // Changed 10 to length since pagination not required MBBGEMS-400;
    int totalEntries_2 = objArray1.length;

    ICustShareholder[]  objArray = custShareHolderTrxValue.getCustShareholder();
    if (objArray == null)objArray = new ICustShareholder[0];
    pageContext.setAttribute("pageContext_custShareHolder", objArray);



%>


<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="<%=context%>calendar-blue.css" />
    <script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

</head>
<body>
<DIV style="overflow: auto;width:750;height:400;scrollbar:true;">

        <html:form action="GroupMember.do">


        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <tbody>
        <tr>
        <td colspan="2">

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
                         <% try { %>
                                <logic:iterate id="custRelationship" name="pageContext_custRelationship" offset="<%=String.valueOf(offset_2)%>"
                                               length="<%=String.valueOf(iterateLength_2)%>" indexId="counter"
                                               type="com.integrosys.cms.app.custrelationship.bus.ICustRelationship">
                                    <%
                                        String entityRel = custRelationship.getRelationshipValue();
//                                        System.out.println("entityRel = " + entityRel);
//                                        entityRel = commonCode.getCommonCodeLabel(ICMSConstant.RELATIONSHIP_CATEGORY_CODE,entityRel);
                                        Date dob = null;
                                        int ageInt = -1;
                                        String custName ="";
                                        String legalRegCountry ="";
                                        if (custRelationship.getCustomerDetails() !=null){
                                             dob = custRelationship.getCustomerDetails().getCMSLegalEntity().getIncorporateDate();
                                             custName = custRelationship.getCustomerDetails().getCustomerName() ;
                                             legalRegCountry = custRelationship.getCustomerDetails().getCMSLegalEntity().getLegalRegCountry() ;
                                        }
                                        if (dob !=null) {
                                            ageInt = CustRelUtils.computeAge(dob);
                                        }
                                        String age = (ageInt == -1) ? "-" : String.valueOf(ageInt);
                                    %>
                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                        <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=custName%>"/></td>
                                        <td> <% if (dob != null){   %>
                                                &nbsp;<integro:date object="<%=dob%>"/>
                                                <%}else{%>
                                                -
                                                <%}%>
                                        </td>
                                        <td class="amount">&nbsp;<integro:empty-if-null value="<%=age %>"/></td>
                                        <td><%=CustGrpIdentifierUIHelper.getCodeDesc(entityRel, ICMSConstant.RELATIONSHIP_CATEGORY_CODE)%>&nbsp;</td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=legalRegCountry %>"/></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=custRelationship.getRemarks() %>"/></td>
                                    </tr>
                                </logic:iterate>
                                <%}catch(Exception e){
                                    System.out.println("Error in popup_shareholder_relationship.jsp = " + e);
                                } %>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

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
                                    CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.CCI_LE_ID_TYPE, null);
                                    int iterateLength_1 = 0;
                                    int offset_1 = 0;
                                    int length_1 = objArray.length; // Changed 10 to length since pagination not required MBBGEMS-400;
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
                             <% try { %>
                                <logic:iterate id="custShareHolder" name="pageContext_custShareHolder"
                                               offset="<%=String.valueOf(offset_1)%>"
                                               length="<%=String.valueOf(iterateLength_1)%>" indexId="counter"
                                               type="com.integrosys.cms.app.custrelationship.bus.ICustShareholder">
                                    <%
                                        String custName ="-";
                                        String sourceId = "-" ;
                                        String legalRegCountry ="";
                                        String legalRegNumber ="-";
                                        String lEReference = "";
                                        if (custShareHolder.getCustomerDetails() != null){
                                            custName = custShareHolder.getCustomerDetails().getCustomerName();
                                            sourceId = (CounterpartyUIHelper.isNotEmpty(custShareHolder.getCustomerDetails().getCMSLegalEntity().getSourceID()))
                                                    ? custShareHolder.getCustomerDetails().getCMSLegalEntity().getSourceID()
                                                    : "-";
                                            legalRegNumber =custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegNumber();
                                            legalRegCountry = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegCountry();
                                            lEReference = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLEReference();
                                        }
                                        Double percentageOwn = custShareHolder.getPercentageOwn();
                                        String percentageOwnStr = (percentageOwn == null) ? "" : CustRelUtils.formatDouble("#0.00", percentageOwn);
                                        String sourceDesc = CustGrpIdentifierUIHelper.getCodeDesc(sourceId, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE);

                                    %>
                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                        <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=custName%>"/></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=sourceDesc%>"/></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=lEReference%>"/></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=legalRegNumber%>"/></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=legalRegCountry%>"/></td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=percentageOwnStr %>"/></td>
                                    </tr>
                                </logic:iterate>
                              <%}catch(Exception e){
                                System.out.println("Error in popup_shareholder_relationship.jsp) = " + e);
                                } %>

                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

        </td>
        </tr>
        </tbody>
        </table>

        <p align="center">
            <a href="#">
                <img src="<%=context%>img/closeb.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="window.close();"/>
            </a>
        </p>


        </html:form>

</DIV>
</body>
</html>

