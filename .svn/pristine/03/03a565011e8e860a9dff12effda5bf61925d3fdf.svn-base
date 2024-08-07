<%@ page import="com.integrosys.cms.ui.srp.SRPAction,
                 com.integrosys.cms.ui.srp.SRPForm,
                 com.integrosys.cms.app.collateral.bus.ICollateralType,
                 java.util.*,
                 com.integrosys.cms.app.collateral.trx.ICollateralSubTypesTrxValue,
                 com.integrosys.cms.app.collateral.trx.ICollateralParametersTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralSubType,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralParameter"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/srp/selectSRP.jsp,v 1.1 2003/06/27 13:21:13 jtan Exp $
     *
     * This page will display the security items for user to input the
     * percentages.
     *
     * @author $Author: btchng $<br>
     * @version $Revision: 1.1 $
     * @since $Date: 2003/06/27 13:21:13 $
     * Tag: $Name:  $
     */
%>

<%
    // Get the ActionForm.
    SRPForm srpForm = (SRPForm)pageContext.findAttribute("srpForm");
    // srpForm must not be null.

    ICollateralParametersTrxValue value = (ICollateralParametersTrxValue)
            session.getAttribute(
                    "com.integrosys.cms.ui.srp.SRPAction.collateral.parameters.trx.value");

    // Extract the correct country name and security type name for display
    // from the session and the form inputs.
    List countryValuesList = (List)session.getAttribute(
            "com.integrosys.cms.ui.srp.SRPAction.countries.values.list");
    List countryLabelsList = (List)session.getAttribute(
            "com.integrosys.cms.ui.srp.SRPAction.countries.labels.list");


    String countryValue = null;
    String countryName = null;
    for (Iterator valueIter = countryValuesList.iterator(),
            labelIter = countryLabelsList.iterator(); valueIter.hasNext();) {
        countryValue = (String)valueIter.next();
        if (countryValue.equals(srpForm.getCountryCode())) {
            countryName = (String)labelIter.next();
            break;
        }
        labelIter.next();
    }

    ICollateralParameter[] collateralParametersArr = value.getCollateralParameters();
    pageContext.setAttribute("collateral.parameters.arr", collateralParametersArr);

    boolean isEditable = true;
    if (value.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)) {
        isEditable = false;
    }

    List collateralSubTypesList = (List)session.getAttribute(
            "com.integrosys.cms.ui.srp.SRPAction.collateral.subtypes.list");

    String collateralTypeName = null;
    ICollateralType collateralSubType = null;
    for (Iterator iter = collateralSubTypesList.iterator(); iter.hasNext();) {
        collateralSubType = (ICollateralType)iter.next();
        if (collateralSubType.getTypeCode().equals(srpForm.getSecurityTypeCode())) {
            collateralTypeName = collateralSubType.getTypeName();
        }
    }
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

// @todo Is this ok ?
function submitForm() {
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
<tr>
<td><h3><%=countryName%> - <%=collateralTypeName%></h3></td>
</tr>
<tr>
<td><hr /></td>
</tr>
</thead>
<tbody>
<tr>
<td><table width="100%" border="0" align="center" cellpadding="0"
        cellspacing="0" class="tblInput">
<thead>
<tr class="tblInfo">
<td width="8%">S/N</td>
<td width="55%">Description</td>
<td width="9%">Max %</td>
<td width="10%">%</td>
<td width="18%">Valuation Frequency</td>
</tr>
</thead>
<tbody>
<html:form action="srp.do">
<input type="hidden" name="event" value="<%=SRPAction.EVENT_SAVE_SRP_CSP%>"/>
<%
    String cssClass = "odd";
%>
<logic:iterate id="securityItem"
        name="com.integrosys.cms.ui.srp.SRPAction.collateral.subtypes.list"
        indexId="counter"
        type="com.integrosys.cms.app.collateral.bus.ICollateralSubType">
<tr class="<%=cssClass%>">
<td class="index"><%=counter.intValue()+1%></td>
<td><%=securityItem.getSubTypeDesc()%><br/></td>
<td style="text-align:right;padding-right:5px"><%=securityItem.getMaxValue()%></td>
<td style="text-align:right;padding-right:5px">
    <% if (isEditable) { %>
    <input type="text" name="percentages"
            value="<%=srpForm.getPercentages(counter.intValue())%>"
            size="3" maxlength="3" style="text-align:right"/>
        <html:errors property="<%=String.valueOf(counter.intValue())%>"/>
    <% } else {
        out.println(srpForm.getPercentages(counter.intValue()));
    } %>
</td>
<td style="text-align:center">
    <% if (isEditable) { %>
    <input name="valuationFrequencies" type="text"
            value="<%=srpForm.getValuationFrequencies(counter.intValue())%>"
            size="3" maxlength="3"/>
    <select name="valuationFrequencyUnits">
        <option value="DAY" <%=srpForm.writeSelectedForValuationFrequencyUnits(
                counter.intValue(), "DAY")%>>Day(s)</option>
        <option value="WEEK" <%=srpForm.writeSelectedForValuationFrequencyUnits(
                counter.intValue(), "WEEK")%>>Week(s)</option>
        <option value="MONTH" <%=srpForm.writeSelectedForValuationFrequencyUnits(
                counter.intValue(), "MONTH")%>>Month(s)</option>
        <option value="YEAR" <%=srpForm.writeSelectedForValuationFrequencyUnits(
                counter.intValue(), "YEAR")%>>Year(s)</option>
    </select>
    <% } else {
        out.println(srpForm.getValuationFrequencies(counter.intValue()));
        out.println("&nbsp;");
        out.println(srpForm.getValuationFrequencyUnits()[counter.intValue()]);
    } %>
</td>
</tr>

<%
    if (cssClass.equals("odd")) {
        cssClass = "even";
    } else {
        cssClass = "odd";
    }
%>
</logic:iterate>

</html:form>
</tbody>
</table>


</tbody>
</table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td width="75">&nbsp;</td>
<td width="74">&nbsp;</td>
</tr>
<tr>
<td><a href="#" onmouseout="MM_swapImgRestore()"
onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"
onClick="submitForm()">
<img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
<td><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>


<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

<!--
<tr class="odd">
<td class="index">1</td>
<td>General Charge<br /></td>
<td style="text-align:right;padding-right:5px">40</td>
<td style="text-align:right;padding-right:5px">
<input name="textfield3" type="text" value="15" size="3" maxlength="3"
style="text-align:right"/>
</td>
</tr>

<tr class="even">
<td class="index">2</td>
<td>Specific Charge - Plant &amp; Machinery<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px">
<input name="textfield29" type="text" value="20" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">3</td>
<td>Specfic Charge - Vehicles<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px"><input name="textfield222" type="text" value="30" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="even">
<td class="index">4</td>
<td>Specific Charge - Other<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px"><input name="textfield232" type="text" value="15" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">5</td>
<td>Receivables assigned - specific invoices via Agent<br /></td>
<td style="text-align:right;padding-right:5px">60</td>
<td style="text-align:right;padding-right:5px"><input name="textfield243" type="text" value="50" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="even">
<td class="index">6</td>
<td>Receivables assigned - general invoices via Agent<br /></td>
<td style="text-align:right;padding-right:5px">50</td>
<td style="text-align:right;padding-right:5px"><input name="textfield252" type="text" value="40" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">7</td>
<td>Receivables assigned - specfic invoices NOT via Agent<br /></td>
<td style="text-align:right;padding-right:5px">40</td>
<td style="text-align:right;padding-right:5px"><input name="textfield262" type="text" value="40" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="even">
<td class="index">8</td>
<td>Receivables - Assigned - Open<br /></td>
<td style="text-align:right;padding-right:5px">15</td>
<td style="text-align:right;padding-right:5px"><input name="textfield272" type="text" value="15" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">9</td>
<td>Post dated cheques<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px"><input name="textfield2816" type="text" value="20" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>
<tr class="odd">
<td class="index">1</td>
<td>General Charge<br /></td>
<td style="text-align:right;padding-right:5px">40</td>
<td style="text-align:right;padding-right:5px">
<input name="textfield3" type="text" value="15" size="3" maxlength="3"
style="text-align:right"/>
</td>
</tr>

<tr class="even">
<td class="index">2</td>
<td>Specific Charge - Plant &amp; Machinery<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px">
<input name="textfield29" type="text" value="20" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">3</td>
<td>Specfic Charge - Vehicles<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px"><input name="textfield222" type="text" value="30" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="even">
<td class="index">4</td>
<td>Specific Charge - Other<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px"><input name="textfield232" type="text" value="15" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">5</td>
<td>Receivables assigned - specific invoices via Agent<br /></td>
<td style="text-align:right;padding-right:5px">60</td>
<td style="text-align:right;padding-right:5px"><input name="textfield243" type="text" value="50" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="even">
<td class="index">6</td>
<td>Receivables assigned - general invoices via Agent<br /></td>
<td style="text-align:right;padding-right:5px">50</td>
<td style="text-align:right;padding-right:5px"><input name="textfield252" type="text" value="40" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">7</td>
<td>Receivables assigned - specfic invoices NOT via Agent<br /></td>
<td style="text-align:right;padding-right:5px">40</td>
<td style="text-align:right;padding-right:5px"><input name="textfield262" type="text" value="40" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="even">
<td class="index">8</td>
<td>Receivables - Assigned - Open<br /></td>
<td style="text-align:right;padding-right:5px">15</td>
<td style="text-align:right;padding-right:5px"><input name="textfield272" type="text" value="15" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>

<tr class="odd">
<td class="index">9</td>
<td>Post dated cheques<br /></td>
<td style="text-align:right;padding-right:5px">30</td>
<td style="text-align:right;padding-right:5px"><input name="textfield2816" type="text" value="20" size="3"  maxlength="3" style="text-align:right"/></td>
</tr>
-->