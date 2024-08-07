

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				java.io.*
		"%>


<html>
<head>
<%@ include file="/template/stylesheet_template.jsp" %>

<%@ include file="/console/console_include.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/console/css/console.css"/>

<link href="<%=request.getContextPath()%>/css/calendar-blue.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=request.getContextPath()%>/js/calendar.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=request.getContextPath()%>/js/calDriver.js" type="text/javascript"></script>


<STYLE type=text/css>
BODY {
	overflow: auto;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 10px;
}
</STYLE>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxGenericDropdown.js"></script>


</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Dropdown List [via /commoncode/get_common_code.jsp]</td>
  </tr>
</table><br>

<hr>

<br>
<input type="text" name="firstCreditGrantedDate" value="" style="width:120px">
<img src="<%=request.getContextPath()%>/img/calendara.gif"  name="Image14" border="0" id="Image14" onclick="return showCalendar('firstCreditGrantedDate', 'dd/mm/y');"  />
<br><br>

<br><b>Normal Refresh (USING AJAX RETRIEVAL)</b>
<br><br>

<table border="0">
	<tr class="odd">
		<td class="fieldname">
			Nature of Business (17)
		</td>
		<td>
			<select name="17EntryCode" id="categoryCode=17" onclick="refreshGenericDropDownList(this, '<%=request.getContextPath()%>')" size="1">
			<option value="1120" selected>Agriculture Services</option></select>
		</td>
	</tr>
	<tr>
		<td class="fieldname">
			Branch Code (40)
		</td>
		<td>		
			<select name="40EntryCode" id="categoryCode=40" onclick="refreshGenericDropDownList(this, '<%=request.getContextPath()%>')" size="1">
			<option value="49" selected>Klang Branch 2</option></select>
		</td>
	</tr>
	<tr>
		<td class="fieldname">
			OFFICER
		</td>
		<td>		
			<select name="OfficerNEntryCode" id="categoryCode=OFFICER&descWithCode=true" onclick="refreshGenericDropDownList(this, '<%=request.getContextPath()%>')">
			</select>
		</td>
	</tr>

</table>
	
	
<br><br>
<br><b>With Special Dropdown (NO AJAX RETRIEVAL)</b>
<br><br>
<table border="0">
	<tr>
		<td class="fieldname">
			Environment Risk
		</td>
		<td>
			<select name="12EntryCode" id="categoryCode=12" style="position:relative;" onmousedown="generic_dropdown_mousedown(this);" onmouseup="generic_dropdown_mouseup(this);">
				<option value="N" selected>No</option>
				<option value="O" selected>Not Applicable</option>
				<option value="Y" selected>Yes</option>
			</select>
		</td>
	</tr>
</table>

<br><br>
<br><b>With Special Dropdown (USING AJAX RETRIEVAL)</b>
<br><br>
<table border="0">
	<tr>
		<td class="fieldname">
			SOLICITOR
		</td>
		<td>
			<select name="SolicitorEntryCode" id="categoryCode=SOLICITOR&initial=H" style="position:relative;" onmousedown="generic_dropdown_mousedown(this);">
			<option value="SC625   00" selected>HAKEM ARABI &amp; ASSOCIATES</option></select>
		</td>
	</tr>
	<tr>
		<td class="fieldname">
			GOODS_STATUS
		</td>
		<td>		
			<select name="GoodsStatusEntryCode" id="categoryCode=GOODS_STATUS" style="position:relative;" onmousedown="generic_dropdown_mousedown(this);">
			<option value="I" selected>Imported Recondition Registered Used Car</option></select>
		</td>
	</tr>
	<tr>
		<td class="fieldname">
			SCHEME
		</td>
		<td>		
			<select name="SchemeEntryCode" id="categoryCode=SCHEME&descWithCode=true" style="position:relative;" onmousedown="generic_dropdown_mousedown(this);">
			</select>
		</td>
	</tr>
	<tr>
		<td class="fieldname">
			OFFICER
		</td>
		<td>		
			<select name="OfficerEntryCode" id="categoryCode=OFFICER&descWithCode=true&initial=A" style="position:relative;" onmousedown="generic_dropdown_mousedown(this);">
			</select>
		</td>
	</tr>
	<tr>
		<td class="fieldname">
			PRODUCT PACKAGE
		</td>
		<td>		
			<select name="PRODUCT_PACKAGEEntryCode" id="categoryCode=PRODUCT_PACKAGE" style="position:relative;" onmousedown="generic_dropdown_mousedown(this);">
			</select>
		</td>
	</tr>
</table>

<br>

</body>
</html>

