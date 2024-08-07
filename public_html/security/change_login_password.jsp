<%@ page import="java.util.*,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.component.bizstructure.app.bus.*,
                 org.apache.struts.util.MessageResources,
                 com.integrosys.base.uiinfra.common.MessageResourceUtils,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.component.login.ui.GlobalSessionConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<%@ page import="com.integrosys.component.login.ui.*" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);

    String teamIdentifier = (String)session.getAttribute(GlobalSessionConstant.TEAM_IDENTIFIER);
	//String title = msg.getMessage((String)map.get(ICommonEventConstant.TITLE));
    String title = MessageResourceUtils.getInstance().getMessage(null, (String)map.get(ICommonEventConstant.TITLE), null, pageContext, null);
   System.out.println("////////////////////////////////// Pages //////////////////////////// /security/change_login_password.jsp ");

    System.out.println("Team Identifer - "+ teamIdentifier);

    String roleDesc = (String)session.getAttribute(GlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_NAME);


%>


<head>
<title><bean:message key="label.system.title" /></title>

<%@ include file="/template/stylesheet_template.jsp" %>

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


function submitPage(action) {
    document.forms[0].event.value = action;
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
			submitPage('change_password');
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
		MM_preloadImages('img/tab_home2.gif','img/tab_help2.gif','img/tab_keys2.gif', 'img/tab_logout2.gif');
		countDownSession();
		extraOnLoadTask();
}
window.onresize = resize;

//-->
</script>

</head>

<html>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<html:form action="PasswordChange.do">
<input type="hidden" name="event" value="">

    <jsp:include page="/template/topbanner.jsp" />

<!-- Title Container -->
	<table id="contentCompositeBar" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td nowrap="nowrap" id="contentTitleBar">
		  	  <label>Title:</label>
              <label id="txtContentTitle"><%="Change Password"%></label>
		  </td>
		</tr>
	</table>

	<div id="contentCanvas" style="height:100%;width:100%;top:95px;left:0px;position:absolute;">
		<jsp:include page="/template/common_error_message.jsp"/>
		<table align="right" width="100%"><tr><td><p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p></td></tr></table>

		<table width="80%" border="0"><tr><td>&nbsp;</td></tr></table>

		<table width="40%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
		  <thead>
		    <tr>
		      <td><h3>Change Password</h3></td>
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
		              <td valign="middle" align="center" nowrap="nowrap">
						  <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
		                  <thead>
		                  </thead>
		                  <tbody>
		                    <tr class="odd" height="30">
		                      <td class="fieldname">Login ID</td>
		                      <td><%= (String)session.getAttribute(GlobalSessionConstant.USER_LOGIN_ID)%></td>
		                    </tr>
		                    <tr class="even" height="30">
		                      <td class="fieldname" nowrap="nowrap">Old Password&nbsp;<font color="#0000FF">* </font></td>
		                      <td>
		                      	<html:password property="oldPasswd" maxlength="40" size="25" onkeypress="return handleEnter(this, window.event||event, 0);" />
		                    	<html:errors property="oldPasswd" />
		                     </td>
		                    </tr>
		                    <tr class="odd" height="30">
		                      <td class="fieldname" nowrap="nowrap">New Password&nbsp;<font color="#0000FF">* </font></td>
		                      <td>
		                      	<html:password property="newPasswd" maxlength="40" size="25" onkeypress="return handleEnter(this, window.event||event, 0);" />
		                    	<html:errors property="newPasswd" />
		                      </td>
		                    </tr>
		                    <tr class="even" height="30">
		                      <td class="fieldname" nowrap="nowrap">Confirm New Password&nbsp;<font color="#0000FF">* </font></td>
		                      <td>
		                      	<html:password property="confirmPasswd" maxlength="40" size="25" onkeypress="return handleEnter(this, window.event||event, 0);" />
		                    	<html:errors property="confirmPasswd" />
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
		    <td><a href="javascript:submitPage('change_password');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
		  </tr>
		  <tr>
		    <td>&nbsp;</td>
		  </tr>
		</table>

	</div>

	<%@ include file="/template/image_strip_template.jsp" %>
	</div>

	<html:hidden property="loginId"   value="<%= (String)session.getAttribute(GlobalSessionConstant.USER_LOGIN_ID)%>"/>
	<html:hidden property="role" value="<%= (String)session.getAttribute(GlobalSessionConstant.AUTHENTICATION_ROLE) %>"/>
	<html:hidden property="realm"   value="<%= (String)session.getAttribute(GlobalSessionConstant.AUTHENTICATION_REALM) %>"/>
</html:form>

</body>
<!-- InstanceEnd -->
</html>