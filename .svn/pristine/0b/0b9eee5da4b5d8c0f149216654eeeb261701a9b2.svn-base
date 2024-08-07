<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.math.BigDecimal,
                 java.util.List" %>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Iterator"%>


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Credit Grade</h3></td>
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
            <%
                ICreditGrade creditGradeArrayDisp = new OBCreditGrade();
                ICreditGrade[] creditGradeArray = legal.getCreditGrades();

                HashMap typeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CREDIT_GRADE_TYPE);
                Iterator it = typeMap.keySet().iterator();
                while (it.hasNext()) {
                    Object key = it.next();

                    creditGradeArrayDisp = new OBCreditGrade();
                    if (creditGradeArray != null && creditGradeArray.length > 0) {
                        for (int cdIdx = 0; cdIdx < creditGradeArray.length; cdIdx++) {
                            if ("D".equals(creditGradeArray[cdIdx].getUpdateStatusInd())) {
                                continue;
                            }

//                            DefaultLogger.debug(this, "key : " + key );
//                            DefaultLogger.debug(this, "creditGradeArray[cdIdx].getCGType() : " + creditGradeArray[cdIdx].getCGType() );
                            if (key.equals(creditGradeArray[cdIdx].getCGType())) {
                                creditGradeArrayDisp = creditGradeArray[cdIdx];
                                break;
                            }
                        }
                    }
            %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname" width="20%">
                            <%=typeMap.get(key)%>&nbsp;
                        </td>
                        <td width="30%">
                            <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_GRADE_VALUE,creditGradeArrayDisp.getCGCode())%>"/>
                            &nbsp;
                        </td>
                        <td class="fieldname" width="20%">Effective Date</td>
                        <td width="30%">
                            <%if (creditGradeArrayDisp.getEffectiveDate() != null) {%>
                                <integro:date object="<%=creditGradeArrayDisp.getEffectiveDate()%>"/>&nbsp;
                            <%} else {%>-<%}%>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="even">
                        <td class="fieldname">Reason For Change</td>
                        <td>
                            <%if (creditGradeArrayDisp.getReasonForChange() != null) {%>
                                <integro:empty-if-null value="<%=creditGradeArrayDisp.getReasonForChange()%>"/>&nbsp;
                            <%} else {%> - <%}%>
                        </td>
                    </tr>
                </tbody>
            </table><br>
            <%
                }
            %>
        </td>
    </tr>
</tbody>
</table>
