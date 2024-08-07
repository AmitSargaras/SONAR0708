<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.OBValuation"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateralSubType"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.AssetBasedForm"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	  rowIdx = 0; //reset even-odd row highlighting
    IValuation iValIntoCMS = null;
//	iValIntoCMS = iCol.getValuationIntoCMS();
%>
<script type="text/javascript" src="js/validation.js"></script>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.valuation.into.cms"/></h3></td>
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
              <td width="20%" class="fieldname"> <bean:message key="label.valuation.valuer"/></td>
              <td width="30%">
                    <html:select property="valuerInGCMS" >
                        <option value="" ><bean:message key="label.please.select"/> </option>
                        <html:options name="valuerName" labelName="valuerNameLabel"/>
                    </html:select>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.valuation.date.omv"/>&nbsp;
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
                  <font color="#0000FF"><span id="span_valCurrency">&nbsp;</span></font>
               </td>
               <td width="30%">
                    <html:select property="valCurrency" onchange="Mandatory_Valuation()">
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
                  <html:text property="amountCMV" maxlength="15" onchange="Mandatory_Valuation()"/>&nbsp;
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
                  <% if (iValIntoCMS != null && iValIntoCMS.getFSVEvaluationDate() != null) { %>
                    <integro:date object="<%=iValIntoCMS.getFSVEvaluationDate()%>" />
                  <% } %> &nbsp;
              </td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">
              		<bean:message key="label.valuation.type"/>&nbsp;</td>
			  <td> &nbsp; </td>
              <td height="25" class="fieldname"><bean:message key="label.valuation.nextdate"/></td>
              <td>
                  <% if (iValIntoCMS != null && iValIntoCMS.getRevaluationDate() != null) { %>
                        <integro:date object="<%=iValIntoCMS.getRevaluationDate()%>" />
                  <% } %> &nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.valuation.reserve.price"/></td>
              <td>
                  <html:text property="reservePrice" maxlength="15" onchange="Mandatory_reservePrice(this.value)"/>&nbsp;
                  <html:errors property="reservePrice"/> 
               </td>
              <td class="fieldname">
<!--              	<bean:message key="label.valuation.reserve.priceinputdate"/>
              	<font color="#0000FF"><span id="span_reservePriceDate">&nbsp;</span></font>--> &nbsp;
              </td>
              <td><html:hidden property="reservePriceDate"/> &nbsp; </td>			  
            </tr>		       
          </tbody>
        </table>
       </td>
    </tr>
  </tbody>
</table>

<script type="text/javascript">
 <!--
  function Mandatory_Valuation() {
  
    var x = document.forms[0].valCurrency.value;
    var y = document.forms[0].amountCMV.value;
    var p = document.forms[0].reservePrice.value;
    
    if (x.length > 0 || y.length > 0 || (document.forms[0].valDate != null && document.forms[0].valDate.value != "")) {
        document.getElementById('span_valDate').innerText = "* ";
        document.getElementById('span_valCurrency').innerText = "* ";
//        document.getElementById('span_valuationType').innerText = "* ";
        document.getElementById('span_amountCMV').innerText = "* ";
    }  else {
        document.getElementById('span_valDate').innerText = " ";
        document.getElementById('span_valCurrency').innerText = " ";
//        document.getElementById('span_valuationType').innerText = " ";
        document.getElementById('span_amountCMV').innerText = " ";
    }
    
    if (y.length > 0 || p.length > 0 || x.length > 0 || (document.forms[0].valDate != null && document.forms[0].valDate.value != "")) {
    	document.getElementById('span_valCurrency').innerText = "* ";
    } else {
    	document.getElementById('span_valCurrency').innerText = " ";
    }
}

function Mandatory_reservePrice(obj) {

	var x = document.forms[0].valCurrency.value;
	var y = document.forms[0].amountCMV.value;

/*    if (obj.length > 0) {
        document.getElementById('span_reservePriceDate').innerText = "* ";
    }  else {
        document.getElementById('span_reservePriceDate').innerText = " ";
    }*/
    
    if (obj.length > 0 || y.length > 0 || (document.forms[0].valDate != null && document.forms[0].valDate.value != "")) {
    	document.getElementById('span_valCurrency').innerText = "* ";
    } else {
    	if (x.length == 0)
    		document.getElementById('span_valCurrency').innerText = " ";
    }

}
    var p = document.forms[0].amountCMV.value;
    Mandatory_Valuation(p);

    var p = document.forms[0].reservePrice.value;
    Mandatory_reservePrice(p);
 -->
</script>

