<%@ page language="java"%>
<%@ page import="com.integrosys.component.login.ui.*,
				 com.integrosys.base.techinfra.propertyfile.*" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<html>
<head>
<title>Change Login Password</title>
<%@ include file="/template/stylesheet_template.jsp" %>

<style>
<!--
table.tblInput tbody tr td.fieldname {
	width : 150 px;
-->
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

function submitPage() {
    document.forms[0].submit();
}

function handleEnter (field, event, itemPressed) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == "" || field.value == null) {
			//
		}
		else {
			submitPage();
		}
		return false;
	} 
	else
	return true;
}

//-->
</script>

<script language="JavaScript" type="text/javascript">
<!--
initCountCookie("<%=(String)session.getAttribute(GlobalSessionConstant.USER_LOGIN_ID)%>", "<%=session.getMaxInactiveInterval()%>");
window.onload = function() {
		resize();
		MM_preloadImages('img/submit2.gif');
		countDownSession();
		extraOnLoadTask();
}
window.onresize = resize;

//-->
</script>

</head>

<%

	String message = "Change Password";
	String expiryIndicator = null;
	if(request.getAttribute("expiry") != null) {
    	expiryIndicator = (String)request.getAttribute("expiry");

        if(expiryIndicator.equals("maxAgeWarn")) {
			message = "Your Password is nearing expiry. Change it soon";        
        }
        if(expiryIndicator.equals("maxAgeChange")) {
			message = "Your Password had expired. Please change password now.";        
        }
    }
    System.out.println("Expiry Indications - "+ expiryIndicator);

%>

<body>
<html:form action="ForceChangePassword.do">
<!-- InstanceBeginEditable name="Content" -->


     <table width="100%" border="0" cellspacing="0" cellpadding="0" height="48">
        <tr>
          <%@ include file="/template/image_logo_template.jsp" %>

          <img src="img/spacer_clear.gif" width="5" height="8" border="0" />
          &nbsp;|&nbsp;
          Build No: <%= PropertyManager.getValue("build.number","-") %>
          </td>
        </tr>
      </table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="test">
  <tr>
    <%@ include file="/template/image_strip2_template.jsp" %>
  </tr>
</table>
<table align="right" width="100%"><tr><td><p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p></td></tr></table>
<table width="40%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
  <thead>
    <tr>
      <td><h3><%=message%></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" height="150" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="even">
              <td valign="middle" align="center"><table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                  <thead>
                  </thead>
                  <tbody>
                    <tr class="odd" height="30">
                      <td class="fieldname">Login ID</td>
                      <td><%= (String)session.getAttribute(GlobalSessionConstant.USER_LOGIN_ID)%></td>
                    </tr>
                    <tr class="even" height="30">
                      <td class="fieldname">Old Password&nbsp;<font color="#0000FF">* </font></td>
                      <td>
                      	<html:password property="oldPassword" maxlength="40" size="25" styleClass="drop_down_list" onkeypress="return handleEnter(this, window.event||event, 0);" />
                    	<html:errors property="oldPassword" />
                     </td>
                     <input type="hidden" name="command" value="changePwd">
                     <input type="hidden" name="expiryIndicator" value=<%=expiryIndicator%>>
                    </tr>
                    <tr class="odd" height="30">
                      <td class="fieldname">New Password&nbsp;<font color="#0000FF">* </font></td>
                      <td>
                      	<html:password property="newPassword" maxlength="40" size="25" styleClass="drop_down_list" onkeypress="return handleEnter(this, window.event||event, 0);" />
                    	<html:errors property="newPassword" />
                      </td>
                    </tr>
                    <tr class="even" height="30">
                      <td class="fieldname">Confirm&nbsp;New&nbsp;Password&nbsp;<font color="#0000FF">* </font></td>
                      <td>
                      	<html:password property="confirmNewPassword" maxlength="40" size="25" styleClass="drop_down_list" onkeypress="return handleEnter(this, window.event||event, 0);" />
                    	<html:errors property="confirmNewPassword" />
                      </td>
                    </tr>
                  </tbody>
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
</table>
</html:form> 

</html>