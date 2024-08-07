<%@ page import="com.integrosys.cms.ui.collateral.commodity.loanagency.LoanAgencyForm,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.LoanAgencyAction,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 java.util.HashMap,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 java.util.Collection,
                 java.util.Iterator"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/update_loan_agency.jsp,v 1.26 2006/10/27 08:31:13 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.26 $
* Date: $Date: 2006/10/27 08:31:13 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null) {
        from_event = request.getParameter("from_page");
    }

    LoanAgencyForm aForm = (LoanAgencyForm)request.getAttribute("LoanAgencyForm");

    String index = request.getParameter("indexID");

    boolean is_add = false;
    if (index.equals("-1")) {
        is_add = true;
    }
    String title = "Add New";
    if (!is_add) {
        title = "Edit";
    }

    HashMap trxValueMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.commodityMainTrxValue");
    HashMap limitMap = (HashMap)trxValueMap.get("stageLimit");
    HashMap limitList = (HashMap)trxValueMap.get("limitList");
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgTextfieldList.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--


function makeArray(n) {
this.length = n
return this
}

function addOption(original,selection)
{
//    alert(original);
	var i=0,j=0,or_length=original.length,index=0;
    var newitem=true;

    for (i=0;i<or_length;i++)
    {
        if (original.options[i].selected)
        {

            for (j=0;j<selection.length;j++)
            {
                if (original.options[i].value==selection.options[j].value)
                {
                    newitem=false;
                    break;
                }
            }

            if (newitem)
            {
                var op = new Option(original.options[i].text, original.options[i].value);
                if(selection.length == 1 && selection.options[0].value == "")
                {
                    selection.options[0] = op;
                }
                else
                    selection.options[selection.length] = op;
            }

            original.options[i].selected=false;
        }
    }
}

function delOption(selection, original)
{
    var length=selection.length, i=0, index=0;
    for(i=(length-1);i>=0;i--)
    {
        if (selection.options[i].selected)
        {
            selection.options[i].selected=false;
            original.value = selection.options[i].value;
            selection.options[i]=null;
        }
    }

    if (selection.length == 0)
    {
        selection.length = 1;
        selection.options[0].value = "";
    }
}

function alltrim(theString)
{
    var aString = theString;
    var newString = "";
    var kBlank = " ";
    var leftPos = 0;
    var rightPos = aString.length-1;
    var blankCnt = 0;
    for (var i=0;i<aString.length;i++) {
        if (aString.charAt(i) != kBlank) {
            leftPos = i;
            break;
        } else {
            blankCnt = blankCnt + 1;
        }
    }
    if (blankCnt == aString.length) {
        // whole string is BLANK
        newString = "";
    } else {
        for (var j=aString.length-1;j>=0;j--) {
            if (aString.charAt(j) != kBlank) {
                rightPos = j;
                break;
            }
        }
        newString = theString.substring(leftPos,rightPos+1);
    }
    return newString;
}

function addTextArea(original,selection)
{
    var i=0,j=0,index=0;
    var newitem=true;

    var sTextArea = original.value;
    sTextArea = alltrim(original.value);

    if (sTextArea.length > 0)
    {
        for (j=0;j<selection.length;j++)
        {
            if (sTextArea==selection.options[j].value)
            {
                newitem=false;
                break;
            }
        }

        if (newitem)
        {
            var op = new Option(sTextArea, sTextArea);
            if(selection.length == 1 && selection.options[0].value == "")
            {
                selection.options[0] = op;
            }
            else
                selection.options[selection.length] = op;
        }
    }

    original.value = "";
}


function submitPage(num) {
    List = document.forms[0].limitID;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].selectedLimitID;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].borrowerList;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].guarantorList;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].currency;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].selectedCurrency;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    if (num == 1) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_VIEW_SECURITY_DOC%>";
    }
    if (num == 5) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_ADD_SUBLIMIT%>";
    }
    if (num == 6) {
        var delObj = document.forms[0].deleteSubLimit;
        var valid = false;
        if (!delObj.length) {
            valid = delObj.checked;
        } else {
            for (i = 0; i < delObj.length; i++) {
                if (delObj[i].checked) {
                    valid = true;
                }
            }
        }
        if (!valid) {
            alert('At least one sub-limit must be checked');
            return false;
        }

        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_REMOVE_SUBLIMIT%>";
    }
    if (num == 7) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_ADD_PARTICIPANT%>";
    }
    if (num == 8) {
        var delObj = document.forms[0].deleteParticipant;
        var valid = false;
        if (!delObj.length) {
            valid = delObj.checked;
        } else {
            for (i = 0; i < delObj.length; i++) {
                if (delObj[i].checked) {
                    valid = true;
                }
            }
        }
        if (!valid) {
            alert('At least one participant must be checked');
            return false;
        }

        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_REMOVE_PARTICIPANT%>";
    }
    if (num == 9) {
        if (document.forms[0].instalmentEqualType[0].checked) {
            document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_REFRESH_PAYMENT_SCHEDULE%>";
        } else {
            return false;
        }
    }
    if (num == 10) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_REFRESH_INTEREST_AMT%>";
    }
    if (num == 11) {
        if (document.forms[0].instalmentEqualType[0].checked) {
            document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_VIEW_EQUAL_PAYMENT%>";
        } else {
            return false;
        }
    }
    if (num == 12) {
        if (document.forms[0].instalmentEqualType[1].checked) {
            document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_EDIT_NON_EQUAL_PAYMENT%>";
        } else {
            return false;
        }
    }
    document.forms[0].submit();
}

function updateEqual() {
    document.getElementById('span1').innerText="* ";
    document.getElementById('span2').innerText="* ";
    document.getElementById('span3').innerText="* ";
    document.getElementById('span4').innerText="* ";
    document.getElementById('span5').innerText=" ";
    document.getElementById('span6').innerText=" ";
    document.getElementById('span7').innerText=" ";
    document.getElementById('span8').innerText=" ";
    
    document.forms[0].equalPrinAmtCcy.disabled=false;
    document.forms[0].equalPrinAmtVal.disabled=false;
    document.forms[0].equalNoInstalments.disabled=false;
    document.forms[0].equalPaymentFreq.disabled=false;
    document.forms[0].equalFirstPaymentDateCal.disabled=false;

    document.forms[0].nonEqPrinAmtCcy.value="";
    document.forms[0].nonEqPrinAmtVal.value="";
    document.forms[0].nonEqNoInstalments.value="";
    document.forms[0].nonEqPaymentFreq.value="";
    document.forms[0].nonEqFirstPaymentDate.value="";

    document.forms[0].nonEqPrinAmtCcy.disabled=true;
    document.forms[0].nonEqPrinAmtVal.disabled=true;
    document.forms[0].nonEqNoInstalments.disabled=true;
    document.forms[0].nonEqPaymentFreq.disabled=true;
    document.forms[0].nonEqFirstPaymentDateCal.disabled=true;
}

function updateNonEqual() {
    document.getElementById('span1').innerText=" ";
    document.getElementById('span2').innerText=" ";
    document.getElementById('span3').innerText=" ";
    document.getElementById('span4').innerText=" ";
    document.getElementById('span5').innerText="* ";
    document.getElementById('span6').innerText="* ";
    document.getElementById('span7').innerText="* ";
    document.getElementById('span8').innerText="* ";
    
    document.forms[0].nonEqPrinAmtCcy.disabled=false;
    document.forms[0].nonEqPrinAmtVal.disabled=false;
    document.forms[0].nonEqNoInstalments.disabled=false;
    document.forms[0].nonEqPaymentFreq.disabled=false;
    document.forms[0].nonEqFirstPaymentDateCal.disabled=false;

    document.forms[0].equalPrinAmtCcy.value="";
    document.forms[0].equalPrinAmtVal.value="";
    document.forms[0].equalNoInstalments.value="";
    document.forms[0].equalPaymentFreq.value="";
    document.forms[0].equalFirstPaymentDate.value="";

    document.forms[0].equalPrinAmtCcy.disabled=true;
    document.forms[0].equalPrinAmtVal.disabled=true;
    document.forms[0].equalNoInstalments.disabled=true;
    document.forms[0].equalPaymentFreq.disabled=true;
    document.forms[0].equalFirstPaymentDateCal.disabled=true;
}

function changePrepayment(num) {
    if (num == 0) {
        document.forms[0].prePaymentMinCcy.disabled = false;
        document.forms[0].prePaymentMinAmt.disabled = false;
    } else if (num == 1) {
        document.forms[0].prePaymentMinCcy.disabled = true;
        document.forms[0].prePaymentMinAmt.disabled = true;
        document.forms[0].prePaymentMinCcy.value = '';
        document.forms[0].prePaymentMinAmt.value = '';
    }
}
//-->
</script>

</head>
<body>
<html:form action="LoanAgency.do">
<input type="hidden" name="event" value="<%=LoanAgencyAction.EVENT_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.commodity"/></h3></td>
    </tr>
    <tr>
    <td>
      <h3><bean:message key="label.security.syndicate.facility"/> - <%=title%></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      <tr class="even">
          <td width="20%" class="fieldname"><bean:message key="label.security.id"/>&nbsp;<font color="#0000FF">* </font></td>
          <td colspan="3">
          <%
              if (is_add) {
          %>
            <html:select property="securityID">
	        <option value="" ><bean:message key="label.please.select"/> </option>
	        <html:options name="secID" labelName="secValue"/>
            </html:select>&nbsp;
            <html:errors property="securityID"/>
          <% } else { %>
          <integro:empty-if-null value="<%=aForm.getSecurityID()%>"/>
          <html:hidden property="securityID"/>
          <% } %>
        </td>
      </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.limit.id"/>/<br><bean:message key="label.limit.approved.limit"/>/<br><bean:message key="label.agreement.product.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>  <br>
          <%        String[] limitIDList = aForm.getLimitID();
                    String style = "";
                    if (limitIDList == null || limitIDList.length == 0) {
                        style = "width:100%";
                    }
          %>
            <html:select property="limitID" style="<%=style%>" multiple="true" size="5">
            <%  if (limitIDList != null) {
                for (int i = 0; i < limitIDList.length; i++) {
					ICollateralLimitMap colLimitMap = (ICollateralLimitMap)limitMap.get(limitIDList[i]);
					Amount approvedLimitAmt = null;
					long limitID = 0;
					if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER)) {
						ILimit limit = (ILimit)limitList.get(limitIDList[i]);
						approvedLimitAmt = limit.getApprovedLimitAmount();
						limitID = colLimitMap.getSCILimitID();
					} else if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER)) {
						ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitIDList[i]);
						approvedLimitAmt = colmt.getApprovedLimitAmount();
						limitID = colLimitMap.getSCICoBorrowerLimitID();
					}
            %>
            <option value="<%=limitIDList[i]%>">
                    <%=limitID%>&nbsp;(
                    <% if (approvedLimitAmt != null && approvedLimitAmt.getCurrencyCode() != null) { %>
                    <integro:currency amount="<%=approvedLimitAmt%>"/>
                    <% } %> ) -
                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, colLimitMap.getLimitType())%>"/>
            </option>
            <% } } %>
            </html:select>
          </td>
          <td valign="middle" style="border-left:0;border-right:0;text-align:center">
              <input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(limitID,selectedLimitID, false )" value="Add&gt;&gt;"/>
                <br/> <br/>
              <input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(selectedLimitID,limitID,false )" value="&lt;&lt;Remove"/>
          </td>
          <td width="30%">  <html:errors property="selectedLimitID"/><br>
          <%        String[] selectedLimitIDList = aForm.getSelectedLimitID();
                    style = "";
          %>
            <html:select property="selectedLimitID" style="<%=style%>" multiple="true" size="5">
            <%  if (selectedLimitIDList != null) {
                for (int i = 0; i < selectedLimitIDList.length; i++) {
					ICollateralLimitMap colLimitMap = (ICollateralLimitMap)limitMap.get(selectedLimitIDList[i]);
					Amount approvedLimitAmt = null;
					long limitID = 0;
					if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER)) {
						ILimit limit = (ILimit)limitList.get(selectedLimitIDList[i]);
						approvedLimitAmt = limit.getApprovedLimitAmount();
						limitID = colLimitMap.getSCILimitID();
					} else if (colLimitMap.getCustomerCategory().equals(ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER)) {
						ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(selectedLimitIDList[i]);
						approvedLimitAmt = colmt.getApprovedLimitAmount();
						limitID = colLimitMap.getSCICoBorrowerLimitID();
					}
            %>
            <option value="<%=selectedLimitIDList[i]%>">
                    <%=limitID%>&nbsp;(
                    <% if (approvedLimitAmt != null && approvedLimitAmt.getCurrencyCode() != null) { %>
                    <integro:currency amount="<%=approvedLimitAmt%>"/>
                    <% } %> ) -
                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, colLimitMap.getLimitType())%>"/>
            </option>
            <% } } %>
            </html:select>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.col.agent.name"/></td>
          <td>
          <html:text property="colAgentName" maxlength="150" size="30"/>
          <html:errors property="colAgentName"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.admin.agent.name"/></td>
          <td width="30%">
            <html:text property="adminAgentName" maxlength="150" size="30"/>
            <html:errors property="adminAgentName"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.doc.agent"/></td>
          <td>
            <html:text property="documentAgent" maxlength="150" size="30"/>
            <html:errors property="documentAgent"/>
          </td>
          <td  class="fieldname"><bean:message key="label.security.lc.issue.bank"/></td>
          <td>
            <html:text property="lcIssuingBank" maxlength="150" size="30"/>
            <html:errors property="lcIssuingBank"/>
          </td>
        </tr>
        <tr class="even">
          <td height="64" class="fieldname">
            <p><bean:message key="label.security.borrower.obligor"/></p>
            <p>&nbsp; </p>
          </td>
          <td valign="middle" style="border-left:0;border-right:0" class="even">
            <html:text property="borrower" maxlength="150" size="30"/>
          </td>
          <td  valign="middle" style="border-left:0;border-right:0;text-align:left">
            <input type="button" name="Button2" value="Add&gt;&gt;" style="width:80" onClick="addTextArea(borrower,borrowerList)" class="word"/>
            <br/>
            <br/>
            <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onClick="delOption(borrowerList, borrower)" class="word"/>
          </td>
          <td style="border-left:0"><bean:message key="label.security.borrower.obligor.list"/><html:errors property="borrowerList"/><br />
            <%
                String[] borrowerList = aForm.getBorrowerList();
                style = "";
/*
                if (borrowerList == null) {
                    style = "width:100%";
                }
*/
            %>
              <html:select property="borrowerList" size="5" multiple="true" style="<%=style%>">
          <%

              if (borrowerList != null) {
                  for (int i = 0; i < borrowerList.length; i++) {
          %>
                <option value="<%=borrowerList[i]%>"><%=borrowerList[i]%></option>
          <% } } %>
            </html:select>
          </td>
        </tr>
        <tr class="odd">
          <td height="64" class="fieldname">
            <p><bean:message key="label.security.guarantor"/></p>
            <p>&nbsp; </p>
          </td>
          <td valign="middle" style="border-left:0;border-right:0">
            <html:text property="guarantor" maxlength="150" size="30"/>
          </td>
          <td  valign="middle" style="border-left:0;border-right:0;text-align:left">
            <input type="button" name="Button2" value="Add&gt;&gt;" style="width:80" onClick="addTextArea(guarantor,guarantorList)" class="word"/>
            <br/>
            <br/>
            <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onClick="delOption(guarantorList, guarantor)" class="word"/>
          </td>
          <td style="border-left:0"><bean:message key="label.security.guarantor.list"/> <html:errors property="guarantorList"/><br />
            <%
                String[] guarantorList = aForm.getGuarantorList();
                style = "";
/*
                if (guarantorList == null) {
                    style = "width:100%";
                }
*/
            %>
              <html:select property="guarantorList" size="5" multiple="true" style="<%=style%>">
          <%

              if (guarantorList != null) {
                  for (int i = 0; i < guarantorList.length; i++) {
          %>
                <option value="<%=guarantorList[i]%>"><%=guarantorList[i]%></option>
          <% } } %>
          </html:select>
          </td>
        </tr>
        <tr class="even">
        <td class="fieldname"><bean:message key="label.security.multiple.currancy"/></td>
        <td colspan="3">
              <html:radio property="allowMultipleCurr" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="allowMultipleCurr" value="<%=ICMSConstant.FALSE_VALUE%>" /><bean:message key="label.common.no"/>
              <html:errors property="allowMultipleCurr"/>
        </td>
        </tr>
        <tr class="odd">
        <td class="fieldname"><bean:message key="label.currency "/></td>
        <td>
            <html:select property="currency" style="width:100%" multiple="true" size="5">
            <%
                String[] currArr = aForm.getCurrency();
                if (currArr != null) {
                    for (int i = 0; i < currArr.length; i++) {
            %>
            <option value="<%=currArr[i]%>"><%=currArr[i]%></option>
            <% } }%>
            </html:select>
        </td>
        <td valign="middle" style="border-left:0;border-right:0;text-align:center">
              <input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(currency,selectedCurrency, false )" value="Add&gt;&gt;"/>
                <br/> <br/>
              <input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(selectedCurrency,currency,false )" value="&lt;&lt;Remove"/>
        </td>
        <td><html:errors property="selectedCurrency"/><br>
            <html:select property="selectedCurrency" style="width:100%" multiple="true" size="5">
            <%
                String[] currArr = aForm.getSelectedCurrency();
                if (currArr != null) {
                    for (int i = 0; i < currArr.length; i++) {
            %>
            <option value="<%=currArr[i]%>"><%=currArr[i]%></option>
            <% } }%>
            </html:select>
        </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.global.amount"/></td>
          <td>
            <html:select property="globalAmountCcy">
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
            <html:errors property="globalAmountCcy"/>
            <html:text property="globalAmountAmt" maxlength="27"/>
            <html:errors property="globalAmountAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.facilitytype.title"/></td>
          <td>
                <html:select property="facilityType">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="facilityTypeID" labelName="facilityTypeValue"/>
                 </html:select>&nbsp;
                 <html:errors property="facilityType"/><br/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.facility.commitment.date"/></td>
          <td>
			  <html:text property="facCommitmentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('facCommitmentDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="facCommitmentDate"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.facility.effective.date"/></td>
          <td>
			  <html:text property="facEffectiveDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('facEffectiveDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="facEffectiveDate"/>
              </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.facility.maturity.date"/></td>
          <td>
			  <html:text property="facMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('facMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="facMaturityDate"/>
              </td>
          <td class="fieldname"><bean:message key="label.security.facility.termination.date"/></td>
          <td>
			  <html:text property="facTerminationDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('facTerminationDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="facTerminationDate"/>
              </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.last.date.issue.lc"/></td>
          <td>
			  <html:text property="lastDateIssueLC" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('lastDateIssueLC', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="lastDateIssueLC"/>
              </td>
          <td class="fieldname"><bean:message key="label.security.final.lc.maturity.date"/></td>
          <td>
			  <html:text property="finalLCMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('finalLCMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="finalLCMaturityDate"/>
              </td>
          </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.type.transaction"/> </td>
          <td>
                <html:select property="transactionType">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="transTypeID" labelName="transTypeValue"/>
                 </html:select>&nbsp;
                 <html:errors property="transactionType"/><br/>
          </td>
          <td class="fieldname"><bean:message key="label.security.name.counsel.agent.bank"/></td>
          <td>
            <html:text property="counselNameAgentBank" maxlength="150"/>
            <html:errors property="counselNameAgentBank"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td>
      <h3><bean:message key="label.security.sub.limit.details"/></h3>
    </td>
    <td valign="bottom">
      <table width="80"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
          <td width="80" valign="baseline" align="center">
            <input name="Submit23" type="button" class="btnNormal" value="Add New" onclick="javascript:submitPage(5)" />
          </td>
          <td width="80" valign="baseline" align="center">
            <input name="Submit24" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(6)" />
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="25%"><bean:message key="label.currency "/></td>
          <td width="38%"><bean:message key="label.isda.deal.amount"/></td>
          <td width="25%"><bean:message key="label.facilitytype.title"/></td>
          <td width="9%"><bean:message key="label.remove"/></td>
        </tr>
        </thead>
        <tbody>
        <%
            String[] subLimitID = aForm.getSubLimitID();
            String[] subLimitCcy = aForm.getSubLimitCcy();
            String[] subLimitAmt = aForm.getSubLimitAmt();
            String[] subLimitFacType = aForm.getSubLimitFacType();
            if (subLimitID == null || subLimitID.length == 0) {
        %>
        <tr class="odd"><td colspan="5"><bean:message key="label.security.none.sublimit"/></td></tr>
        <%
            } else {
                for (int i = 0; i < subLimitID.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="3%"><%=i + 1%></td>
          <html:hidden property="subLimitID" value="<%=subLimitID[i]%>"/>
          <td width="25%">
          <%
                    if (subLimitCcy[i] == null) {
                        subLimitCcy[i] = "";
                    }
          %>
            <html:select property="subLimitCcy" value="<%=subLimitCcy[i]%>">
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
            <% String subLimitCcyStr = "subLimitCcy"+String.valueOf(i); %>
            <html:errors property="<%=subLimitCcyStr%>"/>
          </td>
          <td width="38%">
            <html:text property="subLimitAmt" value="<%=subLimitAmt[i]%>" maxlength="27"/>
            <% String subLimitAmtStr = "subLimitAmt"+String.valueOf(i); %>
            <html:errors property="<%=subLimitAmtStr%>"/>
          </td>
          <td width="25%"  align="center">
          <%
                    if (subLimitFacType[i] == null) {
                        subLimitFacType[i] = "";
                    }
          %>
            <html:select property="subLimitFacType" value="<%=subLimitFacType[i]%>">
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="facilityTypeID" labelName="facilityTypeValue"/>
            </html:select>&nbsp;
            <% String subLimitFacTypeStr = "subLimitFacType"+String.valueOf(i); %>
            <html:errors property="<%=subLimitFacTypeStr%>"/>
          </td>
          <td width="9%"  align="center">
            <html:multibox property="deleteSubLimit" value="<%=String.valueOf(i)%>"/>
          </td>
        </tr>
        <% } } %>
        <tr class="total">
          <td class="total" style="text-align:center" width="3%">&nbsp;</td>
          <td width="25%" class="total"><bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;</td>
          <td width="38%" class="total"><bean:write name="LoanAgencyForm" property="totalSubLimit"/>&nbsp;
          <html:hidden property="totalSubLimit"/>
          </td>
          <td width="25%" class="total">&nbsp;</td>
          <td width="9%" class="total">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <tr>
    <td>
      <h3><bean:message key="label.security.participant.detail"/></h3>
    </td>
    <td valign="bottom">
        <html:errors property="particpantErr"/>
    </td>
    <td valign="bottom">
      <table width="160"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
          <td width="80" valign="baseline" align="center">
            <input name="Submit22" type="button" class="btnNormal" value="Add New" onclick="javascript:submitPage(7)" />
          </td>
          <td width="80" valign="baseline" align="center">
            <input name="Submit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(8)" />
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="22" colspan="3">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="21%"><bean:message key="label.security.name.participant"/></td>
          <td width="23%"><bean:message key="label.security.allocate.amt.each.participant"/></td>
          <td width="16%"><bean:message key="label.security.percentage.amt"/></td>
          <td width="29%"><bean:message key="label.security.pricing"/></td>
          <td width="8%"><bean:message key="label.remove"/></td>
        </tr>
        </thead>
        <tbody>
        <%
            String[] participantID = aForm.getParticipantID();
            String[] participant = aForm.getParticipant();
            String[] allocatedAmt = aForm.getAllocatedAmt();
            String[] percentageAmt = aForm.getPercentageAmt();
            String[] pricing = aForm.getPricing();
            if (participantID == null || participantID.length == 0) {
        %>
        <tr class="odd"><td colspan="6"><bean:message key="label.security.none.participant"/></td></tr>
        <%
            } else {
                for (int i = 0; i < participantID.length; i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="3%"><%=i + 1%></td>
          <html:hidden property="participantID" value="<%=participantID[i]%>"/>
          <td width="21%">
          <% if (participant[i] == null) {
              participant[i] = "";
          }
          %>
            <html:text property="participant" maxlength="150" size="30" value="<%=participant[i]%>"/>
            <% String participantErr = "participant"+String.valueOf(i); %>
            <html:errors property="<%=participantErr%>"/>
          </td>
          <td width="23%">
            <bean:write name="LoanAgencyForm" property="globalAmountCcy"/>&nbsp;
            <html:text property="allocatedAmt" value="<%=allocatedAmt[i]%>" maxlength="27"/>
            <% String allocatedAmtErr = "allocatedAmt"+String.valueOf(i); %>
            <html:errors property="<%=allocatedAmtErr%>"/>
          </td>
          <%
                    if (percentageAmt[i] == null) {
                        percentageAmt[i] = "";
                    }
          %>
          <td  width="16%"><integro:empty-if-null value="<%=percentageAmt[i]%>"/>&nbsp;
          <html:hidden property="percentageAmt" value="<%=percentageAmt[i]%>"/>
          </td>
          <td width="29%">
          <%
                    if (pricing[i] == null) {
                        pricing[i] = "";
                    }
          %>
            <html:textarea property="pricing" rows="4" cols="35" style="width:100%" value="<%=pricing[i]%>"/>&nbsp;
            <% String pricingErr = "pricing"+String.valueOf(i); %>
            <html:errors property="<%=pricingErr%>" />
          </td>
          <td width="8%"  align="center">
            <html:multibox property="deleteParticipant" value="<%=String.valueOf(i)%>"/>
          </td>
        </tr>
        <% } } %>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3><bean:message key="label.security.term.loan"/></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
  <%
      boolean isEqual = (aForm.getInstalmentEqualType() != null && aForm.getInstalmentEqualType().equals(ICMSConstant.TRUE_VALUE));
  %>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      <tr class="odd">
      <td class="fieldname" width="20%"><bean:message key="label.security.instalment.type"/></td>
      <td colspan="4">
      <html:radio property="instalmentEqualType" value="<%=ICMSConstant.TRUE_VALUE%>" onclick="updateEqual()"/><bean:message key="label.security.equal.instalment"/>
      &nbsp;&nbsp;
      <html:radio property="instalmentEqualType" value="<%=ICMSConstant.FALSE_VALUE%>" onclick="updateNonEqual()"/><bean:message key="label.security.non.equal.instalment"/>
      &nbsp;
      <html:errors property="instalmentEqualType"/>
      </td>
      </tr>
      </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
        <tr class="odd">
          <td colspan="5"><bean:message key="label.security.equal.instalment"/></td>
        </tr>
        </thead>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.principal.amt"/>
          &nbsp;<font color="#0000FF"><span id="span1">&nbsp;</span></font>
          </td>
          <td colspan="2">
            <html:select property="equalPrinAmtCcy" disabled="<%=!isEqual%>">
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
            <html:errors property="equalPrinAmtCcy"/>
            <html:text property="equalPrinAmtVal" maxlength="27" disabled="<%=!isEqual%>"/>
            <html:errors property="equalPrinAmtVal"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.num.instalment"/>
          &nbsp;<font color="#0000FF"><span id="span2">&nbsp;</span></font>
          </td>
          <td width="21%">
            <html:text property="equalNoInstalments" maxlength="4" size="5" disabled="<%=!isEqual%>"/>
            (max 120)
            <html:errors property="equalNoInstalments"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%"><bean:message key="label.security.amt.instalment"/></td>
          <td colspan="2"><bean:write name="LoanAgencyForm" property="equalAmtPerInstalments" />&nbsp;
          <html:hidden property="equalAmtPerInstalments"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.pymt.freq"/>
          &nbsp;<font color="#0000FF"><span id="span3">&nbsp;</span></font>
          </td>
          <td width="21%">
            <html:select property="equalPaymentFreq" disabled="<%=!isEqual%>">
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="paymentFreqID" labelName="paymentFreqValue"/>
            </html:select>&nbsp;
            <html:errors property="equalPaymentFreq"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.first.pymt.date"/>
          &nbsp;<font color="#0000FF"><span id="span4">&nbsp;</span></font>
          </td>
          <td colspan="2">
			  <html:text property="equalFirstPaymentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="equalFirstPaymentDateCal" border="0" id="equalFirstPaymentDateCal" <%=isEqual?"":"disabled"%> onclick="return showCalendar('equalFirstPaymentDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="equalFirstPaymentDate"/>
          </td>
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="21%">&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">
            <p><bean:message key="label.security.pymt.schedule"/><br>
              <a href="#" onclick="submitPage(9)"><bean:message key="label.security.refresh.paymnt.schedule"/></a></p>
            <p><a href="#" onclick="submitPage(11)"><bean:message key="label.security.view.print.paymnt.schedule"/></a></p>
          </td>
          <td width="19%"><b><bean:message key="label.security.pymt.date"/></b><br>
          <%
              String[] paymentDate = aForm.getEqualPaymentDate();
              if (isEqual && paymentDate != null) {
                  for (int i = 0;  i < 4 && i < paymentDate.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=paymentDate[i]%>"/><br/>
          <html:hidden property="equalPaymentDate" value="<%=paymentDate[i]%>"/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.principal.due"/></b><br>
          <%
              String[] principalDue = aForm.getEqualPrincipalAmt();
              if (isEqual && principalDue != null) {
                  for (int i = 0;  i < 4 && i < principalDue.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;
                      <integro:empty-if-null value="<%=principalDue[i]%>"/><br/>
                      <html:hidden property="equalPrincipalAmt" value="<%=principalDue[i]%>"/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.interest.due"/></b><br>
          <%
              String[] interestDue = aForm.getEqualInterestAmt();
              if (isEqual && interestDue != null) {
                  for (int i = 0;  i < 4 && i < interestDue.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;
                      <integro:empty-if-null value="<%=interestDue[i]%>"/><br/>
                      <html:hidden property="equalInterestAmt" value="<%=interestDue[i]%>"/>
          <%  } } %>
          </td>
          <td width="21%"><b><bean:message key="label.security.total.payment.due"/></b><br>
          <%
              String[] totalPayment = aForm.getEqualTotalPayment();
              if (isEqual && totalPayment != null) {
                  for (int i = 0;  i < 4 && i < totalPayment.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<bean:write name="LoanAgencyForm" property="equalPrinAmtCcy"/>&nbsp;
                      <integro:empty-if-null value="<%=totalPayment[i]%>"/><br/>
          <html:hidden property="equalTotalPayment" value="<%=totalPayment[i]%>"/>
          <%  } } %>
          </td>
        </tr>
        <thead>
        <tr class="odd">
          <td class="fieldname" colspan="5"><bean:message key="label.security.non.equal.instalment"/></td>
        </tr>
        </thead>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.principal.amt"/>
          &nbsp;<font color="#0000FF"><span id="span5">&nbsp;</span></font>
          </td>
          <td colspan="2">
            <html:select property="nonEqPrinAmtCcy" disabled="<%=isEqual%>">
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
            <html:errors property="nonEqPrinAmtCcy"/>
            <html:text property="nonEqPrinAmtVal" maxlength="27" disabled="<%=isEqual%>"/>
            <html:errors property="nonEqPrinAmtVal"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.num.instalment"/>
          &nbsp;<font color="#0000FF"><span id="span6">&nbsp;</span></font>
          </td>
          <td width="21%">
            <html:text property="nonEqNoInstalments" maxlength="4" size="5" disabled="<%=isEqual%>"/>
            (max. 120)
            <html:errors property="nonEqNoInstalments"/>
          </td>
        </tr>
        <tr class="even">
          <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.pymt.freq"/>
          &nbsp;<font color="#0000FF"><span id="span7">&nbsp;</span></font>
          </td>
          <td colspan="2">
            <html:select property="nonEqPaymentFreq" disabled="<%=isEqual%>">
                <option value="" ><bean:message key="label.please.select"/></option>
	            <html:options name="paymentFreqID" labelName="paymentFreqValue"/>
            </html:select>&nbsp;
            <html:errors property="nonEqPaymentFreq"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.first.pymt.date"/>
          &nbsp;<font color="#0000FF"><span id="span8">&nbsp;</span></font>
          </td>
          <td width="21%">
			  <html:text property="nonEqFirstPaymentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="nonEqFirstPaymentDateCal" border="0" id="nonEqFirstPaymentDateCal" <%=isEqual?"disabled":""%> onclick="return showCalendar('nonEqFirstPaymentDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="nonEqFirstPaymentDate"/>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">
            <p><bean:message key="label.security.payment.date"/><br>
            </p>
            <p><a href="#" onclick="submitPage(12)"><bean:message key="label.security.view.edit.paymnt.schedule"/></a></p>
            </td>
          <td width="19%"><b><bean:message key="label.security.pymt.date"/></b><br>
          <%
              paymentDate = aForm.getNonEqPaymentDate();
              if (!isEqual && paymentDate != null) {
                  for (int i = 0;  i < 4 && i < paymentDate.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<integro:empty-if-null value="<%=paymentDate[i]%>"/><br/>
          <html:hidden property="nonEqPaymentDate" value="<%=paymentDate[i]%>"/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.principal.due"/></b><br>
          <%
              principalDue = aForm.getNonEqPrincipalAmt();
              if (!isEqual && principalDue != null) {
                  for (int i = 0;  i < 4 && i < principalDue.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>
            &nbsp;<integro:empty-if-null value="<%=principalDue[i]%>"/><br/>
            <html:hidden property="nonEqPrincipalAmt" value="<%=principalDue[i]%>"/>
          <%  } } %>
          </td>
          <td width="20%"><b><bean:message key="label.security.amount.interest.due"/></b><br>
          <%
              interestDue = aForm.getNonEqInterestAmt();
              if (!isEqual && interestDue != null) {
                  for (int i = 0;  i < 4 && i < interestDue.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;
                      <integro:empty-if-null value="<%=interestDue[i]%>"/><br/>
                      <html:hidden property="nonEqInterestAmt" value="<%=interestDue[i]%>"/>
          <%  } } %>
          </td>
          <td width="21%"><b><bean:message key="label.security.total.payment.due"/></b><br>
          <%
              totalPayment = aForm.getNonEqTotalPayment();
              if (!isEqual && totalPayment != null) {
                  for (int i = 0;  i < 4 && i < totalPayment.length; i++) {
          %>
          (<%=i + 1%>)&nbsp;<bean:write name="LoanAgencyForm" property="nonEqPrinAmtCcy"/>&nbsp;
                      <integro:empty-if-null value="<%=totalPayment[i]%>"/><br/>
          <html:hidden property="nonEqTotalPayment" value="<%=totalPayment[i]%>"/>
          <%  } } %>
          </td>
        </tr>
        <thead>
        <tr class="odd">
          <td class="fieldname" colspan="5"><bean:message key="label.security.debt.rate"/></td>
        </tr>
        </thead>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.security.debt.rate.percent"/>&nbsp;<font color="#0000FF">* </font></td>
          <td colspan="2">
            <html:text property="debtRate" maxlength="6" size="7"/>&nbsp;
            <html:errors property="debtRate"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.cal.base"/></td>
          <td width="21%">
            <html:select property="calculateBase" >
                <option value="" ><bean:message key="label.please.select"/> </option>
	            <html:options name="calculationBaseID" labelName="calculationBaseValue"/>
            </html:select>&nbsp;
            <html:errors property="calculateBase"/>
            Days </td>
        </tr>
        <%
            String currency = null;
            if (aForm.getInstalmentEqualType() != null &&
                    aForm.getInstalmentEqualType().equals(ICMSConstant.TRUE_VALUE)) {
                currency = aForm.getEqualPrinAmtCcy();
            } else {
                currency = aForm.getNonEqPrinAmtCcy();
            }
        %>
        <tr class="even">
          <td class="fieldname" width="20%">
            <p><bean:message key="label.security.total.interest.due"/></p>
            <p><br>
              <a href="#" onclick="submitPage(10)"><bean:message key="label.security.refresh.interest.amt"/></a></p>
          </td>
          <td colspan="2"><integro:empty-if-null value="<%=currency%>"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="totalAmtInterest"/>&nbsp;
          <html:hidden property="totalAmtInterest"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.total.payment.due"/></td>
          <td width="21%"><integro:empty-if-null value="<%=currency%>"/>&nbsp;
          <bean:write name="LoanAgencyForm" property="totalPayment"/>&nbsp;
          <html:hidden property="totalPayment"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.term.out.option"/></td>
          <td colspan="2">
              <html:radio property="termOutOption" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="termOutOption" value="<%=ICMSConstant.FALSE_VALUE%>" /><bean:message key="label.common.no"/>
              <html:errors property="termOutOption"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.prepymt.option"/></td>
          <td>
              <html:radio property="prePaymentOption" value="<%=ICMSConstant.TRUE_VALUE%>" onclick="changePrepayment(0)"/><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="prePaymentOption" value="<%=ICMSConstant.FALSE_VALUE%>" onclick="changePrepayment(1)"/><bean:message key="label.common.no"/>
              <html:errors property="prePaymentOption"/>
          </td>
        </tr>
        <%
            boolean isPrepaymentAllow = false;
            if (aForm.getPrePaymentOption() != null &&
                    aForm.getPrePaymentOption().equals(ICMSConstant.TRUE_VALUE)) {
                isPrepaymentAllow = true;
            }
        %>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.prepymt.min.amt"/></td>
          <td colspan="2">
                <html:select property="prePaymentMinCcy" disabled="<%=!isPrepaymentAllow%>">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="prePaymentMinCcy"/>
            <html:text property="prePaymentMinAmt" maxlength="27" disabled="<%=!isPrepaymentAllow%>"/>
            <html:errors property="prePaymentMinAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.prepymt.penality"/></td>
          <td>
              <html:radio property="prePaymentPenalty" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="prePaymentPenalty" value="<%=ICMSConstant.FALSE_VALUE%>" /><bean:message key="label.common.no"/>
              <html:errors property="prePaymentPenalty"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.num.day.notice"/></td>
          <td colspan="2">
            <html:text property="numDayNotice" maxlength="3"/>
            <html:errors property="numDayNotice"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.govern.law"/></td>
          <td>
            <html:text property="governingLaw" maxlength="100" size="30"/>
            <html:errors property="governingLaw"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.interest.period"/></td>
          <td colspan="2">
            <html:text property="interestDuration" maxlength="3"/>
            <html:errors property="interestDuration"/>
                <html:select property="interestDurationUnit">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="timeFreqID" labelName="timeFreqValue"/>
                 </html:select>&nbsp;
                 <html:errors property="interestDurationUnit"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.max.num.loan.outstanding"/></td>
          <td>
            <html:text property="maxLoanOutstanding" maxlength="3" size="5"/>
            <html:errors property="maxLoanOutstanding"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.drawdwn.amt.allowed"/></td>
          <td colspan="2">
                <html:select property="minDrawdownAllowCcy">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="minDrawdownAllowCcy"/>
            <html:text property="minDrawdownAllowAmt" maxlength="27"/>
            <html:errors property="minDrawdownAllowAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.drawndwn.amt.allowed.max"/></td>
          <td>
                <html:select property="maxDrawdownAllowCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="maxDrawdownAllowCcy"/>
            <html:text property="maxDrawdownAllowAmt" maxlength="27"/>
            <html:errors property="maxDrawdownAllowAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.num.drawdwn.allowed.min"/></td>
          <td colspan="2">
            <html:text property="minNumDrawdownAllow" maxlength="3" size="5"/>
            <html:errors property="minNumDrawdownAllow"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.num.drawdwn.allowed.max"/></td>
          <td>
            <html:text property="maxNumDrawdownAllow" maxlength="3" size="5"/>
            <html:errors property="maxNumDrawdownAllow"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.assignmnt.fee.min"/></td>
          <td colspan="2" valign="middle" style="border-left:0;border-right:0" >
                <html:select property="minAssignmentFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="minAssignmentFeeCcy"/>
            <html:text property="minAssignmentFeeAmt" maxlength="27"/>
            <html:errors property="minAssignmentFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.assignmnt.fee.max "/></td>
          <td valign="middle" style="border-left:0;border-right:0" >
                <html:select property="maxAssignmentFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="maxAssignmentFeeCcy"/>
            <html:text property="maxAssignmentFeeAmt" maxlength="27"/>
            <html:errors property="maxAssignmentFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td  valign="middle" class="fieldname"><bean:message key="label.security.consent.frm.borrower"/></td>
          <td colspan="2" style="border-left:0">
              <html:radio property="borrowerConsent" value="<%=ICMSConstant.TRUE_VALUE%>" /><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="borrowerConsent" value="<%=ICMSConstant.FALSE_VALUE%>" /><bean:lmessage key="label.common.no"/>
              <html:errors property="borrowerConsent"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.majority.lender.consent.percent"/></td>
          <td valign="middle" style="border-left:0;border-right:0" >
            <html:text property="majorityLendConsent" maxlength="10" size="10"/>&nbsp;%
            <html:errors property="majorityLendConsent"/>
          </td>
        </tr>
        <tr class="odd">
          <td  valign="middle" class="fieldname"><bean:message key="label.security.default.rate"/></td>
          <td colspan="2" valign="middle" style="border-left:0;border-right:0">
            <html:text property="defaultRate" maxlength="10" size="10"/>&nbsp;%
            <html:errors property="defaultRate"/>
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tbody> </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3><bean:message key="label.security.fee"/></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.agency.fee"/></td>
          <td>
                <html:select property="agencyFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="agencyFeeCcy"/>
            <html:text property="agencyFeeAmt" maxlength="27"/>
            <html:errors property="agencyFeeAmt"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.closing.fee"/></td>
          <td>
                <html:select property="closingFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/></option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="closingFeeCcy"/>
            <html:text property="closingFeeAmt" maxlength="27"/>
            <html:errors property="closingFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.commitmnt.fee"/></td>
          <td>
                <html:select property="commitmentFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="commitmentFeeCcy"/>
            <html:text property="commitmentFeeAmt" maxlength="27"/>
            <html:errors property="commitmentFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.facility.fee"/></td>
          <td>
                <html:select property="facilityFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="facilityFeeCcy"/>
            <html:text property="facilityFeeAmt" maxlength="27"/>
            <html:errors property="facilityFeeAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.upfornt.fee"/></td>
          <td>
                <html:select property="upfrontFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="upfrontFeeCcy"/>
            <html:text property="upfrontFeeAmt" maxlength="27"/>
            <html:errors property="upfrontFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.lc.fee"/></td>
          <td>
                <html:select property="lcFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="lcFeeCcy"/>
            <html:text property="lcFeeAmt" maxlength="27"/>
            <html:errors property="lcFeeAmt"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.amendmnt.fee"/></td>
          <td>
                <html:select property="amendmentFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="amendmentFeeCcy"/>
            <html:text property="amendmentFeeAmt" maxlength="27"/>
            <html:errors property="amendmentFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.extension.fee"/></td>
          <td>
                <html:select property="extensionFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="extensionFeeCcy"/>
            <html:text property="extensionFeeAmt" maxlength="27"/>
            <html:errors property="extensionFeeAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.arrangemnt.fee"/></td>
          <td>
                <html:select property="arrangementFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="arrangementFeeCcy"/>
            <html:text property="arrangementFeeAmt" maxlength="27"/>
            <html:errors property="arrangementFeeAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.other.fee"/></td>
          <td>
                <html:select property="otherFeeCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:errors property="otherFeeCcy"/>
            <html:text property="otherFeeAmt" maxlength="27"/>
            <html:errors property="otherFeeAmt"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td width="77%">
      <h3><bean:message key="label.security.title.doc.list.completed"/></h3>
    </td>
    <td align="right" valign="bottom" width="23%">
      <input name="Submit4" type="button" class="btnNormal" value="View Security Documents" onclick="submitPage(4)"/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2"><bean:message key="label.security.view.sec.doc"/></td>
  </tr>
  </thead> <tbody> </tbody>
</table>

<br>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (is_add) {
    %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="60" height="22" border="0" id="Image4" /></a></td>
    <% }  else { %>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="60" height="22" border="0" id="Image4" /></a></td>
    <% } %>
    <td><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<script>
    var equal = "<%=(aForm.getInstalmentEqualType() != null && aForm.getInstalmentEqualType().equals(ICMSConstant.TRUE_VALUE))%>";
    if(equal=="true")
      updateEqual();
    else
      updateNonEqual();


</script>

</body>
</html>