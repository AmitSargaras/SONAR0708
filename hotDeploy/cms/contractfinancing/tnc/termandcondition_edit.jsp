<%@ page import="com.integrosys.cms.ui.common.ContractFinancingTermsList,
                 com.integrosys.cms.ui.contractfinancing.tnc.TNCForm,
                 java.util.List"%>
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
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
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

function showTextBox(selectObj,othersFieldName) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].text == "Others") {
        eval("document.forms[0]."+othersFieldName+".style").display="";
    }
    else {
        eval("document.forms[0]."+othersFieldName).value="";
        eval("document.forms[0]."+othersFieldName+".style").display="none";
    }
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
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>

<%
    String event = request.getParameter("event");
    
    TNCForm aForm = (TNCForm) request.getAttribute("CF_TNCForm");

    if(event.equals("maker_prepare_create")||event.equals("create")){
        List values = (List)request.getAttribute("termsValues");
        List labels = (List)request.getAttribute("termsLabels");
        pageContext.setAttribute("values", values);
        pageContext.setAttribute("labels", labels);
    }
%>

<html:form action="CF_TNC.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="tncIndex" value="<%=request.getParameter("tncIndex")%>" />   <%--for edit--%>
<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td align="right" colspan="2"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></td>
    </tr>
    <tr>
        <td>
            <h3>
            <%
            if(event.equals("maker_prepare_create")||event.equals("create")){
                %><bean:message key="label.tnc.add"/><%
            }
            else{
                %><bean:message key="label.tnc.edit"/><%
            }
            %>
            </h3>
        </td>
    </tr>
    <tr>
        <td><hr></td>
    </tr>
</table>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
    <tr class="even">
        <td width="25%" class="fieldname"><bean:message key="label.tnc.terms"/> <font color="#0000FF">*</font> </td>
        <td width="75%">
        <%
        if(event.equals("maker_prepare_create")||event.equals("create")){
            %><html:select property="terms" onchange="javascript:submitPage('maker_prepare_create')">
                    <html:option value="">Please Select</html:option>
                    <html:options name="values" labelName="labels"/>
                </html:select>
                <html:errors property="terms"/>
            <input type="text" name="termsOthers" style="display:<%=(aForm.getTerms()!=null&&aForm.getTerms().equals("OTH")?"":"none")%>" value="<%=aForm.getTermsOthers()%>" />
            <html:errors property="termsOthers"/>
            <%
        }
        else{
            %><%=ContractFinancingTermsList.getInstance().getContractFinancingTermsValue(aForm.getTerms())%>
            <integro:empty-if-null value="<%=aForm.getTermsOthers()%>" />&nbsp;
            <%
        }
        %>
        </td>
    </tr>
    <tr class="odd">
        <td width="25%" class="fieldname"><bean:message key="label.tnc.date"/> <font color="#0000FF">*</font></td>
        <td width="75%">
            <html:text property="tncDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image7" border="0" id="Image2" onClick="return showCalendar('tncDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image7','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="tncDate" />
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.tnc.conditions"/> <font color="#0000FF">*</font></td>
        <td>
            <%
            String strConditions = "string.contract.financing.terms.for."+aForm.getTerms();
            if(event.equals("maker_prepare_create")){
                try {
                    %><input type="text" name="conditions" value='<bean:message key="<%=strConditions%>"/>' size="100"/><%
                }
                catch(Exception e){
                    //No need desciption for this terms.
                    %>' size="100"/><%
                }
            }
            else {
                %><html:text property="conditions" size="100"/><%        
            }
            %>
            <html:errors property="conditions" />
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname" width="25%"><bean:message key="label.tnc.remarks"/></td>
        <td width="75%">
            <html:textarea property="remarks" rows="5" style="width:100% "/>
            <html:errors property="remarks" />
        </td>
    </tr>
</tbody>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
</tr>
<tr>
    <td>
    <%
    if(event.equals("maker_prepare_create")||event.equals("create")){
        %><a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:submitPage('list_summary')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    else{
        %><a href="javascript:submitPage('update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:submitPage('list_summary')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    %>
    </td>
</tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>