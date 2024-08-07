<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.IValuation" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    rowIdx = 0; // to reset odd-even row highlighting

    IValuation iValIntoGCMS = iCol.getValuationIntoGCMS();


    boolean isiValIntoGCMSNull = (iValIntoGCMS == null);
    IValuation oldValuationIntoGCMS = null;
    IValuation newValuationIntoGCMS = null;
    boolean nonstdFreqChangedIntoGCMS = false;

    if (isProcess) {
        oldValuationIntoGCMS = oldCollateral.getValuationIntoGCMS();
        newValuationIntoGCMS = newCollateral.getValuationIntoGCMS();

        if (oldValuationIntoGCMS != null && newValuationIntoGCMS != null) {
            nonstdFreqChangedIntoGCMS = !(CompareOBUtil.compOB(newValuationIntoGCMS, oldValuationIntoGCMS, "nonRevaluationFreq") &&
                                          CompareOBUtil.compOB(newValuationIntoGCMS, oldValuationIntoGCMS, "nonRevaluationFreqUnit"));
        }
    }

%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="label.valuation.into.gcms"/></h3></td>
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
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS,oldValuationIntoGCMS,"valuerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.old.valuer"/></td>
            <td width="30%">
                <% if (!isiValIntoGCMSNull) {
                    String valuerName = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUER, iValIntoGCMS.getValuerName());
                %>
                    <integro:empty-if-null value="<%=valuerName%>"/>
                <% } %> &nbsp;</td>
            <td width="20%"class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS,oldValuationIntoGCMS,"valuationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.date.of.omv"/>&nbsp;
                <font color="#0000FF"><span id="spanVal1">&nbsp;</span></font></td>
            <td width="30%"><% if (!isiValIntoGCMSNull) { %>
                <integro:date object="<%=iValIntoGCMS.getValuationDate()%>"/>
                <% } %>&nbsp;
            </td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS,oldValuationIntoGCMS,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.currency"/>&nbsp;
				<font color="#0000FF"><span id="spanVal2">&nbsp;</span></font>
            </td>
            <td width="30%"><% if (!isiValIntoGCMSNull) { %>
                <integro:empty-if-null value="<%=iValIntoGCMS.getCurrencyCode()%>"/>
                <% } %> &nbsp;
            </td>
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(oldCollateral, newCollateral, "margin")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.haircut"/></td>
            <td width="30%"><bean:write name="<%=formName%>" property="haircut"/>&nbsp;%</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS.getCMV(), oldValuationIntoGCMS.getCMV(), "amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.omv.amount"/>&nbsp;
                <font color="#0000FF"><span id="spanVal3">&nbsp;</span></font>
            </td>
            <td><bean:write name="<%=formName%>" property="amountCMV"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS.getFSV(), oldValuationIntoGCMS.getFSV(), "amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.fsv.amount"/></td>
            <td><bean:write name="<%=formName%>" property="amountFSV"/>&nbsp;</td>
        </tr>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="fieldname"><bean:message key="label.valuation.standard.rev.freq"/></td>
            <td><bean:write name="<%=formName%>" property="revalFreq"/>&nbsp;
                <bean:write name="<%=formName%>" property="revalFreqUnit"/>
            </td>
            <td class="fieldname"><bean:message key="label.valuation.date.of.fsv"/></td>
            <td><% if (!isiValIntoGCMSNull && iValIntoGCMS.getFSVEvaluationDate() != null) { %>
                <integro:date object="<%=iValIntoGCMS.getFSVEvaluationDate()%>"/>
                <% } %> &nbsp;
            </td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS,oldValuationIntoGCMS,"valuationType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.type"/></td>
            <td>
                <% if (!isiValIntoGCMSNull && iValIntoGCMS.getValuationType() != null) {
                    String valuationType = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUATION_TYPE, iValIntoGCMS.getValuationType());
                %>
                    <integro:empty-if-null value="<%=valuationType%>"/>
                <% } %> &nbsp;
            </td>
            <td height="25" class="fieldname"><bean:message key="label.valuation.nextdate"/></td>
            <td><% if (!isiValIntoGCMSNull && iValIntoGCMS.getRevaluationDate() != null) { %>
                    <integro:date object="<%=iValIntoGCMS.getRevaluationDate()%>"/>
                <% } %> &nbsp;</td>
        </tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS.getOlv(), oldValuationIntoGCMS.getOlv(), "amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.OLV"/>&nbsp;<font color="#0000FF">*</font>
                
            </td>
            <td><integro:amount param="amount" amount="<%=iCol.getOlv()%>"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS, oldValuationIntoGCMS, "remainusefullife")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.remain.useful.life"/></td>
                <%System.out.println("testting======================"+iValIntoGCMS.getRemainusefullife());%>
            <td><integro:empty-if-null value="<%=iValIntoGCMS.getRemainusefullife()%>"/>&nbsp;</td>
        </tr>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS,oldValuationIntoGCMS,"valuationbasis")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.valuation.valuation.basis"/>&nbsp;</td>
                <td colspan="3"><integro:wrapper value="<%=iValIntoGCMS.getValuationbasis()%>"/>&nbsp;</td>
            </tr>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS.getReservePrice(),oldValuationIntoGCMS.getReservePrice(),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.reserve.price"/></td>
            <td width="30%"><bean:write name="<%=formName%>" property="reservePrice"/>&nbsp;</td>
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoGCMS,oldValuationIntoGCMS,"reservePriceDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
               <bean:message key="label.valuation.reserve.priceinputdate"/></td>
            <td width="30%"><% if (!isiValIntoGCMSNull && iValIntoGCMS.getReservePriceDate() != null) { %>
                                <integro:date object="<%=iValIntoGCMS.getReservePriceDate()%>"/>
                            <% } %> &nbsp;
            </td>
        </tr>

        <tr class="">
            <td colspan="4">&nbsp; </td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB((newCollateral == null) ? null : newCollateral.getNetRealisableAmount(),((oldCollateral==null)?null:oldCollateral.getNetRealisableAmount()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.net.col.value"/>
            </td>
            <td colspan="3">
                <bean:write name="<%=formName%>" property="netRealisableSecValue"/>&nbsp;
            </td>
        </tr>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<script language="Javascript">
    <!--
      var cmv = "<%=(iValIntoGCMS != null?iValIntoGCMS.getCMV():null)%>";
       if(cmv!=null && cmv!="" && cmv != "null"){
          document.getElementById('spanVal1').innerText="*";
          document.getElementById('spanVal2').innerText="*";
       }else{
          document.getElementById('spanVal1').innerText=" ";
          document.getElementById('spanVal2').innerText=" ";
       }

       var date1 = "<%=(iValIntoGCMS != null?iValIntoGCMS.getValuationDate():null)%>";
       if(date1!=null && date1!="" && date1 != "null"){
            document.getElementById('spanVal3').innerText="* ";
       } else{
           document.getElementById('spanVal3').innerText=" ";
       }
      -->
</script>
