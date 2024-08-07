<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation"%>

<% IValuation iVal = iCol.getValuation(); %>
<script type="text/javascript" src="js/validation.js"></script>
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
              <td width="20%" class="fieldname"><bean:message key="label.valuation.old.valuer"/></td>
                <% String valuer = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.oldValuer");
                    Collection valuerName = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.valuerName");
                    pageContext.setAttribute("valuerName", valuerName);
                %>                
                <td width="30%" >	     
                (<integro:empty-if-null value="<%=valuer%>"/>)<br>
                <html:select property="valuer"  >
	            <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="valuerName" labelName="valuerName"/>
                </html:select>&nbsp;
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.valuation.date.user.input"/>&nbsp;<font color="#0000FF"><span id="span20">&nbsp;</span></font></td>
              <td width="30%" >	     
              <html:text property="valDate"  readonly="true"/>
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('valDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="valDate"/>
              </td>
            </tr>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.valuation.currency"/>&nbsp;<font color="#FF0000">*</font><font color="#0000FF"><span id="span21">&nbsp;</span></font></td>
                <td width="30%" >
                <html:select property="valCurrency"  >
	            <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="valCurrency"/>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.security.margin"/>&nbsp;</td>
              <td width="30%" >
                 <html:text property="margin" size="3" maxlength="3" />%
                 <html:errors property="margin"/>&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.nominal.value"/></td>
              <td >
              <html:text property="nominalValue" maxlength="15" />&nbsp;
              <html:errors property="nominalValue" />
              </td>
              <td class="fieldname"><bean:message key="label.security.valuation.cmv"/>&nbsp;<font color="#FF0000">*</font><font color="#0000FF"><span id="span22">&nbsp;</span></font></td>
              <td >
              <html:text property="amountCMV" maxlength="15"   onchange="mandaVal(this.value)"/>&nbsp;
              <html:errors property="amountCMV"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.valuation.fsv"/></td>
              <td><bean:write name="<%=formName%>" property="amountFSV"/>&nbsp;
              <html:hidden property="amountFSV" />
              </td>
              <td class="fieldname"><bean:message key="label.security.evaluation.date.fsv"/></td>
              <td><% if (iVal != null && iVal.getFSVEvaluationDate() != null) { %>
              <integro:date object="<%=iVal.getFSVEvaluationDate()%>" /><% } %>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.valuation.standard.rev.freq"/></td>
              <td><bean:write name="<%=formName%>"  property="revalFreq"/>&nbsp;
              <bean:write name="<%=formName%>" property="revalFreqUnit"/>
              <html:hidden property="revalFreq"/>
              <html:hidden property="revalFreqUnit"/>
              </td>
              <td height="25" class="fieldname"><bean:message key="label.valuation.revaluation.date"/></td>
              <td><% if (iVal != null && iVal.getRevaluationDate() != null) { %>
              <integro:date object="<%=iVal.getRevaluationDate()%>" /><% } %>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.valuation.non.standard.revaluation.freq"/></td>              
              <td >
                <html:text property="nonStdFreq" />&nbsp;
                <html:select property="nonStdFreqUnit" >
                  <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="frequencyValue" labelName="frequencyLabel"/>
                </html:select>&nbsp;
                <html:errors property="nonStdFreq"/>
                <html:errors property="nonStdFreqUnit"/>
              </td>
              <td class="fieldname"><bean:message key="label.global.comment"/></td>
              <td >
                <html:textarea property="comments" cols="60" rows="5" style="width:100%" onkeyup="limitTextInput(this.form.comments, 256, 'Comments');"  />&nbsp;
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.property.quit.rent"/></td>
              <td>
                <html:radio property="stdQuitRent" value="<%=ICMSConstant.TRUE_VALUE%>" /> <bean:message key="label.common.yes"/> &nbsp;&nbsp;
                <html:radio property="stdQuitRent" value="<%=ICMSConstant.FALSE_VALUE%>" /> <bean:message key="label.common.no"/> &nbsp;&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.security.property.quit.rent.receipt"/></td>
              <td>
                <html:radio property="quitRentReceipt" value="<%=ICMSConstant.TRUE_VALUE%>"  /> <bean:message key="label.common.yes"/> &nbsp;&nbsp;
                <html:radio property="quitRentReceipt" value="<%=ICMSConstant.FALSE_VALUE%>" /> <bean:message key="label.common.no"/> &nbsp;&nbsp;
              </td>
            </tr> 
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>