<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.contractfinancing.bus.ITNC,
                 com.integrosys.cms.ui.common.ContractFinancingTermsList,
                 com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList"%>
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

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function JumpOnSelect(selectObj,tncIndex) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
        window.location.href =  "CF_TNC.do?event=view&tncIndex="+tncIndex;
    if (selectObj.options[selectIndex].value == "edit")
        window.location.href =  "CF_TNC.do?event=maker_prepare_update&tncIndex="+tncIndex;
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
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>

<%
    IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");

    if(contractFinancingTrxValue != null) {


        try {
            ITNC[] tncActualList = null;
            if (contractFinancingTrxValue.getContractFinancing()!=null) {  //actual will be null if this is new record
                tncActualList = contractFinancingTrxValue.getContractFinancing().getTncList();
            }
            ITNC[] tncStagingList = contractFinancingTrxValue.getStagingContractFinancing().getTncList();

            if(tncActualList!=null || tncStagingList!=null){
                List compResult = CompareOBUtil.compOBArray(tncStagingList,tncActualList);
                ArrayList list = new ArrayList(compResult);
                pageContext.setAttribute("tncList",list);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    int i=0;
%>

<html:form action="CF_TNC.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td width="84%"><h3><bean:message key="label.tnc.title"/></h3></td>
        <td align="right" width="20%" valign="bottom"></td>
    </tr>
    <tr>
        <td><hr></td>
        <td width="20%"><hr></td>
    </tr>
</table>
<table class="tblInfo" width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr class="even">
        <td class="fieldname" width="3%"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td class="fieldname" width="18%"><bean:message key="label.tnc.terms"/></td>
        <td class="fieldname" width="9%"><bean:message key="label.tnc.date"/></td>
        <td width="23%" class="fieldname"><bean:message key="label.tnc.conditions"/></td>
        <td class="fieldname" width="11%"><bean:message key="label.contractfinancing.action"/></td>
    </tr>
</thead>
<tbody>
    <logic:present name="tncList">
        <logic:iterate id="compResult" name="tncList" type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
                ITNC stagingParameter = (ITNC) compResult.getObj();
                i++;
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
                <td class='<bean:write name="compResult" property="key" />'><%=i%>
                </td>
                <td>
                    <%=ContractFinancingTermsList.getInstance().getContractFinancingTermsValue(stagingParameter.getTerms())%>
                    <%=stagingParameter.getTermsOthers()%>&nbsp;
                </td>
                <td><integro:date object="<%=stagingParameter.getTncDate()%>"/></td>
                <td><%=stagingParameter.getConditions()%>
                </td>
                <td>
                    <center><a href="CF_TNC.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>">View</a>
                    </center>
                </td>
            </tr>
        </logic:iterate>
    </logic:present>
    <%
    if(i==0){
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
</body>
</html:form>
<!-- InstanceEnd -->
</html>