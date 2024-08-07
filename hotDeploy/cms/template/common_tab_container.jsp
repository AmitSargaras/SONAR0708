<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.HashMap,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.bus.OBCommonUser,
                 com.integrosys.base.uiinfra.common.MessageResourceUtils,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    try {
    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
	//System.out.println(map);
	//String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    //String leftPath = (String)map.get(ICommonEventConstant.LEFT_FRAME);	
	System.out.println("///////////////////////////////// Right Frame is ///////////////////////////// common_tab_container.jsp");
	
    String title = MessageResourceUtils.getInstance().getMessage(null, (String)map.get(ICommonEventConstant.TITLE), null, pageContext, null);
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    
    DefaultLogger.debug(this, ">>>>>> Title:" + title);
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

<script language="JavaScript" src="js/defaultImageFunction.js"></script>

<script language="JavaScript" type="text/javascript">
<!--
initCountCookie("<%=user.getLoginID()%>", "<%=session.getMaxInactiveInterval()%>");
window.onload = function() {
		resize();
		MM_preloadImages('img/save2.gif','img/submit2.gif','img/cancel2.gif','img/delete2.gif','img/next2.gif','img/tab_home2.gif','img/tab_help2.gif','img/tab_keys2.gif', 'img/tab_logout2.gif');

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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="overflow:auto;overflow-y:hidden">

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
			  &nbsp;(<%=customer.getCMSLegalEntity().getLEReference()%>)
		  </td>
		</tr>
	</table>
  <% } %>
<!-- Title Container -->
        <%
            if(title.indexOf("Contract Financing")>-1){
                %>
<table id="contentCompositeBar" width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td nowrap="nowrap" width="100%" id="contentTitleBar">
                <jsp:include page="/contractfinancing/contractfinancing_title.jsp"/>
        </td>
    </tr>
        <%
            }
            else if(title.indexOf("Bridging Loan")>-1){
                %>
<table id="contentCompositeBar" width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td nowrap="nowrap" width="100%" id="contentTitleBar">
                <jsp:include page="/bridgingloan/bridgingloan_title.jsp"/>
        </td>
    </tr>
         <%
            }
            else {
                %>
		<table id="contentCompositeBar2" border="0" cellpadding="0" cellspacing="0">
	        <tr>
	          <td nowrap="nowrap">
			  	  <label><bean:message key="label.title"/>:</label>
	              <label id="txtContentTitle"><%=title%></label>
			  </td>
			  <td nowrap="nowrap">
				  <label><bean:message key="label.global.host.los.aa.number"/>:</label>
				  <label id="txtContentTitle"><%=profile.getBCAReference()%>
<%--	 /	<integro:empty-if-null value="<%=profile.getLosLimitProfileReference() %>"/> --%>
				  </label>
			  </td>
			  <td nowrap="nowrap">
				  <label>Approved Date:</label>
				  <label id="txtContentTitle">
					<integro:date object="<%=profile.getApprovalDate()%>"/>
				  </label>
			  </td>
			</tr>
        <%
            }
        %>

</table>

<%String errMsg = (String)session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.errorMsg"); 
    System.out.println("--------------------------------errMsg : " + errMsg);
    boolean hasError = false;
if (errMsg != null && !errMsg.equals("")) {
	hasError = true;
%>
<input type="hidden" name="errorMsg" value="<%=errMsg%>"/>
<div id="hostError" style="height:30px;width:100%;left:0px;position:absolute">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="left" width="100%"><font face=Tahoma size=2 color="#FF0000"><%=errMsg%></font></td>
    </tr>
</table>
</div>
<%}%>
<!-- Tab Container -->
<%
String tabStyle = "top:"+(hasError?155:125)+"px;width:100%;height:30px;left:0px;position:absolute;";
String style="overflow:scroll;overflow-x:hidden;top:"+(hasError?185:155)+"px;height:100%;width:100%;position:absolute";
if (title.indexOf("Contract Financing") > -1) {
    if (title.equals("Contract Financing Main")) {
        style = "height:100%;width:100%;top:"+(hasError?145:115)+"px;left:0px;";
        tabStyle = "top:"+(hasError?125:95)+"px;width:100%;height:20px;left:0px;position:absolute;";
    } else if (title.equals("Contract Financing Status")) {
        style = "height:100%;width:100%;top:"+(hasError?163:133)+"px;left:0px;";
        tabStyle = "top:"+(hasError?125:95)+"px;width:100%;height:38px;left:0px;position:absolute;";
    } else {
        style = "height:100%;width:100%;top:"+(hasError?198:168)+"px;left:0px;";
        tabStyle = "top:"+(hasError?125:95)+"px;width:100%;height:73px;left:0px;position:absolute;";
    }
}
else if(title.indexOf("Bridging Loan")>-1 && !title.equals("Bridging Loan Main")){
    style = "height:100%;width:100%;top:"+(hasError?179:149)+"px;left:0px;";
    tabStyle = "top:"+(hasError?125:95)+"px;width:100%;height:54px;left:0px;position:absolute;";
}
%>
<div id="contentCanvasTab" style="<%=tabStyle%>">
    <template:get name='rightContainerTab'/>
</div>

<!-- Right Container -->
<div id="contentCanvas" style="<%=style%>">
	<jsp:include page="/template/common_error_message.jsp"/>
    <template:get name='rightContainer'/>
</div>
	<%@ include file="/template/image_strip_template.jsp" %>

</div>
</div>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>