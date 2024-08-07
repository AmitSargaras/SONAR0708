<%@ page import="com.integrosys.cms.ui.feed.propertyindex.item.PropertyIndexItemAction,
                 com.integrosys.cms.ui.feed.propertyindex.item.PropertyIndexItemAction,
                 com.integrosys.cms.ui.feed.propertyindex.item.PropertyIndexItemForm,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.feed.trx.propertyindex.IPropertyIndexFeedGroupTrxValue,
                 com.integrosys.cms.app.feed.bus.propertyindex.IPropertyIndexFeedGroup,
                 com.integrosys.base.businfra.currency.ICurrency,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.*"
                 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
*  $Header: /home/cms2/cvsroot/cms2/public_html/feed/property_index/item/prepare.jsp,v 1.8 2006/10/27 08:44:06 hmbao Exp $
*
* Input form for adding property index
* Purpose: Display input form for adding property index
* Description:
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.8 $
* Date: $Date: 2006/10/27 08:44:06 $
* Tag: $Name:  $
*/
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function submitForm() {
	document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].event.value = "<%=PropertyIndexItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>


<!-- InstanceBeginEditable name="Content" -->

<%
    // Get the property index feed group trx value from session.
    IPropertyIndexFeedGroupTrxValue feedGroupTrxValue = (IPropertyIndexFeedGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.feed.propertyindex.PropertyIndexAction.propertyIndexFeedGroupTrxValue");

    IPropertyIndexFeedGroup stagingFeedGroup = feedGroupTrxValue.
            getStagingPropertyIndexFeedGroup();

    CountryList countryList = CountryList.getInstance();
    String countryName = countryList.getCountryName(stagingFeedGroup.getSubType());

%>

<html:form action="feed_property_index_item.do">
	<input type="hidden" name="event" value="<%=PropertyIndexItemAction.EVENT_SAVE%>"/>
	<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td><h3><%=countryName%> - New</h3></td>
			</tr>
			<tr>
				<td><hr /></td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname">Type&nbsp;<font color="#0000FF">* </font></td>
								<td>
									<html:text property="type" size="50" maxlength="50"/>
									<html:errors property="type"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Region&nbsp;<font color="#0000FF">* </font></td>
								<td>
									<html:text property="region" size="30" maxlength="30"/>
									<html:errors property="region"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Index&nbsp;<font color="#0000FF">* </font></td>
								<td>
									<html:text property="unitPrice" maxlength="14"/>
									<html:errors property="unitPrice"/>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>

	<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td width="91">&nbsp;</td>
			<td width="59">&nbsp;</td>
		</tr>
		<tr>
			<td>
				<a href="#" onClick="submitForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image1" width="60" height="22" border="0" id="Image1" /></a>
			</td>
			<td>
				<a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a>
			</td>
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
