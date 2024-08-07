<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation,
				 com.integrosys.cms.ui.collateral.TimeFreqList"%>

<% IValuation iVal = iCol.getValuation();
    boolean isIValNull = (iVal == null);
    IValuation oldValuation = null;
    IValuation newValuation = null;
    Amount oldBefMargin = null;
    Amount newBefMargin = null;
    if (isProcess) {
        oldValuation = oldCollateral.getValuation();
        newValuation = newCollateral.getValuation();
        if (oldValuation != null) {
            oldBefMargin = oldValuation.getBeforeMarginValue();
        }
        if (newValuation != null) {
            newBefMargin = newValuation.getBeforeMarginValue();
        }
    }
    
    TimeFreqList timeFreq = TimeFreqList.getInstance();    
%>

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
            <tr class="even">
            <td  class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">* </font></td>
              <td>
              <% if (!isIValNull) { %>
                <integro:empty-if-null value="<%=iVal.getCurrencyCode()%>"/>
              <% } %> &nbsp;</td>
              
              <td width="20%" class="fieldname"><bean:message key="label.security.valuation.cmv"/></td>
              <td width="30%"><bean:write name="<%=formName%>" property="valBefMargin"/>&nbsp;</td>
            </tr>
            <tr class="odd">
               <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"margin")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.margin"/></td>
              <td width="30%"><bean:write name="<%=formName%>" property="margin"/>&nbsp;%</td>
              <td  class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
              <td><bean:write name="<%=formName%>" property="valAftMargin"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.valuation.nextdate"/></td>
              <td><% if (!isIValNull && iVal.getLastEvaluationDate() != null) { %>
              <integro:date object="<%=iVal.getLastEvaluationDate()%>" />
              <% } %> &nbsp;</td>
              <td class="fieldname"><bean:message key="label.security.val.date"/></td>
              <td>
              <% if (!isIValNull) { %>
              <integro:date object="<%=iVal.getValuationDate()%>" />
                <% } %> &nbsp; </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.revaluation.freq"/></td>
              <td><bean:write name="<%=formName%>"  property="revalFreq"/>&nbsp;
              <bean:write name="<%=formName%>" property="revalFreqUnit"/>
              </td>
              	<%
        			boolean isSame = CompareOBUtil.compOB(newValuation,oldValuation, "nonRevaluationFreq");
        			isSame = isSame && CompareOBUtil.compOB(newValuation,oldValuation, "nonRevaluationFreqUnit");
        		%>
        		<td class="<%=isProcess?(isSame?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.non.standard.revaluation.freq"/></td>
        		<td><bean:write name="<%=formName%>" property="nonStdFreq"/>&nbsp;
				<integro:empty-if-null value="<%=timeFreq.getTimeFreqItem(aForm.getNonStdFreqUnit())%>"/>        		
        		</td>
            </tr>
            <tr class="even">
            <td class="fieldname"><bean:message key="label.next.revaluation.date"/></td>
              <td><% if (!isIValNull && iVal.getNextRevaluationDate() != null) { %>
              <integro:date object="<%=iVal.getNextRevaluationDate()%>" />
              <% } %> &nbsp;</td>
             <td class="fieldname">&nbsp;</td>
       			<td>&nbsp;</td>       				
        	</tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
