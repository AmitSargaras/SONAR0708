<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<!--	Begin - Five new fields		-->
        <tr class="even">
            <td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remargin")?"fieldname":"fieldnamediff"):"fieldname"%>">
                   <bean:message key="label.security.remargin"/>
                 </td>
                <td> <integro:empty-if-null value="<%=iCol.getRemargin()%>" />&nbsp; </td>
				<td class="fieldname"> &nbsp; </td>
				<td> &nbsp; </td>
			</tr>
			<tr class="odd">
				<td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastRemarginDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.remargin.date.last"/>
				  </td>
				<td> <integro:date object="<%=iCol.getLastRemarginDate()%>" />&nbsp; </td>
				<td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextRemarginDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.remargin.date.next"/>
				 </td>
				<td> <integro:date object="<%=iCol.getNextRemarginDate()%>" />&nbsp; </td>
			</tr>
			<tr class="even">
				<td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"riskMitigationCategory")?"fieldname":"fieldnamediff"):"fieldname"%>">
                   <bean:message key="label.security.risk.miti.cate"/>
				 </td>
				<td> <integro:empty-if-null value="<%=iCol.getRiskMitigationCategory()%>" />&nbsp; </td>
				<td  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"extSeniorLien")?"fieldname":"fieldnamediff"):"fieldname"%>">
                  <bean:message key="label.security.ext.senior.lien"/>
				 </td>
				<td> <integro:empty-if-null value="<%=iCol.getExtSeniorLien()%>" />&nbsp; </td>
			</tr>
	<!--	End - Five new fields		-->