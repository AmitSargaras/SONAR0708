<%@ page import="com.integrosys.cms.app.contractfinancing.bus.IFDR"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

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

function JumpOnSelect(selectObj,fdrIndex,amountAccumulated) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
        document.forms[0].event.value = "view";
    if (selectObj.options[selectIndex].value == "edit")
        document.forms[0].event.value = "maker_prepare_update";
    if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete";

    document.forms[0].fdrIndex.value = fdrIndex;
    document.forms[0].amountAccumulated.value = amountAccumulated;
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
    String isEdit = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.isEdit");

    IFDR[] fdrList = (IFDR[])request.getAttribute("fdrList");

    int fdrSummaryLength = 0;
    if (fdrList!=null) {
        fdrSummaryLength = fdrList.length;
    }
%>
<body>

<html:form action="CF_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="fdrIndex"/>
<input type="hidden" name="amountAccumulated"/>

<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td width="58%" ><h3><bean:message key="label.fdr.title"/></h3></td>
        <td width="42%" align="right" valign="bottom" >
            <%
            if(isEdit!=null && isEdit.equals("true")) {
                %><input name="Submit" type="button" class="btnNormal" value="Add New " onClick="submitPage('maker_prepare_create')" style="width:110px"/><%
            }
            %>
         </td>
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
    int count = 0;
    for (int i=0;i<fdrSummaryLength;i++){
        if (!fdrList[i].getIsDeleted()) {
            //if one convertion found error, the following no need convert.
            if(!convertError){
                try {
                    amountAccumulated = CommonUtil.addAmount(amountAccumulated, fdrList[i].getFdrAmount());
                } catch (AmountConversionException e) {
                    if(e.toString().indexOf("AMT_CONV_EX")>-1){
                        convertError = true;
                        amountAccumulated = null;
                    }
                }
            }
            count++;
            %>
            <tr class='<%=(count%2==0?"even":"odd")%>'>
                <td width="4%" class="index"><%=i+1%></td>
                <td style="text-align:left"><integro:date object="<%=fdrList[i].getFdrDate()%>" /></td>
                <td width="20%" style="text-align:left"><%=fdrList[i].getAccountNo()%></td>
                <td width="25%" style="text-align:left">
                    <integro:amount param="all" amount="<%=fdrList[i].getFdrAmount()%>" />
                </td>
                <td width="26%"  style="text-align:left">
                <%
                    if(!convertError){
                        %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
                    }
                    else {
                        %><bean:message key="error.contractfinancing.no.conversion"/><%
                    }
                %>
                </td>
                <td width="16%" style="text-align:center"><%=fdrList[i].getReferenceNo()%></td>
                <%
                if(isEdit!=null && isEdit.equals("true")) {
                    %>
                    <td>
                    <center>
                    <%
                    if(!convertError){
                        %><select onChange="JumpOnSelect(this,'<%=i%>','<integro:amount param="all" amount="<%=amountAccumulated%>" />')"><%
                    }
                    else{
                        %><select onChange="JumpOnSelect(this,'<%=i%>','<bean:message key="error.contractfinancing.no.conversion"/>')"><%                        
                    }
                    %>
                        <option selected="selected">Please select</option>
                        <option value="view">View</option>
                        <option value="edit">Edit</option>
                        <option value="delete">Delete</option>
                    </select>
                    </center>
                    </td>
                    <%
                }
                else {
                    if(!convertError){
                        %><td><center><a href="CF_FDR.do?event=view&fdrIndex=<%=i%>&amountAccumulated=<integro:amount param="all" amount="<%=amountAccumulated%>" />">View</a></center></td><%
                    }
                    else{
                        %><td><center><a href="CF_FDR.do?event=view&fdrIndex=<%=i%>&amountAccumulated=<bean:message key="error.contractfinancing.no.conversion"/>">View</a></center></td><%
                    }
                }
                %>
            </tr>
        <%
        }
    }
    if (count>0){
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