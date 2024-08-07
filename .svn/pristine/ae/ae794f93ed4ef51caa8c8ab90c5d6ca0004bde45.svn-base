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

    IValuation iValIntoCMS = iCol.getValuationIntoCMS();


    boolean isiValIntoCMSNull = (iValIntoCMS == null);
    IValuation oldValuationIntoCMS = null;
    IValuation newValuationIntoCMS = null;
    boolean nonstdFreqChangedIntoCMS = false;

    if (isProcess) {
        oldValuationIntoCMS = (oldCollateral==null) ? null : oldCollateral.getValuationIntoCMS();
        newValuationIntoCMS = newCollateral.getValuationIntoCMS();

        if (oldValuationIntoCMS != null && newValuationIntoCMS != null) {
            nonstdFreqChangedIntoCMS = !(CompareOBUtil.compOB(newValuationIntoCMS, oldValuationIntoCMS, "nonRevaluationFreq") &&
                                          CompareOBUtil.compOB(newValuationIntoCMS, oldValuationIntoCMS, "nonRevaluationFreqUnit"));
        }
    }

%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="label.valuation.into.cms"/></h3></td>
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
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoCMS,oldValuationIntoCMS,"valuerName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.old.valuer"/></td>
            <td width="30%">
                <% if (!isiValIntoCMSNull) {
                    String valuerName = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUER, iValIntoCMS.getValuerName());
                %>
                    <integro:empty-if-null value="<%=valuerName%>"/>
                <% } %> &nbsp;</td>
            <td width="20%"class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoCMS,oldValuationIntoCMS,"valuationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.date.omv"/>&nbsp;
                <font color="#0000FF"><span id="spanVal1">&nbsp;</span></font></td>
            <td width="30%"><% if (!isiValIntoCMSNull) { %>
                <integro:date object="<%=iValIntoCMS.getValuationDate()%>"/>
                <% } %>&nbsp;
            </td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoCMS,oldValuationIntoCMS,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.currency"/>&nbsp;
                <font color="#0000FF"><span id="spanVal2">&nbsp;</span></font>
            </td>
            <td width="30%"><% if (!isiValIntoCMSNull) { %>
                <integro:empty-if-null value="<%=iValIntoCMS.getCurrencyCode()%>"/>
                <% } %> &nbsp;
            </td>
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(oldCollateral, newCollateral, "margin")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.haircut"/></td>
            <td width="30%"><bean:write name="<%=formName%>" property="haircut"/>&nbsp;%</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB((newValuationIntoCMS == null) ? null : newValuationIntoCMS.getCMV(), ((oldValuationIntoCMS==null)?null:oldValuationIntoCMS.getCMV()), "amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.omv.amount"/>&nbsp;
                <font color="#0000FF"><span id="spanVal3">&nbsp;</span></font>
            </td>
            <td><bean:write name="<%=formName%>" property="amountCMV"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB((newValuationIntoCMS == null) ? null : newValuationIntoCMS.getFSV(), ((oldValuationIntoCMS==null)?null:oldValuationIntoCMS.getFSV()), "amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.fsv.amount"/></td>
            <td><bean:write name="<%=formName%>" property="amountFSV"/>&nbsp;</td>
        </tr>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="fieldname"><bean:message key="label.valuation.standard.rev.freq"/></td>
            <td><bean:write name="<%=formName%>" property="revalFreq"/>&nbsp;
                <bean:write name="<%=formName%>" property="revalFreqUnit"/>
            </td>
            <td class="fieldname"><bean:message key="label.valuation.date.of.fsv"/></td>
            <td><% if (!isiValIntoCMSNull && iValIntoCMS.getFSVEvaluationDate() != null) { %>
                <integro:date object="<%=iValIntoCMS.getFSVEvaluationDate()%>"/>
                <% } %> &nbsp;
            </td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoCMS,oldValuationIntoCMS,"valuationType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.type"/></td>
            <td>
                <% if (!isiValIntoCMSNull && iValIntoCMS.getValuationType() != null) {
                    String valuationType = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUATION_TYPE, iValIntoCMS.getValuationType());
                %>
                    <integro:empty-if-null value="<%=valuationType%>"/>
                <% } %> &nbsp;
            </td>
            <td height="25" class="fieldname"><bean:message key="label.valuation.nextdate"/></td>
            <td><% if (!isiValIntoCMSNull && iValIntoCMS.getRevaluationDate() != null) { %>
                    <integro:date object="<%=iValIntoCMS.getRevaluationDate()%>"/>
                <% } %> &nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB((newValuationIntoCMS == null) ? null : newValuationIntoCMS.getReservePrice(),((oldValuationIntoCMS==null)?null:oldValuationIntoCMS.getReservePrice()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.reserve.price"/></td>
            <td width="30%"><bean:write name="<%=formName%>" property="reservePrice"/>&nbsp;</td>
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newValuationIntoCMS,oldValuationIntoCMS,"reservePriceDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
               <bean:message key="label.valuation.reserve.priceinputdate"/></td>
            <td width="30%"><% if (!isiValIntoCMSNull && iValIntoCMS.getReservePriceDate() != null) { %>
                                <integro:date object="<%=iValIntoCMS.getReservePriceDate()%>"/>
                            <% } %> &nbsp;
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
      var cmv = "<%=(iValIntoCMS != null?iValIntoCMS.getCMV():null)%>";
       if(cmv!=null && cmv!="" && cmv != "null"){
          document.getElementById('spanVal1').innerText="*";
          document.getElementById('spanVal2').innerText="*";
       }else{
          document.getElementById('spanVal1').innerText=" ";
          document.getElementById('spanVal2').innerText=" ";
       }

       var date1 = "<%=(iValIntoCMS != null?iValIntoCMS.getValuationDate():null)%>";
       if(date1!=null && date1!="" && date1 != "null"){
            document.getElementById('spanVal3').innerText="* ";
       } else{
           document.getElementById('spanVal3').innerText=" ";
       }
      -->
</script>
