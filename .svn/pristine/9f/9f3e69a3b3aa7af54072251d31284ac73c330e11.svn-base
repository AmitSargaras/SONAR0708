<%@ page import="com.integrosys.cms.ui.contractfinancing.ContractDetailForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue" %>
<%@ page import="com.integrosys.cms.ui.common.ContractFinancingFacTypeList" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.cms.app.common.util.CommonUtil" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.*" %>
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

function JumpOnSelect(selectObj,facilityTypeIndex) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
        goChildPage('facilitytype_view',facilityTypeIndex);
    if (selectObj.options[selectIndex].value == "edit")
    	goChildPage('facilitytype_update',facilityTypeIndex);
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
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function goChildPage(childPage,facilityTypeIndex){
    document.forms[0].next_page.value = childPage;
    document.forms[0].event.value = "maker_navigate_tab";
    document.forms[0].facilityTypeIndex.value = facilityTypeIndex;
    document.forms[0].submit();
}

function refresh(){

    var contractCurrency = document.forms[0].contractCurrency.value;
    var contractAmount = document.forms[0].contractAmount.value;
    var financePercent = document.forms[0].financePercent.value;
    var financedContractValue = removeCommas(contractAmount) * financePercent / 100;
    financedContractValue = financedContractValue.toFixed(0)

    if (isNaN(financedContractValue)) {
        document.getElementById('financedContractValue').innerHTML = "";
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
	amount = minus + amount;
	return amount;
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
    String trxID = request.getParameter("trxID");
    String initEvent = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.initEvent");
    
    IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");
    OBContractFinancing obContractFinancing = (OBContractFinancing)contractFinancingTrxValue.getStagingContractFinancing();

    String sourceLimit = obContractFinancing.getSourceLimit();
    String productDescription = obContractFinancing.getProductDescription();
    String limitProfileID = String.valueOf(obContractFinancing.getLimitProfileID());

    IFDR[] fdrList = obContractFinancing.getFdrList();
    Amount amountAccumulated = null;
    boolean convertError = false;
    if (fdrList != null) {
        for (int i = 0; i < fdrList.length; i++) {
            if (!fdrList[i].getIsDeleted()) {
                try {
                    amountAccumulated = CommonUtil.addAmount(amountAccumulated, fdrList[i].getFdrAmount());
                } catch (AmountConversionException e) {
                    if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                        convertError = true;
                        amountAccumulated = null;
                        break; //if one convertion found error, the following no need convert.
                    }
                }
            }
        }
    }

    ContractDetailForm aForm = (ContractDetailForm) request.getAttribute("ContractDetailForm");

    pageContext.setAttribute("awarderTypeValues", request.getAttribute("awarderTypeValues"));
    pageContext.setAttribute("awarderTypeLabels", request.getAttribute("awarderTypeLabels"));

    pageContext.setAttribute("contractTypeValues", request.getAttribute("contractTypeValues"));
    pageContext.setAttribute("contractTypeLabels", request.getAttribute("contractTypeLabels"));

    pageContext.setAttribute("currencyLabels", request.getAttribute("currencyLabels"));

    pageContext.setAttribute("sinkingFundValues", request.getAttribute("sinkingFundValues"));
    pageContext.setAttribute("sinkingFundLabels", request.getAttribute("sinkingFundLabels"));
%>
<body onload="refresh()">

<html:form action="ContractFinancing.do">
<input type="hidden" name="event"/>
<input type="hidden" name="from_page" value="contractdetail"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="facilityTypeIndex"/>
<input type="hidden" name="limitProfileID" value="<%=limitProfileID%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td align="right" colspan="2"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></td>
    </tr>      
    <tr>
      <td width="58%"><h3><bean:message key="label.contractfinancing.title"/></h3></td>
      <td width="42%" align="right" valign="bottom">&nbsp; </td>
    </tr>
    <tr>
      <td colspan="2">
        <hr/>
      </td>
    </tr>
</thead>
</table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
    <tr class="even">
        <td width="20%" class="fieldname"><bean:message key="label.contractdetails.limit.id"/></td>
        <td width="30%"><%=sourceLimit%></td>
        <td width="20%" class="fieldname"><bean:message key="label.contractdetails.product.description"/></td>
        <td width="30%">
            <integro:empty-if-null value="<%=productDescription%>" />
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.contractdetails.contract.no"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="contractNumber" maxlength="50"/>
            <html:errors property="contractNumber"/>
        </td>
        <td  class="fieldname"><bean:message key="label.contractdetails.contract.date"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="contractDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onClick="return showCalendar('contractDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="contractDate"/>
        </td>
    </tr>
    <tr class="even">
        <td  class="fieldname"><bean:message key="label.contractdetails.type.of.awarder"/></td>
        <td>
            <html:select property="awarderType" onchange="showTextBox(this,'awarderTypeOthers')">
                <html:option value="">Please Select</html:option>
                <html:options name="awarderTypeValues" labelName="awarderTypeLabels"/>
            </html:select>
            <html:errors property="awarderType"/>
            <%
            if (aForm.getAwarderType()!=null&&aForm.getAwarderType().equals("OTH")) {
                %><html:text property="awarderTypeOthers" style="display:" /><%
            } else{
                %><html:text property="awarderTypeOthers" style="display:none" /><%
            }
            %>
            <html:errors property="awarderTypeOthers"/>
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.name.of.awarder"/></td>
        <td class="even">
            <html:text property="awarderName" size="40"/>
            <html:errors property="awarderName"/>
        </td>
    </tr>
    <tr class="odd">
        <td  class="fieldname"><bean:message key="label.contractdetails.type.of.contract"/></td>
        <td>
            <html:select property="contractType" onchange="showTextBox(this,'contractTypeOthers')">
                <html:option value="">Please Select</html:option>
                <html:options name="contractTypeValues" labelName="contractTypeLabels"/>
            </html:select>
            <html:errors property="contractType"/>
            <%
            if (aForm.getContractType()!=null&&aForm.getContractType().equals("OT")) {
                %><html:text property="contractTypeOthers" style="display:" /><%
            } else{
                %><html:text property="contractTypeOthers" style="display:none" /><%
            }
            %>
            <html:errors property="contractTypeOthers"/>
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.commencement.date.of.contract"/></td>
        <td class="odd">
            <html:text property="startDate" readonly="true" />
            <img id="sel33" onMouseOver="MM_swapImage('sel33','','img/calendarb.gif',1)" onClick="return showCalendar('startDate', 'dd/mm/y');" src="img/calendara.gif" border=0 name=sel33>
            <html:errors property="startDate"/>
        </td>
    </tr>
    <tr class="even">
        <td  class="fieldname"><bean:message key="label.contractdetails.expiry.date.of.contract"/> <font color="#0000FF">*</font></td>
        <td>
            <html:text property="expiryDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onClick="return showCalendar('expiryDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="expiryDate"/>
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.extended.date.of.contract"/> <font color="#0000FF">*</font></td>
        <td class="even">
            <html:text property="extendedDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onClick="return showCalendar('extendedDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="extendedDate"/>
            <html:errors property="compareDate"/>
        </td>
    </tr>
    <tr class="odd">
        <td  class="fieldname"><bean:message key="label.contractdetails.contract.amount"/> <font color="#0000FF">*</font></td>
        <td><html:select property="contractCurrency" onchange="refresh()">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="contractCurrency"/>
            <html:text property="contractAmount" onblur="refresh()" size="20" maxlength="15"/>
            <html:errors property="contractAmount"/>
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.percentage.of.financing"/> <font color="#0000FF">*</font></td>
        <td class="odd">
            <html:text property="financePercent" onblur="refresh()" size="6" maxlength="3"/> %
            <html:errors property="financePercent"/>
        </td>
    </tr>
    <tr class="even">
        <td  class="fieldname"><bean:message key="label.contractdetails.financed.contract.value"/></td>
        <td>&nbsp;<span id="financedContractValue"><%=aForm.getContractCurrency()%> <%=aForm.getFinancedAmount()%></span></td>
        <td class="fieldname"><bean:message key="label.contractdetails.actual.finance.contract"/></td>
        <td class="even">
            <html:select property="actualFinanceCurrency" onchange="refresh()">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="actualFinanceCurrency"/>
            <html:text property="actualFinanceAmount"/>
            <html:errors property="actualFinanceAmount"/>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.contractdetails.projected.profit"/></td>
        <td>
            <html:select property="projectedProfitCurrency" onchange="refresh()">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="projectedProfitCurrency"/>
            <html:text property="projectedProfitAmount"/>
            <html:errors property="projectedProfitAmount"/>
        </td>
        <td class="fieldname">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.contractdetails.collection.account.no"/></td>
        <td>
            <html:text property="collectionAccount"/>
            <html:errors property="collectionAccount"/>
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.expiry.of.facilities"/></td>
        <td>
            <html:text property="facilityExpiryDate" readonly="true" />
            <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onClick="return showCalendar('facilityExpiryDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="facilityExpiryDate"/>
        </td>
    </tr>
    <tr class="odd">
        <td  class="fieldname"><bean:message key="label.contractdetails.project.account.no"/></td>
        <td >
            <html:text property="projectAccount"/>
            <html:errors property="projectAccount"/>
        </td>
        <td  class="fieldname"><bean:message key="label.contractdetails.sinking.fund"/></td>
        <td >
            <html:radio property="sinkingFundInd" value="Y">Yes</html:radio>
            <html:radio property="sinkingFundInd" value="N">No</html:radio>
            <html:errors property="sinkingFundInd"/>

            <html:select property="sinkingFundParty">
                <html:option value="">Please Select</html:option>
                <html:options name="sinkingFundValues" labelName="sinkingFundLabels"/>
            </html:select>
            <html:errors property="sinkingFundParty"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.contractdetails.buildup.fd"/></td>
        <td >
            <html:text property="buildUpFdr" size="6" maxlength="6"/> %
            <html:errors property="buildUpFdr"/>
        </td>
        <td class="fieldname"><bean:message key="label.contractdetails.accumulated.fdr"/></td>
        <td>
        <%
        if(!convertError){
            %><integro:amount param="all" amount="<%=amountAccumulated%>" /><%
        }
        else {
            %><bean:message key="error.contractfinancing.no.conversion"/><%
        }
        %>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.contractdetails.contract.description"/></td>
        <td colspan="3">
       	    <html:textarea property="contractDescription" rows="5" style="width:100% "/>
            <html:errors property="contractDescription"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.contractdetails.remarks"/></td>
        <td colspan="3">
       	    <html:textarea property="remark" rows="5" style="width:100% "/>
            <html:errors property="remark"/>
        </td>
    </tr>
</tbody>
</table>
<br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td width="84%">
            <h3><bean:message key="label.facilitytype.title"/></h3>
        </td>
      <td align="right" width="20%" valign="bottom">
        <input name="Submit" type="button" class="btnNormal" value="Add New" onClick="javascript:goChildPage('facilitytype_add')" style="width:80px"/>&nbsp;
        <input name="Submit" type="button" class="btnNormal" value="Delete" onClick="javascript:goChildPage('facilitytype_delete')" style="width:60px"/></td>
    </tr>
	<tr>
	<td><hr></td>
	<td width="20%"><hr></td>
	</tr>
</table>
<table width="90%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
<thead>
    <tr class="even">
        <td width="27" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td width="138" class="fieldname"><bean:message key="label.facilitytype.title"/></td>
        <td width="92" class="fieldname"><bean:message key="label.facilitytype.date"/></td>
        <td width="139" class="fieldname"><bean:message key="label.facilitytype.moa"/></td>
        <td width="139" class="fieldname"><bean:message key="label.facilitytype.maximum.cap"/></td>
        <td width="184" class="fieldname"><bean:message key="label.facilitytype.remarks"/></td>
        <td width="114" class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
        <td width="75" class="fieldname"><bean:message key="label.contractfinancing.delete"/></td>
    </tr>
</thead>
<tbody>
    <%
    IContractFacilityType[] facilityTypeList = (IContractFacilityType[]) request.getAttribute("facilityTypeList");
    IContractFinancing stagingParametersArray = (IContractFinancing)request.getAttribute("contractFinancingObj");
    if (facilityTypeList == null && stagingParametersArray != null) {
        facilityTypeList = stagingParametersArray.getFacilityTypeList();
    }

    int facilityTypeSummaryLength = 0;
    if (facilityTypeList!=null) {
        facilityTypeSummaryLength = facilityTypeList.length;
    }
    int count = 0;
    for(int i=0;i<facilityTypeSummaryLength;i++){
        if (!facilityTypeList[i].getIsDeleted()) {
        count++;
        %>
        <tr class='<%=(i%2==0?"even":"odd")%>'>
            <td class="index"><%=i+1%></td>
            <td>
                <%=ContractFinancingFacTypeList.getInstance().getContractFinancingFacTypeValue(facilityTypeList[i].getFacilityType())%>
                <%=facilityTypeList[i].getFacilityTypeOthers()%>
            </td>
            <td><integro:date object="<%=facilityTypeList[i].getFacilityDate()%>" /></td>
            <td><%=facilityTypeList[i].getMoa()%>&nbsp;</td>
            <td><integro:amount param="all" amount="<%=facilityTypeList[i].getMaxCap()%>" />&nbsp;</td>
            <td><integro:empty-if-null value="<%=facilityTypeList[i].getRemarks()%>" />&nbsp;</td>
            <td>
                <select onChange="JumpOnSelect(this,'<%=i%>')">
                <option selected="selected">Please select</option>
                <option value="view">View</option>
                <option value="edit">Edit</option>
                </select>
            </td>
            <td><center><input type="checkbox" name="deletedBox" value="<%=String.valueOf(i)%>"/></center>
                <%
                    if(facilityTypeList[i].getHasChild()){
                        %><font color="red"><bean:message key="label.facilitytype.cannot.delete"/></font><%
                        facilityTypeList[i].setHasChild(false);
                    }
                %>
            </td>
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

<%
if (initEvent!=null && initEvent.equals("maker_process")) {
    %>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="contractfinancing_remarks_section_include.jsp" flush="true">
                        <jsp:param name="UID" value='<%=contractFinancingTrxValue.getUserInfo()%>'/>
                        <jsp:param name="remarks" value='<%=contractFinancingTrxValue.getRemarks()%>'/>
                    </jsp:include>
                </td>
            </tr>
        </tbody>
    </table>
    <%
}
%>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
</tr>
<tr>
	<td><a href="javascript:submitPage('submit')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image142" width="75" height="22" border="0" id="Image142" /></a></td>
    <td><a href="javascript:submitPage('save')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <%
    if (trxID!=null) {
        %><td><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td><%
    }
    else if (obContractFinancing.getContractID() != ICMSConstant.LONG_INVALID_VALUE) {
        %><td><a href="ContractFinancing.do?initEvent=view&event=view&contractID=<%=obContractFinancing.getContractID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td><%
    }
    else {
        %><td><a href="ContractFinancing.do?initEvent=list_summary&event=list_summary&limitProfileID=<%=obContractFinancing.getLimitProfileID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td><%
    }
    %>
  </tr>
<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd -->
</html>
