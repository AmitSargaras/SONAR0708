<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceAction,				 
				 java.util.Locale,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.base.businfra.currency.CurrencyCode,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 java.util.HashMap,
				 java.util.Collection,
				 java.util.Arrays,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IStock,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBStock,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IFixedAssetOthers,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBFixedAssetOthers,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeUtil,
				 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				 com.integrosys.base.uiinfra.mapper.MapperUtil"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/insurance/update_insurance.jsp,v 1.18 2006/10/27 08:24:22 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:24:22 $
* Tag: $Name:  $
*/
%>

<%
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	String indexID = (String)request.getParameter("indexID");

	String title = indexID.equals("-1")?"Add":"Edit";

	CurrencyCode ccy = new CurrencyCode(itrxValue.getStagingCollateral().getCurrencyCode());
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
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
        document.forms[0].event.value = "<%=InsuranceAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=InsuranceAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=InsuranceAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=InsuranceAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="AssetInsurance.do">
<%@ include file="/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp"%>

<input type="hidden" name="event" value="<%=InsuranceAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>
<html:hidden property="refID"/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="81%" ><h3><%=title%> Insurance (<%=CollateralConstant.TAB_STOCK.equals(tab)?"Stock":"Fixed Assets/Others"%>)</h3></td>
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
              <td width="40%" class="fieldname">Insurance Policy Number&nbsp;<font color="#0000FF">* </font></td>
              <td width="60%">
              	<html:text property="insPolicyNum" maxlength="30" size="30"/>&nbsp;
              	<html:errors property="insPolicyNum"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Insurer's Name&nbsp;<font color="#0000FF">* </font></td>
              <td valign="top">
	              <html:select property="insurerName">
	              <option value="" >Please Select </option>
	              <html:options name="insurerNameID" labelName="insurerNameValue"/>
	              </html:select>&nbsp;
	              <html:errors property="insurerName" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Insurance Type&nbsp;<font color="#0000FF">* </font></td>
              <td>
               	<html:select property="insuranceType">
               	<option value="" >Please Select </option>
               	<html:options name="insuranceTypeID" labelName="insuranceTypeValue"/>
               	</html:select>
               	<html:errors property="insuranceType"/>
              </td>
            </tr>

            <tr class="even">
		  <td class="fieldname">LEID & BCA</td>
		  <td>
			<html:select property="lmtProfileId" onchange="submitPage(4)">
			<option value="" >Please Select </option>
			<html:options name="limitProfileIds" labelName="leid_bcarefIds"/>
			</html:select>
			<html:errors property="LEID&BCA"/>
		  </td>
		</tr>
	    <tr class="even">
		  <td class="fieldname">Document No</td>
		  <td>
			<html:select property="documentNo">
			<option value="" >Please Select </option>
			<html:options name="docsId" labelName="docsId"/>
			</html:select>
			<html:errors property="documentAlreadyBoundToInsurancePolicy"/>
		  </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Expiry Date of Insurance&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="expiryDateIns" readonly="true" size="15" maxlength="11" />
                <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('expiryDateIns', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="expiryDateIns"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Insurance Policy Currency</td>
              <td>
                <html:select property="insPolicyCurrency" >
	            <option value="" >Please Select </option>
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:errors property="insPolicyCurrency"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Insurable Amount</td>
              <td>
              	<html:text property="insurableAmt" maxlength="19"/>&nbsp;
              	<html:errors property="insurableAmt"/>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Insured Amount&nbsp;<font color="#0000FF">* </font> </td>
              <td>
              	<html:text property="insuredAmt" maxlength="19"/>
              	<html:errors property="insuredAmt"/>
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">CMS Security Currency</td>
              <td>
              	<bean:write name="AssetInsuranceForm" property="cmsSecurityCurrency"/>&nbsp;
              	<html:hidden property="cmsSecurityCurrency"/>
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Insured Amount (Sec Currency)</td>
              <td>
              	<bean:write name="AssetInsuranceForm" property="insuredAmtCMS"/>&nbsp;
              	<html:hidden property="insuredAmtCMS"/>
              </td>
            </tr>
            <tr class="odd">
              <td height="21" class="fieldname">Effective Date of Insurance&nbsp;<font color="#0000FF">* </font></td>
              <td>
              	<html:text property="effectiveDateIns" readonly="true" size="15" maxlength="11" />
                <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('effectiveDateIns', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="effectiveDateIns"/>
              </td>
            </tr>
            <tr class="even">
              <td height="21" class="fieldname">Insured Against </td>
              <td>
              	<html:textarea property="insuredAgainst" rows="3" cols="80" style="width:100%" />&nbsp;
              	<html:errors property="insuredAgainst"/>
              </td>
            </tr>
          </tbody>
        </table>
        </td>
      </tr>
      <tr><td colspan="2"><html:errors property="insuranceErr"/></td></tr>
	  <tr>
		<td colspan="2"><h3>Insured Against <%=CollateralConstant.TAB_STOCK.equals(tab)?"Stock":"Fixed Assets/Others (FAO)"%></h3>
	    <hr> </td>
		</tr>
		<tr>
		<td colspan="2">
		<%
			if (CollateralConstant.TAB_STOCK.equals(tab)) { // display stock information
		%>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
              <tr>
                <td width="5%">S/N</td>
                <td width="15%">Stock ID </td>
                <td width="15%">Stock Type </td>
                <td width="20%">Address</td>
                <td width="19%">Gross Value</td>
                <td width="18%">Net Value (after Margin) </td>
                <td width="8%">&nbsp;</td>
              </tr>
            </thead>
            <tbody>
        <%
        	HashMap stockMap = (HashMap)((IGeneralCharge)itrxValue.getStagingCollateral()).getStocks();
        	if (stockMap == null || stockMap.isEmpty()) {
        %>
        	<tr class="odd">
        		<td colspan="7">There is no stock information</td>
        	</tr>
        <%
    		} else {
	        	Collection stockList = (Collection)stockMap.keySet();
	        	
	        	String[] stockIDList = null;
	        	if (stockList != null) {
		        	stockIDList = (String[])stockList.toArray(new String[0]);
		        	Arrays.sort(stockIDList);
	        	}
	    		for (int i = 0; i < stockIDList.length; i++) {
		    		IStock stock = (IStock)stockMap.get(stockIDList[i]);
        %>
              <tr class="<%=(i%2==0)?"odd":"even"%>">
                <td class="index" valign="top"><%=i+1%></td>
                <td valign="top"><integro:empty-if-null value="<%=stock.getStockID()%>"/>&nbsp;</td>
                <td  valign="top">
                <%
                	String[] stockTypeList = stock.getStockType();
                	if (stockTypeList != null) {
	                	for (int j = 0; j < stockTypeList.length; j++) {
                %>
                			<integro:empty-if-null value="<%=stockTypeList[j]%>"/>
                <%
            		} }
                %>
                &nbsp;
                </td>
                <td valign="top"><integro:wrapper value="<%=stock.getAddress()%>"/>&nbsp;</td>
                <td  valign="top" class="amount">
                <%
                	String strGrossValue = AssetGenChargeUtil.getCMSAmount(((OBStock)stock).getCalculatedGrossValue(), ccy, locale);
                %>
                <integro:empty-if-null value="<%=strGrossValue%>"/>&nbsp;
                </td>
                <td  valign="top" class="amount">
                <%
                	String strNetValue = AssetGenChargeUtil.getCMSAmount(((OBStock)stock).getCalculatedNetValue(), ccy, locale);
                %>
                <integro:empty-if-null value="<%=strNetValue%>"/>&nbsp;
                </td>
                <td valign="top" style="text-align:center " >
                	<html:multibox property="insuranceLinks" value="<%=stock.getStockID()%>"/>
                </td>
              </tr>
        <%
    			}
    		}
        %>
            </tbody>
          </table>
        <%
    		} else {
        %> 
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="5%">S/N</td>
              <td width="15%">FAO ID </td>
              <td width="20%">Description</td>
              <td width="20%">Address</td>
              <td width="16%">Gross Value</td>
              <td width="16%">Net Value (after Margin) </td>
              <td width="8%">&nbsp;</td>
            </tr>
          </thead>
          <tbody>
          <%
          	HashMap faoMap = (HashMap)((IGeneralCharge)itrxValue.getStagingCollateral()).getFixedAssetOthers();
        	if (faoMap == null || faoMap.isEmpty()) {          	
          %>
        	<tr class="odd">
        		<td colspan="7">There is no fixed asset/ others information</td>
        	</tr>
          <%
      		} else {
	      		Collection faoList = (Collection)faoMap.keySet();
	        	String[] faoIDList = null;
	        	if (faoList != null) {
		        	faoIDList = (String[])faoList.toArray(new String[0]);
		        	Arrays.sort(faoIDList);
	        	}
	      		for (int i = 0; i < faoIDList.length; i++) {
		      		IFixedAssetOthers fao = (IFixedAssetOthers)faoMap.get(faoIDList[i]);
          %>
            <tr class="<%=(i%2==0)?"odd":"even"%>">
              <td class="index" valign="top"><%=i+1%></td>
              <td valign="top"><integro:empty-if-null value="<%=fao.getFAOID()%>"/>&nbsp;</td>
              <td  valign="top"><integro:wrapper value="<%=fao.getDescription()%>"/>&nbsp;</td>
              <td valign="top"><integro:wrapper value="<%=fao.getAddress()%>"/>&nbsp;</td>
              <td  valign="top" class="amount">
                <%
                	String strGrossValue = AssetGenChargeUtil.getCMSAmount(((OBFixedAssetOthers)fao).getGrossValue(), ccy, locale);
                %>
                <integro:empty-if-null value="<%=strGrossValue%>"/>&nbsp;
              </td>
              <td  valign="top" class="amount">
                <%
                	String strNetValue = AssetGenChargeUtil.getCMSAmount(((OBFixedAssetOthers)fao).getCalculatedNetValue(), ccy, locale);
                %>
                <integro:empty-if-null value="<%=strNetValue%>"/>&nbsp;
              </td>
              <td valign="top" style="text-align:center " >
              	<html:multibox property="insuranceLinks" value="<%=fao.getFAOID()%>"/>
              </td>
            </tr>
          <%
      			}
      		}
          %>
          </tbody>
        </table>        
        <% } %>
        </td>
		</tr>
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
