<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.fixedassetsoth.faoitem.FAOItemAction,
				 java.util.Collection"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/fixedassetsoth/faoitem/update_faoitem.jsp,v 1.12 2006/10/27 08:24:15 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.12 $
* Date: $Date: 2006/10/27 08:24:15 $
* Tag: $Name:  $
*/
%>

<%
	String indexID = (String)request.getParameter("indexID");
	String title = indexID.equals("-1")?"Add":"Edit";
	
    Collection valuerName = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.valuerName");
    pageContext.setAttribute("valuerName", valuerName);
%>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=FAOItemAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=FAOItemAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=FAOItemAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=FAOItemAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<html:form action="AssetFAOItem.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=FAOItemAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="81%" ><h3><%=title%> Fixed Assets/Others (FAO)</h3></td>
      <td width="19%" align="right" valign="bottom" >&nbsp; </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td width="20%" class="fieldname">FAO ID</td>
              <td width="30%">
              	<bean:write name="AssetFAOItemForm" property="faoID"/>&nbsp;
              	<html:hidden property="faoID"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Description&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:textarea property="description" rows="3" cols="80" style="width:100%" />&nbsp;
            	<html:errors property="description"/>
			  </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Address&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:textarea property="address" rows="3" cols="80" style="width:100%" />&nbsp;
            	<html:errors property="address"/>
			  </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Valuer</td>
              <td>
               <html:select property="valuer" >
	            <option value="" >Please Select </option>
	            <html:options name="valuerName" labelName="valuerName"/>
                </html:select>
                <html:errors property="valuer"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Valuation Date (User Input)</td>
              <td>
              <html:text property="valuationDate" readonly="true"/>
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('valuationDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="valuationDate"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Standard Revaluation Frequency</td>
              <td>
              	<bean:write name="AssetFAOItemForm" property="stdRevalFreq"/>&nbsp;
              	<html:hidden property="stdRevalFreq"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Non-Standard Revaluation Frequency</td>
              <td>
              <html:text property="nonStdRevalFreqNum" size="3" maxlength="3" />&nbsp;
                <html:select property="nonStdRevalFreqUnit">
	            <option value="" >Please Select </option>
	            <html:options name="freqID" labelName="freqValue"/>
                </html:select>&nbsp;
                <html:errors property="nonStdRevalFreqNum" />
                <html:errors property="nonStdRevalFreqUnit"/>
		      </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Revaluation Date</td>
              <td>
              	<bean:write name="AssetFAOItemForm" property="revaluationDate"/>&nbsp;
              	<html:hidden property="revaluationDate"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Valuation Currency&nbsp;<font color="#0000FF">* </font></td>
              <td>
               <html:select property="valCurrency" >
	            <option value="" >Please Select </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="valCurrency"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Gross Value (Val Currency)&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="grossValueValCurr" maxlength="19" />&nbsp;
              	<html:errors property="grossValueValCurr"/>
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">CMS Sec Currency</td>
              <td>
              	<bean:write name="AssetFAOItemForm" property="cmsSecCurrency"/>&nbsp;
              	<html:hidden property="cmsSecCurrency"/>
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Gross Value (CMS Currency)</td>
              <td>
              	<bean:write name="AssetFAOItemForm" property="grossValueCMSCurr"/>&nbsp;
              	<html:hidden property="grossValueCMSCurr"/>
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Margin (%)&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="margin" maxlength="3" size="5"/>&nbsp;
              	<html:errors property="margin"/>
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Net Value (CMS Currency)</td>
              <td>
              	<bean:write name="AssetFAOItemForm" property="netValue"/>&nbsp;
              	<html:hidden property="netValue"/>
              </td>
            </tr>
          </tbody>
        </table>
        </td>
    </tr>
  </tbody>
</table>
<table width="225"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>        
    </tr>
    <tr>
        <td width="75" valign="baseline" align="center">
        <%
            if (indexID.equals("-1")) {
        %>
            <a href="#" onclick="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="#" onclick="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="#" onclick="javascript:submitPage(4)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/refresh2.gif',1)"><img src="img/refresh1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="#" onclick="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>        
    </tr>
</table>
</html:form>
 
</body>
</html>
