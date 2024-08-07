<%@ page import="com.integrosys.cms.app.contractfinancing.bus.ITNC,
                 com.integrosys.cms.ui.common.ContractFinancingTermsList"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

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
    String isEdit = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.isEdit");

    ITNC[] tncList = (ITNC[])request.getAttribute("tncList");

    int tncSummaryLength = 0;
    if (tncList!=null) {
        tncSummaryLength = tncList.length;
    }

%>

<html:form action="CF_TNC.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td width="84%"><h3><bean:message key="label.tnc.title"/></h3></td>
        <td align="right" width="20%" valign="bottom">
            <%
            if(isEdit!=null && isEdit.equals("true")) {
                %>
                <input name="Submit" type="button" class="btnNormal" value="Add New" onClick="submitPage('maker_prepare_create')" style="width:80px"/>&nbsp;
                <input name="Submit" type="button" class="btnNormal" value="Delete" onClick="submitPage('delete')" style="width:60px"/>
                <%
            }
            %>
        </td>
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
        <%
        if(isEdit!=null && isEdit.equals("true")) {
            %><td class="fieldname" width="8%"><bean:message key="label.contractfinancing.delete"/></td><%
        }
        %>
    </tr>
</thead>
<tbody>
    <%
    int count = 0;
    for (int i=0;i<tncSummaryLength;i++){
        if (!tncList[i].getIsDeleted()) {
        count++;
        %>
        <tr class='<%=(count%2==0?"even":"odd")%>'>
            <td class="index"><%=i+1%></td>
            <td>
                <%=ContractFinancingTermsList.getInstance().getContractFinancingTermsValue(tncList[i].getTerms())%>
                <%=tncList[i].getTermsOthers()%>&nbsp;
            </td>
            <td><integro:date object="<%=tncList[i].getTncDate()%>" /></td>
            <td><%=tncList[i].getConditions()%></td>
            <%
            if(isEdit!=null && isEdit.equals("true")) {
                %>
                <td>
                <center>
                <select onChange="JumpOnSelect(this,'<%=i%>')">
                    <option selected="selected">Please select</option>
                    <option value="view">View</option>
                    <option value="edit">Edit</option>
                </select>
                </center>
                </td>
                <td><center>
                <input type="checkbox" name="deletedBox" value="<%=String.valueOf(i)%>"/>
                </center></td>
                <%
            }
            else {
                %>
                <td><center><a href="CF_TNC.do?event=view&tncIndex=<%=i%>">View</a></center></td>
                <%
            }
            %>
        </tr>
        <%
        }
    }

    if(count==0){
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