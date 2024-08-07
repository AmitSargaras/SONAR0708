<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>


          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
          <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.perfection.date"/>&nbsp;
		  <span class="mandatoryPerfection">*</span></td>
            <td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
            <td class="fieldname">&nbsp;</td><td>&nbsp;</td>
          </tr>
          
          