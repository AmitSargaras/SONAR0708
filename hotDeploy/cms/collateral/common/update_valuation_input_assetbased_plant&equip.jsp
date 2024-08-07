<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedForm"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	rowIdx = 0; //reset even-odd row highlighting
    IValuation iValIntoGCMS = null;
//	iValIntoGCMS = iCol.getValuationIntoGCMS();

%>
<script type="text/javascript" src="js/validation.js"></script>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.valuation.into.gcms"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td width="20%" class="fieldname"> <bean:message key="label.valuation.old.valuer"/></td>
              <td width="30%">
                    <html:select property="valuerInGCMS" >
                        <option value="" ><bean:message key="label.please.select"/> </option>
                        <html:options name="valuerName" labelName="valuerNameLabel"/>
                    </html:select>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.valuation.date.of.omv"/>&nbsp;
                   <font color="#0000FF"><span id="span_valDate">&nbsp;</span></font>
              </td>
              <td width="30%">
                  <html:text property="valDate" readonly="true"/>
                        <img src="img/calendara.gif" name="Image1" border="0" id="Image1" alt=""
                             onclick="showCalendar('valDate', 'dd/mm/y')"
                             onmouseover="MM_swapImage('Image1','','img/calendarb.gif',1)"
                             onmouseout="MM_swapImgRestore()"/>&nbsp;
                    <html:errors property="valDate"/>
              </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td width="20%" class="fieldname"><bean:message key="label.valuation.currency"/>&nbsp;
                  <span id="span_valCurrency">&nbsp;</span></font>
               </td>
               <td width="30%">
                    <html:select property="valCurrency">
                        <option value="" ><bean:message key="label.please.select"/> </option>
                        <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>&nbsp;
                    <html:errors property="valCurrency"/>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.valuation.haircut"/></td>
              <td width="30%" >
                 <html:text property="haircut" maxlength="3" size="3"/>%
                 <html:errors property="haircut"/>&nbsp;
              </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.valuation.omv.amount"/>&nbsp;
                  <font color="#0000FF"><span id="span_amountCMV">&nbsp;</span></font></td>
              <td>
                  <html:text property="amountCMV" maxlength="15" onchange="Mandatory_Valuation(this.value)"/>&nbsp;
                  <html:errors property="amountCMV"/>
              </td>
              <td class="fieldname"><bean:message key="label.valuation.fsv.amount"/></td>
              <td><bean:write name="<%=formName%>" property="amountFSV"/>
                  <html:hidden property="amountFSV" /></td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"> <bean:message key="label.valuation.standard.rev.freq"/></td>
              <td>
                    <bean:write name="<%=formName%>"  property="revalFreq"/>&nbsp;
                    <bean:write name="<%=formName%>" property="revalFreqUnit"/>
                    <html:hidden property="revalFreq"/>
                    <html:hidden property="revalFreqUnit"/>
              </td>
              <td class="fieldname"><bean:message key="label.valuation.date.of.fsv"/></td>
              <td>
                  <% if (iValIntoGCMS != null && iValIntoGCMS.getFSVEvaluationDate() != null) { %>
                    <integro:date object="<%=iValIntoGCMS.getFSVEvaluationDate()%>" />
                  <% } %> &nbsp;
              </td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.valuation.type"/></td>
              <td>
                   <html:select property="valuationType">
                        <option value="" selected><bean:message key="label.please.select"/></option>
                        <html:options name="valuationValues" labelName="valuationLabels"/>
                    </html:select>
              </td>
              <td height="25" class="fieldname"><bean:message key="label.valuation.nextdate"/></td>
              <td>
                  <% if (iValIntoGCMS != null && iValIntoGCMS.getRevaluationDate() != null) { %>
                        <integro:date object="<%=iValIntoGCMS.getRevaluationDate()%>" />
                  <% } %> &nbsp;</td>
            </tr>
            
          <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.valuation.OLV"/>&nbsp;<span class="mandatory">*</span></td>
              <td>
                  <html:text property="olv" maxlength="15" />&nbsp;
                  <html:errors property="olv"/>
              </td>
              <td class="fieldname"><bean:message key="label.valuation.remain.useful.life"/></td>
              <td>
                  <html:text property="remainusefullife" maxlength="15" />&nbsp;
                  <html:errors property="remainusefullife"/>
              </td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.valuation.valuation.basis"/>&nbsp;
                  </td>
              <td colspan="3">
                  <html:textarea  property="valuationbasis" rows="3" style="width:100%"  />&nbsp;
                  <html:errors property="valuationbasis"/>
              </td>
              </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.valuation.reserve.price"/></td>
              <td>
                  <html:text property="reservePrice" maxlength="15" onchange="Mandatory_reservePrice(this.value)"/>&nbsp;
                  <html:errors property="reservePrice"/>
               </td>
              <td class="fieldname"><bean:message key="label.valuation.reserve.priceinputdate"/></td>
              <td>
                    <html:text property="reservePriceDate" readonly="true"/>
                        <img src="img/calendara.gif" name="Image1" border="0" id="Image1" alt="calender"
                             onclick="showCalendar('reservePriceDate', 'dd/mm/y')"
                             onmouseover="MM_swapImage('Image1','','img/calendarb.gif',1)"
                             onmouseout="MM_swapImgRestore()"/>&nbsp;
                    <html:errors property="reservePriceDate"/>
              </td>
            </tr>

             <tr class="">
                 <td colspan="4">&nbsp; </td>
             </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
               <td class="fieldname"><bean:message key="label.valuation.net.col.value" /> </td>
               <td colspan = "3">
                   <html:text property="netRealisableSecValue" maxlength="15" readonly="false"/>
                   <html:errors property="netRealisableSecValue"/>
               </td>
            </tr>
          </tbody>
        </table>
       </td>
    </tr>
  </tbody>
</table>

<script type="text/javascript">
 <!--
  function Mandatory_Valuation(obj) {
    if (parseInt(obj) >= 0) {
        document.getElementById('span_valDate').innerText = "* ";
        document.getElementById('span_valCurrency').innerText = "* ";
    }  else {
        document.getElementById('span_valDate').innerText = " ";
        document.getElementById('span_valCurrency').innerText = " ";
    }

    if (document.forms[0].valDate != null && document.forms[0].valDate.value != ""){
        document.getElementById('span_amountCMV').innerText = "* ";
    }else{
        document.getElementById('span_amountCMV').innerText = " ";
    }

    var p = document.forms[0].reservePrice.value;
    Mandatory_reservePrice(p);

}

function Mandatory_reservePrice(obj) {
    if (parseInt(obj) >= 0) {
        document.getElementById('span_valCurrency').innerText = "* ";
    }  else {
        document.getElementById('span_valCurrency').innerText = " ";
    }

}





    var p = document.forms[0].amountCMV.value;
    Mandatory_Valuation(p);

    var p = document.forms[0].reservePrice.value;
    Mandatory_reservePrice(p);


 -->
</script>

