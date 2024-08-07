<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustForm,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction,
                 com.integrosys.cms.app.creditriskparam.trx.ICreditRiskParamGroupTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup,
                 com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:$
*
* credit_risk_param_unittrust_view.jsp
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

<%
    Enumeration enum = session.getAttributeNames();
    while (enum.hasMoreElements()) {
        DefaultLogger.debug(this, enum.nextElement());
    }

    CreditRiskParamUnitTrustForm actionForm = (CreditRiskParamUnitTrustForm)pageContext.findAttribute("CreditRiskParamUnitTrustForm");

    String event = actionForm.getEvent();

    boolean forClose = event.equals(CreditRiskParamUnitTrustAction.EVENT_READ_MAKER_CLOSE) ||
    					event.equals(CreditRiskParamUnitTrustAction.EVENT_LIST_MAKER_CLOSE);
    					
//    boolean forRead = CreditRiskParamUnitTrustAction.EVENT_READ.equals(event) ||
//    					CreditRiskParamUnitTrustAction.EVENT_LIST_READ.equals(event);
    
    // Get the unit trust feed group trx value from session.
    ICreditRiskParamGroupTrxValue paramGroupTrxValue = (ICreditRiskParamGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.creditRiskParamGroupTrxValue");

    String lastActionBy = paramGroupTrxValue.getUserInfo();
    String lastRemarksMade = paramGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

    ICreditRiskParamGroup stagingFeedGroup = null;

        stagingFeedGroup = paramGroupTrxValue.getStagingCreditRiskParamGroup();

    ICreditRiskParamGroup actualFeedGroup = paramGroupTrxValue.getCreditRiskParamGroup();


    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.length")).intValue();

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
    String lastEvent = (String)request.getParameter("firstEvent");
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

function goPageIndex(targetOffset) {
	<% if (forClose) { %>
		document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_LIST_MAKER_CLOSE%>";
	<% } else { %>
		document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_LIST_TO_TRACK%>";
	<% } %>
	document.forms[0].targetOffset.value = targetOffset;

	document.forms[0].submit();
}

function closeForm() {
	document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_CLOSE%>"
	document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>--%>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->



<html:form action="CreditRiskParamUnitTrust.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
  <% if (countryName == null || ("").equals(countryName)) { %>
	<td height="34"> <h3><bean:message key="label.unit.trust"/></h3></td>
  <% } else { %>
    <td height="34"> <h3><bean:message key="label.unit.trust"/> - <%=countryName%></h3></td>
  <% } %>

</tr>
<tr>
	<td><hr /> </td>
</tr>
</thead>
<tbody>
<tr>
	<td>
		<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
		<thead>
            <tr>
                <td width="3%" rowspan="2"><bean:message key="label.global.sn"/></td>
                <td width="26%" rowspan="2"><bean:message key="label.fund.name"/></td>
                <td width="8%" rowspan="2"><bean:message key="label.isin"/></td>
                <td width="8%" rowspan="2"><bean:message key="label.ric"/></td>
                <td width="6%" rowspan="2"><bean:message key="label.ccy"/></td>
                <td width="14%" rowspan="2"><bean:message key="label.moa"/></td>
                <td width="14%" rowspan="2"><bean:message key="label.maximum.collateral.cap"/></td>
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

                originalMoa = String.valueOf(paramEntry.getMarginOfAdvance());
                originalMaxCap = String.valueOf(paramEntry.getMaximumCap());

//                OBCreditRiskParam[] entriesArr = actualFeedGroup.getFeedEntries();
//                OBCreditRiskParam[] entriesArr = stagingFeedGroup.getFeedEntries();
//                if (entriesArr != null) {
//                    DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
//                    for (int i = 0; i < entriesArr.length; i++) {
//                        if (ref == entriesArr[i].getCreditRiskParamEntryRef()) {
//                            DefaultLogger.debug(this, "entriesArr[i].getMarginOfAdvance() = " + entriesArr[i].getMarginOfAdvance());
//                            originalMoa = String.valueOf(entriesArr[i].getMarginOfAdvance());
//                            originalMoa = FeedUtils.padFractionDigits(originalMoa, 1, 2);
//
//                            originalMaxCap = String.valueOf(entriesArr[i].getMaximumCap());
//                            originalMaxCap = FeedUtils.padFractionDigits(originalMaxCap, 1, 2);
//                            DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
//                            break;
//                        }
//                    }
//                }
			%>
		<tr class="<%=cssClass%>">
			<td class="index" valign="top"><%=counter.intValue() + 1%></td>
			<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getName()%>"/>&nbsp;</td>
            <td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getIsinCode()%>"/>&nbsp;</td>
			<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getRic()%>"/>&nbsp;</td>
			<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=paramEntry.getCurrencyCode()%>"/>&nbsp;</td>
			<td style="{text-align: center}" class="amount"><integro:empty-if-null value="<%=FeedUtils.padFractionDigits(originalMoa, 1, 2)%>"/>&nbsp;%</td>
			<td style="{text-align: center}" class="amount"><integro:empty-if-null value="<%=FeedUtils.padFractionDigits(originalMaxCap, 1, 2)%>"/>&nbsp;%</td>
			<td style="{text-align: center}">
             <%  if (paramEntry.getIsIntSuspend() != null && (ICMSConstant.TRUE_VALUE).equals(paramEntry.getIsIntSuspend())) { %>
                    <bean:message key="label.unacceptable"/>
             <%  } else { %>
                    <bean:message key="label.acceptable"/>
             <%  }  %>
            </td>
			<td style="{text-align: center}">&nbsp;<integro:yesno-display value="<%=paramEntry.getIsIntSuspend()%>"/>&nbsp;</td>
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

<%if(forClose) {%>
    <p/>
    <p/>
    <p/>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
      <tbody>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.last.action.by"/></td>
          <td class="even">&nbsp;<%=lastActionBy%></td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
          <td><integro:wrapper value="<%=lastRemarksMade%>" />&nbsp;</td>
        </tr>
      </tbody>
    </table>
<%}%>

<%if (forClose) {%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td><a href="#" onclick="closeForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a></td>
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
<% } else { %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
	<td valign="baseline" align="center">&nbsp;</td>

	</tr>
	<tr>
	<td width="100" valign="baseline" align="center">
	<%
        //String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
		String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
		long roleType = Long.parseLong(teamTypeMemID);
        if (roleType == ICMSConstant.TEAM_TYPE_GAM_USER ||
            roleType == ICMSConstant.TEAM_TYPE_SCO_USER ||
            roleType == ICMSConstant.TEAM_TYPE_SSC_MAKER||
            roleType == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH||
            roleType == ICMSConstant.TEAM_TYPE_CPU_MAKER_I||
            roleType == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH||
            roleType == ICMSConstant.TEAM_TYPE_SSC_CHECKER||
            roleType == ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH||
            roleType == ICMSConstant.TEAM_TYPE_FAM_USER||
            ((roleType == ICMSConstant.TEAM_TYPE_SC_CHECKER||roleType == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH)&&lastEvent!=null)) {
        	
            %><a href="CreditRiskParamUnitTrust.do?event=selectMakerEdit" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a><%
        }
        else {
            %> 
            <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
            <%
        }
    %>
    </td>

	</tr>
	<tr>
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
