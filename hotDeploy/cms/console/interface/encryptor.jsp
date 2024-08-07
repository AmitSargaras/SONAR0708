<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				com.integrosys.base.businfra.login.PasswordUtil,
				com.integrosys.base.techinfra.crypto.CryptoManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
  
  
<html>
<head>
<title>Encryption Viewer</title>
<%@ include file="/console/console_include.jsp" %>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Text Encryption</strong></td>
  </tr>
</table><br>


<%
	String status = request.getParameter("status");
	if ((status == null) || status.equals(""))
	{
		status = "";
	}
	
	String subjectText = request.getParameter("inputtext");
	if ((subjectText == null) || subjectText.equals(""))
	{
		subjectText = "";
	}
	
	String resultText = "";
	String clearText = subjectText;
	
	CryptoManager sec = new CryptoManager("Hex", PropertyManager.getValue("encryption.provider"));
	//System.out.println("BYTE ARRAY LENGTH BEFORE ENCRYPT  : >>>" + clearText.getBytes().length + "<<<");

	if ("encrypt".equalsIgnoreCase(status)) {
		resultText = sec.encrypt(clearText);
	}
	else if ("hash".equalsIgnoreCase(status)) {
		resultText = PasswordUtil.getPasswordHash(clearText);
	}

	if ((resultText == null) || resultText.equals("")) {
		resultText = "";
	}

%>


<form name="myform" action="encryptor.jsp" class="niceform" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="80" align="left">Method:</td>
			<td align="left">
				<select name="status" size="1">
					<option <%= ("".equals(status)) ? "selected" : "" %> value="">Please Select</option>
					<option <%= ("encrypt".equals(status)) ? "selected" : "" %> value="encrypt">Encrypt</option>
					<option <%= ("hash".equals(status)) ? "selected" : "" %> value="hash">Hash</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="80" align="left">Text:</td>
			<td align="left">
				<input type="text" name="inputtext" size="80" maxlength="255" value="<%= subjectText %>" />
			</td>			
		</tr>
		<tr>
			<td width="80" align="left">&nbsp;</td>
			<td align="left">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td width="80" align="left">Result:</td>
			<td align="left">
				<textarea name="soft" id="soft" rows="12" cols="70" WRAP=SOFT READONLY><%= resultText %></textarea>
			</td>
		</tr>
		<tr>
			<td width="80" align="left">&nbsp;</td>
			<td align="left">
				&nbsp;
			</td>
		</tr>
		<tr>
			<td align="left">&nbsp;</td>
			<td align="left">
				<input type="submit" value=" Submit "/>
			</td>
		</tr>
	</table>
</form>

	<center>
		<hr>
		<a href="encryptor.jsp"><img src="<%=request.getContextPath()%>/img/refresh1.gif" border="0"></a>
	</center>


</body>
</html>

