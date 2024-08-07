<%@ page import="com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.app.collateral.bus.IValuation"%>
				 
<% IValuation iVal = iCol.getValuation();
    boolean isIValNull = (iVal == null);
    IValuation oldValuation = null;
    IValuation newValuation = null;
    Amount oldCMV = null;
    Amount newCMV = null;
    boolean nonstdFreqChanged = false;
    if (isProcess) {
        oldValuation = oldCollateral.getValuation();
        newValuation = newCollateral.getValuation();
        if (oldValuation != null) {
            oldCMV = oldValuation.getCMV();
        }
        if (newValuation != null) {
            newCMV = newValuation.getCMV();
        }
        if (oldValuation != null && newValuation != null)
        {                              
            nonstdFreqChanged = !(CompareOBUtil.compOB(newValuation,oldValuation,"nonRevaluationFreq")&&
                                  CompareOBUtil.compOB(newValuation, oldValuation, "nonRevaluationFreqUnit"));
        }
    }  
    String formName = subtype+"Form";    
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
      <input type="hidden" name="amountCMV1" value="<bean:write name='<%=formName%>' property='amountCMV'/>"/>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="odd">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"valuerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.valuer"/></td>
              <td width="30%" ><% if (!isIValNull) { %>
               <integro:empty-if-null value="<%=iVal.getValuerName()%>"/> <% } %> &nbsp;</td>
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"valuationDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.date.user.input"/>&nbsp;<font color="#0000FF"><span id="spanVal1">&nbsp;</span></font></td>
              <td width="30%" ><% if (!isIValNull) { %>
                <integro:date object="<%=iVal.getValuationDate()%>" />
                <% } %> &nbsp;</td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">*</font><font color="#0000FF"><span id="spanVal2">&nbsp;</span></font></td>
              <td width="30%" ><% if (!isIValNull) { %>
               <integro:empty-if-null value="<%=iVal.getCurrencyCode()%>"/> <% } %> &nbsp;</td>
              <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(oldCollateral, newCollateral, "margin")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.margin"/></td>
              <td width="30%"><bean:write name="<%=formName%>" property="margin"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getNominalValue(),oldCollateral.getNominalValue(),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.nominal.value"/></td>
              <td><bean:write name="<%=formName%>" property="nominalValue"/>&nbsp;</td>
            <%  boolean unchanged = true;
                if (isProcess) {
                        unchanged = CompareOBUtil.compOB(newCMV,oldCMV,"amount");
                }
            %>
              <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.valuation.cmv"/>&nbsp;<font color="#FF0000">*</font><font color="#0000FF"><span id="spanVal3">&nbsp;</span></font></td>
              <td><bean:write name="<%=formName%>" property="amountCMV"/>&nbsp;</td>
            </tr>
            <tr class="even"> 
              <td class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
              <td><bean:write name="<%=formName%>" property="amountFSV"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.security.evaluation.date.fsv"/></td>
              <td><% if (!isIValNull && iVal.getFSVEvaluationDate() != null) { %>
              <integro:date object="<%=iVal.getFSVEvaluationDate()%>" />
              <% } %> &nbsp;</td>

            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.valuation.standard.rev.freq"/></td>
              <td><bean:write name="<%=formName%>"  property="revalFreq"/>&nbsp;
              <bean:write name="<%=formName%>" property="revalFreqUnit"/>
              </td>
              <td height="25" class="fieldname"><bean:message key="label.valuation.revaluation.date"/></td>
              <td><% if (!isIValNull && iVal.getRevaluationDate() != null) { %>
              <integro:date object="<%=iVal.getRevaluationDate()%>" />
              <% } %> &nbsp;</td>
            </tr>

            <tr class="even">
              <td width="20%" class="<%=nonstdFreqChanged?"fieldnamediff":"fieldname"%>"><bean:message key="label.valuation.non.standard.revaluation.freq"/></td>
              <td width="30%">
                <bean:write name="<%=formName%>" property="nonStdFreq" />&nbsp;
                <bean:write name="<%=formName%>" property="nonStdFreqUnitDesc" />
              </td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newValuation,oldValuation,"comments")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.global.comment"/></td>
              <td><% if (!isIValNull) { %>
               <integro:wrapper value="<%=iVal.getComments()%>"/> <% } %>&nbsp;
              </td> 
            </tr>
            
            <%
              String stdQuitRentDisp = "Y".equals(iCol.getStdQuitRent())?"<bean:message key=\"label.common.yes\"/>":"<bean:message key=\"label.common.no\"/>";
              String quitRentReceiptDisp = "Y".equals(iCol.getQuitRentReceipt())?"<bean:message key=\"label.common.yes\"/>":"<bean:message key=\"label.common.no\"/>";
            %>  
            <tr class="odd">
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"stdQuitRent")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.quit.rent"/></td>
              <td><integro:empty-if-null value="<%=stdQuitRentDisp %>" />&nbsp;</td>
              <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"quitRentReceipt")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.quit.rent.receipt"/></td>
              <td><integro:empty-if-null value="<%=quitRentReceiptDisp %>" />&nbsp;</td>
            </tr>  
          </tbody>
        </table></td>
    </tr>
  </tbody>
  <script>

      var cmv = "<%=(iVal != null?iVal.getCMV():null)%>";
       if(cmv!=null && cmv!="" && cmv != "null"){
          document.getElementById('spanVal1').innerText="*";
          document.getElementById('spanVal2').innerText="*";
       }else{
          document.getElementById('spanVal1').innerText=" ";
          document.getElementById('spanVal2').innerText=" ";
       }
       var date1 = "<%=(iVal != null?iVal.getValuationDate():null)%>";
       if(date1!=null && date1!="" && date1 != "null"){
            document.getElementById('spanVal3').innerText="* ";
       }
       else{
           document.getElementById('spanVal3').innerText=" ";
       }
  </script>
</table>