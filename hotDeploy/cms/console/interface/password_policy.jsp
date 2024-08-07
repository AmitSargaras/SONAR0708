<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<HTML>
<HEAD>
<title>Password Policy</title>

<%@ include file="/console/console_include.jsp" %>

<STYLE type=text/css>
.invalidInput {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px
}
.validInput {
	PADDING-RIGHT: 1px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px
}
.invalidInput {
	BORDER-RIGHT: #f00 1px solid; BORDER-TOP: #f00 1px solid; BORDER-LEFT: #f00 1px solid; BORDER-BOTTOM: #f00 1px solid
}
.validInput {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; BORDER-LEFT: #fff 1px solid; BORDER-BOTTOM: #fff 1px solid
}
</STYLE>

<SCRIPT type=text/javascript>

// Patterns
var formValidationMasks = new Array();
formValidationMasks['email'] = /\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/gi;	// Email
formValidationMasks['numeric'] = /^[0-9]+$/gi;	// Numeric
formValidationMasks['zip'] = /^[0-9]{5}\-[0-9]{4}$/gi;	// Numeric

var formElementArray = new Array();

function validateInput(e, inputObj)
{
	if(!inputObj)inputObj = this;		
	var inputValidates = true;
	
	if (formElementArray[inputObj.name]['required'] && inputObj.tagName=='INPUT' && inputObj.value.length==0) inputValidates = false;
	if (formElementArray[inputObj.name]['required'] && inputObj.tagName=='SELECT' && inputObj.selectedIndex==0) {
		inputValidates = false;
	}
	if (formElementArray[inputObj.name]['mask'] && !inputObj.value.match(formValidationMasks[formElementArray[inputObj.name]['mask']])) inputValidates = false;

	if (formElementArray[inputObj.name]['freemask']) {
		var tmpMask = formElementArray[inputObj.name]['freemask'];
		tmpMask = tmpMask.replace(/-/g,'\\-');
		tmpMask = tmpMask.replace(/S/g,'[A-Z]');
		tmpMask = tmpMask.replace(/N/g,'[0-9]');
		tmpMask = eval("/^" + tmpMask + "$/gi");
		if(!inputObj.value.match(tmpMask))inputValidates = false
	}	
	
	if (formElementArray[inputObj.name]['regexpPattern']) {
		var tmpMask = eval(formElementArray[inputObj.name]['regexpPattern']);
		if(!inputObj.value.match(tmpMask))inputValidates = false
	}
	if (!formElementArray[inputObj.name]['required'] && inputObj.value.length==0 && inputObj.tagName=='INPUT') inputValidates = true;
	
	
	if (inputValidates) {
		inputObj.parentNode.className='validInput';
	} else {
		inputObj.parentNode.className='invalidInput'
	}
}

function isFormValid()
{
	var divs = document.getElementsByTagName('DIV');
	for (var no=0; no<divs.length; no++) {
		if(divs[no].className=='invalidInput')return false;
	}
	return true;	
}

function initFormValidation()
{
	var inputFields = document.getElementsByTagName('INPUT');
	var selectBoxes = document.getElementsByTagName('SELECT');
	
	var inputs = new Array();
	for (var no=0;no<inputFields.length;no++) {
		inputs[inputs.length] = inputFields[no];	
	}
	for (var no=0;no<selectBoxes.length;no++) {
		inputs[inputs.length] = selectBoxes[no];
	}
	for (var no=0;no<inputs.length;no++) {
		var className = inputs[no].parentNode.className;
		if (className && className.indexOf('validInput')>=0) continue;
		var required = inputs[no].getAttribute('required');
		if (!required) required = inputs[no].required;		

		var mask = inputs[no].getAttribute('mask');
		if (!mask) mask = inputs[no].mask;

		var freemask = inputs[no].getAttribute('freemask');
		if (!freemask) freemask = inputs[no].freemask;

		var regexpPattern = inputs[no].getAttribute('regexpPattern');
		if (!regexpPattern) regexpPattern = inputs[no].regexpPattern;

		var div = document.createElement('DIV');
		div.className = 'invalidInput';
		inputs[no].parentNode.insertBefore(div,inputs[no]);
		div.appendChild(inputs[no]);
		div.style.width = (inputs[no].offsetWidth*2) + 'px';

		inputs[no].onblur = validateInput;
		inputs[no].onchange = validateInput;
		inputs[no].onpaste = validateInput;
		inputs[no].onkeyup = validateInput;

		formElementArray[inputs[no].name] = new Array();
		formElementArray[inputs[no].name]['mask'] = mask;
		formElementArray[inputs[no].name]['freemask'] = freemask;
		formElementArray[inputs[no].name]['required'] = required;
		formElementArray[inputs[no].name]['regexpPattern'] = regexpPattern;

		validateInput(false, inputs[no]);

	}	
}

</SCRIPT>

</HEAD>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Password Policy</strong></td>
  </tr>
</table><br>

<% 
	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

	long j_POLICY_ID = 1;
	long j_NUMBER_WARN_DAYS = 7;
	long j_PWD_MAX_AGE = 30;
	long j_MAX_REPEATED_CHARS = 1;
	long j_PWD_MIN_AGE = 1;
	long j_MIN_ALPHA_CHARS = 4;
	long j_PWD_MIN_LENGTH = 6;
	long j_PWD_MAX_LENGTH = 12;
	long j_TIME_EXPIRE_LOCKOUT = 0;
	long j_PWD_HISTORY = 10;

	String s_POLICY_ID = request.getParameter("POLICY_ID");
	if ((s_POLICY_ID == null) || s_POLICY_ID.equals("")) {
		s_POLICY_ID = Long.toString(j_POLICY_ID);
	}
	String s_NUMBER_WARN_DAYS = request.getParameter("NUMBER_WARN_DAYS");
	if ((s_NUMBER_WARN_DAYS == null) || s_NUMBER_WARN_DAYS.equals("")) {
		s_NUMBER_WARN_DAYS = Long.toString(j_NUMBER_WARN_DAYS);
	}
	String s_PWD_MAX_AGE = request.getParameter("PWD_MAX_AGE");
	if ((s_PWD_MAX_AGE == null) || s_PWD_MAX_AGE.equals("")) {
		s_PWD_MAX_AGE = Long.toString(j_PWD_MAX_AGE);
	}
	String s_MAX_REPEATED_CHARS = request.getParameter("MAX_REPEATED_CHARS");
	if ((s_MAX_REPEATED_CHARS == null) || s_MAX_REPEATED_CHARS.equals("")) {
		s_MAX_REPEATED_CHARS = Long.toString(j_MAX_REPEATED_CHARS);
	}
	String s_PWD_MIN_AGE = request.getParameter("PWD_MIN_AGE");
	if ((s_PWD_MIN_AGE == null) || s_PWD_MIN_AGE.equals("")) {
		s_PWD_MIN_AGE = Long.toString(j_PWD_MIN_AGE);
	}
	String s_MIN_ALPHA_CHARS = request.getParameter("MIN_ALPHA_CHARS");
	if ((s_MIN_ALPHA_CHARS == null) || s_MIN_ALPHA_CHARS.equals("")) {
		s_MIN_ALPHA_CHARS = Long.toString(j_MIN_ALPHA_CHARS);
	}
	String s_PWD_MIN_LENGTH = request.getParameter("PWD_MIN_LENGTH");
	if ((s_PWD_MIN_LENGTH == null) || s_PWD_MIN_LENGTH.equals("")) {
		s_PWD_MIN_LENGTH = Long.toString(j_PWD_MIN_LENGTH);
	}
	String s_PWD_MAX_LENGTH = request.getParameter("PWD_MAX_LENGTH");
	if ((s_PWD_MAX_LENGTH == null) || s_PWD_MAX_LENGTH.equals("")) {
		s_PWD_MAX_LENGTH = Long.toString(j_PWD_MAX_LENGTH);
	}
	String s_TIME_EXPIRE_LOCKOUT = request.getParameter("TIME_EXPIRE_LOCKOUT");
	if ((s_TIME_EXPIRE_LOCKOUT == null) || s_TIME_EXPIRE_LOCKOUT.equals("")) {
		s_TIME_EXPIRE_LOCKOUT = Long.toString(j_TIME_EXPIRE_LOCKOUT);
	}
	String s_PWD_HISTORY = request.getParameter("PWD_HISTORY");
	if ((s_PWD_HISTORY == null) || s_PWD_HISTORY.equals("")) {
		s_PWD_HISTORY = Long.toString(j_PWD_HISTORY);
	}
	
	String s_OPERATION = request.getParameter("OPERATION");
	if ((s_OPERATION == null) || s_OPERATION.equals("")) {
		//
	
	} else {

	    try {
			String queryStr = "UPDATE cms_password_policy set NUMBER_WARN_DAYS = " + s_NUMBER_WARN_DAYS + ", PWD_MAX_AGE = " + s_PWD_MAX_AGE + ", MAX_REPEATED_CHARS = " + s_MAX_REPEATED_CHARS + ", PWD_MIN_AGE = " + s_PWD_MIN_AGE + ", MIN_ALPHA_CHARS = " + s_MIN_ALPHA_CHARS + ", PWD_MIN_LENGTH = " + s_PWD_MIN_LENGTH + ", PWD_MAX_LENGTH = " + s_PWD_MAX_LENGTH + ", TIME_EXPIRE_LOCKOUT = " + s_TIME_EXPIRE_LOCKOUT + ", PWD_HISTORY = " + s_PWD_HISTORY + " where POLICY_ID = " + s_POLICY_ID;
			System.out.println("******* queryStr: " + queryStr);
			connProperties = performDatabaseInsertUpdate(datasourcename, schema, queryStr);

			Object temp; 
			temp = connProperties.get("updated");
			if (temp != null) {
				out.println("<font color='blue'><b>Update is successful for " + temp + " record(s)</b></font><br>");
			}

	    } catch (Exception e) {
			e.printStackTrace(System.err);
			out.println("<font color='red'><b>Exception OCCURRED: </b></font><br>" + e.getMessage());

	    } finally {
			closeDatabaseConnection(connProperties);
			connProperties = null;
	    }
	}


    try {
		String queryStr = "select POLICY_ID, NUMBER_WARN_DAYS, PWD_MAX_AGE, MAX_REPEATED_CHARS, PWD_MIN_AGE, MIN_ALPHA_CHARS, PWD_MIN_LENGTH, PWD_MAX_LENGTH, TIME_EXPIRE_LOCKOUT, PWD_HISTORY from cms_password_policy";
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

		while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			j_POLICY_ID = ((java.sql.ResultSet) connProperties.get("rs")).getLong(1);
			j_NUMBER_WARN_DAYS = ((java.sql.ResultSet) connProperties.get("rs")).getLong(2);
			j_PWD_MAX_AGE = ((java.sql.ResultSet) connProperties.get("rs")).getLong(3);
			j_MAX_REPEATED_CHARS = ((java.sql.ResultSet) connProperties.get("rs")).getLong(4);
			j_PWD_MIN_AGE = ((java.sql.ResultSet) connProperties.get("rs")).getLong(5);
			j_MIN_ALPHA_CHARS = ((java.sql.ResultSet) connProperties.get("rs")).getLong(6);
			j_PWD_MIN_LENGTH = ((java.sql.ResultSet) connProperties.get("rs")).getLong(7);
			j_PWD_MAX_LENGTH = ((java.sql.ResultSet) connProperties.get("rs")).getLong(8);
			j_TIME_EXPIRE_LOCKOUT = ((java.sql.ResultSet) connProperties.get("rs")).getLong(9);
			j_PWD_HISTORY = ((java.sql.ResultSet) connProperties.get("rs")).getLong(10);
		}

    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'><b>Exception OCCURRED: </b></font><br>" + e.getMessage());

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }

%>


<FORM class="niceform" 
onsubmit="if (isFormValid()) {  } else { alert('Those fields highlighted in red boxes are not proper. You need to resolve them before you can submit.');return false; }" 
action="password_policy.jsp" method=post>

<FIELDSET>

<TABLE>
  <TBODY>
  <TR>
    <TD><strong>DATABASE SETTING</strong></TD>
    <TD>&nbsp;</TD>
    <TD>&nbsp;</TD></TR>
  
  <TR>
    <TD><LABEL for=POLICY_ID>POLICY_ID:</LABEL></TD>
    <TD><INPUT id=POLICY_ID maxLength=3 size=3 name=POLICY_ID mask="numeric" readonly="readonly" value="<%= j_POLICY_ID %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=NUMBER_WARN_DAYS>NUMBER_WARN_DAYS:</LABEL></TD>
    <TD><INPUT id=NUMBER_WARN_DAYS maxLength=3 size=3 name=NUMBER_WARN_DAYS required="1" mask="numeric" value="<%= j_NUMBER_WARN_DAYS %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=PWD_MAX_AGE>PWD_MAX_AGE:</LABEL></TD>
    <TD><INPUT id=PWD_MAX_AGE maxLength=3 size=3 name=PWD_MAX_AGE required="1" mask="numeric" value="<%= j_PWD_MAX_AGE %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=MAX_REPEATED_CHARS>MAX_REPEATED_CHARS:</LABEL></TD>
    <TD><INPUT id=MAX_REPEATED_CHARS maxLength=3 size=3 name=MAX_REPEATED_CHARS required="1" mask="numeric" value="<%= j_MAX_REPEATED_CHARS %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=PWD_MIN_AGE>PWD_MIN_AGE:</LABEL></TD>
    <TD><INPUT id=PWD_MIN_AGE maxLength=3 size=3 name=PWD_MIN_AGE required="1" mask="numeric" value="<%= j_PWD_MIN_AGE %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=MIN_ALPHA_CHARS>MIN_ALPHA_CHARS:</LABEL></TD>
    <TD><INPUT id=MIN_ALPHA_CHARS maxLength=3 size=3 name=MIN_ALPHA_CHARS required="1" mask="numeric" value="<%= j_MIN_ALPHA_CHARS %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=PWD_MIN_LENGTH>PWD_MIN_LENGTH:</LABEL></TD>
    <TD><INPUT id=PWD_MIN_LENGTH maxLength=3 size=3 name=PWD_MIN_LENGTH required="1" mask="numeric" value="<%= j_PWD_MIN_LENGTH %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=PWD_MAX_LENGTH>PWD_MAX_LENGTH:</LABEL></TD>
    <TD><INPUT id=PWD_MAX_LENGTH maxLength=3 size=3 name=PWD_MAX_LENGTH required="1" mask="numeric" value="<%= j_PWD_MAX_LENGTH %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=TIME_EXPIRE_LOCKOUT>TIME_EXPIRE_LOCKOUT:</LABEL></TD>
    <TD><INPUT id=TIME_EXPIRE_LOCKOUT maxLength=3 size=3 name=TIME_EXPIRE_LOCKOUT required="1" mask="numeric" value="<%= j_TIME_EXPIRE_LOCKOUT %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=PWD_HISTORY>PWD_HISTORY:</LABEL></TD>
    <TD><INPUT id=PWD_HISTORY maxLength=3 size=3 name=PWD_HISTORY required="1" mask="numeric" value="<%= j_PWD_HISTORY %>"></TD>
    <TD>Required = yes, type = numeric</TD></TR>
  <TR>
    <TD><LABEL for=OPERATION>OPERATION:</LABEL></TD>
    <TD><INPUT id=OPERATION maxLength=6 size=6 name=OPERATION readonly="readonly" value="update"></TD>
    <TD>Required = yes</TD></TR>

  
<%-- 
  <TR>
    <TD><LABEL for=input1>First name:</LABEL></TD>
    <TD><INPUT id=input1 name=input1 required="1"></TD>
    <TD>Required = 1</TD></TR>
  <TR>
    <TD><LABEL for=input2>Last name:</LABEL></TD>
    <TD><INPUT id=input2 name=input2 required="1"></TD>
    <TD>Required = 1</TD></TR>
  <TR>
    <TD><LABEL for=email>Email:</LABEL></TD>
    <TD><INPUT id=email size=30 name=email required="1" mask="email"></TD>
    <TD>Required = 1, mask = email</TD></TR>
  <TR>
    <TD><LABEL for=age>Age:</LABEL></TD>
    <TD><INPUT id=age maxLength=3 size=3 name=age required="1" mask="numeric"></TD>
    <TD>Required = 1, mask = numeric</TD></TR>
  <TR>
    <TD><LABEL for=code>Code(SSSS-NN):</LABEL></TD>
    <TD><INPUT id=code maxLength=7 size=8 name=code required="1" freemask="SSSS-NN"></TD>
    <TD>Required = 1, freemask = SSSS-NN i.e four letters and two digits</TD></TR>
  <TR>
    <TD><LABEL for=zipcode>Zip code(NNNNN-NNNN):</LABEL></TD>
    <TD><INPUT id=zipcode maxLength=10 size=11 name=zipcode required="1" mask="zip"></TD>
    <TD>Required = 1, mask = zip</TD></TR>
  <TR>
    <TD><LABEL for=zipcode>Domain:</LABEL></TD>
    <TD><INPUT id=domain size=30 name=domain regexpPattern="/\b[A-Z0-9.-]+\.[A-Z]{2,4}\b/gi"></TD>
    <TD>regexpPattern="/\b[A-Z0-9.-]+\.[A-Z]{2,4}\b/gi"</TD></TR>
  <TR>
    <TD>Country</TD>
    <TD><SELECT name=country required="1">
		<OPTION value="" selected></OPTION> <OPTION value=Norway>Norway</OPTION> 
		<OPTION value=Denmark>Denmark</OPTION> <OPTION value=Sweden>Sweden</OPTION> 
        <OPTION value=Finland>Finland</OPTION> <OPTION value=France>France</OPTION> 
		<OPTION value="United States">United States</OPTION> <OPTION value=Germany>Germany</OPTION>
		</SELECT>
	</TD>
    <TD>Required = 1</TD></TR>
--%>
	
  <TR>
    <TD><INPUT type=submit value=" Update "></TD>
  </TR>
  </TBODY>

</TABLE>

</FIELDSET>

</FORM>


<%!
	public String GetPropertyData(String propName, String descriptionText) {
		String startTag = "  <TD><font size='-2'>";
		String endTag = "</font></TD>";

		StringBuffer result = new StringBuffer();
	
		result.append("<TR>");
		result.append(startTag + propName + endTag);
		result.append(startTag + " = " + endTag);
		result.append(startTag + PropertyManager.getValue(propName, "-") + endTag);
		result.append(startTag + "&nbsp;" + descriptionText + "&nbsp;" + endTag);
		result.append("</TR>");

		return (result.toString());
	}

%>


<FIELDSET>
<TABLE border='1'>
  <TBODY>
  <TR>
    <TD><strong>OFA PROPERTY</strong></TD>
    <TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
    <TD>&nbsp;</TD></TR>
<%

	out.println (GetPropertyData("integrosys.sme.login.enabled", ""));
	out.println (GetPropertyData("integrosys.sme.login.username.minlength", ""));
	out.println (GetPropertyData("integrosys.sme.login.username.maxlength", ""));
	out.println (GetPropertyData("integrosys.sme.login.password.expiry.period", ""));
	out.println (GetPropertyData("integrosys.los.smeuser.registration.enable", ""));
	out.println (GetPropertyData("integrosys.los.smeuser.create.active.user", "Set this to true to create Enabled user. The need to create Disabled and then Enable user is skipped"));
	out.println (GetPropertyData("integrosys.los.smeuser.loginID.alphanumeric.strict", ""));
	out.println (GetPropertyData("integrosys.los.smeuser.not.invalidate.first.user.session", "Set this to true to not allow 2nd user to invalidate session of 1st logged in user"));
	out.println (GetPropertyData("integrosys.super_users", ""));
	out.println (GetPropertyData("integrosys.login.top.most.layer", ""));
	out.println (GetPropertyData("integrosys.login.datepattern", ""));
	out.println (GetPropertyData("integrosys.login.days.dormant", ""));
	out.println (GetPropertyData("integrosys.login.session.expiry.warning", ""));

	out.println (GetPropertyData("integrosys.login.persistentbroker", ""));
	out.println (GetPropertyData("integrosys.login.loginmodule.losuser", ""));
	out.println (GetPropertyData("integrosys.login.persistententity.losuser", ""));
	out.println (GetPropertyData("integrosys.login.mapper.losuser", ""));
%>

  <TR>
    <TD><strong>OFA ENV PROPERTY</strong></TD>
    <TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
    <TD>&nbsp;</TD></TR>

<%
	out.println (GetPropertyData("integrosys.login.single.signon.enabled", ""));
	out.println (GetPropertyData("authentication.manager.bean.name", ""));
	out.println (GetPropertyData("authentication.verify.force.password.change", ""));
	
%>
  </TBODY>
</TABLE>	
</FIELDSET>

	
<SCRIPT type=text/javascript>
	initFormValidation();
</SCRIPT>

</BODY>
</HTML>
