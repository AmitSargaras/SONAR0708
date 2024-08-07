<%@ page import="com.integrosys.cms.ui.feed.exchangerate.item.ExchangeRateItemAction,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.Collection,
                 com.integrosys.base.businfra.currency.ICurrency,
                 java.util.Enumeration,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Iterator,
                 java.util.List,
                 com.integrosys.cms.ui.feed.exchangerate.item.ExchangeRateItemForm" %>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>                     
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
List restrictionTypeList = (List)session.getAttribute("com.integrosys.cms.ui.feed.exchangerate.item.ExchangeRateItemAction.restrictionTypeList");
pageContext.setAttribute("restrictionTypeList",restrictionTypeList);
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->
    
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
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

function submitForm() {
    document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].event.value = "<%=ExchangeRateItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

//-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>



<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><h3>Exchange Rate - New</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>

        <html:form action="feed_exchange_rate_item.do">
        <input type="hidden" name="event" value="<%=ExchangeRateItemAction.EVENT_SAVE%>"/>

        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead></thead> <tbody>
                    <tr class="even">
                        <td class="fieldname" width="29%">System Code &nbsp;<font color="red">* </font></td>
                        <td width="72%" >
                        <html:text property="currencyCode" size="15" maxlength="4"/>
                        <html:errors property="currencyCodeError"/>
                        <html:errors property="currencyCode"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname" >Currency Description<font color="red">* </font>
                        <br/><bean:message key="error.string.currency.name"/></td>
                        <td  id="descriptionText">
                             <html:text property="currencyDescription" size="15" maxlength="50"/>
                             <html:errors property="currencyDescriptionError"/>
                        </td>
                    </tr>
                     <tr class="even">
                        <td class="fieldname" >Currency ISO Code&nbsp;<font color="red">*</font></td>
                        <td width="72%" class="currency">
                            <html:text property="currencyIsoCode" size="15" maxlength="4" style="text-transform: uppercase" />
                            <html:errors property="currencyISOCodeError"/>
                            <html:errors property="currencyISOCode"/>

                        </td>
                    </tr>
                    <tr class="even">
                        <td class="fieldname" >Update Exchange Rate&nbsp;<font color="red">* </font></td>
                        <td width="72%" class="currency">
                            <html:text property="unitPrice" size="15" maxlength="7" styleId="unitPrice" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                            <html:errors property="unitPrice"/>

                        </td>
                    </tr>
                     <tr>
	                    <td class="fieldname" width="20%">Restriction Type <font color="red">*</font></td>
						<td>
              
			           <html:select  property="restrictionType" >
						<integro:common-code categoryCode="<%=CategoryCodeConstant.RESTRICTION_TYPE%>" descWithCode="false" />
			           </html:select>
			           <html:errors property="restrictionTypeError"/>
                            <html:errors property="restrictionType"/>
                             </td>
					</tr>
                   
                </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<html:hidden property="status" value="ENABLE"/>
<table width="120" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td >&nbsp;</td>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
            <img src="img/ok1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a></td>
        <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2"/></a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>