<br>
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
                ICreditGrade[] creditGradeArray = legal.getCreditGrades();
                if (creditGradeArray == null || creditGradeArray.length == 0) {
                    HashMap typeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CREDIT_GRADE_TYPE);
                    Iterator it = typeMap.keySet().iterator();
                    
                    while (it.hasNext()) {
                        Object key = it.next();
            %>
<%--
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname" width="20%">
                            <%=typeMap.get(key)%>&nbsp;
                        </td>
                        <td width="30%">
                            -
                        </td>
                        <td class="fieldname" width="20%">Effective Date</td>
                        <td width="30%">
                            -
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
                            -
                        </td>
                    </tr>
                </tbody>
            </table><br>
--%>            
            <%
                }
            } else {
                for (int cdIdx = 0; cdIdx < creditGradeArray.length; cdIdx++) {
                    if ("D".equals(creditGradeArray[cdIdx].getUpdateStatusInd())) {
                        continue;
                    }
            %>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname" width="20%">
                            <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_GRADE_TYPE,creditGradeArray[cdIdx].getCGType())%>"/>
                            &nbsp;
                        </td>
                        <td width="30%">
                            <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.CREDIT_GRADE_VALUE,creditGradeArray[cdIdx].getCGCode())%>"/>
                            &nbsp;
                        </td>
                        <td class="fieldname" width="20%">Effective Date</td>
                        <td width="30%">
                            <%if (creditGradeArray[cdIdx].getEffectiveDate() != null) {%>
                            <integro:date object="<%=creditGradeArray[cdIdx].getEffectiveDate()%>"/>&nbsp;
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
                            <%if (creditGradeArray[cdIdx].getReasonForChange() != null) {%>
                            <integro:empty-if-null value="<%=creditGradeArray[cdIdx].getReasonForChange()%>"/>&nbsp;
                            <%} else {%> - <%}%>
                        </td>
                    </tr>
                </tbody>
            </table><br>
            <%
                    }
                }
            %>
        </td>
    </tr>
</tbody>
</table>