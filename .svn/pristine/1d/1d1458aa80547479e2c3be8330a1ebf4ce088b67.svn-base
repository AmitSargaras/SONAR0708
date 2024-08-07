<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation"%>

<% IValuation iVal = iCol.getValuation(); %>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
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
            <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.security.margin"/></td>
              
               <td>
               <html:text property="margin" maxlength="3" size="3"/>%&nbsp;
                <html:errors property="margin" />
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.security.value.before.margin.cms.sec.currency"/></td>
              <td width="30%" >
                <bean:write name="<%=formName%>" property="valBefMargin"/>&nbsp;</td>
              <html:hidden property="valBefMargin"/>
              <html:hidden property="valAftMargin"/>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.value.after.margin.cms.sec.currency"/></td>
              <td><bean:write name="<%=formName%>" property="valAftMargin"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">*</font><font color="#0000FF">* </font></td>
              
              <td>
              <html:select property="valCurrency">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>
              <html:errors property="valCurrency"/>
              </td>
            </tr>
            <tr class="odd"> 
              <td class="fieldname"><bean:message key="label.security.min.fsv.req.cms.sec.currency"/></td>
              
              <td>
              <html:text property="minimalFSV" maxlength="15" />&nbsp;
              <html:errors property="minimalFSV"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.valuation.nextdate"/></td>
              <td width="30%" >
                <% if (iVal != null && iVal.getLastEvaluationDate() != null) { %>
                <integro:date object="<%=iVal.getLastEvaluationDate()%>" />
                 <% } %> &nbsp;</td>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.security.val.date"/></td>
              <td width="30%" >
                  <bean:write name="<%=formName%>" property="valDate"/>&nbsp;
              <html:hidden property="valDate"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.revaluation.freq"/></td>
              <td><bean:write name="<%=formName%>"  property="revalFreq"/>&nbsp;
              <bean:write name="<%=formName%>" property="revalFreqUnit"/>
              <html:hidden property="revalFreq"/>
              <html:hidden property="revalFreqUnit"/>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.next.revaluation.date"/></td>
              <td width="30%" >
                <% if (iVal != null && iVal.getNextRevaluationDate() != null) { %>
                <integro:date object="<%=iVal.getNextRevaluationDate()%>" />
                <% } %> &nbsp;</td>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr><td>&nbsp;</td></tr>