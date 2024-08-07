<html>
<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
				 com.integrosys.base.uiinfra.common.Constants,
				 com.integrosys.base.uiinfra.common.SessionListener,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.net.*" %>
<%@ page import="com.integrosys.base.techinfra.beanloader.BeanController" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSJNDIConstant" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.EBDocumentItemHome" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.EBDocumentItemLocalHome" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.EBDocumentItemLocalHome" %>
<%@ page import="com.integrosys.cms.app.bridgingloan.bus.EBBridgingLoanBean" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.rmi.PortableRemoteObject" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%

//	System.out.println(BeanController.getEJBLocalHome("EBBLBuildUpLocalHome", EBBridgingLoanBean.class.getName()));
	
	
//	System.out.println("fdgdsfgdsfdsfdsf");	
//	InitialContext ic = new InitialContext();
//	Object obj = ic.lookup("EBDocumentItemHome");
//	obj = PortableRemoteObject.narrow(obj, Class.forName("com.integrosys.cms.app.chktemplate.bus.EBDocumentItemHome"));
//
//	System.out.println("Shalalalalalala : " + ((EBDocumentItemHome)obj).findByItemCode("AAA"));

//	Object obj1 = ic.lookup("EBDocumentItemHome");
//	obj1 = PortableRemoteObject.narrow(obj, Class.forName("com.integrosys.cms.app.chktemplate.bus.EBDocumentItemLocalHome"));
//	System.out.println("Tralalalala : " + ((EBDocumentItemLocalHome)obj1));



%>


<%
    boolean ssl = PropertyManager.getBoolean("login.ssl", false);

    String normalPort = PropertyManager.getValue("system.normal.port",request.getServerPort()+"");
    String sslPort = PropertyManager.getValue("system.ssl.port",request.getServerPort()+"");

    //String normalLoginURL = "http://" + request.getServerName() + ":" + normalPort+request.getContextPath() + PropertyManager.getValue("login.normal.url");
    //String sslLoginURL = "https://" + request.getServerName() + ":" + sslPort+request.getContextPath() + PropertyManager.getValue("login.ssl.url");

    String scheme = request.getScheme();
    String actionTarget = "/Login.do";

    DefaultLogger.debug(this, "Scheme is: " + scheme);
    //DefaultLogger.debug(this, "Normal Login URL: " + normalLoginURL);
    //DefaultLogger.debug(this, "SSL Login URL: " + sslLoginURL);
    DefaultLogger.debug(this, "SSL Required: " + ssl);

    if(true == ssl) {
        if(scheme.equalsIgnoreCase("HTTPS")) {
            //actionTarget = "/SSLLogin.do";
            actionTarget = "/Login.do";
        }
        else {
            //response.sendRedirect(sslLoginURL);
            actionTarget = "/Login.do";
        }
    }
    else {
        if(scheme.equalsIgnoreCase("HTTP")) {
            actionTarget = "/Login.do";
        }
        else {
            //response.sendRedirect(normalLoginURL);
            actionTarget = "/Login.do";
        }
    }
    //System.out.println("IP by Header :"+request.getHeader("X-FORWARDED-FOR"));
    //InetAddress thisIp =Inet4Address.getLocalHost();
	//if(thisIp!=null){
	System.out.println(">>>>>>>>>>>>>>>>> USER IP >>>>ON JSP SYSOUT>>>>>>> "+request.getRemoteAddr());
	session.setAttribute("addressIp", request.getRemoteAddr());
	//}
	//DefaultLogger.info(this, "IP Address request.getRemoteAddr() $$$$$$$$$$$$$$$$$$$$$$$:"+request.getRemoteAddr());
	
%>


<head>
<link rel="shortcut icon" href="img/C2.ico" type="image/x-icon">
<link rel="icon" href="img/C2.ico" type="image/x-icon">

<title>Collateral & Limits Management System</title>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />

<%@ include file="/template/stylesheet_template.jsp" %>

<script type="text/javascript">
<!--
	var curvyCornersNoAutoScan = true;
	var curvyCornersVerbose = false;
-->
</script>

<script type="text/JavaScript" src="<%=request.getContextPath()%>/console/javascripts/curvycorners.js"></script>


<style type="text/css">
.test {  font-family: Verdana; font-size: 11px; color:#FFFFFF; text-decoration: none}

body {
	background-image:url(img/AllianceLogin3.jpg);
	background-repeat: no-repeat;
	background-color:#6f9fc5
}

.loginpage {
	 width: 530pt; height: 450pt; padding-right: 15pt; margin-top: 30pt;
	 padding-left: 15pt; padding-bottom: 10pt; margin-left: auto;
	 margin-right: auto; padding-top: 15pt; text-align: left; font-family: Times New Roman;
}

.loginpage-block {
	 padding-right: 10pt; padding-left: 8pt; padding-bottom: 0pt; padding-top: 0pt;
}
.loginpage-box {
	width: 52%; text-align: left; padding-top: 20pt;
}
.loginpage-text {
	background: #fffd6; float: left; width: 45%; text-align: left; position: absolute;
}

.pagetitle {
	font-weight: bold; font-size: 20px; color: #003366
}

.tiny {
	font-size: 11px; color: #333333; font-family: Verdana, Arial, Helvetica, sans-serif
}

.subtitle {
	font-weight: bold; margin-bottom: 0px; color: #666666;
}

.subtitle1 {
	margin-bottom: 0px; color: #555555 ;
}
</style>
<script type="text/JavaScript" src="js/aes-min.js"></script>
<script language="JavaScript">
 
//After clicking submit button, user should not be allowed to click again. Midiate screen has been introduced notifying "Loading..."  
function newShowSilkScreen() {
	unloadingCount = 0;
	//this makes focus back to main window so last control (i.e. dropdown) cannot be used, but not window.open
	//self.focus();
		
/* 	var pwd= document.forms[0].password.value;
	    var encryptedAES = CryptoJS.AES.encrypt(pwd, "René Über");
	document.forms[0].password.value= encryptedAES; */
	
	var silkScreen = document.getElementById("fullscreensilk");
	if (silkScreen != null) {
		disableBodyScrollbar();

		if (BrowserDetect) {
			if (BrowserDetect.browser == "Explorer") {
				if (BrowserDetect.version == 6) {
					//hide dropdown for IE6
					var jsElement;
					if (document.all) {
						jsElement = document.all.tags("SELECT");
					} else if (document.getElementsByTagName) {
						jsElement = document.getElementsByTagName("SELECT");
					}
					for (var i = 0; i < jsElement.length; i++) {
						jsElement[i].style.display = "none";
					}
				}
			}
		}

		var screenInfo = calculatePageSize();
		var scrollData = calculateWindowScroll();

		silkScreen.style.width = (screenInfo.pageWidth) + "px";	//screenInfo.pageWidth, screen.width, 3000
		silkScreen.style.height = (screenInfo.pageHeight) + "px"; //screenInfo.pageHeight, screen.height, 3000
		silkScreen.style.display = "block";
		//silkScreen.innerHTML ="<center><span style='color:#800000;text-align:center;'> &lt; Please wait - System is processing &gt;</span></center>";

		var silkScreenImage = document.getElementById("fullscreensilkimage");
		if (silkScreenImage != null) {
			silkScreenImage.style.left = (scrollData.left) + "px";
			silkScreenImage.style.top = ((screenInfo.windowHeight/2) + scrollData.top - (141/2)) + "px";
			silkScreenImage.style.display = "block";

			//hack for IE to animate gif
			setTimeout("document.getElementById('spinLoading').src = document.getElementById('spinLoading').src", 100);
			//setTimeout("document.getElementById('spinLoading').src = 'images/loading.gif'", 200);
		}
	}

}
<!--
  function getCookieLogin(cookieName){var cookieJar=document.cookie.split("; ");for(var x=0;x<cookieJar.length;x++){var oneCookie=cookieJar[x].split("=");if(oneCookie[0]==escape(cookieName)){return unescape(oneCookie[1]);}}return null;}
  function setCookieLogin(cookieName,cookieValue,lifeTime,path,domain,isSecure){if(!cookieName){return false;}if(lifeTime=="delete"){lifeTime=-10;}document.cookie=escape(cookieName)+"="+escape(cookieValue)+(lifeTime?";expires="+(new Date((new Date()).getTime()+(1000*lifeTime))).toGMTString():"")+(path?";path="+path:"")+(domain?";domain="+domain:"")+(isSecure?";secure":"");if(lifeTime<0){if(typeof(getCookieLogin(cookieName))=="string"){return false;}return true;}if(typeof(getCookieLogin(cookieName))=="string"){return true;}return false;}

  //manual defining of style
  tempStyle = getParameter("style", top.window.location.href);
  if (tempStyle != false) {
	if (tempStyle == "orange" || tempStyle == "blue" || tempStyle == "blackwhite" || tempStyle == "green")
		setCookieLogin ("cms_style", tempStyle);
  }

  if (cookieSupport) {
	setCookieLogin("timeout", <%= session.getMaxInactiveInterval() %>);
	countDownInterval = getCookieLogin("timeout");
	countDownTime = parseInt(countDownInterval);
  }

  function initCorners()
  {
    settings = {
          tl: { radius: 20 },
          tr: { radius: 20 },
          bl: { radius: 20 },
          br: { radius: 20 },
          antiAlias: true
    }

	if ('init' in curvyCorners) {
		curvyCorners.init();
	}
	//curvyCorners(settings, "#loginBox");
	curvyCorners(settings, "#loginLogoBox");

  }

-->
</script>

<script language="JavaScript" type="text/javascript">
<!--
window.onload = function() {
	//countDownSession();

<%
	//to be placed inside onload function, so the browser can define setting

	//establish first time session update
	String sessionFirstTimeText = "global.SESSION_FIRST_TIME";
	boolean sessionFirstTime;
	sessionFirstTime = false;

	String formattedDate = (String) session.getAttribute(sessionFirstTimeText);
	if (session.getAttribute(sessionFirstTimeText) != null) {
		DefaultLogger.info(this,"############ Found (" + sessionFirstTimeText + ") in session. To prevent showing login page.");
		//System.out.println("----- " + formattedDate);
	}
	else {
		java.util.Date todaysDate = new java.util.Date();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		formattedDate = formatter.format(todaysDate);

		session.setAttribute(sessionFirstTimeText, formattedDate);
		DefaultLogger.info(this,"############ Setting (" + sessionFirstTimeText + ") with " + formattedDate);
		sessionFirstTime = true;
	}

	boolean alreadyLogin;
	alreadyLogin = false;

	//prevent a new login screen to be shown if another tab already existed
	if (session.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID) != null) {
		DefaultLogger.info(this,"############ Found (" + Constants.SESSION_CHECK_USER_LOGIN_ID + ") in session. To prevent login.");
		//System.out.println("----- " + session.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID));

		alreadyLogin = true;
	}

	String multipleTabPath = "'" + request.getContextPath() + "/system/inproper_session.jsp'";

	if (PropertyManager.getBoolean("integrosys.login.top.most.layer", true)) {
		sessionFirstTime = false;
		alreadyLogin = false;

		out.println("sessvars.sessionName = " + formattedDate + ";");
	}

	out.println("sessvars.sessionFirstTime = " + sessionFirstTime + ";");
	out.println("sessvars.alreadyLogin = " + alreadyLogin + ";");
%>

	if (sessvars.sessionFirstTime == true) {
		if (sessvars.alreadyLogin == true) {
			if (sessvars.sessionName == undefined || sessvars.sessionName == 'undefined') {
				//alert("session recreated on existing tab - invalid");
				top.window.location = <%= multipleTabPath %>;
			}
			else {
				sessvars.sessionName = '<%= formattedDate %>';
			}
		}
		else {
			sessvars.sessionName = '<%= formattedDate %>';
		}
	}
	else if (sessvars.sessionFirstTime == false) {
		if (sessvars.alreadyLogin == true) {
			if (sessvars.sessionName == undefined || sessvars.sessionName == 'undefined') {
				//alert("session recreated on existing tab - invalid");
				top.window.location = <%= multipleTabPath %>;

			}
			else if (sessvars.sessionName == '<%= formattedDate %>') {
				//alert('valid tab already login = true, session remains');
			}
			else {
				//alert('valid tab already login = true, session recreated');
				sessvars.sessionName = '<%= formattedDate %>';
			}
		} else {
			if (sessvars.sessionName == undefined || sessvars.sessionName == 'undefined') {
				//alert("not first time and on new tab - invalid");
				top.window.location = <%= multipleTabPath %>;
			}
			else {
				//alert('valid tab already login = false');
			}
		}
	}
	else {
	   //alert('invalid tab');
	   top.window.location = <%= multipleTabPath %>;
	}

	//sessvars.$.debug();

<%
	if (!PropertyManager.getBoolean("integrosys.login.top.most.layer", true)) {
		DefaultLogger.info(this,"----------------------------------------------------------------------------------------------");
		DefaultLogger.info(this,"##### Login page cannot be top most HTML layer");

		out.println("if (self == top) {");
		out.println("	top.window.location = '" + request.getContextPath() + "';");
		out.println("}");
	}
	else
		DefaultLogger.info(this,"///////////////////////////////// login.jsp /////////////////////////////////");

%>

//initCorners();
setTimeout("initCorners()", 150);

}
//-->
</script>

</head>

<body bgcolor="#FFFFFF" text="#FFFFFF" leftmargin="0" topmargin="0px" marginwidth="0" marginheight="0">
<!--<form name="LoginForm" method="POST" action="/cms/Login.do">-->
<html:form  action="<%=actionTarget%>">
<table width="100%"  border="0" cellpadding="0"  cellspacing="0" style="margin-top:40px;">

<tr>
<td align="center">

<div class="loginpage-box">

                                    <span><img src="img/spacer_clear.gif" border="0" height="40"></span><br>
                                    <span class="login_pagetitle">&nbsp;<bean:message key="label.login.user.login"/></span><br>
                                    <span class="login_tiny">&nbsp;&nbsp;<bean:message key="label.login.message"/></span><br>
                                    <br>
                                    <span class="login_alert"><html:errors property="invalid_session_error"/></span>
<div class="loginpage-block">

<table align="center" cellpadding="0" cellspacing="0" style="margin-top:0px">

  <tr>
    <td valign="top" >
      <table width="300" border="0">
        <tr height="15" align="left">
          <td align="right" class="test" width="100">&nbsp;</td>
          <td align="left" width="200">
              <font face="Verdana, Arial, Helvetica, sans-serif" size="2" style="color:red;"><html:errors property="loginError"/>&nbsp;</font>
            </td>
        </tr>

        <tr align="left">
          <td align="left" class="test" width="100"><font color="#003366" face="Arial, Helvetica, sans-serif">
            <span id="spanLogin"><strong><bean:message key="label.login.form.user.name" />&nbsp;:</strong></span>       </td>
          <td width="200"><font face="Verdana, Verdana" size="2" color="FF0000">
           <html:text property="userName" styleId="TextUserName" size="15" maxlength="100"/>
            </font>          </td>
        </tr>
        <tr align="left">
          <td align="right" class="test" width="100">&nbsp;</td>
          <td width="200"><font face="Verdana, Verdana" size="2" color="FF0000">
                    <html:errors property="userName"/>
            </font>          </td>
        </tr>

        <tr align="left">
          <td align="left" class="test" width="100"><font color="#003366" face="Arial, Helvetica, sans-serif">
            <span id="spanPassword"><strong><bean:message key="label.login.form.user.pwd" />&nbsp;:</strong></span>          </td>
          <td width="200"><font face="Verdana, Verdana" size="2" color="FF0000">
            <html:password property="password" styleId="TextPassword" size="15" maxlength="100"/>
            </font>          </td>
        </tr>
        <tr align="left">
          <td align="right" class="test" width="100">&nbsp;</td>
          <td width="200"><font face="Verdana, Verdana" size="2" color="FF0000">
                       <html:errors property="password"/>
            </font>          </td>
        </tr>
        <tr align="left">
           <td align="left" class="test" colspan="2"><font color="#003366" face="Arial, Helvetica, sans-serif">
           <strong><bean:message key="label.login.role.message"/>&nbsp;:</strong></font>          </td>
        </tr>
        <tr align="left">
		  <td align="right" class="test" width="100">&nbsp;</td>
          <td width="200"><font face="Verdana, Verdana" size="2" color="FF0000">
           <html:select property="membershipID" >
           <html:option value="">Please Select</html:option>
           <html:option value="1">Maker</html:option>
           <html:option value="2">Checker</html:option>
           </html:select>
            </font>          </td>
        </tr>
        <tr align="left">
          <td align="right"> &nbsp;&nbsp; </td>
          <td>
          <html:submit property="submitLogin" styleId="TextLogin" onclick="newShowSilkScreen();"><bean:message key="label.login.form.button.submit"/></html:submit>
          <html:reset styleId="TextReset"><bean:message key="label.login.form.button.reset"/></html:reset>
													          </td>
        </tr>
      </table>   
    </td>
  </tr>
</table>
</div>
<p>&nbsp;</p>
  <p align="justify">
<span class="login_tiny">
<span class="login_style6"><bean:message key="label.login.signup.difficulty"/><br> </span>
<span class="login_style3"><bean:message key="label.login.contact.administrator"/></span><br><br>
<span class="login_style6"><bean:message key="label.login.signup.warning"/></span><br>
<span class="login_style3"><bean:message key="label.login.warning"/></span>
</span>
</p>

</div></td>
</tr>

       		<html:hidden property="realm" value="sme"></html:hidden>
			<html:hidden property="role" value="losuser"></html:hidden>

</table>
   </html:form>


<NOSCRIPT>
<strong>Note:</strong><br>
There are many convenience functions that will not be available with java scripting disabled.<br>
Enable Java Script in your browser to take advantage of these functions.<br>
</NOSCRIPT>


<script language="JavaScript" type="text/javascript">
<!--
  function deniedLogin()
  {
	var uiControl = document.getElementById('TextUserName');
	if (uiControl != null) uiControl.disabled = true;

	uiControl = document.getElementById('spanLogin');
	if (uiControl != null) uiControl.disabled = true;

	uiControl = document.getElementById('TextPassword');
	if (uiControl != null) uiControl.disabled = true;

	uiControl = document.getElementById('spanPassword');
	if (uiControl != null) uiControl.disabled = true;

	uiControl = document.getElementById('TextLogin');
	if (uiControl != null) uiControl.disabled = true;

	uiControl = document.getElementById('TextReset');
	if (uiControl != null) uiControl.disabled = true;

	uiControl = document.getElementById('spanExceed');
	if (uiControl != null) uiControl.innerHTML = "<strong>Maximum number of online users is reached. Please try again later.</strong>";
  }

//-->
</script>

<script language="JavaScript" type="text/javascript">
<!--
	var cookie = read_Cookie("cms_style");
	var styletitle = cookie ? ("themes/" + cookie + "/img") : "img";
	var imgName = styletitle + "/AllianceLogin3.jpg";
	document.body.style.backgroundImage = 'url(' + imgName + ')';

/*
	imgName = styletitle + "/login.jpg";
	var divLayer = document.getElementById('loginBox');
	if (divLayer != null)
		divLayer.style.backgroundImage = 'url(' + imgName + ')';
*/

	imgName = styletitle + "/login-logo.jpg";
	divLayer = document.getElementById('loginLogoBox');
	if (divLayer != null)
		divLayer.style.backgroundImage = 'url(' + imgName + ')';

	load_DynamicStyleSheet(false);

	if (actualTitle) {
		top.document.title = actualTitle;
	}

	//alert('(' + BrowserDetect.browser + ')  (' + BrowserDetect.version + ') ');

//-->
</script>

<script language="JavaScript" type="text/javascript">
<!--
var backgroundOffset = 0;
var incV = -1;

function scrollBG (maxSize) {
	backgroundOffset = backgroundOffset + incV;
	if (backgroundOffset < -maxSize)
		incV = 1;
	else if (backgroundOffset > 0)
		incV = -1;
	document.body.style.backgroundPosition = backgroundOffset + " 0";
}

//var ScrollTimer = window.setInterval("scrollBG(600)", 64);

backgroundOffset = -(Math.random() * 500) % 500;
//scrollBG(600);

<%
DefaultLogger.info(this,"############# Online_User_ID: " + SessionListener.getSessionCount());
	String countUsers = PropertyManager.getValue("sessionlistener.countusers", "false");
	if (countUsers.equals("true")) {
		int maxUsers = PropertyManager.getInt("sessionlistener.maxusers", 100);

		if (SessionListener.getSessionCount() >= maxUsers) {
			out.println("deniedLogin();");
		}
	}

%>

// -->
</script>
 <div class="fullscreensilk" id="fullscreensilk">
	<table width="100%" height="100%" bgcolor="#F5F5F5" border="0" cellspacing="0" cellpadding="0">
	<tr><td align="center" valign="middle"><div class="fullscreensilk" id="fullscreensilkimage"><img src="<%=request.getContextPath()%>/img/loading.gif" border="0" id="spinLoading"></div>&nbsp;</td></tr>
	</table>
</div>
</body>
</html>