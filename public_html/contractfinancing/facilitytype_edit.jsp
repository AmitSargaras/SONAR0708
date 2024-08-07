<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.contractfinancing.FacilityTypeForm,
                 java.util.List,
                 com.integrosys.cms.ui.common.ContractFinancingFacTypeList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

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

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
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
    String event = request.getParameter("event");

    FacilityTypeForm aForm = (FacilityTypeForm) request.getAttribute("CF_FacilityTypeForm");

    if(event.equals("maker_prepare_create")||event.equals("create")){
        List values = (List)request.getAttribute("facTypeValues");
        List labels = (List)request.getAttribute("facTypeLabels");
        pageContext.setAttribute("values", values);
        pageContext.setAttribute("labels", labels);
    }

    List currencyLabels = (List)request.getAttribute("currencyLabels");
    pageContext.setAttribute("currencyLabels", currencyLabels);
%>

<html:form action="CF_FacilityType.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="facilityTypeIndex" value="<%=request.getParameter("facilityTypeIndex")%>" />   <%--for edit--%>

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
      <td align="right" colspan="2"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></td>
    </tr>
    <tr>
        <td width="81%" >
            <h3>
            <%
            if(event.equals("maker_prepare_create")||event.equals("create")){
                %><bean:message key="label.facilitytype.add"/><%
            }
            else{
                %><bean:message key="label.facilitytype.edit"/><%
            }
            %>
            </h3>
        </td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
</thead>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
    <tr class="even">
        <td width="25%" class="fieldname"><bean:message key="label.facilitytype.title"/> <font color="#0000FF">*</font></td>
        <td width="75%">
        <%
        if(event.equals("maker_prepare_create")||event.equals("create")){
            %><html:select property="facilityType" onchange="showTextBox(this,'facilityOthers')">
                    <html:option value="">Please Select</html:option>
                    <html:options name="values" labelName="labels"/>
                </html:select>
                <html:errors property="facilityType"/>
            <input type="text" name="facilityOthers" style="display:<%=(aForm.getFacilityType()!=null&&aForm.getFacilityType().equals("OTH")?"":"none")%>" value="<%=aForm.getFacilityOthers()%>" />
            <html:errors property="facilityOthers"/>
            <%
        }
        else{
            %>
            <input type="hidden" name="facilityType" value="<%=aForm.getFacilityType()%>">
            <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(aForm.getFacilityType())%>
            <%=aForm.getFacilityOthers()%>&nbsp;
            <%
        }
        %>
        </td>
    </tr>
    <tr class="odd">
        <td width="25%" class="fieldname"><bean:message key="label.facilitytype.date"/> <font color="#0000FF">*</font></td>
        <td width="75%">
            <html:text property="facilityDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image7" border="0" id="Image2" onClick="return showCalendar('facilityDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image7','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="facilityDate"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.facilitytype.moa"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="moa" size="8"/> %
            <html:errors property="moa"/>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.facilitytype.maximum.cap"/></td>
        <td>
            <html:select property="maxCapCurrency">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="maxCapCurrency"/>

            <html:text property="maxCapAmount" size="20" maxlength="15"/>
            <html:errors property="maxCapAmount"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname" width="25%"><bean:message key="label.facilitytype.remarks"/></td>
        <td width="75%">
            <html:textarea property="remarks" rows="5" style="width:100% "/>
            <html:errors property="remarks"/>
        </td>
    </tr>
</tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td height="14" align="right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td height="14" align="center" valign="bottom">
        <%
        if(event.equals("maker_prepare_create")||event.equals("create")){
            %><a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
            <a href="javascript:gotoPage('ContractFinancing.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a><%
        }
        else{
            %><a href="javascript:submitPage('update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
            <a href="javascript:gotoPage('ContractFinancing.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a><%
        }
        %>
        </td>
    </tr>
</thead>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>