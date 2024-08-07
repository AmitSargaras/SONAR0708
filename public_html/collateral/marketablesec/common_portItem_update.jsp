<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.ui.collateral.ExchangeControlList" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<!--
<tr class="even">
    <td class="fieldname"> <bean:message key="label.security.isin.num"/> <span id="spanISINCODE"><span class="mandatory">*</span></span></td>
    <td><html:text property="isinCode" maxlength="20"/>
        &nbsp;<html:errors property="isinCode"/></td>
    <td class="fieldname"><bean:message key="label.stock.code"/></td>
    <td><html:text property="stockCode" maxlength="20"/>
        &nbsp;<html:errors property="stockCode"/></td>
</tr>
-->
<script language="JavaScript" type="text/JavaScript">
    <!--
    var  isincode = '<%=ICMSConstant.EQUITY_TYPE_UNIT_TRUST%>'  ;
    function set_ISINCODE(obj) {
    //alert(obj);
		if (document.getElementById("spanISINCODE") == null) return;
	
        if (obj == isincode) {
            document.getElementById("spanISINCODE").style.visibility = "visible";
       }  else {
            document.getElementById("spanISINCODE").style.visibility = "hidden";
        }
    }

    var s = "<%=aForm.getEquityType()%>";
    set_ISINCODE(s);
-->
</script>