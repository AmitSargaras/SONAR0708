<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.app.contractfinancing.bus.IPayment,
                 com.integrosys.cms.app.contractfinancing.bus.OBAdvance"%>
<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ page import="com.integrosys.cms.ui.contractfinancing.advspayment.SG_AdvsPaymentForm" %>
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
<script type="text/javascript" src="js/dateext.js"></script>
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
    //before submit, system generate expiry date
    refresh();
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function JumpOnSelect(selectObj,paymentIndex) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
        document.forms[0].event.value = "view_item";
    if (selectObj.options[selectIndex].value == "edit")
        document.forms[0].event.value = "maker_prepare_edit_item";

    document.forms[0].paymentIndex.value = paymentIndex;
    document.forms[0].submit();
}

function refresh() {
    strDrawdownDate = document.forms[0].drawdownDate.value;
    drawdownDate = convertStrToDate(strDrawdownDate);

    tenorPeriod = document.forms[0].tenorPeriod.value;
    tenorUom = document.forms[0].tenorUom.value;

    if(!isNaN(drawdownDate) && drawdownDate!="" && tenorPeriod!="" && tenorUom!="") {
        expDate = calculateNextDate(drawdownDate, tenorPeriod, tenorUom);
        strExpDate = convertDateToStr(expDate);
        document.getElementById('expiryDate').innerHTML = strExpDate;
        document.forms[0].expiryDate.value = strExpDate;
    }
    else {
        document.getElementById('expiryDate').innerHTML = "";
        document.forms[0].expiryDate.value = "";
    }

    claimAmount = document.forms[0].claimAmount.value;
    if(!isNaN(claimAmount) && claimAmount!="") {
        document.getElementById('advanceAmount').innerHTML =
        document.forms[0].claimCurrency.value+" "+claimAmount * document.forms[0].moa.value/100;
    }
    else{
        document.getElementById('advanceAmount').innerHTML = "";
    }
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
    String isEdit = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.isEdit");
    String advanceIndex = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.advanceIndex");
        
    SG_AdvsPaymentForm aForm = (SG_AdvsPaymentForm) request.getAttribute("CF_SG_AdvsPaymentForm");
    DefaultLogger.debug(this,"aForm="+aForm);

    String facilityType = request.getParameter("facilityType");
    if (facilityType==null) {
        facilityType = aForm.getFacilityType();
    }

    if(event.equals("maker_prepare_create")||event.equals("create")){
        pageContext.setAttribute("facTypeValues", request.getAttribute("facTypeValues"));
        pageContext.setAttribute("facTypeLabels", request.getAttribute("facTypeLabels"));
    }

    OBAdvance obAdvance = (OBAdvance)request.getAttribute("obAdvance");
    if (obAdvance == null) {
        obAdvance = new OBAdvance();
        DefaultLogger.debug(this,"create new OBAdvance");
    }

    if(request.getParameter("moa")!=null){
        obAdvance.setFacilityTypeMOA(Float.parseFloat(request.getParameter("moa")));
    }
%>

<html:form action="CF_SG_AdvsPayment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="advanceIndex" value="<%=advanceIndex%>" />   <%--for edit--%>
<input type="hidden" name="paymentIndex"/>
<input type="hidden" name="facilityType" value="<%=facilityType%>"/>
<input type="hidden" name="moa" value="<%=request.getParameter("moa")%>"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td align="right" colspan="2"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></td>
    </tr>
    <tr>
        <td width="81%" >
            <h3>
            <%
            if(event.equals("maker_prepare_create")||event.equals("create")){
                %><bean:message key="label.advancepayment.add"/><%
            }
            else{
                %><bean:message key="label.advancepayment.edit"/><%
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

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="2" ><bean:message key="label.advancepayment.advance.section"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.type.of.facility"/></td>
        <td>

        <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(facilityType)%>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.advancepayment.reference.no"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="referenceNo" size="20" maxlength="15" />
            <html:errors property="referenceNo"/>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.drawdown.date"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="drawdownDate" readonly="true"/>
            <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onClick="showCalendar('drawdownDate', 'dd/mm/y');refresh()" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="drawdownDate"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.advancepayment.tenor"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="tenorPeriod" onchange="refresh()" size="5" maxlength="3" />
            <html:errors property="tenorPeriod"/>

            <html:select property="tenorUom" onchange="refresh()">
                <html:option value="">Please Select</html:option>
                <html:options name="frequencyValues" labelName="frequencyLabels"/>
            </html:select>
            <html:errors property="tenorUom"/>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.claim.amount"/> <font color="#0000FF">*</font></td>
        <td>
            <html:select property="claimCurrency" onchange="refresh()">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="claimCurrency"/>
            <html:text property="claimAmount" onchange="refresh()" size="20" maxlength="15"/>
            <html:errors property="claimAmount"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.advancepayment.advanced.amount"/> </td>
        <td><span id="advanceAmount">
            <integro:amount param="all" amount="<%=obAdvance.getAdvanceAmount()%>" /></span>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.actual.advanced.amount"/> <font color="#0000FF">*</font></td>
        <td>
            <html:select property="actualAdvanceCurrency">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="actualAdvanceCurrency"/>
            <html:text property="actualAdvanceAmount" size="20" maxlength="15"/>
            <html:errors property="actualAdvanceAmount"/>
        </td>
    </tr>
    <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.expiry.date"/> <font color="#0000FF">*</font></td>
        <td width="30%">
            <span id="expiryDate"><integro:empty-if-null value="<%=aForm.getExpiryDate()%>" /></span>
            <html:hidden property="expiryDate"/>
        </td>
    </tr>
</tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr>
    <td >&nbsp;</td>
</tr>
<tr>
    <td style="text-align:right"><input name="Submit" type="button" class="btnNormal" value="Add" onClick="gotoPage('CF_SG_AdvsPayment.do','maker_prepare_add_item')" style="width:60px"/>
    <input name="Submit" type="button" onClick="gotoPage('CF_SG_AdvsPayment.do','delete_item')" class="btnNormal" value="Delete"  style="width:60px"/></td>
</tr>
<tr>
    <td height="3" ></td>
</tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr class="even" align="center">
        <td colspan="3" class="fieldname"><bean:message key="label.advancepayment.payment.section"/> </td>
    </tr>
    <tr class="even" align="center">
        <td width="3%" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.date.payment.received"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.amount.received"/></td>
    </tr>
</thead>
<tbody>
    <%
    IPayment[] paymentList = null;
    if(obAdvance!=null) {
        paymentList = obAdvance.getPaymentList();
    }
    int count = 0;
    if(paymentList!=null) {
        for(int i=0;i<paymentList.length;i++) {
            if(!paymentList[i].getIsDeleted()){
            count++;
            %>
            <tr class='<%=(count%2==0?"even":"odd")%>'>
                <td class="index"><%=i+1%></td>
                <td style="text-align:center">
                    
                    <integro:date object="<%=paymentList[i].getReceiveDate()%>" />&nbsp;</td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=paymentList[i].getReceiveAmount()%>" /></td>
            </tr>
            <%
            }
        }
    }
    if(count==0) {
        %>
        <tr class="odd">
            <td colspan="3"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%
    }
    %>
</tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr><td >&nbsp;</td></tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr class="even" align="center">
        <td colspan="5" class="fieldname"><bean:message key="label.advancepayment.retention.section"/></td>
    </tr>
    <tr class="even" align="center">
        <td width="3%" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.date.retention.distributed"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.retention.amount"/></td>
        <td class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
        <td class="fieldname"><bean:message key="label.contractfinancing.delete"/></td>
    </tr>
</thead>
<tbody>
    <%
    count = 0;
    if(paymentList!=null) {
        for(int i=0;i<paymentList.length;i++) {
            if(!paymentList[i].getIsDeleted()){
            count++;
            %>
            <tr class='<%=(count%2==0?"even":"odd")%>'>
                <td class="index"><%=i+1%></td>
                <td style="text-align:center"><integro:date object="<%=paymentList[i].getDistributeDate()%>" /></td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=paymentList[i].getDistributeAmount()%>" /></td>
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
                    <td><center><a href="CF_SG_Payment.do?event=view&paymentIndex=<%=i%>">View</a></center></td>
                    <%
                }
                %>
            </tr>
            <%
            }
        }
    }
    if(count==0) {
        %>
        <tr class="odd">
            <td colspan="7"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%
    }    
    %>
</tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr><td >&nbsp;</td></tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="2" ><bean:message key="label.advancepayment.operative.limit"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.od"/></td>
        <td width="30%">
            <%
            try {
                %><integro:amount param="all" amount="<%=obAdvance.getOperativeLimitZeroWhenPartialPayment()%>" /><%
            } catch (AmountConversionException e) {
                if(e.toString().indexOf("AMT_CONV_EX")>-1){
                    %><bean:message key="error.contractfinancing.no.conversion"/><%
                }
            }
            %>&nbsp;
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
    <a href="javascript:submitPage('refresh')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image61','','img/refresh2.gif',1)"><img src="img/refresh1.gif" name="Image61" width="75" height="22" border="0" id="Image61" /></a>
    <%
    String initAdvEvent = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.initAdvEvent");
        
    if(initAdvEvent.equals("maker_prepare_create")||event.equals("create")){
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