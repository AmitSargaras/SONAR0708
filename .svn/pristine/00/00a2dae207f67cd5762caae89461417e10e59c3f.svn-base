<%@ page import="com.integrosys.cms.app.feed.bus.unittrust.IUnitTrustFeedGroup,
                 com.integrosys.cms.app.feed.trx.unittrust.IUnitTrustFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustForm,
                 com.integrosys.cms.app.creditriskparam.trx.ICreditRiskParamGroupTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup,
                 com.integrosys.cms.app.creditriskparam.bus.IPriceFeedEntry,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustMapper,
                 com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:$
*
* credit_risk_param_unittrust_list.jsp
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<html>
<head>
<title>Untitled Document</title>



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

function MM_findObj(n, d) { //v4.01
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function gotopage(aLocation) {
window.location = aLocation;
}

function submitForm() {

    document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_SUBMIT%>";

    document.forms[0].submit();
}

function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_PAGINATE%>"

    document.forms[0].targetOffset.value = targetOffset;

    document.forms[0].submit();
}

function cancel() {
	document.forms[0].event.value="<%=CreditRiskParamUnitTrustAction.EVENT_SELECT_MAKER_EDIT%>";
	document.forms[0].submit();
}

function changeIsAcceptableLabel(labelId, checkboxId) {
    if (document.getElementById(checkboxId).checked == true)
    {
       document.getElementById(labelId).innerHTML = "<bean:message key="label.unacceptable"/>";
    } else {
       document.getElementById(labelId).innerHTML = "<bean:message key="label.acceptable"/>";
    }
}

<%--function checkSuspended (form)--%>
<%--{--%>
<%--    for(var i=0;i<form.chkSuspended.length;i++)--%>
<%--    {--%>
<%--        alert (form.chkSuspended[i].checked);--%>
<%--        if (form.chkSuspended[i].checked)--%>
<%--        {--%>
<%--            form.chkSuspended[i].value = 'Y';--%>
<%--        } else {--%>
<%--            form.chkSuspended[i].value = 'N';--%>
<%--        }--%>
<%--    }--%>
<%----%>
<%--}--%>

//-->
</script>

</head>

<body>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></p>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->


<%
    Enumeration enum = session.getAttributeNames();
    while (enum.hasMoreElements()) {
        DefaultLogger.debug(this, enum.nextElement());
    }

    CreditRiskParamUnitTrustForm actionForm = (CreditRiskParamUnitTrustForm)pageContext.findAttribute("CreditRiskParamUnitTrustForm");

    String event = actionForm.getEvent();

    // Get the unit trust feed group trx value from session.
    ICreditRiskParamGroupTrxValue paramGroupTrxValue = (ICreditRiskParamGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.creditRiskParamGroupTrxValue");

    ICreditRiskParamGroup stagingFeedGroup = null;
    stagingFeedGroup = paramGroupTrxValue.getStagingCreditRiskParamGroup();

    ICreditRiskParamGroup actualFeedGroup = paramGroupTrxValue.getCreditRiskParamGroup();
    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    //int offset = Integer.parseInt(actionForm.getOffset());
    //int length = Integer.parseInt(actionForm.getLength());
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.length")).intValue();

    //int targetOffset = Integer.parseInt(actionForm.getTargetOffset());

    String cssClass = "odd";

    CurrencyList currencyList = CurrencyList.getInstance();
    HashMap currenciesMap = currencyList.getCurrencyList();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    String countryLabel = (String)request.getParameter("countrylabel");   // get country name from dropdown list
    DefaultLogger.debug(this, "countryLabel : " + countryLabel);

    String countryName = countryLabel;

    if (countryName == null || ("").equals(countryName))
    {
        String countryCode = "";
        OBCreditRiskParam[] obCreditRiskParams = stagingFeedGroup.getFeedEntries();
        while (obCreditRiskParams != null && obCreditRiskParams.length > 0)
        {
            countryCode = obCreditRiskParams[0].getCountryCode();
            break;
        }

        CountryList countryList = CountryList.getInstance();
        countryName = countryList.getCountryName(countryCode);
    }

%>

<html:form action="CreditRiskParamUnitTrust.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>

<tr>
  <% if (countryName == null || ("").equals(countryName)) { %>
	<td height="34" colspan="2"> <h3><bean:message key="label.unit.trust"/></h3></td>
  <% } else { %>
    <td height="34" colspan="2"> <h3><bean:message key="label.unit.trust"/> - <%=countryName%></h3></td>
  <% } %>
</tr>
<tr>
	<td colspan="2"><hr /> </td>
</tr>
</thead>
<tbody>
<tr>
	<td colspan="2">
		<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
		<thead>
		<tr>
			<td width="3%" rowspan="2"><bean:message key="label.global.sn"/></td>
			<td width="26%" rowspan="2"><bean:message key="label.fund.name"/></td>
            <td width="8%" rowspan="2"><bean:message key="label.isin"/></td>
			<td width="8%" rowspan="2"><bean:message key="label.ric"/></td>
			<td width="6%" rowspan="2"><bean:message key="label.ccy"/></td>
			<td width="14%" rowspan="2"><bean:message key="label.moa"/>&nbsp;<font color="#00AAFF">* </font></td>
            <td width="14%" rowspan="2"><bean:message key="label.maximum.collateral.cap"/>&nbsp;<font color="#00AAFF">* </font></td>
			<td width="11%" rowspan="2">
                <p><bean:message key="label.acceptable.or.unacceptable"/></p>
			</td>
			<td width="10%" rowspan="2">
                <p><bean:message key="label.suspend.for.internal.use"/></p>
			</td>
		</tr>
		</thead>
		<tbody>

			<%
            if (totalEntries <= 0)
            {
            %>
                <tr class="odd">
                  <td colspan="9"><bean:message key="label.global.not.found"/></td>
                </tr>
            <%
            }
            else
            {
				// Check that offset + length cannot exceed the total.
				int iterateLength = 0;
				if (offset + length > totalEntries) {
					iterateLength = totalEntries - offset;
				} else {
					iterateLength = length;
				}

                // Check chkSuspended checkbox
				String[] chkSuspendedArr = actionForm.getChkSuspended();
				int[] suspendedArr = new int[ chkSuspendedArr == null ? 0 : chkSuspendedArr.length];

                DefaultLogger.debug(this, "suspendedArr[] size : " + suspendedArr.length);
				for (int i = 0; i < suspendedArr.length; i++) {

                    DefaultLogger.debug(this, "chkSuspendedArr[i] : " + i + chkSuspendedArr[i]);
                    if (chkSuspendedArr[i]==null)
                    {
                        chkSuspendedArr[i] = "-1";
                    }

                    try {
                        suspendedArr[i] = Integer.parseInt(chkSuspendedArr[i]) + offset;
                    } catch (Exception e) {
                        DefaultLogger.debug(this, "value is not int-parseable." );
                        if ((ICMSConstant.TRUE_VALUE).equals(chkSuspendedArr[i]))
                        {
                            suspendedArr[i] = i + offset;
                        } else {
                            suspendedArr[i] = -1;
                        }
                    }

                    DefaultLogger.debug(this, "suspendedArr[i] : " + i + suspendedArr[i]);
				}


			%>
			<logic:iterate id="paramEntry" name="stagingFeedGroup" property="feedEntries"
					offset="<%=String.valueOf(offset)%>"
					length="<%=String.valueOf(iterateLength)%>" indexId="counter"
					type="com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam">
			<%
				DefaultLogger.debug(this, "counter is now " + counter.intValue());

				long ref = paramEntry.getCreditRiskParamEntryRef();
					String originalMoa = "";
                    String originalMaxCap = "";

					OBCreditRiskParam[] entriesArr = actualFeedGroup.getFeedEntries();
					if (entriesArr != null) {
						DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
						for (int i = 0; i < entriesArr.length; i++) {
							if (ref == entriesArr[i].getCreditRiskParamEntryRef()) {

                                //todo - FeedUtils ???
//								originalMoa = String.valueOf(entriesArr[i].getMarginOfAdvance());
//                                originalMoa = FeedUtils.padFractionDigits(originalMoa, 1, 2);
//
//                                originalMaxCap = String.valueOf(entriesArr[i].getMaximumCap());
//                                originalMaxCap = FeedUtils.padFractionDigits(originalMaxCap, 1, 2);
								DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
								break;
							}
						}
					}


			%>
		<tr class="<%=cssClass%>">
			<td class="index" valign="top" align="center"><%=counter.intValue() + 1%></td>
			<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getName()%>"/>&nbsp;</td>
            <td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getIsinCode()%>"/>&nbsp;</td>
			<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getRic()%>"/>&nbsp;</td>
			<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getCurrencyCode()%>"/>&nbsp;</td>
			<td class="amount">
                <input name="updatedMoa" type="text"
                value="<%=FeedUtils.padFractionDigits(actionForm.getUpdatedMoa(counter.intValue() - offset), 1, 2)%>"
                size="15" class="currency" maxlength="11"/>&nbsp;%
				<html:errors property="<%=\"updatedMoa.\" + String.valueOf(counter.intValue() - offset)%>"/>
			</td>
            <td class="amount">
                <input name="updatedMaxCap" type="text"
                value="<%=FeedUtils.padFractionDigits(actionForm.getUpdatedMaxCap(counter.intValue() - offset), 1, 2)%>"
                size="15" class="currency" maxlength="11"/>&nbsp;%
				<html:errors property="<%=\"updatedMaxCap.\" + String.valueOf(counter.intValue() - offset)%>"/>
			</td>
			<td style="{text-align: center}">
                <label id="isAcceptable_<%=counter.intValue()%>">
                 <%  if (CreditRiskParamUnitTrustMapper.inArray(counter.intValue(), suspendedArr)) { %>
                        <bean:message key="label.unacceptable"/>
                 <%  } else { %>
                        <bean:message key="label.acceptable"/>
                 <%  }  %>
                </label>
            </td>
            <td style="{text-align: center}">
			    <input type="checkbox" name="chkSuspended" id="suspended_<%=counter.intValue()%>"
				<%=CreditRiskParamUnitTrustMapper.inArray(counter.intValue(), suspendedArr)?"checked":""%>
<%--                <%=(ICMSConstant.TRUE_VALUE).equals(actionForm.getChkSuspended(counter.intValue() - offset)) ?"checked":""%>--%>
				value="<%=counter.intValue() - offset%>"
                onclick="changeIsAcceptableLabel('isAcceptable_<%=counter.intValue()%>', 'suspended_<%=counter.intValue()%>')"/>
			</td>
		</tr>

			<%
				if (cssClass.equals("odd")) {
					cssClass = "even";
				} else {
					cssClass = "odd";
				}
			%>
			</logic:iterate>
        <%
            }
        %>


		</tbody>
		</table>
	</td>
</tr>
</tbody>
</table>
<br><br>
	<%
		if (paramGroupTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
    String lastActionBy = paramGroupTrxValue.getUserInfo();
    String lastRemarksMade = paramGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

	%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr>
<td class="fieldname"><bean:message key="label.remarks"/></td>
<td class="odd"><html:textarea property="remarks" rows="4" style="width:90%"/>
<html:errors property="remarks"/></td>
</tr>
<tr>
<td class="fieldname"><bean:message key="label.last.action.by"/></td>
<td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
</tr>
<tr class="odd">
<td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
<td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
</tr>
</tbody>
</table>
<% } %>

<%
  if (totalEntries > 0)
  {
%>
    <table width="180"  border="0" align="center" cellpadding="0" cellspacing="0">

		<tr>
        <td width="75" valign="baseline" align="center">
        <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" />
        </a></td>

    <%--	<td width="75" valign="baseline" align="center">--%>
    <%--	<a href="#" onclick="save()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3311"  border="0" id="Image331" />--%>
    <%--	</a></td>--%>
        <td width="75" valign="baseline" align="center">
        <%
            if (paramGroupTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                paramGroupTrxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
        %>
        <a href="ToDo.do" align="center" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image331" /></a>
        <%
            } else {
        %>
        <a href="#" align="center" onclick="cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image331" /></a>
        <% } %>
        </td>
        </tr>

        <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    <%--	<td valign="baseline" align="center">&nbsp;</td>--%>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    </table>
<%
  } else {
%>
   <table width="180"  border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
            <td valign="baseline" align="center">
                <a href="#" align="center" onclick="cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
            </td>
        </tr>
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
    </table>
<% } %>

</html:form>
</td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->

<tr>
<td height="25">

		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
			<tr>
				<td valign="middle">
				<integro:pageindex
				 pageIndex="<%=new PageIndex(offset, length, stagingFeedGroup.getFeedEntries().length)%>"
				 url="CreditRiskParamUnitTrust.do" submitFlag="true"/>
				</td>
			</tr>
		</table>

</td>
</tr>

</table>



</body>
</html>
