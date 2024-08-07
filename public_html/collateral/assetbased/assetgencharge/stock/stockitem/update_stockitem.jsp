<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.stockitem.StockItemAction,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.stock.stockitem.StockItemForm,
				 java.util.Collection"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/stock/stockitem/update_stockitem.jsp,v 1.19 2006/10/27 08:24:38 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.19 $
* Date: $Date: 2006/10/27 08:24:38 $
* Tag: $Name:  $
*/
%>

<%
	String indexID = (String)request.getParameter("indexID");
	String title = indexID.equals("-1")?"Add":"Edit";

    Collection valuerName = (Collection)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.valuerName");
    pageContext.setAttribute("valuerName", valuerName);

    StockItemForm aForm = (StockItemForm)request.getAttribute("AssetStockItemForm");
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
        document.forms[0].event.value = "<%=StockItemAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=StockItemAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=StockItemAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=StockItemAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}

function updatePhysical(isPhyscialInspectionDone) {
	if (isPhyscialInspectionDone) {
        document.getElementById('spanPIF').innerText="*";
        document.getElementById('spanLPID').innerText="*";
        document.forms[0].phyInsFreqNum.disabled=false;
		document.forms[0].phyInsFreqUnit.disabled=false;
		document.forms[0].lastPhyDateCal.disabled=false;
	} else {
        document.getElementById('spanPIF').innerText=" ";
        document.getElementById('spanLPID').innerText=" ";
        document.forms[0].phyInsFreqNum.value="";
		document.forms[0].phyInsFreqUnit.value="";
		document.forms[0].lastPhyInsDate.value="";

		document.forms[0].phyInsFreqNum.disabled=true;
		document.forms[0].phyInsFreqUnit.disabled=true;
		document.forms[0].lastPhyDateCal.disabled=true;
	}
}

//-->
</script>
<script>
  function manda(){
      if(document.forms[0].rawMaterialsAmt.value !="")
          document.getElementById('spanRM').innerText="*";
      else
          document.getElementById('spanRM').innerText=" ";
      if(document.forms[0].goodsInTransitAmt.value!="")
            document.getElementById('spanGT').innerText="*";
      else
            document.getElementById('spanGT').innerText=" ";
      if(document.forms[0].finishedGoodsAmt.value !="")
            document.getElementById('spanFG').innerText="*";
      else
            document.getElementById('spanFG').innerText=" ";
      if(document.forms[0].storesSparesAmt.value !="")
            document.getElementById('spanSS').innerText="*";
      else
            document.getElementById('spanSS').innerText=" ";
      if(document.forms[0].wipAmt.value !="")
            document.getElementById('spanWIP').innerText="*";
      else
            document.getElementById('spanWIP').innerText=" ";
      if(document.forms[0].othMerchandiseAmt.value !="")
            document.getElementById('spanOM').innerText="*";
      else
            document.getElementById('spanOM').innerText=" ";

      if(document.forms[0].rawMaterialsMargin.value !="")
          document.getElementById('spanRM1').innerText="*";
      else
          document.getElementById('spanRM1').innerText=" ";
      if(document.forms[0].goodsInTransitMargin.value!="")
            document.getElementById('spanGT1').innerText="*";
      else
            document.getElementById('spanGT1').innerText=" ";
      if(document.forms[0].finishedGoodsMargin.value !="")
            document.getElementById('spanFG1').innerText="*";
      else
            document.getElementById('spanFG1').innerText=" ";
      if(document.forms[0].storesSparesMargin.value !="")
            document.getElementById('spanSS1').innerText="*";
      else
            document.getElementById('spanSS1').innerText=" ";
      if(document.forms[0].wipMargin.value !="")
            document.getElementById('spanWIP1').innerText="*";
      else
            document.getElementById('spanWIP1').innerText=" ";
      if(document.forms[0].othMerchandiseMargin.value !="")
            document.getElementById('spanOM1').innerText="*";
      else
            document.getElementById('spanOM1').innerText=" ";
    }

</script>

</head>

<body>
<html:form action="AssetStockItem.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=StockItemAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="81%" ><h3><%=title%> Stock</h3></td>
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
            <tr class="odd">
              <td width="20%" class="fieldname">Stock ID</td>
              <td width="30%">
              	<bean:write name="AssetStockItemForm" property="stockID"/>&nbsp;
              	<html:hidden property="stockID"/>
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
            </tr>
            <tr class="odd">
              <td class="fieldname">Standard Revaluation Frequency</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="stdRevalFreq"/>&nbsp;
              	<html:hidden property="stdRevalFreq"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Non-Standard Revaluation Frequency</td>
              <td>
              <html:text property="nonStdRevalFreqNum" size="3" maxlength="3" />&nbsp;
                <html:select property="nonStdRevalFreqUnit">
	            <option value="" >Please Select </option>
	            <html:options name="timeFreqID" labelName="timeFreqValue"/>
                </html:select>&nbsp;
                <html:errors property="nonStdRevalFreqNum" />
                <html:errors property="nonStdRevalFreqUnit"/>
		      </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Revaluation Date</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="revaluationDate"/>&nbsp;
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
              <td class="fieldname">Gross Value Less Creditors (Val Currency)</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="grossValueValCurr"/>&nbsp;
              	<html:hidden property="grossValueValCurr"/>
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">CMS Sec Currency</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="cmsSecCurrency"/>&nbsp;
              	<html:hidden property="cmsSecCurrency"/>
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Gross Value Less Creditors (CMS Currency)</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="grossValueCMSCurr"/>&nbsp;
              	<html:hidden property="grossValueCMSCurr"/>
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Margin (%)</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="margin"/>&nbsp;
              	<html:hidden property="margin"/>
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Net Value (CMS Currency)</td>
              <td>
              	<bean:write name="AssetStockItemForm" property="netValue"/>&nbsp;
              	<html:hidden property="netValue"/>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
		<td colspan="2"><h3> Stock Type (Amount) &nbsp;<html:errors property="stockTypeErr"/></h3>
		  <hr> </td>
	</tr>
	<tr>
		<td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="even">
              <td class="fieldname">Type</td>
              <td class="fieldname">Amount (Valuation Currency) </td>
              <td class="fieldname">Type</td>
              <td class="fieldname">Amount (Valuation Currency) </td>
            </tr></thead><tbody>
            <tr class="even">
              <td width="30%" class="fieldname">Raw Materials&nbsp;<font color="#0000FF"><span id = "spanRM1">&nbsp;</span></font></td>
              <td width="20%">
              <html:text property="rawMaterialsAmt" maxlength="19" onchange="manda()"/>&nbsp;
              <html:errors property="rawMaterialsAmt" />
              </td>
              <td width="30%" class="fieldname">Goods-in-Transit&nbsp;<font color="#0000FF"><span id = "spanGT1">&nbsp;</span></font></td>
              <td width="20%">
              <html:text property="goodsInTransitAmt" maxlength="19" onchange="manda()"/>&nbsp;
              <html:errors property="goodsInTransitAmt" />
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Finished Goods&nbsp;<font color="#0000FF"><span id = "spanFG1">&nbsp;</span></font></td>
              <td valign="top">
              <html:text property="finishedGoodsAmt" maxlength="19" onchange="manda()"/>&nbsp;
              <html:errors property="finishedGoodsAmt" />
              </td>
              <td class="fieldname">Stores &amp; Spares&nbsp;<font color="#0000FF"><span id = "spanSS1">&nbsp;</span></font></td>
              <td valign="top">
              <html:text property="storesSparesAmt" maxlength="19" onchange="manda()"/>&nbsp;
              <html:errors property="storesSparesAmt" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Work-in-Progress&nbsp;<font color="#0000FF"><span id = "spanWIP1">&nbsp;</span></font></td>
              <td>
              <html:text property="wipAmt" maxlength="19" onchange="manda()"/>&nbsp;
              <html:errors property="wipAmt" />
              </td>
              <td class="fieldname">Other Merchandise&nbsp;<font color="#0000FF"><span id = "spanOM1">&nbsp;</span></font></td>
              <td>
              <html:text property="othMerchandiseAmt" maxlength="19" onchange="manda()"/>&nbsp;
              <html:errors property="othMerchandiseAmt" />
              </td>
            </tr>
            <tr class="odd">
            	<td class="fieldname">Total</td>
            	<td colspan="3"><bean:write name="AssetStockItemForm" property="totalStockTypeAmt"/>&nbsp;
            	<html:hidden property="totalStockTypeAmt"/>
            	</td>
            </tr>
          	<tr class="even">
            	<td class="fieldname">Creditor (Valuation Currency) </td>
            	<td >
              	<html:text property="creditor" maxlength="19"/>&nbsp;
              	<html:errors property="creditor" />
				</td>
            	<td  class="fieldname">Creditor (CMS Currency) </td>
            	<td >
            	<bean:write name="AssetStockItemForm" property="creditorCMS"/>&nbsp;
            	<html:hidden property="creditorCMS"/>
            	</td>
          	</tr>
          </tbody>
        </table>
		</td>
	</tr>
    <tr>
		<td colspan="2"><h3> Stock Type (Margin)</h3>
		  <hr> </td>
	</tr>
	<tr>
		<td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="even">
              <td class="fieldname">Type</td>
              <td class="fieldname">Margin (%) </td>
              <td class="fieldname">Type</td>
              <td class="fieldname">Margin (%) </td>
            </tr></thead><tbody>
            <tr class="even">
              <td width="30%" class="fieldname">Raw Materials&nbsp;<font color="#0000FF"><span id = "spanRM">&nbsp;</span></font></td>
              <td width="20%">
              <html:text property="rawMaterialsMargin" maxlength="3" size="5" onchange="manda()"/>&nbsp;
              <html:errors property="rawMaterialsMargin" />
              </td>
              <td width="30%" class="fieldname">Goods-in-Transit&nbsp;<font color="#0000FF"><span id = "spanGT">&nbsp;</span></font></td>
              <td width="20%">
              <html:text property="goodsInTransitMargin" maxlength="3" size="5" onchange="manda()"/>&nbsp;
              <html:errors property="goodsInTransitMargin" />
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Finished Goods&nbsp;<font color="#0000FF"><span id = "spanFG">&nbsp;</span></font></td>
              <td valign="top">
              <html:text property="finishedGoodsMargin" maxlength="3" size="5" onchange="manda()"/>&nbsp;
              <html:errors property="finishedGoodsMargin" />
              </td>
              <td class="fieldname">Stores &amp; Spares&nbsp;<font color="#0000FF"><span id = "spanSS">&nbsp;</span></font></td>
              <td valign="top">
              <html:text property="storesSparesMargin" maxlength="3" size="5" onchange="manda()"/>&nbsp;
              <html:errors property="storesSparesMargin" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Work-in-Progress&nbsp;<font color="#0000FF"><span id = "spanWIP">&nbsp;</span></font></td>
              <td>
              <html:text property="wipMargin" maxlength="3" size="5" onchange="manda()"/>&nbsp;
              <html:errors property="wipMargin" />
              </td>
              <td class="fieldname">Other Merchandise&nbsp;<font color="#0000FF"><span id = "spanOM">&nbsp;</span></font></td>
              <td>
              <html:text property="othMerchandiseMargin" maxlength="3" size="5" onchange="manda()"/>&nbsp;
              <html:errors property="othMerchandiseMargin" />
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Weighted Average</td>
              <td><bean:write name="AssetStockItemForm" property="weightedAverageMargin"/>&nbsp;
              	<html:hidden property="weightedAverageMargin"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table>
		</td>
	</tr>
	<tr>
	<td colspan="2">
	  <table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
        <thead>
          <tr>
            <td>
              <h3>Inspection Details</h3></td>
          </tr>
          <tr>
            <td><hr/></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                          <tr class="odd">
                            <td width="20%" class="fieldname">Physical Inspection </td>
                            <td width="30%">
					          <html:radio property="physicalInspection" value="<%=ICMSConstant.TRUE_VALUE%>" onclick="updatePhysical(true)">Yes</html:radio> &nbsp;&nbsp;
					          <html:radio property="physicalInspection" value="<%=ICMSConstant.FALSE_VALUE%>" onclick="updatePhysical(false)">No</html:radio>
					          &nbsp;<html:errors property="physicalInspection" />
							</td>
							<%
								boolean isPhysical = (aForm.getPhysicalInspection() != null && aForm.getPhysicalInspection().equals(ICMSConstant.TRUE_VALUE))?true:false;
							%>
                            <td width="20%" class="fieldname">Physical Inspection Frequency&nbsp;<font color="#0000FF"><span id = "spanPIF"><%=isPhysical?"*":""%>&nbsp;</span></font></td>
                            <td width="30%">
				              <html:text property="phyInsFreqNum" size="3" maxlength="3" disabled="<%=!isPhysical%>"/>&nbsp;
				                <html:select property="phyInsFreqUnit" disabled="<%=!isPhysical%>">
					            <option value="" >Please Select </option>
					            <html:options name="freqID" labelName="freqValue"/>
				                </html:select>&nbsp;
				                <html:errors property="phyInsFreqNum" />
				                <html:errors property="phyInsFreqUnit" />
                          </tr>
                          <tr class="even">
                            <td class="fieldname">Last Physical Inspection Date&nbsp;<font color="#0000FF"><span id = "spanLPID"><%=isPhysical?"*":""%>&nbsp;</span></font></td>
                            <td>
	      					<html:text property="lastPhyInsDate"  readonly="true" size="15" maxlength="11" />
              				<img src="img/calendara.gif"  name="lastPhyDateCal" border="0" id="lastPhyDateCal" <%=!isPhysical?"disabled":""%> onclick="return showCalendar('lastPhyInsDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              				<html:errors property="lastPhyInsDate"/>
              				</td>
                            <td  class="fieldname">Next Physical Inspection Date</td>
                            <td>
                            	<bean:write name="AssetStockItemForm" property="nextPhyInsDate"/>&nbsp;
                            	<html:hidden property="nextPhyInsDate"/>
                            </td>
                          </tr>
                        </tbody>
                    </table></td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table></td>
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
<script>
    manda();
</script>
 
</body>
</html>
