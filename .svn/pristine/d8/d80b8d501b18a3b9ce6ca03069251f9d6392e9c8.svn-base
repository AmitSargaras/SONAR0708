<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IPropertyType,
                 com.integrosys.cms.app.bridgingloan.bus.IProjectSchedule,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.ui.bridgingloan.*,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.ArrayList"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Update Project Information
* Description: This screen allows the adding or editing of project details.
* It can be reached by clicking on the “Project Info” tab on the top of the screen.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        String trxID = request.getParameter("trxID");
        DefaultLogger.debug(this,"trxID="+trxID);
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);
        String initEvent = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.initEvent");
        DefaultLogger.debug(this,"initEvent="+initEvent);

        IBridgingLoanTrxValue bridgingLoanTrxValue = (IBridgingLoanTrxValue) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanTrxValue");
        IBridgingLoan objBridgingLoan = (IBridgingLoan) bridgingLoanTrxValue.getStagingBridgingLoan();

        String limitProfileID = String.valueOf(objBridgingLoan.getLimitProfileID());
        String sourceLimit = objBridgingLoan.getSourceLimit();
        String productDescription = objBridgingLoan.getProductDescription();

        if (productDescription == null)
            productDescription = "Bridging Loan";

        BridgingLoanForm objBridgingLoanForm = (BridgingLoanForm) request.getAttribute("BridgingLoanForm");
        if (objBridgingLoanForm == null)
            objBridgingLoanForm = new BridgingLoanForm();

        String financedAmount = objBridgingLoanForm.getFinancedAmount();
        String contractCurrency = objBridgingLoanForm.getContractCurrency();
        if (financedAmount == null || financedAmount.equals("")) {
            financedAmount = "";
            contractCurrency = "";
        }
%>

<html>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<style type="text/css">
<!--
.style1 {color: #0000FF}
//-->
</style>
<script src="js/calendar.js"></script>
<script src="js/calDriver.js"></script>
<script>
function JumpOnSelectactive(childPage, selectObj, index) {
    var selectIndex = selectObj.selectedIndex;

    if (childPage == 'propertytype')
        document.forms[0].propertyTypeIndex.value = index;
    else if (childPage == 'projectschedule')
        document.forms[0].projectScheduleIndex.value = index;

    if (selectObj.options[selectIndex].value == "view")
        childPage = childPage + "_view";
    else if (selectObj.options[selectIndex].value == "update")
        childPage = childPage + "_update";
    else if (selectObj.options[selectIndex].value == "delete")
        childPage = childPage + "_delete";

    goChildPage(childPage);
}

function submitPage(event) {
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function goChildPage(childPage) {
    document.forms[0].next_page.value = childPage;
    document.forms[0].event.value = "maker_navigate_tab";
    document.forms[0].submit();
}

function formOnLoad() {
    var contractCurrency = document.forms[0].contractCurrency.value;
    var contractAmount = document.forms[0].contractAmount.value;
    var financePercent = document.forms[0].financePercent.value;
    var financedContractValue = removeCommas(contractAmount) * financePercent / 100;

    if (isNaN(financedContractValue)) {
        document.getElementById('financedContractValue').innerHTML = "-";
    }
    else {
        document.getElementById('financedContractValue').innerHTML = contractCurrency +" "+ CommaFormatted(financedContractValue);
    }
}

function removeCommas(strValue) {
  return strValue.replace(/,/g,'');
}

function CommaFormatted(amount) {
	var delimiter = ","; // replace comma if desired
<%--	var a = amount.split('.',2);--%>
<%--	var d = a[1];--%>
<%--	var i = parseInt(a[0]);--%>
    var a = amount;
    var i = parseInt(a);
	if (isNaN(i)) { return ''; }
	var minus = '';
	if (i < 0) { minus = '-'; }
	i = Math.abs(i);
	var n = new String(i);
	var a = [];
	while(n.length > 3) {
		var nn = n.substr(n.length-3);
		a.unshift(nn);
		n = n.substr(0,n.length-3);
	}
	if (n.length > 0) { a.unshift(n); }
	n = a.join(delimiter);
    amount = n;
<%--	if (d.length < 1) { amount = n; }--%>
<%--	else { amount = n + '.' + d; }--%>
	amount = minus + amount;
	return amount;
}
</script>
</head>

<body onload="formOnLoad(); MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif');">
<html:form action="BridgingLoan.do" >
<input type="hidden" name="event" />
<input type="hidden" name="initEvent"/>
<input type="hidden" name="from_page" value="projectinfo"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="limitProfileID" value="<%=limitProfileID%>"/>
<input type="hidden" name="propertyTypeIndex"/>
<input type="hidden" name="projectScheduleIndex"/>
<%
    //pass this trxID to mapper
    if (trxID != null) {
        %><input type="hidden" name="trxID" value="<%=trxID%>"/><%
    }
%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" ><h3><bean:message key="label.bridgingloan.cont.title"/></h3></td>
        <td width="42%" style="text-align:center" valign="bottom" >&nbsp; </td>
    </tr>
    <tr>
        <td colspan="2">
        <hr/>      </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.limit.id"/></td>
                <td width="30%"><%=sourceLimit%></td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prd.desc"/></td>
                <td width="30%"><integro:empty-if-null value="<%=productDescription%>"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.proj.no"/></td>
                <td><html:text property="projectNumber" /><html:errors property="projectNumber"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.cont.date"/><span class="style1">*</span></td>
                <td><html:text property="contractDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onclick="return showCalendar('contractDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="contractDate"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.ofc.value"/><span class="style1">*</span></td>
                <td><html:select property="contractCurrency" onchange="javascript:formOnLoad()" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="contractCurrency"/>
                    <html:text property="contractAmount" onblur="javascript:formOnLoad()"  /><html:errors property="contractAmount"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.per.finc"/></td>
                <td><html:text property="financePercent" onblur="javascript:formOnLoad();" />&nbsp;%<html:errors property="financePercent"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.finc.cont.value"/></td>
                <td>&nbsp;<span id="financedContractValue"><%=contractCurrency%>&nbsp;<%=financedAmount%></span></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.fsc.date"/></td>
                <td><html:text property="fullSettlementContractDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image21" border="0" id="Image21" onclick="return showCalendar('fullSettlementContractDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image21','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="fullSettlementContractDate"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.col.acc.no"/></td>
                <td><html:text property="collectionAccount" /><html:errors property="collectionAccount"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.hda.acc.no"/></td>
                <td><html:text property="hdaAccount" /><html:errors property="hdaAccount"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.proj.acc"/></td>
                <td><html:text property="projectAccount" /><html:errors property="projectAccount"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.curr.acc"/></td>
                <td><html:text property="currentAccount" /><html:errors property="currentAccount"/></td>
            </tr>

            <tr class="odd">
                <td height="34" class="fieldname"><bean:message key="label.bridgingloan.prop.no.typ"/></td>
                <td><html:text property="noOfTypes" /><html:errors property="noOfTypes"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                <%
                    int noUnit = 0;
                    if (objBridgingLoan != null) {
                        IPropertyType[] obPropertyType = (IPropertyType[]) objBridgingLoan.getPropertyTypeList();
                        if (obPropertyType != null && obPropertyType.length > 0) {
                            for (int index=0; index<obPropertyType.length; index++) {
                                if (obPropertyType[index].getIsDeletedInd() != true) {
                                    noUnit += obPropertyType[index].getNoOfUnits();
                                }
                            }
                        }
                    }
                    String noOfUnit = "";
                    if (noUnit <= 0)
                        noOfUnit = "-"; //Return "-" when noUnit = 0
                    else
                        noOfUnit = Integer.toString(noUnit);
                %>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=noOfUnit%>"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.exp.st.date"/></td>
                <td>
                    <html:text property="expectedStartDate" readonly="true" />
                    <img src="img/calendara.gif" name="Image721" border="0" id="Image2" onclick="return showCalendar('expectedStartDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image721','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="expectedStartDate"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.exp.complt.date"/></td>
                <td>
                    <html:text property="expectedCompletionDate" readonly="true" />
                    <img src="img/calendara.gif" name="Image7211" border="0" id="Image2" onclick="return showCalendar('expectedCompletionDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image7211','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="expectedCompletionDate"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.act.st.date"/><span class="style1">*</span></td>
                <td>
                    <html:text property="actualStartDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image7212" border="0" id="Image2" onclick="return showCalendar('actualStartDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image7212','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="actualStartDate"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.act.complt.date"/><span class="style1">*</span></td>
                <td>
                    <html:text property="actualCompletionDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image7213" border="0" id="Image2" onclick="return showCalendar('actualCompletionDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image7213','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="actualCompletionDate"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.expry.avail.date"/></td>
                <td><html:text property="availabilityExpiryDate" readonly="true" />
                    <img src="img/calendara.gif" name="Image22" border="0" id="Image22" onclick="return showCalendar('availabilityExpiryDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image22','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="availabilityExpiryDate"/></td>
                <td class="fieldname"><bean:message key="label.bridgingloan.date.fs"/></td>
                <td><html:text property="fullSettlementDate" readonly="true" />
                    <img src="img/calendara.gif" name="Image23" border="0" id="Image23" onclick="return showCalendar('fullSettlementDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image23','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="fullSettlementDate"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td colspan="3">
                    <html:textarea property="blRemarks" rows="3" cols="80"/>&nbsp;
                    <html:errors property="blRemarks"/>
                </td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="text-align:right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td><h3>Property Type </h3></td>
        <td style="text-align:right"><input name="Submit" type="button" class="btnNormal" value="Add New" onclick="javascript:goChildPage('propertytype_add')" style="width:170px"/></td>
    </tr>
    <tr>
        <td colspan="2"><hr></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            <tr>
                <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                <td width="*"><bean:message key="label.bridgingloan.prty.typ"/></td>
                <td width="12%"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
            </tr>
            </thead>
            <tbody>

                <%
                    IPropertyType[] objPropertyType = null;
                    if (objBridgingLoan != null)
                        objPropertyType = (IPropertyType[]) objBridgingLoan.getPropertyTypeList();

                    DefaultLogger.debug(this, "objPropertyType: " + objPropertyType);
                    if (objBridgingLoan != null && objPropertyType != null) {
                        for (int index=0; index<objPropertyType.length; index++) {
                            if (objPropertyType[index].getIsDeletedInd() != true) {
                %>
                <tr class='<%=(index%2==0?"even":"odd")%>'>
                    <td style="text-align:center" class="index"><%=(index+1)%></td>
                    <td><integro:empty-if-null value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(objPropertyType[index].getPropertyType())%>"/></td>
                    <td style="text-align:right"><integro:number number="<%=objPropertyType[index].getNoOfUnits()%>" /></td>
                    <td style="text-align:center"><select name="select1" onChange="JumpOnSelectactive('propertytype', this, <%=index%>)">
                            <option selected="selected">Please Select</option>
                            <option value="view">View</option>
                            <option value="update">Edit</option>
                            <option value="delete">Delete</option>
                        </select>
                    </td>
                </tr>
                <% } } } else { %>
                <tr class="even">
                    <td width="100%" colspan="9"><bean:message key="label.common.empty"/></td>
                </tr>
                <% } %>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td><h3> Project Schedule </h3></td>
        <td style="text-align:right" valign="bottom">
        <input type="button" name="button2" id="button" value="Add New Progress Stage" class="btnNormal" onclick="javascript:goChildPage('projectschedule_add')" style="width:170px"/></td>
    </tr>
    <tr>
        <td colspan="2"><hr /></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.prgs.stg"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.prop.st.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.prop.end.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.act.st.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.act.end.date"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
            </thead>
            <tbody>
                <%
                    IProjectSchedule[] objProjectSchedule = null;
                    if (objBridgingLoan != null)
                        objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();

                    DefaultLogger.debug(this, "objProjectSchedule: " + objProjectSchedule);
                    if (objBridgingLoan != null && objProjectSchedule != null) {
                        for (int index=0; index<objProjectSchedule.length; index++) {
                            if (objProjectSchedule[index].getIsDeletedInd() != true) {
                %>
                <tr class='<%=(index%2==0?"even":"odd")%>'>
                    <td style="text-align:center" class="index"><%=(index+1)%></td>
                    <td><integro:empty-if-null value="<%=objProjectSchedule[index].getProgressStage()%>"/></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getStartDate()%>" /></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getEndDate()%>" /></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getActualStartDate()%>" /></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getActualEndDate()%>" /></td>

                    <td style="text-align:center"><select name="select2" onChange="JumpOnSelectactive('projectschedule', this, <%=index%>)">
                            <option selected="selected">Please Select</option>
                            <option value="view">View</option>
                            <option value="update">Edit</option>
                            <option value="delete">Delete</option>
                        </select>
                    </td>
                </tr>
                <% } } } else { %>
                <tr class="even">
                    <td width="100%" colspan="9"><bean:message key="label.common.empty"/></td>
                </tr>
                <% } %>
            </tbody>
            </table>
        </td>
    </tr>
	<tr>
	    <td colspan="2">&nbsp; </td>
	</tr>
</tbody>
</table>

<% if (initEvent != null && initEvent.equals("maker_process")) { %>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <jsp:include page="/bridgingloan/bridgingloan_remarks_section_include.jsp" flush="true">
                <jsp:param name="UID" value='<%=bridgingLoanTrxValue.getUserInfo()%>'/>
                <jsp:param name="remarks" value='<%=bridgingLoanTrxValue.getRemarks()%>'/>
                </jsp:include>
            </td>
        </tr>
    </tbody>
    </table>
<% } %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <table width="246" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td><a href="javascript:submitPage('submit')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image142" width="75" height="22" border="0" id="Image142" /></a></td>
                <td><a href="javascript:submitPage('save')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
                <%
                if (trxID!=null) {
                    %><td><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td><%
                }
                else if (objBridgingLoan.getProjectID() != ICMSConstant.LONG_INVALID_VALUE) {
                    %><td><a href="BridgingLoan.do?initEvent=view&event=view&projectID=<%=objBridgingLoan.getProjectID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td><%
                }
                else {
                    %><td><a href="BridgingLoan.do?initEvent=list_summary&event=list_summary&limitProfileID=<%=objBridgingLoan.getLimitProfileID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td><%
                }
                %>
            </tr>
            </table>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>