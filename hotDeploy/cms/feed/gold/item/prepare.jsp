<%@ page
	import="com.integrosys.cms.ui.feed.gold.item.GoldItemAction,com.integrosys.cms.ui.common.CurrencyList,java.util.Collection,com.integrosys.base.businfra.currency.ICurrency,java.util.Enumeration,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.Iterator,com.integrosys.cms.ui.feed.gold.item.GoldItemForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
</style>

<%
	GoldItemForm actionForm = (GoldItemForm) pageContext.findAttribute("goldItemForm");

	CurrencyList currencyList = CurrencyList.getInstance();
	Collection currencyLabels = (Collection) request.getAttribute("currencyLabels");
	Collection currencyValues = (Collection) request.getAttribute("currencyValues");
	pageContext.setAttribute("currencyLabels", currencyLabels);
	pageContext.setAttribute("currencyValues", currencyValues);

	String arrayContents = "";

	// Iterate over the currencyValues collection and get the country names
	// into arrayContents.
	String countryName = null;
	for (Iterator iter = currencyValues.iterator(); iter.hasNext();) {
		countryName = currencyList.getCountryName((String) iter.next());
		if (countryName == null) {
			countryName = "";
		}
		arrayContents = arrayContents + ",\"" + countryName + "\"";
	}

	if (!arrayContents.equals("")) {
		// Remove the first comma.
		arrayContents = arrayContents.substring(1);
	}

	DefaultLogger.debug(this, "arrayContents = " + arrayContents);

	if (actionForm.getCurrencyCode() == null || actionForm.getCurrencyCode().equals("")) {
		// Get the first option in the list.
		actionForm.setCurrencyCode((String) currencyValues.iterator().next());
	}
	
	String[] style = {"odd", "even"};

	DefaultLogger.debug(this, "currency code = " + actionForm.getCurrencyCode());
%>

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
    document.forms[0].event.value = "<%=GoldItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

function change(selectObj) {

    // Form the array every time.
    var arr = new Array(<%=arrayContents%>);
    document.getElementById("descriptionText").innerHTML = arr[selectObj.selectedIndex];
}

//-->
    </script>
<!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp"%>
<br>



<html:form action="feed_gold_item.do">
	<input type="hidden" name="event"
		value="<%=GoldItemAction.EVENT_SAVE%>" />
	<table width="60%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
				<h3>Gold - New</h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>


			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInput">
					<thead></thead>
					<tbody>
					<% int count = 1; %>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname">Gold Grade&nbsp;<font
								color="#0000FF">* </font></td>
							<td><html:select property="goldGradeNum">
								<html:options name="goldGradeValues" labelName="goldGradeLabels" />
							</html:select> <html:errors property="goldGradeNum" />
							</td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname">Unit of Measurement&nbsp;<font
								color="#0000FF">* </font></td>
							<td><html:select property="unitMeasurementNum">
								<html:options name="goldUOMValues" labelName="goldUOMLabels" />
							</html:select> <html:errors property="unitMeasurementNum" />
							</td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname">Unit Price&nbsp;<font
								color="#0000FF">* </font></td>
							<td width="72%" class="currency"><html:text
								property="unitPrice" size="15" maxlength="14" /> <html:errors
								property="unitPrice" /></td>
						</tr>
						<tr class="<%=style[count++%2]%>">
							<td class="fieldname" width="29%">Currency Code&nbsp;<font
								color="#0000FF">* </font></td>
							<td width="72%"><html:select property="currencyCode">
								<html:options name="currencyValues" labelName="currencyLabels" />
							</html:select> <html:errors property="currencyCode" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>

	<table width="120" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a href="#" onmouseout="MM_swapImgRestore()"
				onClick="submitForm();"
				onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)"> <img
				src="img/ok1.gif" name="Image1" width="60" height="22" border="0"
				id="Image1" /></a></td>
			<td><a href="#" onClick="cancelForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"> <img
				src="img/cancel1.gif" name="Image2" width="70" height="20"
				border="0" id="Image2" /></a></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>