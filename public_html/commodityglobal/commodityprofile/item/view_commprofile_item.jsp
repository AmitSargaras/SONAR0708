<%@ page import="com.integrosys.cms.ui.commodityglobal.commodityprofile.item.CommProfileItemAction,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.item.CommProfileItemForm,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfConstants"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String from_event = request.getParameter("from_event");

    CommProfileItemForm aForm = (CommProfileItemForm)request.getAttribute("CommProfileItemForm");
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/javascript" src="js/itgTextfieldList.js"></script>
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>


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
<!-- InstanceEndEditable -->
</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body onload="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommProfileItem.do">
<input type="hidden" name="event" value="<%=CommProfileItemAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>

<table width="77%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <h3>Commodity Profile - View</h3>
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
            <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(aForm.getCommodityCategory())%>"/>
          </td>
          <td class="fieldname"  width="20%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
            <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(aForm.getCommodityCategory(), aForm.getProductType())%>"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <bean:write name="CommProfileItemForm" property="productSubType"/>
          </td>
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="30%">
            &nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">(+) or (-)</td>
          <td width="165">
            <%  if (aForm.getPlusmn() != null) {
                if (aForm.getPlusmn().equals(CommodityConstant.SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getPlusmn().equals(CommodityConstant.SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getPlusmn().equals(CommodityConstant.SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
          </td>
          <td class="fieldname">Commodity Price Differential </td>
          <td>
            <bean:write name="CommProfileItemForm" property="commPriceDiff"/>&nbsp;
          </td>
        </tr>
        <%
            if (IProfile.PRICE_TYPE_FUTURES.equals(aForm.getPriceType())) {
        %>
        <tr>
        <td colspan="4">
            <h3>Futures&nbsp;<font color="#0000FF">* </font></h3>
        </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Market Name&nbsp;<font color="#0000FF">* </font></td>
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
        <td class="fieldname">
            RIC Futures&nbsp;<font color="#0000FF">* </font>
        </td>
        <td>
            <bean:write name="CommProfileItemForm" property="ricFutures"/>&nbsp;
        </td>
        <% } else { %>
        <td class="fieldname">
            RIC (Futures) Options&nbsp;<font color="#0000FF">* </font>
        </td>
        <td>
            <bean:write name="CommProfileItemForm" property="ricFuturesOptions"/>&nbsp;
        </td>
        <% } %>
        <td class="fieldname">&nbsp;</td>
        <td>&nbsp;</td>
        </tr>
        <% 
        	} else if (IProfile.RIC_TYPE_CASH.equals(aForm.getPriceType())) {
	    %>
        <tr>
        <td colspan="4">
            <h3>Cash&nbsp;<font color="#0000FF">* </font></h3>
        </td>
        </tr>
        <tr class="odd">
        <td class="fieldname">Country/Area&nbsp;<font color="#0000FF">* </font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="countryArea"/>&nbsp;
        </td>
        <td class="fieldname">Outrights&nbsp;<font color="#0000FF">* </font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="outrights"/>&nbsp;
        </td>
        </tr>
        <tr class="even">
        <td class="fieldname">Chains&nbsp;<font color="#0000FF">* </font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="chains"/>&nbsp;
        </td>
        <td class="fieldname">RIC Cash&nbsp;<font color="#0000FF">* </font></td>
        <td>
            <bean:write name="CommProfileItemForm" property="ricCash"/>&nbsp;
        </td>
        </tr>
        <% 
        	} else {        
        %>
        <tr>
	        <td colspan="4">
	            <h3>Non-RIC&nbsp;<font color="#0000FF">* </font></h3>
	        </td>
	    </tr>
        <tr  class="odd">
        	<td  class="fieldname">
        		Non-RIC Commodity Ref Code
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
        	<td class="fieldname">
        		Country&nbsp;<font color="#0000FF">* </font>
        	</td>
        	<td>        		
        		<bean:write name="CommProfileItemForm" property="<%=CMDTProfConstants.FN_COUNTRY%>"/>&nbsp;
        	</td>
        	<td class="fieldname">
        		Non-RIC Description&nbsp;<font color="#0000FF">* </font>
        	</td>
        	<td>
        		<bean:write name="CommProfileItemForm" property="<%=CMDTProfConstants.FN_NON_RIC_DESC%>"/>&nbsp;
        	</td>
        </tr>
        
        <%
    		}
        %>
        <tr><td colspan="4">&nbsp;</td></tr>
        <tr class="odd">
          <td class="fieldname">
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
          <td height="64" class="fieldname">
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
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
