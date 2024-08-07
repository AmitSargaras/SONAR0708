<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.debtors.DebtorsAction,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.debtors.DebtorsForm"%>
				 
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/debtors/debtor_update.jsp,v 1.13 2006/10/27 08:23:52 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Asset Based - General Charge - Debtor Tab
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.13 $
* Date: $Date: 2006/10/27 08:23:52 $
* Tag: $Name:  $
*/
%>

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	
	String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
	
	String debtorsAgeingErr = "";
	
	DebtorsForm aForm = (DebtorsForm)request.getAttribute("AssetDebtorForm");
	String[] debtorsAgeing = aForm.getDebtorsAgeing();
	String[] debtorsAgeingCMS = aForm.getDebtorsAgeingCMS();
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
		document.forms[0].event.value="<%=DebtorsAction.EVENT_REFRESH%>";
	}

    document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<html:form action="/AssetGenChargeDebtor.do">

<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=DebtorsAction.EVENT_EDIT%>"/>
<input type="hidden" name="next_page"/>

<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td width="81%" colspan="2"><h3>Debtors</h3> <hr> </td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
        <thead>
          <tr>
            <td colspan="3" class="topheader" style="text-align:left; font-weight: bold;"> Debtors - Debtors Ageing Table </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>Base Currency &nbsp;<font color="#0000FF">* </font>
               <html:select property="valCurrency" >
	            <option value="" >Please Select </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="valCurrency"/>
            </td>
            <td>CMS Security Currency (<bean:write name="AssetDebtorForm" property="cmsCurrency"/>)
          </tr>
          <tr>
            <td width="34%" style="text-align:left ">Months</td>
            <td width="33%">Amount</td>
            <td width="33%">Amount</td>
          </tr>
        </thead>
        <tbody>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">1</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(0); 
            		if (debtorsAgeing[0] == null) {
	            		debtorsAgeing[0] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[0]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[0] == null) {
	            	debtorsAgeingCMS[0] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[0]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[0]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="fieldname"style="text-align:center ">2</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(1); 
            		if (debtorsAgeing[1] == null) {
	            		debtorsAgeing[1] = "";
            		}            		
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[1]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[1] == null) {
	            	debtorsAgeingCMS[1] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[1]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[1]%>"/>
            </td>
          </tr>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">3</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(2); 
            		if (debtorsAgeing[2] == null) {
	            		debtorsAgeing[2] = "";
            		}            		
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[2]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>            
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[2] == null) {
	            	debtorsAgeingCMS[2] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[2]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[2]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="fieldname"style="text-align:center ">4</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(3); 
            		if (debtorsAgeing[3] == null) {
	            		debtorsAgeing[3] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[3]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[3] == null) {
	            	debtorsAgeingCMS[3] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[3]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[3]%>"/>
            </td>
          </tr>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">5</td>
            <td  style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(4); 
            		if (debtorsAgeing[4] == null) {
	            		debtorsAgeing[4] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[4]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[4] == null) {
	            	debtorsAgeingCMS[4] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[4]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[4]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="fieldname"style="text-align:center ">6</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(5); 
            		if (debtorsAgeing[5] == null) {
	            		debtorsAgeing[5] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[5]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[5] == null) {
	            	debtorsAgeingCMS[5] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[5]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[5]%>"/>
            </td>
          </tr>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">7</td>
            <td  style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(6);
            		if (debtorsAgeing[6] == null) {
	            		debtorsAgeing[6] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[6]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[6] == null) {
	            	debtorsAgeingCMS[6] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[6]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[6]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="fieldname"style="text-align:center ">8</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(7); 
            		if (debtorsAgeing[7] == null) {
	            		debtorsAgeing[7] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[7]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[7] == null) {
	            	debtorsAgeingCMS[7] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[7]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[7]%>"/>
            </td>
          </tr>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">9</td>
            <td  style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(8); 
            		if (debtorsAgeing[8] == null) {
	            		debtorsAgeing[8] = "";
            		}            		
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[8]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[8] == null) {
	            	debtorsAgeingCMS[8] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[8]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[8]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="fieldname"style="text-align:center ">10</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(9); 
            		if (debtorsAgeing[9] == null) {
	            		debtorsAgeing[9] = "";
            		}            		
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[9]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[9] == null) {
	            	debtorsAgeingCMS[9] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[9]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[9]%>"/>
            </td>
          </tr>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">11</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(10); 
            		if (debtorsAgeing[10] == null) {
	            		debtorsAgeing[10] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[10]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[10] == null) {
	            	debtorsAgeingCMS[10] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[10]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[10]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="fieldname"style="text-align:center ">12</td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(11); 
            		if (debtorsAgeing[11] == null) {
	            		debtorsAgeing[11] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[11]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[11] == null) {
	            	debtorsAgeingCMS[11] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[11]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[11]%>"/>
            </td>
          </tr>
          <tr class="odd">
            <td class="fieldname" style="text-align:center ">&gt; 12 </td>
            <td style="text-align:center">
            	<% 
            		debtorsAgeingErr = "debtorsAgeing"+String.valueOf(12); 
            		if (debtorsAgeing[12] == null) {
	            		debtorsAgeing[12] = "";
            		}
            	%>
            	<html:text property="debtorsAgeing"  value="<%=debtorsAgeing[12]%>" maxlength="18" size="20"/>&nbsp;
            	<html:errors property="<%=debtorsAgeingErr%>"/>
            </td>
            <td style="text-align:center">
            <%
            	if (debtorsAgeingCMS[12] == null) {
	            	debtorsAgeingCMS[12] = "";
            	}
            %>
            <integro:empty-if-null value="<%=debtorsAgeingCMS[12]%>"/>&nbsp;
            <input type="hidden" name="debtorsAgeingCMS" value="<%=debtorsAgeingCMS[12]%>"/>
            </td>
          </tr>
          <tr class="even">
            <td class="total"style="text-align:center ">Total</td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="total"/>&nbsp;
            	<html:hidden property="total"/>
            </td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="totalCMS"/>&nbsp;
            	<html:hidden property="totalCMS"/>
            </td>
          </tr>
          <tr class="even">
            <td class="total"style="text-align:center ">Period Applicable (months)</td>
            <td class="total" style="text-align:center" colspan="2">
		        <html:select property="periodApplicable">
		        <html:options name="debtorPeriodID" labelName="debtorPeriodValue"/>
		        </html:select>
            </td>
          </tr>
          <tr class="even">
            <td class="total"style="text-align:center ">Debtors Less Overdue</td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="totalDebtors"/>&nbsp;
            	<html:hidden property="totalDebtors"/>
            </td>
            <td class="total" style="text-align:center">
            	<bean:write name="AssetDebtorForm" property="totalDebtorsCMS"/>&nbsp;
            	<html:hidden property="totalDebtorsCMS"/>
            </td>
          </tr>
        </tbody>
      </table>   
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" style="margin-top:15px ">
          <tbody>
            <tr class="odd">
              <td width="23%" valign="top" class="fieldname">Valuation Date</td>
              <td width="21%"  valign="top" style="text-align:center ">
              <html:text property="valuationDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('valuationDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="valuationDate"/>
              </td>
              <td width="26%" valign="top" class="fieldname">Standard Revaluation Frequency</td>
              <td width="17%"  valign="top" >
              	<bean:write name="AssetDebtorForm" property="stdRevalFreq"/>&nbsp;
              	<html:hidden property="stdRevalFreq"/>
              </td>
            </tr>
            <tr class="even">
              <td valign="top" class="fieldname">Non-Standard Revaluation Frequency</td>
              <td  valign="top">
              <html:text property="nonStdRevalFreqNum" size="3" maxlength="3" />&nbsp;
                <html:select property="nonStdRevalFreqUnit">
	            <option value="" >Please Select </option>
	            <html:options name="timeFreqID" labelName="timeFreqValue"/>
                </html:select>&nbsp;
                <html:errors property="nonStdRevalFreqNum" />
                <html:errors property="nonStdRevalFreqUnit"/>
              </td>
              <td valign="top" class="fieldname">Revaluation Date</td>
              <td valign="top">
              	<bean:write name="AssetDebtorForm" property="revaluationDate"/>&nbsp;
              	<html:hidden property="revaluationDate"/>
              </td>
            </tr>
          </tbody>
        </table>       		
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput" style="margin-top:15px ">
          <tbody>
            <tr class="odd">
              <td width="20%" valign="top" class="fieldname">CMS Security Currency </td>
              <td width="30%"  valign="top">
              	<bean:write name="AssetDebtorForm" property="cmsCurrency"/>&nbsp;
              	<html:hidden property="cmsCurrency"/>
              </td>
              <td width="20%" valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - Debtors</td>
              <td width="30%"  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="totalCMS"/>&nbsp;
              </td>
            </tr>
            <tr class="even">
              <td valign="top" class="fieldname"><bean:message key="label.valuation.omv.amount"/> - Debtors Less Overdue</td>
              <td  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="totalDebtorsCMS"/>&nbsp;
              </td>
              <td valign="top" class="fieldname">Negative Stock Value (if any)</td>
              <td valign="top" class="amount"><bean:write name="AssetDebtorForm" property="negativeStockValue"/>&nbsp;
              	<html:hidden property="negativeStockValue"/>
              </td>
            </tr>
            <tr class="odd">
              <td valign="top" class="fieldname">Applicable Debtors</td>
              <td valign="top" class="amount"><bean:write name="AssetDebtorForm" property="applicableDebtors"/>&nbsp;
              	<html:hidden property="applicableDebtors"/>
              </td>
              <td valign="top" class="fieldname">Margin (%)</td>
              <td  valign="top">
              	<html:text property="margin" maxlength="3" size="5"/>&nbsp;
              	<html:errors property="margin"/>
              </td>
            </tr>
            <tr class="even">
              <td valign="top" class="fieldname">Valuation FSV - Debtors (CMS Post-haircut)</td>
              <td  valign="top" class="amount">
              	<bean:write name="AssetDebtorForm" property="valuationFSV"/>&nbsp;
              	<html:hidden property="valuationFSV"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td></tr>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      </tr>
        <td width="96">&nbsp;</td>
        <td width="54">&nbsp;</td>
      <tr>
        <td><a href="#" onclick="submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/refresh2.gif',1)"><img src="img/refresh1.gif" name="Image2" width="80" height="20" border="0" id="Image2" /></a></td>      
      <%
      	if (from_page != null && from_page.equals(DebtorsAction.EVENT_PROCESS_UPDATE)) {
      %>
		<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>      
	  <% } else { %>
        <td><a href="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getCollateral().getCollateralID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
      <% } %>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
</table>

</html:form>
 
</body>
</html>
