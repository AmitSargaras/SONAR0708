<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction,
                 com.integrosys.cms.app.commodity.main.trx.price.ICommodityPriceTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.price.ICommodityPrice,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceForm,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfHelper,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityprice/update_commodityprice.jsp,v 1.14 2006/07/28 09:33:17 pratheepa Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: pratheepa $<br>
    * @version $Revision: 1.14 $
    * Date: $Date: 2006/07/28 09:33:17 $
    * Tag: $Name:  $
    */
%>
<%
    ICommodityPriceTrxValue trxValue  = (ICommodityPriceTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction.commPriceTrxValue");
    CommodityPriceForm aForm = (CommodityPriceForm)request.getAttribute("CommodityPriceForm");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    String category = categoryList.getCommCategoryItem(trxValue.getCommodityCategoryCode());
    String productType = categoryList.getCommProductItem(trxValue.getCommodityCategoryCode(), trxValue.getCommodityProdTypeCode());
    
    String ricType = request.getParameter("ricType");
    boolean isRIC = !IProfile.PRICE_TYPE_NOC_RIC.equals(ricType);
%>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function setActualDate(cal, date) {
    cal.sel.value = date;
    var name = cal.sel.name;

    if (name.substring(0,5) == 'close') {
        var num = parseInt(name.substring(15, name.length));
        if (document.forms[0].closeUpdateDate.length+'' == 'undefined') {
            document.forms[0].closeUpdateDate.value = date;
        } else {
            document.forms[0].closeUpdateDate[num].value = date;
        }
    } else {
        var num = parseInt(name.substring(17, name.length));
        if (document.forms[0].currentUpdateDate.length+'' == 'undefined') {
            document.forms[0].currentUpdateDate.value = date;
        } else {
            document.forms[0].currentUpdateDate[num].value = date;
        }
    }
}

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "submit";
    }

    if (num == 2) {
        document.forms[0].event.value = "update";
    }
    document.forms[0].submit();
}

function changeAllCheck() {

    var updateObj = document.forms[0].updateCheck;
    var checkedValue = document.forms[0].updateChk.checked;
    
    var checkBoxes = document.getElementsByName('updateCheck');
     if(checkBoxes.length>0){
        if (!updateObj.length) {
        	updateObj.checked = checkedValue;
    	}
    	for (i = 0; i < updateObj.length; i++) {
        	updateObj[i].checked = checkedValue;
    	}
    }
}
//-->
</script>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<html:form action="CommodityPrice.do">
<input type="hidden" name="event" value="<%=CommodityPriceAction.EVENT_SUBMIT%>"/>
<input type="hidden" name="ricType" value="<%=ricType%>" />

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Maintain Commodity Price</h3></td>
      <td valign="bottom"><html:errors property="commodityPriceList"/>
        <html:errors property="updateCheck"/>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/></td>
    </tr>
    <tr>

    </tr>
    <tr>
      <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="even">
          <td width="20%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.sub.type"/>: <%=category%></td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>: <%=productType%></td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>

</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr>
          <td width="3%">S/N</td>
          <td width="15%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/></td>
          <td width="8%"><bean:message key="label.cmdt.profile.cmdt.pri.type"/></td>
          <td width="7%">RIC</td>
          <td width="7%">Market Unit</td>
          <td width="12%">Close Price&nbsp;<font color="#00AAFF">* </font></td>
          <td width="14%">Close Update Date</td>
          <%
          		if(isRIC){
          %>
          <td width="12%">Current Price <br> <font color="#FF0000" size="1"> Do not input data</font></td>
          <td width="14%">Current Update Date <br> <font color="#FF0000" size="1"> Do not input data</font></td>
          <%
      			}
          %>
          <td width="8%">Update
          <input type="checkbox" name="updateChk" value="checkbox" onclick="changeAllCheck()"/>
          All
          </td>
        </tr>
        </thead>
        <tbody>
        <%
            ICommodityPrice[] priceList = trxValue.getStagingCommodityPrice();
            if (priceList == null || priceList.length == 0) {
        %>
        <tr class="odd"><td colspan="10">There is no Commodity Price.</td></tr>
        <%
            } else {
                String[] priceUOM = aForm.getPriceUOM();
                String[] closePriceCcy = aForm.getClosePriceCcy();
                String[] closePriceAmt = aForm.getClosePriceAmt();
                String[] closeUpdateDate = aForm.getCloseUpdateDate();
                String[] currentPriceCcy = aForm.getCurrentPriceCcy();
                String[] currentPriceAmt = aForm.getCurrentPriceAmt();
                String[] currentUpdateDate = aForm.getCurrentUpdateDate();
                for (int i = 0; i < priceList.length; i++) {
	                IProfile profile = priceList[i].getCommodityProfile();
	                String priceType = CMDTProfHelper.getPriceTypeDesc(profile.getPriceType());
                    if (priceUOM[i] == null) priceUOM[i] = "";
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" width="3%"><%=i + 1%></td>
          <td width="15%"><integro:empty-if-null value="<%=profile.getProductSubType()%>"/></td>
          <td width="8%"><integro:empty-if-null value="<%=priceType%>"/></td>
          <td width="7%"><integro:htmltext value="<%=profile.getReuterSymbol()%>"/></td>
          <td width="7%">
                <html:select property="priceUOM" value="<%=priceUOM[i]%>">
                <option value="" >Please Select </option>
	            <html:options name="marketUOMID" labelName="marketUOMValue"/>
                </html:select>&nbsp;
                <% String errPriceUOM = "priceUOM"+String.valueOf(i); %>
                <html:errors property="<%=errPriceUOM%>"/>
          </td>
          <td width="12%">
                <html:select property="closePriceCcy" value="<%=closePriceCcy[i]%>">
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:text property="closePriceAmt" value="<%=closePriceAmt[i]%>" size="15" maxlength="21"/>&nbsp;
                <% String errClosePrice = "closePriceAmt"+String.valueOf(i); %>
                <html:errors property="<%=errClosePrice%>"/>
          </td>
          <td width="14%">
			  <html:text property="closeUpdateDate" readonly="true" size="15" maxlength="11" value="<%=closeUpdateDate[i]%>"/>
              <% String closeDate = "closeUpdateDate" + String.valueOf(i);%>
              <input type="hidden" name="<%=closeDate%>"/>
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%=closeDate%>', 'dd/mm/y', setActualDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="<%=closeDate%>"/>
          </td>
          
          <%
          		if(isRIC){
          %>
          <td width="12%">
                <html:select property="currentPriceCcy" value="<%=currentPriceCcy[i]%>">
	            <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>&nbsp;
                <html:text property="currentPriceAmt" value="<%=currentPriceAmt[i]%>" size="15" maxlength="21"/>&nbsp;
                <% String errCurrentPrice = "currentPriceAmt"+String.valueOf(i); %>
                <html:errors property="<%=errCurrentPrice%>"/>
          </td>
          <td width="14%">
			  <html:text property="currentUpdateDate" readonly="true" size="15" maxlength="11" value="<%=currentUpdateDate[i]%>"/>
              <% String currentDate = "currentUpdateDate"+String.valueOf(i); %>
              <input type="hidden" name="<%=currentDate%>"/>
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%=currentDate%>', 'dd/mm/y', setActualDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="<%=currentDate%>"/>
          </td>
          
          <%
      			}
          %>
          <td width="8%">
            <html:multibox property="updateCheck" value="<%=String.valueOf(i)%>"/>
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
    <tr><td>
    Note : New Commodity Products will only be displayed if it has been created in Commodity Profile.
    </td></tr>
    <tr><td>&nbsp;</td></tr>
  </tbody>
</table>
<% if (trxValue != null && trxValue.getStatus() != null &&
        trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td class="fieldname" width="39%">Remarks</td>
        <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="remarks"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">Last Action By</td>
        <td class="even"><%=trxValue!=null?trxValue.getUserInfo():""%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname">Last Remarks Made</td>
        <td><% if (trxValue != null) { %>
            <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
            <% } %>&nbsp;
       </td>
    </tr>
    </tbody>
</table>
<% } %>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31" border="0" id="Image3" /></a></td>
    <%
        if (trxValue.getStatus() != null &&
                (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT))) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image21" border="0" id="Image2" /></a></td>
    <% } else { %>
    <td><a href="CommodityPrice.do?event=select&ricType=<%=ricType%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image21" border="0" id="Image2" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</html:form>