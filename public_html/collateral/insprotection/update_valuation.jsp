<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% IValuation iVal = iCol.getValuation(); %>

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
                <td  width="20%" class="fieldname"><bean:message key="label.valuation.date"/> </td>
                <td width="30%">
                   <%-- <bean:write name="GteBankDiffForm" property="valDate"/>&nbsp;</td>  --%>
                    <% if (iVal.getValuationDate() != null) { %>
                        <integro:date object="<%=iVal.getValuationDate()%>" />
                    <% } %> &nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">*</font></td>
                <td width="30%">
                   <html:select property="valCurrency">
                      <option value="" ><bean:message key="label.please.select"/> </option>
                      <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>
                <html:errors property="valCurrency"/>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.valuation.omv.cms.sec.currency"/></td>
                <td width="30%">
                    <%-- <bean:write name="GteBankDiffForm" property="valAftMargin"/>&nbsp;</td--%>
                    <% if (iVal.getCMV() != null) { %>
                        <integro:amount amount="<%=iVal.getCMV()%>" />
                    <% } %> &nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
                <td width="30%">
                   <%--<bean:write name="GteBankDiffForm" property="valBefMargin"/>&nbsp;</td> --%>
                    <% if (iVal.getFSV() != null) { %>
                        <integro:amount amount="<%=iVal.getFSV()%>" />
                    <% } %> &nbsp;</td>
              </td>

              </tr>
              <tr class="even">
                <td class="fieldname"><bean:message key="label.security.evaluation.date.fsv"/></td>
                <td><% if (iVal.getFSVEvaluationDate() != null) { %>
                 <integro:date object="<%=iVal.getFSVEvaluationDate()%>" />
               <% } %> &nbsp;</td>
                <td class="fieldname"><bean:message key="label.valuation.standard.rev.freq"/></td>
                <td>
                     <%=iVal.getRevaluationFreq()%>
                     <%=iVal.getRevaluationFreqUnit()%>
                  <%--  <bean:write name="GteBankDiffForm"  property="revalFreq"/>&nbsp;
                    <bean:write name="GteBankDiffForm" property="revalFreqUnit"/> &nbsp; </td>--%>
              </tr>
              <tr class="odd">
                <td class="fieldname"><bean:message key="label.valuation.revaluation.date"/></td>
               <td><% if (iVal.getRevaluationDate() != null) { %>
                         <integro:date object="<%=iVal.getRevaluationDate()%>" />
                  <% } %>&nbsp;
                </td>
                <td class="fieldname"><bean:message key="label.security.margin"/></td>
            	<td>
              <html:text property="margin" maxlength="3" size="3"/>&nbsp;%
              <html:errors property="margin"/>
            	</td>
              </tr>

            </tbody>
          </table>


<%--<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.valuation.details"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">* </font></td>               
               <td width="30%">
               <html:select property="valCurrency">
	            <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="valCurrency"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.valuation.cmv"/></td>
              <td><% if (iVal != null && iVal.getCMV() != null) { %>
              <integro:currency amount="<%=iVal.getCMV()%>" param="amount"/>
              <% } %>&nbsp;
              </td>
            </tr>
            <tr class="odd">
            	<td class="fieldname"><bean:message key="label.security.margin"/></td>
            	<td>
              <html:text property="margin" maxlength="3" size="3"/>&nbsp;%
              <html:errors property="margin"/>
            	</td>
              <td class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
              <td><% if (iVal != null && iVal.getFSV() != null) { %>
              <integro:currency amount="<%=iVal.getFSV()%>" param="amount"/>
              <% } %>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.val.date"/></td>
              <td><% if (iVal != null && iVal.getValuationDate() != null) { %>
              <integro:date object="<%=iVal.getValuationDate()%>" /> <% } %> &nbsp;
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>--%>
