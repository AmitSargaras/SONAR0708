<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<!--    Begin - Five new fields        -->
<%--
          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remargin")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.remargin"/>
            </td>
            <td><% if (iCol.getRemargin() != null && iCol.getRemargin().equals("Y")) {%>
                Yes &nbsp;&nbsp;
                <% } else if (iCol.getRemargin() != null && iCol.getRemargin().equals("N")) { %>
                No &nbsp;&nbsp;
                <% } else {%>
                &nbsp;&nbsp;
                <% } %>
            </td>
            <td class="fieldname"> &nbsp; </td>
            <td> &nbsp; </td>
          </tr>
          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastRemarginDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.remargin.date.last"/>
            </td>
            <td> <integro:date object="<%=iCol.getLastRemarginDate()%>" />&nbsp; </td>
            <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextRemarginDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.remargin.date.next"/>
            </td>
            <td> <integro:date object="<%=iCol.getNextRemarginDate()%>" />&nbsp; </td>
          </tr>
          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"riskMitigationCategory")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.risk.miti.cate"/>
            </td>
            <td><% if (iCol.getRiskMitigationCategory() != null && iCol.getRiskMitigationCategory().equals("FSTLOSS")) {%>
                First Loss &nbsp;&nbsp;
                <% } else if (iCol.getRiskMitigationCategory() != null && iCol.getRiskMitigationCategory().equals("PRORATA")) { %>
                Pro-Rata &nbsp;&nbsp;
                <% } else if (iCol.getRiskMitigationCategory() != null && iCol.getRiskMitigationCategory().equals("SENIOR")) { %>
                Senior Positions &nbsp;&nbsp;
                <% } else if (iCol.getRiskMitigationCategory() != null && iCol.getRiskMitigationCategory().equals("JUNIOR")) { %>
                Junior Positions &nbsp;&nbsp;
                <%  } else{  %>
                - &nbsp;&nbsp;
                <% } %>
            </td>
            --%>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isBorrowerDependency")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.borrower.collateral" /></td>
				<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
			</tr>
          
    <!--    End - Five new fields        -->