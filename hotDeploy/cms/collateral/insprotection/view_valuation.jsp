<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>

<% IValuation iVal = iCol.getValuation();
    boolean isIValNull = (iVal == null);
    IValuation oldValuation = null;
    IValuation newValuation = null;
    if (isProcess) {
        oldValuation = oldCollateral.getValuation();
        newValuation = newCollateral.getValuation();
    }
%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.valuation.system.val.details"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>

          <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                  <td  class="fieldname"><bean:message key="label.valuation.date"/></td>
                  <td><bean:write name="<%=formName%>" property="valDate"/>&nbsp;</td>
                  <td  class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">*</font><font color="#0000FF">* </font></td>
                  <td>
                  <% if (!isIValNull) { %>
                        <integro:empty-if-null value="<%=iVal.getCurrencyCode()%>"/>
                  <% } %>&nbsp;
                  </td>
                </tr>
              <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.valuation.omv.cms.sec.currency"/></td>
                <td width="30%"><bean:write name="<%=formName%>" property="valAftMargin"/>&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
                <td width="30%"><bean:write name="<%=formName%>" property="valBefMargin"/>&nbsp;</td>
              </td>
              </tr>
              <tr class="even">
                <td class="fieldname"><bean:message key="label.security.evaluation.date.fsv"/></td>
                <td><% if (!isIValNull && iVal.getFSVEvaluationDate() != null) { %>
                 <integro:date object="<%=iVal.getFSVEvaluationDate()%>" />
               <% } %> &nbsp;</td>
                <td class="fieldname"><bean:message key="label.valuation.standard.rev.freq"/></td>
                <td>
                    <bean:write name="<%=formName%>"  property="revalFreq"/>&nbsp;
                    <bean:write name="<%=formName%>" property="revalFreqUnit"/> &nbsp; </td>
              </tr>
              <tr class="odd">
                <td class="fieldname"><bean:message key="label.valuation.revaluation.date"/></td>
               <td><% if (!isIValNull && iVal.getRevaluationDate() != null) { %>
                         <integro:date object="<%=iVal.getRevaluationDate()%>" />
                  <% } %>&nbsp;
                </td>
                <td class="fieldname">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </tbody>
          </table>

<%--
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.valuation.details"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>
                    <tr class="even">
                        <td width="20%"
                            class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.currency"/>&nbsp;
                            <font color="#FF0000">* </font></td>
                        <td width="30%"><bean:write name="<%=formName%>" property="valCurrency"/>&nbsp;</td>
                        <td class="fieldname"><bean:message key="label.security.valuation.cmv"/></td>
                        <td><bean:write name="<%=formName%>" property="amountCMV"/>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"margin")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.margin"/></td>
                        <td><bean:write name="<%=formName%>" property="margin"/>&nbsp;%</td>
            </td>
            <td class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
            <td><bean:write name="<%=formName%>" property="amountFSV"/>&nbsp;</td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.security.val.date"/></td>
            <td><bean:write name="<%=formName%>" property="valDate"/>&nbsp;</td>
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>--%>
</td>
</tr>
