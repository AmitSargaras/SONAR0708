<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
rowIdx = 0;
%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td><h3>Formal Group Valuation Report</h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
    <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Combined Value Amount </td>
			<td>&nbsp;</td>
			<td class="fieldname">Value No.</td>
			<td>&nbsp;</td>
		</tr>

        </tbody>
        </table>
        
    </td>
</tr>
<tr><td>&nbsp;</td></tr>
</tbody>
</table>

</body>
</html>