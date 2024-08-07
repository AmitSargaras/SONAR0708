
<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.HashMap,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.bus.OBCommonUser,
                 com.integrosys.base.uiinfra.common.MessageResourceUtils,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
	String title = null; 
	if(map != null)
		title = MessageResourceUtils.getInstance().getMessage(null, (String)map.get(ICommonEventConstant.TITLE), null, pageContext, null);
    String event=(String)request.getParameter("event");
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    //anup
    ICMSCustomer stage_customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." +"OBCMSCustomer");
   
    //end anup
    DefaultLogger.debug(this, ">>>>>> Title:" + title+", Right Frame: common_container.jsp");
    if(null == title) {
        title = "";
    }
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"." + IGlobalConstant.USER);
    if (user == null) {
	    DefaultLogger.warn(this, "user is null in the session, is login successfully ?");
	    user = new OBCommonUser();
    }

%>


<html>
<head>
<title><bean:message key="label.system.title" /></title>
<%@ include file="/template/stylesheet_template.jsp" %>

<script language="JavaScript" src="js/common.js" type="text/javascript"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
//-->
</script>

<script language="JavaScript" type="text/javascript">
<!--
initCountCookie("<%=user.getLoginID()%>", "<%=session.getMaxInactiveInterval()%>");
window.onload = function() {
		resize();
		MM_preloadImages('img/print2.gif','img/refresh2.gif','img/return2.gif','img/ok2.gif','img/approve2.gif','img/reject2.gif','img/close2a.gif','img/calendarb.gif','img/return1.gif','img/save2.gif','img/submit2.gif','img/cancel2.gif','img/delete2.gif','img/next2.gif','img/tab_home2.gif','img/tab_help2.gif','img/tab_keys2.gif', 'img/tab_logout2.gif');

		//if (window.location.href.indexOf("Welcome.do") != -1)
		//	ajaxpack.postAjaxRequest('/cms/Welcome.do?event=list&countIndex=1', '', processGetPost, 'txt', null, 1);
		countDownSession();
		extraOnLoadTask();
}
document.onstop = setUnloadFlag;
window.onunload = setServerSubmit;

window.onbeforeprint = resizeOnPrint;
window.onafterprint = resizeOnAfterPrint;
window.onresize = resize;
//-->
</script>


</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<jsp:include page="/template/topbanner.jsp"/>

<!-- WinTitle Container -->
 <%
	if(null != customer) {
%>
	  <table id="winTitleBar" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td align="left" bgcolor="#FFFFFF"><input id="imgPropertyIcon" name="imgPropertyIcon" type="image" src="img/win/icon.gif" width="16" height="16" border="0" />
		  </td>
		  <td id="tdWinTitle" style="width:100%" bgcolor="#FFFFFF">
			  <label></label>
			  <label><%=customer.getCustomerName()%></label>
			  &nbsp;(<%=customer.getCifId()%>)
		  </td>
		</tr>
	</table>
  <% } %>
<!-- Title Container -->
<%-- anup--%>
<%
	if(null==customer && null!=stage_customer && event!=null && !event.equals("prepare")) {
%>
	  <table id="winTitleBar" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td align="left" bgcolor="#FFFFFF"><input id="imgPropertyIcon" name="imgPropertyIcon" type="image" src="img/win/icon.gif" width="16" height="16" border="0" />
		  </td>
		  <td id="tdWinTitle" style="width:100%" bgcolor="#FFFFFF">
			  <label></label>
			  <label><%=stage_customer.getCustomerName()%></label>
			  &nbsp;(<%=stage_customer.getCifId()%>)
		  </td>
		</tr>
	</table>
  <% } %>
<%-- anup--%>
<table id="contentCompositeBar" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td nowrap="nowrap" id="contentTitleBar">
		  	  <label>Title:</label>
              <label id="txtContentTitle"><%=title%></label>
		  </td>
		</tr>
	  </table>

<%-- Right Container --%>
<div id="contentCanvas" style="height:100%;width:100%;top:125px;left:0px;position:absolute;">
	<jsp:include page="/template/common_error_message.jsp"/>
    <template:get name='rightContainer'/>
</div>
<%@ include file="/template/image_strip_template.jsp" %>

</body>
</html>