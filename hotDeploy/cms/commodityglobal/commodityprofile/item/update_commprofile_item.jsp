<%@ page import="com.integrosys.cms.ui.commodityglobal.commodityprofile.item.CommProfileItemAction,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.item.CommProfileItemForm,
                 com.integrosys.cms.app.commodity.main.bus.ArithmeticSymbolEnum,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfConstants"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_event") != null) {
        from_event = request.getParameter("from_event");
    }

    String event = CommProfileItemAction.EVENT_UPDATE;
    String title = null;
    boolean isTransferable = true;
    if (from_event.equals(CommProfileItemAction.EVENT_PREPARE_ADD)) {
        title = "Add New";
        event = CommProfileItemAction.EVENT_ADD;
    } else {
        title = "Edit";
        Boolean isTrans = (Boolean)request.getAttribute("isTransferable");
        if(isTrans!=null){
	        isTransferable = isTrans.booleanValue();
        }
    }
    CommProfileItemForm aForm = (CommProfileItemForm)request.getAttribute("CommProfileItemForm");
    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
    String itemStatus = request.getParameter("isNewItem");
    boolean isNewItem = itemStatus.equals("true");

	String cmdtCategory = (String)request.getAttribute(CMDTProfConstants.FN_CMDT_CATEGORY_ID);
%>

<script language="JavaScript" type="text/javascript" src="js/itgTextfieldList.js"></script>
<style>

table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>


<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num) {
    List = document.forms[0].supplierList;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].buyerList;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    if (num == 1) {
        document.forms[0].event.value = "add";
    }
    if (num == 2) {
        document.forms[0].event.value = "update";
    }
    if (num == 3) {
        document.forms[0].event.value = "cancel";
    }
    document.forms[0].submit();
}

function chooseFutures() {
        document.getElementById('span1').innerText="*";
        if(value1=="o")
           document.getElementById('span2a').innerText="*";
        else
           document.getElementById('span2').innerText="*";
        document.getElementById('span3').innerText=" ";
        document.getElementById('span4').innerText=" ";
        document.getElementById('span5').innerText=" ";
        document.getElementById('span6').innerText=" ";
        document.getElementById('span7').innerText=" ";
        document.getElementById('span8').innerText=" ";
        document.getElementById('span21').innerText="*";
        document.getElementById('span22').innerText=" ";
        document.getElementById('span23').innerText=" ";
        document.forms[0].priceType[0].checked = true;
	    document.forms[0].marketName.disabled = false;
	    document.forms[0].ricFuturesChoice.disabled = false;
	    document.forms[0].ricFuturesChoice[0].disabled = false;
    	document.forms[0].ricFuturesChoice[1].disabled = false;
		disableCash();
		disableNonRIC();
}

function clickCash() {

      document.getElementById('span1').innerText=" ";
      document.getElementById('span2').innerText=" ";
      document.getElementById('span3').innerText="*";
      document.getElementById('span4').innerText="*";
      document.getElementById('span5').innerText="*";
      document.getElementById('span6').innerText="*";
      document.getElementById('span7').innerText=" ";
      document.getElementById('span8').innerText=" ";
      document.getElementById('span21').innerText=" ";
      document.getElementById('span22').innerText="*";
      document.getElementById('span23').innerText=" ";

    document.forms[0].countryArea.disabled = false;
    document.forms[0].outrights.disabled = false;
    document.forms[0].chains.disabled = false;
    document.forms[0].ricCash.disabled = false;
	disableFutures();
	disableNonRIC();
}

function clickNonRIC(){
      document.getElementById('span1').innerText=" ";
      document.getElementById('span2').innerText=" ";
      document.getElementById('span3').innerText=" ";
      document.getElementById('span4').innerText=" ";
      document.getElementById('span5').innerText=" ";
      document.getElementById('span6').innerText=" ";
      document.getElementById('span7').innerText="*";
      document.getElementById('span8').innerText="*";
      document.getElementById('span21').innerText=" ";
      document.getElementById('span22').innerText=" ";
      document.getElementById('span23').innerText="*";

    document.forms[0].<%=CMDTProfConstants.FN_COUNTRY%>.disabled = false;

    document.forms[0].<%=CMDTProfConstants.FN_NON_RIC_DESC%>.value = "";
    document.forms[0].<%=CMDTProfConstants.FN_NON_RIC_DESC%>.disabled = false;

	disableFutures();
	disableCash();
}

function disableFutures(){
    document.forms[0].marketName.value = "";
    document.forms[0].marketName.disabled = true;
    document.forms[0].ricFuturesChoice.value = "";
    document.forms[0].ricFuturesChoice.disabled = true;
    document.forms[0].ricFutures.value = "";
    document.forms[0].ricFutures.disabled = true;
    document.forms[0].ricFuturesOptions.value = "";
    document.forms[0].ricFuturesOptions.disabled = true;
    document.forms[0].ricFuturesChoice[0].checked = false;
    document.forms[0].ricFuturesChoice[0].disabled = true;
    document.forms[0].ricFuturesChoice[1].checked=false;
    document.forms[0].ricFuturesChoice[1].disabled = true;
}

function disableCash(){
    document.forms[0].countryArea.value = "";
    document.forms[0].countryArea.disabled = true;
    document.forms[0].outrights.value = "";
    document.forms[0].outrights.disabled = true;
    document.forms[0].chains.value = "";
    document.forms[0].chains.disabled = true;
    document.forms[0].ricCash.value = "";
    document.forms[0].ricCash.disabled = true;
}

function disableNonRIC(){
	document.forms[0].<%=CMDTProfConstants.FN_COUNTRY%>.disabled = true;
    document.forms[0].<%=CMDTProfConstants.FN_NON_RIC_DESC%>.value = "";
    document.forms[0].<%=CMDTProfConstants.FN_NON_RIC_DESC%>.disabled = true;
}

function clickRicFuture() {
	if(document.forms[0].marketName.disabled == false){
	    document.forms[0].ricFutures.disabled = false;
	    document.forms[0].ricFuturesOptions.vlaue = "";
	    document.forms[0].ricFuturesOptions.disabled = true;
        document.getElementById('span2').innerText="*";
        document.getElementById('span2a').innerText=" ";
    }
}

function clickRicFutureOp() {
	if(document.forms[0].marketName.disabled == false){
	    document.forms[0].ricFuturesOptions.disabled = false;
	    document.forms[0].ricFutures.value = "";
	    document.forms[0].ricFutures.disabled = true;
        document.getElementById('span2').innerText=" ";
        document.getElementById('span2a').innerText="*";
    }
}


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

function refresh() {
    List = document.forms[0].supplierList;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    List = document.forms[0].buyerList;
    for (i=0;i<List.length;i++)
    {
        List.options[i].selected = true;
    }

    document.forms[0].event.value = "<%=CommProfileItemAction.EVENT_REFRESH%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommProfileItem.do">
<input type="hidden" name="event" value="<%=event%>"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="isNewItem" value="<%=itemStatus%>"/>
<table width="77%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <h3>Commodity Profile - <%=title%></h3>
    </td>
  </tr>
  <tr>
    <td><hr /></td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>
      <table width="100%" height="275" border="0" cellpadding="0" cellspacing="0" class="tblInput">
        <thead> </thead> <tbody>
        <tr class="even">
          <td class="fieldname" width="20%"><bean:message key="label.cmdt.profile.cmdt.sub.type"/></td>
          <td width="30%">
        <%--
            if (from_event.equals(CommProfileItemAction.EVENT_PREPARE_ADD) || isNewItem) {
        %>
                <html:select property="commodityCategory" onchange="refresh()">
	            <option value="" >Please Select </option>
	            <html:options name="categoryID" labelName="categoryValue"/>
                </html:select>&nbsp;
                <html:errors property="commodityCategory"/>
          <% } else { --%>
          <integro:empty-if-null value="<%=categoryList.getCommCategoryItem(cmdtCategory)%>"/>&nbsp;
          <html:hidden property="commodityCategory" value="<%=cmdtCategory%>"/>
          <%-- } --%>
          </td>
          <td class="fieldname" width="20%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
        <%
            if (from_event.equals(CommProfileItemAction.EVENT_PREPARE_ADD) || isNewItem) {
        %>
                <html:select property="productType" >
	            <option value="" >Please Select </option>
	            <html:options name="<%=CMDTProfConstants.AN_PRODUCT_TYPE_ID_COLL%>" labelName="<%=CMDTProfConstants.AN_PRODUCT_TYPE_VAL_COLL%>"/>
                </html:select>&nbsp;
                <html:errors property="productType"/>
          <% } else { %>
          <integro:empty-if-null value="<%=categoryList.getCommProductItem(aForm.getCommodityCategory(), aForm.getProductType())%>"/>&nbsp;
          <html:hidden property="productType"/>
          <% } %>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
        <%
            if (from_event.equals(CommProfileItemAction.EVENT_PREPARE_ADD) || isNewItem) {
        %>
            <html:text property="productSubType" maxlength="30"/>
            <html:errors property="productSubType"/>
         <% } else { %>
         <bean:write name="CommProfileItemForm" property="productSubType"/>&nbsp;
         <html:hidden property="productSubType"/>
         <% } %>
          </td>
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="30%">&nbsp;
<%--
                <html:select property="marketUOM" >
	            <option value="" >Please Select </option>
	            <html:options name="marketUOMID" labelName="marketUOMValue"/>
                </html:select>&nbsp;
                <html:errors property="marketUOM"/>
--%>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">(+) or (-)</td>
          <td width="30%">
            <html:radio property="plusmn" value="<%=CommodityConstant.SIGN_PLUS%>">+</html:radio>
            &nbsp;&nbsp;
            <html:radio property="plusmn" value="<%=CommodityConstant.SIGN_MINUS%>">-</html:radio>
            &nbsp;&nbsp;
            <html:radio property="plusmn" value="<%=CommodityConstant.SIGN_PLUS_OR_MINUS%>" disabled="true">&plusmn;</html:radio>
            <html:errors property="plusmn"/>
          </td>
          <td class="fieldname">Commodity Price Differential </td>
          <td>
            <html:text property="commPriceDiff" maxlength="21"/>
            <html:errors property="commPriceDiff"/>
          </td>
        </tr>
        <%
            boolean isPriceTypeFuture = false;
            boolean isPriceTypeCash = false;
            boolean isPriceTypeNonRIC = false;
            if (IProfile.PRICE_TYPE_CASH.equals(aForm.getPriceType())) {
	            isPriceTypeFuture = false;
	            isPriceTypeCash = true;
	            isPriceTypeNonRIC = false;
            }else if (IProfile.PRICE_TYPE_NOC_RIC.equals(aForm.getPriceType())) {
	            isPriceTypeFuture = false;
	            isPriceTypeCash = false;
	            isPriceTypeNonRIC = true;
            }else if (IProfile.PRICE_TYPE_FUTURES.equals(aForm.getPriceType())) {
	            isPriceTypeFuture = true;
	            isPriceTypeCash = false;
	            isPriceTypeNonRIC = false;
            }            
        %>
        <tr>
        <td colspan="4">
            <h3>
            <% if(isTransferable||isPriceTypeCash||isPriceTypeFuture){ %>
   <html:radio property="priceType" value="<%=IProfile.PRICE_TYPE_FUTURES%>" onclick="chooseFutures()">Futures&nbsp;<font color="#0000FF"><span id= "span21">&nbsp;</span></font></html:radio>
            <% }else{ %>
   <html:radio property="priceType" value="<%=IProfile.PRICE_TYPE_FUTURES%>" disabled="true">Futures&nbsp;<font color="#0000FF"><span id= "span21">&nbsp;</span></font></html:radio>
            <% } %>
            &nbsp;<html:errors property="priceType"/>
            </h3>
        </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Market Name&nbsp;<font color="#0000FF"><span id= "span1">&nbsp;</span></font></td>
          <td>
            <html:text property="marketName" disabled="<%=!isPriceTypeFuture%>" maxlength="50"/>&nbsp;
            <html:errors property="marketName"/>
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <%
            boolean isRicFutures = false;
            boolean isRicFuturesOption = false;
            if (aForm.getRicFuturesChoice() != null && aForm.getRicFuturesChoice().length() > 0) {
                if (aForm.getRicFuturesChoice().equals(IProfile.RIC_TYPE_FUTURES)) {
                    isRicFutures = true;
                } else {
                    isRicFuturesOption = true;
                }
            }
        %>
        <tr class="even">
        <td class="fieldname">
            <html:radio property="ricFuturesChoice" value="<%=IProfile.RIC_TYPE_FUTURES%>" onclick="clickRicFuture()">RIC Futures&nbsp;<font color="#0000FF"><span id= "span2">&nbsp;</span></font></html:radio>
        </td>
        <td>
            <html:text property="ricFutures" maxlength="20" disabled="<%=!isRicFutures && !isPriceTypeFuture%>"/>&nbsp;
            <html:errors property="ricFutures"/>    &nbsp;<html:errors property="ricFuturesChoice"/>

        </td>
        <td class="fieldname">
            <html:radio property="ricFuturesChoice" value="<%=IProfile.RIC_TYPE_OPTIONS%>" onclick="clickRicFutureOp()">RIC (Futures) Options&nbsp;<font color="#0000FF"><span id= "span2a">&nbsp;</span></font></html:radio>
        </td>
        <td>
            <html:text property="ricFuturesOptions" maxlength="20" disabled="<%=!isRicFuturesOption && !isPriceTypeFuture%>"/>&nbsp;
            <html:errors property="ricFuturesOptions"/>
        </td>
        </tr>
        <tr>
        <td colspan="4">
            <h3>
            <% if(isTransferable||isPriceTypeCash||isPriceTypeFuture){ %>
        <html:radio property="priceType" value="<%=IProfile.PRICE_TYPE_CASH%>" onclick="clickCash()">Cash&nbsp;<font color="#0000FF"><span id= "span22">&nbsp;</span></font></html:radio>
        	<% }else{ %>
        <html:radio property="priceType" value="<%=IProfile.PRICE_TYPE_CASH%>"  disabled="true">Cash&nbsp;<font color="#0000FF"><span id= "span22">&nbsp;</span></font></html:radio>
        	<% } %>
        	</h3>
        </td>
        </tr>
        <tr class="odd">
        <td class="fieldname">Country/Area&nbsp;<font color="#0000FF"><span id= "span3">&nbsp;</span></font></td>
        <td>
            <html:text property="countryArea" maxlength="50" disabled="<%=!isPriceTypeCash%>"/>&nbsp;
            <html:errors property="countryArea"/>
        </td>
        <td class="fieldname">Outrights&nbsp;<font color="#0000FF"><span id= "span4">&nbsp;</span></font></td>
        <td>
            <html:text property="outrights" maxlength="50" disabled="<%=!isPriceTypeCash%>"/>&nbsp;
            <html:errors property="outrights"/>
        </td>
        </tr>
        <tr class="even">
        <td class="fieldname">Chains&nbsp;<font color="#0000FF"><span id= "span5">&nbsp;</span></font></td>
        <td>
            <html:text property="chains" maxlength="50" disabled="<%=!isPriceTypeCash%>"/>&nbsp;
            <html:errors property="chains"/>
        </td>
        <td class="fieldname">RIC Cash&nbsp;<font color="#0000FF"><span id= "span6">&nbsp;</span></font></td>
        <td>
            <html:text property="ricCash" maxlength="20" disabled="<%=!isPriceTypeCash%>"/>&nbsp;
            <html:errors property="ricCash"/>
        </td>
        </tr>
        <!--	Begin Non-RIC	-->
        <tr>
        <td colspan="4">
            <h3>
            <% if(isTransferable){ %>
            	<html:radio property="priceType" value="<%=IProfile.PRICE_TYPE_NOC_RIC%>" onclick="clickNonRIC()">Non-RIC&nbsp;<font color="#0000FF"><span id= "span23">&nbsp;</span></font></html:radio>
            <% }else{ %>
            	<html:radio property="priceType" value="<%=IProfile.PRICE_TYPE_NOC_RIC%>"  disabled="true">Non-RIC&nbsp;<font color="#0000FF"><span id= "span23">&nbsp;</span></font></html:radio>
        	<% } %>
            </h3>
        </td>
        </tr>
        <tr  class="odd">
        	<td class="fieldname">
        		Non-RIC Commodity Ref Code
        	</td>
        	<td>
         		<bean:write name="CommProfileItemForm" property="nonRICCode"/>&nbsp;
        	</td>
        	<td class="fieldname">
        		&nbsp;
        	</td>
        	<td>
        		&nbsp;
        	</td>
        </tr>
        <tr  class="even">
        	<td class="fieldname">
        		Country&nbsp;<font color="#0000FF"><span id= "span7">&nbsp;</span></font>
        	</td>
        	<td>
                <html:select property="<%=CMDTProfConstants.FN_COUNTRY%>" disabled="<%=!isPriceTypeNonRIC%>">
		            <option value="" >Please Select </option>
		            <html:options name="<%=CMDTProfConstants.AN_COUNTRY_VAL_COLL%>" labelName="<%=CMDTProfConstants.AN_COUNTRY_LAB_COLL%>"/>
                </html:select>&nbsp;
                <html:errors property="<%=CMDTProfConstants.FN_COUNTRY%>"/>
        	</td>
        	<td class="fieldname">
        		Non-RIC Description&nbsp;<font color="#0000FF"><span id= "span8">&nbsp;</span></font>
        	</td>
        	<td>
	            <html:text property="<%=CMDTProfConstants.FN_NON_RIC_DESC%>" maxlength="100" disabled="<%=!isPriceTypeNonRIC%>"/>&nbsp;
	            <html:errors property="<%=CMDTProfConstants.FN_NON_RIC_DESC%>"/>
        	</td>
        </tr>
        <!--	End Non-RIC	-->
        <tr><td colspan="4">&nbsp;</td></tr>
        <tr class="odd">
          <td height="64" class="fieldname">
            <p>Add New Supplier Name</p>
            <p>&nbsp; </p>
          </td>
          <td valign="middle" style="border-left:0;border-right:0;text-align:center">
          <html:text property="supplier" maxlength="150"/>
          </td>
          <td  valign="middle" style="border-left:0;border-right:0;text-align:center">
            <input type="button" name="Button2" value="Add&gt;&gt;" style="width:80" onclick="addTextArea(supplier,supplierList)" class="word"/>
            <br/>
            <br/>
            <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onClick="delOption(supplierList, supplier)" class="word"/>
          </td>
          <td style="border-left:0">Supplier List &nbsp;<html:errors property="supplier"/>
            <br />
            <%
                String[] supplierList = aForm.getSupplierList();
                String style = "";
/*
                if (supplierList == null) {
                    style = "width:100%";
                }
*/
            %>
              <html:select property="supplierList" size="5" multiple="true" style="<%=style%>">
          <%

              if (supplierList != null) {
                  for (int i = 0; i < supplierList.length; i++) {
          %>
                <option value="<%=supplierList[i]%>"><%=supplierList[i]%></option>
          <% } } %>
            </html:select>
          </td>
        </tr>
        <tr class="even">
          <td height="64" class="fieldname">
            <p>Add New Buyer Name</p>
            <p>&nbsp; </p>
          </td>
          <td valign="middle" style="border-left:0;border-right:0;text-align:center">
          <html:text property="buyer" maxlength="150"/>
          </td>
          <td  valign="middle" style="border-left:0;border-right:0;text-align:center">
            <input type="button" name="Button2" value="Add&gt;&gt;" style="width:80" onclick="addTextArea(buyer,buyerList)" class="word"/>
            <br/>
            <br/>
            <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onClick="delOption(buyerList, buyer)" class="word"/>
          </td>
          <td style="border-left:0">Buyer List &nbsp;<html:errors property="buyer"/>
            <br />
            <%
                String[] buyerList = aForm.getBuyerList();
                style = "";
/*
                if (buyerList == null) {
                   style = "width:100%";
                }
*/
            %>
              <html:select property="buyerList" size="5" multiple="true" style="<%=style%>">
          <%
              if (buyerList != null) {
                  for (int i = 0; i < buyerList.length; i++) {
          %>
                <option value="<%=buyerList[i]%>"><%=buyerList[i]%></option>
          <% } } %>
            </html:select>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="75" valign="baseline" align="center">
        <%
            if (from_event.equals(CommProfileItemAction.EVENT_PREPARE_ADD)) {
        %>
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
<script>

    var value = "<%=(aForm!=null?aForm.getPriceType():" ")%>";
    var value1 = "<%=(aForm!=null?aForm.getRicFuturesChoice():" ")%>";

    if(value=='f'){
        document.getElementById('span1').innerText="*";
        if(value1=="o")
           document.getElementById('span2a').innerText="*";
        else
           document.getElementById('span2').innerText="*";
        document.getElementById('span3').innerText=" ";
        document.getElementById('span4').innerText=" ";
        document.getElementById('span5').innerText=" ";
        document.getElementById('span6').innerText=" ";
        document.getElementById('span7').innerText=" ";
        document.getElementById('span8').innerText=" ";
        document.getElementById('span21').innerText="*";
        document.getElementById('span22').innerText=" ";
        document.getElementById('span23').innerText=" ";
    }
    if(value=='c'){
       document.getElementById('span1').innerText=" ";
       document.getElementById('span2').innerText=" ";
       document.getElementById('span3').innerText="*";
       document.getElementById('span4').innerText="*";
       document.getElementById('span5').innerText="*";
       document.getElementById('span6').innerText="*";
       document.getElementById('span7').innerText=" ";
       document.getElementById('span8').innerText=" ";
       document.getElementById('span21').innerText=" ";
       document.getElementById('span22').innerText="*";
       document.getElementById('span23').innerText=" ";
    }
    if(value=='n'){
       document.getElementById('span1').innerText=" ";
       document.getElementById('span2').innerText=" ";
       document.getElementById('span3').innerText=" ";
       document.getElementById('span4').innerText=" ";
       document.getElementById('span5').innerText=" ";
       document.getElementById('span6').innerText=" ";
       document.getElementById('span7').innerText="*";
       document.getElementById('span8').innerText="*";
       document.getElementById('span21').innerText=" ";
       document.getElementById('span22').innerText=" ";
       document.getElementById('span23').innerText="*";
    }
    if(value!='n' && value!='c' && value!='f'){
       document.getElementById('span21').innerText="*";
    }


</script>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>