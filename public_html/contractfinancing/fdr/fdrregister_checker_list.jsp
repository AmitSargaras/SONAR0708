<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.contractfinancing.bus.IFDR,
                 com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: contract financing - maker update page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.2 $
* @since $Date: 2007/May/07 $
* Tag: $Name:  $
*/
%>

<%
    IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue) session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");

    if (contractFinancingTrxValue != null) {

        try {
            IFDR[] fdrActualList = null;
            if (contractFinancingTrxValue.getContractFinancing() != null) {  //actual will be null if this is new record
                fdrActualList = contractFinancingTrxValue.getContractFinancing().getFdrList();
            }
            IFDR[] fdrStagingList = contractFinancingTrxValue.getStagingContractFinancing().getFdrList();

            if (fdrActualList != null || fdrStagingList != null) {
                List compResult = CompareOBUtil.compOBArray(fdrStagingList, fdrActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("fdrList", list);
            }

        } catch (Exception e) {
            DefaultLogger.debug(this, "<<<<<<>>>>>>>>> Error");
            e.printStackTrace();
        }
    }
    int i = 0;
%>
<body>

<html:form action="CF_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td width="58%" ><h3><bean:message key="label.fdr.title"/></h3></td>
        <td width="42%" align="right" valign="bottom" ></td>
    </tr>
    <tr>
    <td><hr></td>
    <td width="20%"><hr></td>
    </tr>
</table>
<table width="90%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr class="even" align="center">
        <td width="4%" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td width="17%" class="fieldname"><bean:message key="label.fdr.date"/></td>
        <td width="20%" class="fieldname"><bean:message key="label.fdr.account.no"/></td>
        <td width="25%" class="fieldname"><bean:message key="label.fdr.amount"/></td>
        <td width="26%" class="fieldname"><bean:message key="label.fdr.total.accumulated"/><br/></td>
        <td width="16%" class="fieldname"><bean:message key="label.fdr.ref.number"/></td>
        <td width="12%" class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
    </tr>
</thead>
<tbody>
    <%
    Amount amountAccumulated = null;
    boolean convertError = false;
    %>
    <logic:present name="fdrList">
        <logic:iterate id="compResult" name="fdrList" type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
                IFDR stagingParameter = (IFDR) compResult.getObj();
                i++;

                //if one convertion found error, the following no need convert.
                if(!convertError){
                    try {
                        amountAccumulated = CommonUtil.addAmount(amountAccumulated, stagingParameter.getFdrAmount());
                    } catch (AmountConversionException e) {
                        if(e.toString().indexOf("AMT_CONV_EX")>-1){
                            convertError = true;
                            amountAccumulated = null;
                        }
                    }
                }
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
                <td class='<bean:write name="compResult" property="key" />'><%=i%>
                </td>
                <td style="text-align:left"><integro:date object="<%=stagingParameter.getFdrDate()%>"/></td>
                <td width="20%" style="text-align:left"><%=stagingParameter.getAccountNo()%>
                </td>
                <td width="25%" style="text-align:left">
                    <integro:amount param="all" amount="<%=stagingParameter.getFdrAmount()%>"/>
                </td>
                <td width="26%" style="text-align:left">
                <%
                    if(!convertError){
                        %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
                    }
                    else {
                        %><bean:message key="error.contractfinancing.no.conversion"/><%
                    }
                %>
                </td>
                <td width="16%" style="text-align:center"><%=stagingParameter.getReferenceNo()%>
                </td>
                <%
                if(!convertError){
                    %><td><center><a href="CF_FDR.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountAccumulated=<integro:amount param="all" amount="<%=amountAccumulated%>" />">View</a></center></td><%
                }
                else{
                    %><td><center><a href="CF_FDR.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountAccumulated=<bean:message key="error.contractfinancing.no.conversion"/>">View</a></center></td><%
                }
                %>
            </tr>
        </logic:iterate>
    </logic:present>
    <%
    if (i>0){
    %>
    <tr class="even">
        <td width="4%" class="total">&nbsp;</td>
        <td class="total" style="text-align:right">&nbsp;</td>
        <td width="20%" class="total" style="text-align:left"><span class="total" style="text-align:right"><bean:message key="label.contractfinancing.total"/></span></td>
        <td width="25%" class="total" style="text-align:left">
        <%
            if(!convertError){
                %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
            }
            else {
                %><bean:message key="error.contractfinancing.no.conversion"/><%
            }
        %>
        </td>
        <td width="26%" style="text-align:left" class="total">&nbsp;</td>
        <td width="16%" class="total">&nbsp;</td>
        <td width="12%" class="total" style="text-align:center">&nbsp;</td>
    </tr>
    <%
    }
    else {
        %>
        <tr class="odd">
            <td colspan="10"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%
    }
    %>
    </tbody>
</table>
<!-- InstanceEndEditable -->

</html:form>
</body>
<!-- InstanceEnd -->
</html>