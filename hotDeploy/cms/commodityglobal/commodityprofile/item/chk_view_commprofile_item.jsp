<%@ page import="com.integrosys.cms.ui.commodityglobal.commodityprofile.item.CommProfileItemAction,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.item.CommProfileItemForm,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.commodity.main.bus.ArithmeticSymbolEnum,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.app.commodity.main.bus.profile.ISupplier,
                 com.integrosys.cms.app.commodity.main.bus.profile.IBuyer,
                 java.util.Collection,
                 java.util.Arrays,
                 java.util.Iterator,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfConstants"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String from_event = request.getParameter("from_event");

    CommProfileItemForm aForm = (CommProfileItemForm)request.getAttribute("CommProfileItemForm");

    IProfile actual = (IProfile)request.getAttribute("actualProfile");
    IProfile staging = (IProfile)request.getAttribute("stageProfile");
    Collection actualSupplier = null;
    Collection stageSupplier = null;
    Collection actualBuyer = null;
    Collection stageBuyer = null;
    if (actual != null) {
        if (actual.getSuppliers() != null) {
            Collection temp = Arrays.asList(actual.getSuppliers());
            Iterator itr = temp.iterator();
            actualSupplier = new ArrayList();
            while (itr.hasNext()) {
                actualSupplier.add(((ISupplier)itr.next()).getName());
            }
        }
        if (actual.getBuyers() != null) {
            Collection temp = Arrays.asList(actual.getBuyers());
            Iterator itr = temp.iterator();
            actualBuyer = new ArrayList();
            while (itr.hasNext()) {
                actualBuyer.add(((IBuyer)itr.next()).getName());
            }
        }
    }
    if (staging != null) {
        if (staging.getSuppliers() != null) {
            Collection temp = Arrays.asList(staging.getSuppliers());
            Iterator itr = temp.iterator();
            stageSupplier = new ArrayList();
            while (itr.hasNext()) {
                stageSupplier.add(((ISupplier)itr.next()).getName());
            }
        }
        if (staging.getBuyers() != null) {
            Collection temp = Arrays.asList(staging.getBuyers());
            Iterator itr = temp.iterator();
            stageBuyer = new ArrayList();
            while (itr.hasNext()) {
                stageBuyer.add(((IBuyer)itr.next()).getName());
            }
        }
    }

%>

<script language="JavaScript" type="text/javascript" src="js/itgTextfieldList.js"></script>
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>


<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage() {
    document.forms[0].event.value = "read_return";
    document.forms[0].submit();
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

function delOption(selection)
{
    var length=selection.length, i=0, index=0;
    for(i=(length-1);i>=0;i--)
    {
        if (selection.options[i].selected)
        {
            selection.options[i].selected=false;
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
            var op = new Option(sTextArea, "@" + sTextArea);
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

//-->
</script>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p>
<html:form action="CommProfileItem.do">
<input type="hidden" name="event" value="<%=CommProfileItemAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>

<table width="77%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <h3>Commodity Profile - Process</h3>
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
          <td class="<%=CompareOBUtil.compOB(staging, actual, "category")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.cmdt.profile.cmdt.sub.type"/></td>
          <td width="30%">
            <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(aForm.getCommodityCategory())%>"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "productType")?"fieldname":"fieldnamediff"%>"  width="20%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#00A0FF">* </font></td>
          <td width="30%">
            <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(aForm.getCommodityCategory(), aForm.getProductType())%>"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "productSubType")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font color="#00A0FF">* </font></td>
          <td>
            <bean:write name="CommProfileItemForm" property="productSubType"/>&nbsp;
          </td>
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="30%">
            &nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "differentialSign")?"fieldname":"fieldnamediff"%>">(+) or (-)</td>
          <td width="30%">
            <%  if (aForm.getPlusmn() != null) {
                if (aForm.getPlusmn().equals(CommodityConstant.SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getPlusmn().equals(CommodityConstant.SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getPlusmn().equals(CommodityConstant.SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
          </td>
          <td class="<%=CompareOBUtil.compOB(staging, actual, "priceDifferential")?"fieldname":"fieldnamediff"%>">Commodity Price Differential </td>
          <td>
            <bean:write name="CommProfileItemForm" property="commPriceDiff"/>&nbsp;
          </td>
        </tr>
        <%
            if (IProfile.PRICE_TYPE_FUTURES.equals( aForm.getPriceType())) {
        %>
        <tr>
        <td colspan="4" class="<%=CompareOBUtil.compOB(staging, actual, "priceType")?"":"fieldnamediff"%>">
            <h3>Futures&nbsp;<font color="#0000FF">* </font></h3>
        </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(staging, actual, "marketName")?"fieldname":"fieldnamediff"%>">Market Name&nbsp;<font color="#0000FF">*</font></td>
          <td>
                <bean:write name="CommProfileItemForm" property="marketName"/>&nbsp;
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr class="even">
        <%
                if (aForm.getRicFuturesChoice().equals(IProfile.RIC_TYPE_FUTURES)) {
        %>
        <td class="<%=CompareOBUtil.compOB(staging, actual, "reuterSymbol")?"fieldname":"fieldnamediff"%>">
            RIC Futures&nbsp;<font color="#0000FF">*</font>
        </td>
        <td>
            <bean:write name="CommProfileItemForm" property="ricFutures"/>&nbsp;
        </td>
        <% } else { %>
        <td class="<%=CompareOBUtil.compOB(staging, actual, "reuterSymbol")?"fieldname":"fieldnamediff"%>">
            RIC (Futures) Options&nbsp;<font color="#0000FF">*</font>
        </td>
        <td>
            <bean:write name="CommProfileItemForm" property="ricFuturesOptions"/>&nbsp;
        </td>
        <% } %>
        <td class="fieldname">&nbsp;</td>
        <td>&nbsp;</td>
        </tr>
        <% 
        	} else if (IProfile.RIC_TYPE_CASH.equals( aForm.getPriceType())) {
	    %>
        <tr>
        <td colspan="4" class="<%=CompareOBUtil.compOB(staging, actual, "priceType")?"":"fieldnamediff"%>">
            <h3>Cash&nbsp;<font color="#0000FF">* </font></h3>
        </td>
        </tr>
        <tr class="odd">
        <td class="<%=CompareOBUtil.compOB(staging, actual, "countryArea")?"fieldname":"fieldnamediff"%>">Country/Area&nbsp;<font color="#0000FF">*</font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="countryArea"/>&nbsp;
        </td>
        <td class="<%=CompareOBUtil.compOB(staging, actual, "outrights")?"fieldname":"fieldnamediff"%>">Outrights&nbsp;<font color="#0000FF">*</font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="outrights"/>&nbsp;
        </td>
        </tr>
        <tr class="even">
        <td class="<%=CompareOBUtil.compOB(staging, actual, "chains")?"fieldname":"fieldnamediff"%>">Chains&nbsp;<font color="#0000FF">*</font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="chains"/>&nbsp;
        </td>
        <td class="<%=CompareOBUtil.compOB(staging, actual, "reuterSymbol")?"fieldname":"fieldnamediff"%>">RIC Cash&nbsp;<font color="#0000FF">*</font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="ricCash"/>&nbsp;
        </td>
        </tr>
        <% 
        	} else {        
        %>
        <tr>
	        <td colspan="4" class="<%=CompareOBUtil.compOB(staging, actual, "priceType")?"":"fieldnamediff"%>">
	            <h3>Non-RIC&nbsp;<font color="#0000FF">* </font></h3>
	        </td>
	    </tr>
        <tr  class="odd">
        	<td  class="<%=CompareOBUtil.compOB(staging, actual, "reuterSymbol")?"fieldname":"fieldnamediff"%>">
        		Non-RIC Commodity Ref Code&nbsp;<font color="#0000FF">*</font>
        	</td>
        	<td>
        		<bean:write name="CommProfileItemForm" property="<%=CMDTProfConstants.FN_NON_RIC_CODE%>"/>&nbsp;
        	</td>
        	<td class="fieldname">
        		&nbsp;
        	</td>
        	<td>
        		&nbsp;
        	</td>
        </tr>
        <tr  class="even">
        	<td class="<%=CompareOBUtil.compOB(staging, actual, "countryArea")?"fieldname":"fieldnamediff"%>">
        		Country&nbsp;<font color="#0000FF">*</font>
        	</td>
        	<td>        		
        		<bean:write name="CommProfileItemForm" property="<%=CMDTProfConstants.FN_COUNTRY%>"/>&nbsp;
        	</td>
        	<td class="<%=CompareOBUtil.compOB(staging, actual, "nonRICDesc")?"fieldname":"fieldnamediff"%>">
        		Non-RIC Description&nbsp;<font color="#0000FF">*</font>
        	</td>
        	<td>
        		<bean:write name="CommProfileItemForm" property="<%=CMDTProfConstants.FN_NON_RIC_DESC%>"/>&nbsp;
        	</td>
        </tr>
        
        <%
    		}
        %>
        <tr><td colspan="4">&nbsp;</td></tr>
        <%
            boolean isSame = true;
            if (actualSupplier != null && stageSupplier == null &&
                    !actualSupplier.isEmpty()) {
                isSame = false;
            } else if (stageSupplier != null && actualSupplier == null &&
                    !stageSupplier.isEmpty()) {
                isSame = false;
            } else if (actualSupplier != null && stageSupplier != null) {
                if (actualSupplier.size() != stageSupplier.size()) {
                    isSame = false;
                } else {
                    Iterator itr = actualSupplier.iterator();
                    while (isSame && itr.hasNext()) {
                        if (!stageSupplier.contains(itr.next())) {
                             isSame = false;
                        }
                    }
                }
            }

        %>
        <tr class="odd">
          <td height="64" class="<%=isSame?"fieldname":"fieldnamediff"%>">
            Supplier Name
          </td>
          <td>
          <%
              String[] supplierList = aForm.getSupplierList();
              if (supplierList != null) {
                  for (int i = 0; i < supplierList.length; i++) {
          %>
                <integro:empty-if-null value="<%=supplierList[i]%>"/><br>
          <% } } %>&nbsp;
          </td>
        <%
            isSame = true;
            if (actualBuyer != null && stageBuyer == null &&
                    !actualBuyer.isEmpty()) {
                isSame = false;
            } else if (stageBuyer != null && actualBuyer == null &&
                    !stageBuyer.isEmpty()) {
                isSame = false;
            } else if (actualBuyer != null && stageBuyer != null) {
                if (actualBuyer.size() != stageBuyer.size()) {
                    isSame = false;
                } else {
                    Iterator itr = actualBuyer.iterator();
                    while (isSame && itr.hasNext()) {
                        if (!stageBuyer.contains(itr.next())) {
                             isSame = false;
                        }
                    }
                }
            }

        %>
          <td height="64" class="<%=isSame?"fieldname":"fieldnamediff"%>">
            Buyer Name
          </td>
          <td>
          <%
              String[] buyerList = aForm.getBuyerList();
              if (buyerList != null) {
                  for (int i = 0; i < buyerList.length; i++) {
          %>
                <integro:empty-if-null value="<%=buyerList[i]%>"/><br>
          <% } } %>&nbsp;
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
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()"   onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>