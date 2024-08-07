<%@ page import="com.integrosys.cms.ui.commoditydeal.finance.hedging.HedgingAction,
                 com.integrosys.cms.ui.commoditydeal.finance.hedging.HedgingForm"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/hedging/update_hedging.jsp,v 1.12 2006/10/27 08:39:39 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.12 $
* Date: $Date: 2006/10/27 08:39:39 $
* Tag: $Name:  $
*/
%>
<%
    HedgingForm aForm = (HedgingForm)request.getAttribute("HedgingForm");
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=HedgingAction.EVENT_UPDATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=HedgingAction.EVENT_CANCEL%>";
    }
    document.forms[0].submit();
}

function refreshPage() {
    document.forms[0].event.value="<%=HedgingAction.EVENT_REFRESH%>";
    document.forms[0].submit();
}

function addExtension() {
    document.forms[0].event.value="<%=HedgingAction.EVENT_ADD_EXTENSION%>";
    document.forms[0].submit();
}

function removeExtension() {
        var delObj = document.forms[0].deletePeriod;
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
            alert('At least one Hedging Priod must be checked');
            return false;
        }

    document.forms[0].event.value="<%=HedgingAction.EVENT_REMOVE_EXTENSION%>";
    document.forms[0].submit();
}

     months = new Array();
     months['Jan'] = 0;
     months['Feb'] = 1;
     months['Mar'] = 2;
     months['Apr'] = 3;
     months['May'] = 4;
     months['Jun'] = 5;
     months['Jul'] = 6;
     months['Aug'] = 7;
     months['Sep'] = 8;
     months['Oct'] = 9;
     months['Nov'] = 10;
     months['Dec'] = 11;

     month = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

function getMonthLength(month,year)
{
   var ml;
   if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10||month==12)
      {ml = 31;}
   else {
       if(month==2) {
          ml = 28;
          if(((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
             ml++;
       }
       else
          {ml = 30;}
   }
   return ml;
}

function setActualDate(cal, date) {
    cal.sel.value = date;
    var name = cal.sel.name;

    var num = parseInt(name.substring(15, name.length));

    if (document.forms[0].periodStartDate.length+'' == 'undefined') {
        document.forms[0].periodStartDate.value = date;
    } else {
        document.forms[0].periodStartDate[num].value = date;
    }
    setDates(num, date);
}

function setDates(num, date) {
    var dateLength = 0;
    if (document.forms[0].periodStartDate.length+'' == 'undefined') {
        dateLength = 1;
    } else {
        dateLength = document.forms[0].periodStartDate.length;
    }
    var startDateStr = date;
    for (i = num; i < dateLength; i++ ) {
        setEndDate(i, startDateStr);
        if (dateLength > 1) {
            startDateStr = document.forms[0].periodEndDate[i].value;
            if (i + 1 < dateLength) {
                document.forms[0].periodStartDate[i + 1].value = startDateStr;
            }
        }
    }
}

function setEndDate(num, date) {
    var startDateStr = date;
    if (startDateStr == "") {
        if (document.forms[0].periodStartDate.length+'' == 'undefined') {
            startDateStr = document.forms[0].periodStartDate.value;
        } else {
            startDateStr = document.forms[0].periodStartDate[num].value;
        }
    }

    var periodValue = "";
    var periodUOM = "";
    if (document.forms[0].period.length+'' == 'undefined') {
        periodValue = document.forms[0].period.value;
        periodUOM = document.forms[0].periodUnit.value;
    } else {
        periodValue = document.forms[0].period[num].value;
        periodUOM = document.forms[0].periodUnit[num].value;
    }

    if (periodValue != "" && periodUOM != "" && startDateStr != "") {
        periodValue = parseFloat(periodValue.split(' ').join(''));
        startDate = new Date();
 	    startDate.setDate(startDateStr.substring(0,2));
  	    startDate.setMonth(months[startDateStr.substring(3,6)]);
  	    startDate.setFullYear(startDateStr.substring(7,11));

        endDate = new Date();
        if (periodUOM == 1) {
            endDate = startDate.add(Date.DAY, periodValue);
        }
        if (periodUOM == 2) {
            endDate = startDate.add(Date.DAY, (periodValue * 7));
        }
        if (periodUOM == 3) {
            endDate = startDate.add(Date.MONTH, periodValue);
        }
        if (periodUOM == 4) {
            endDate = startDate.add(Date.YEAR, periodValue);
        }
        endDateStr = "";
        if (endDate.getDate() < 10) {
            endDateStr = "0";
        }
        endDateStr = endDateStr + endDate.getDate()+"/"+month[endDate.getMonth()]+"/"+endDate.getFullYear();

        if (document.forms[0].periodEndDate.length+'' == 'undefined') {
            document.forms[0].periodEndDate.value = endDateStr;
        } else {
            document.forms[0].periodEndDate[num].value = endDateStr;
        }
    }
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="Hedging.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=HedgingAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tr>

  </tr>
  <thead>
  <tr>
    <td>
      <h3>Hedging</h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname">TP Deal Ref. No.</td>
          <td width="30%"><bean:write name="HedgingForm" property="tpDealRefNo"/>&nbsp;
          <html:hidden property="tpDealRefNo"/>
          </td>
          <td width="20%" class="fieldname">Global Treasury Ref. No.</td>
          <td width="30%">
              <html:select property="globalTreasuryRefNo" onchange="refreshPage()">
	              <option value="" >Please Select </option>
	              <html:options name="globalTrRefID" labelName="globalTrRefValue"/>
              </html:select>
              <html:errors property="globalTreasuryRefNo"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Date of Deal</td>
          <td><bean:write name="HedgingForm" property="dealdate"/>&nbsp;
            <html:hidden property="dealdate"/>
          </td>
          <td  class="fieldname">Amount of Deal</td>
          <td><bean:write name="HedgingForm" property="dealAmt"/>&nbsp;
            <html:hidden property="dealAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Hedging Agreement Ref.</td>
          <td><bean:write name="HedgingForm" property="hedgeAgreeRef"/>&nbsp;
          <html:hidden property="hedgeAgreeRef"/>
          </td>
          <td class="fieldname">Date of Hedging Agreement</td>
          <td><bean:write name="HedgingForm" property="hedgeAgreeDate"/>&nbsp;
            <html:hidden property="hedgeAgreeDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" height="16">Name of Counterparty</td>
          <td height="16"><bean:write name="HedgingForm" property="counterPartyName"/>&nbsp;
            <html:hidden property="counterPartyName"/>
          </td>
          <td class="fieldname" height="16">Margin</td>
          <td height="16"><bean:write name="HedgingForm" property="margin"/>&nbsp;%
            <html:hidden property="margin"/>
          </td>
        </tr>
        <tr class="odd">
          <td width="20%" class="fieldname">Hedging Price&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
              <html:select property="hedgingPriceCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="hedgingPriceCcy"/>
              <html:text property="hedgingPriceAmt" maxlength="27"/>
              <html:errors property="hedgingPriceAmt"/>
          </td>
          <td class="fieldname" height="16">&nbsp;</td>
          <td height="16">Click <a href="#" onclick="javascript:refreshPage()">here</a> to refresh the page</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableCell">
  <thead>
  <tr>
    <td>
      <h3>Hedging Quantity</h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td class="fieldname" width="21%">Total Quantity of Goods</td>
          <td width="30%"><bean:write name="HedgingForm" property="totalQtyGoods"/>&nbsp;
          <html:hidden property="totalQtyGoods"/>
          </td>
          <td class="fieldname" width="17%">Unit of Measure</td>
          <td width="32%"><bean:write name="HedgingForm" property="hedgeQtyUOM"/>&nbsp;
          <html:hidden property="hedgeQtyUOM"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="21%">Total Quantity of Goods Hedged&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
            <html:text property="totalQtyGoodsHedge" maxlength="27"/>
            <html:errors property="totalQtyGoodsHedge"/>
          </td>
          <td class="fieldname" width="17%">Unit of Measure</td>
          <td width="32%"><bean:write name="HedgingForm" property="hedgeQtyUOM"/>&nbsp;</td>
        </tr>
        <tbody>
        <tr class="odd">
          <td class="fieldname" width="21%">Percentage of Goods Hedged</td>
          <td colspan="3"><bean:write name="HedgingForm" property="percentageGoodsHedge"/>&nbsp;%
          <html:hidden property="percentageGoodsHedge"/>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td width="75%">
      <h3>Hedging Price/Period and Settlement</h3>
    </td>
    <td align="right" valign="bottom" width="16%">
      <input type="button" name="button22" id="button2" value="Add Extension" class="btnNormal"  onclick="addExtension()"/>
    </td>
    <td align="right" valign="bottom" width="9%">
      <input type="button" name="button222" id="button2" value="Remove" class="btnNormal" onClick="removeExtension()"/>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr class="odd">
          <td width="9%" class="fieldname" height="20">S/N</td>
          <td width="28%" height="20">Period (Tenor)</td>
          <td width="26%" height="20">Start Date</td>
          <td width="20%" height="20">End Date</td>
          <td width="17%" height="20">Delete</td>
        </tr>
        </thead>
        <tbody>
        <%
            String[] period = aForm.getPeriod();
            String[] periodUnit = aForm.getPeriodUnit();
            String[] periodStartDate = aForm.getPeriodStartDate();
            String[] periodEndDate = aForm.getPeriodEndDate();
            String[] periodID = aForm.getPeriodID();
            if (periodID == null || periodID.length == 0) {
        %>
        <tr class="odd"><td colspan="5">There is no Hedging Period.</td></tr>
        <%
            } else {
                for (int i = 0 ; i < periodID.length; i++) {
                    System.out.println(i+"\tperiodID: "+periodID[i]);
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
        <html:hidden property="periodID" value="<%=periodID[i]%>"/>
          <td width="9%" class="index"><%=i + 1%></td>
          <td width="28%">
            <input type="text" name="period" maxlength="3" value="<%=period[i]%>" onchange="setDates(<%=i%>, '')"/>
            <% String periodErr = "period"+String.valueOf(i);%>
            <html:errors property="<%=periodErr%>"/>
            <%
                    String changeAction = "setDates("+i+",'')";
            %>
              <html:select property="periodUnit" value="<%=periodUnit[i]%>" onchange="<%=changeAction%>">
	              <option value="" >Please Select </option>
	              <html:options name="timeFreqID" labelName="timeFreqValue"/>
              </html:select>
            <% String periodUnitErr = "periodUnit"+String.valueOf(i);%>&nbsp;<font color="#0000FF">* </font>
            <html:errors property="<%=periodUnitErr%>"/>
          </td>
          <td width="26%">
			  <html:text property="periodStartDate" readonly="true" size="15" maxlength="11" value="<%=periodStartDate[i]%>"/>
              <%
                    String startDate = "periodStartDate" + String.valueOf(i);
                    String str = "onclick=\"return showCalendarWithCustomHandling('"+startDate+"', 'dd/mm/y', setActualDate);\"";
              %>
              <input type="hidden" name="<%=startDate%>"/>
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=i==0?str:""%> onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />&nbsp;<font color="#0000FF">* </font>
              <html:errors property="<%=startDate%>"/></td>
          <td width="20%" >
			  <html:text property="periodEndDate" readonly="true" size="15" maxlength="11" value="<%=periodEndDate[i]%>" readonly="true"/>
              <% String endDate = "periodEndDate" + String.valueOf(i);%>
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="<%=endDate%>"/></td>
          </td>
          <td style="text-align:center" width="17%">
          <% if (i > 0) { %>
            <html:multibox property="deletePeriod" value="<%=String.valueOf(i)%>"/>
          <% } else { %>&nbsp;<% } %>
          </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<br>


<table width="142" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="76">&nbsp;</td>
    <td width="66">&nbsp;</td>
  </tr>
  <tr>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
  </tr>
  <tr>
    <td style="text-align:center" width="76">&nbsp;</td>
    <td style="text-align:center" width="66">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
