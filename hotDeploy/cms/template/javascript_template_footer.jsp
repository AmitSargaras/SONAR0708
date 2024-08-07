<%@page import="com.integrosys.component.user.app.bus.OBCommonUser"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralHelper"%>
<%@ page import = "com.integrosys.base.techinfra.propertyfile.PropertyManager,
                   com.integrosys.component.bizstructure.app.bus.ITeam,
                   com.integrosys.base.techinfra.logger.DefaultLogger,
                   com.integrosys.base.uiinfra.common.Constants,
                   com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                   com.integrosys.base.uiinfra.exception.AccessDeniedException,
				   com.integrosys.component.user.app.bus.ICommonUser,
				   com.integrosys.cms.ui.common.constant.IGlobalConstant,
				   com.integrosys.cms.app.common.constant.ICMSConstant,
				   java.util.*,
				   java.text.*,
                   com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%@ page import="com.integrosys.component.login.ui.GlobalSessionConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<div class="SML_SCRIPT_FOOTER">

<%
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	
	if (user == null) {
		DefaultLogger.warn(this, "user is null in the session, is login successfully ?");
		user = new OBCommonUser();
	}
%>

<%-- script to handle silkscreen --%>
<script>

	function setSilkScreenHideSecond(num, message) {
		if (typeof num != 'undefined') {
			silkScreenHideSecond = num;
			$('#loading-message').text(message).show();
		}
	}
	
	   if (!window.opener) {
	       initCountCookie("<%=user.getLoginID()%>", "<%=session.getMaxInactiveInterval()%>");
	       countDownSession();
	   }
	
	   <%-- preload images --%>
	if (document.images) {
		var img1 = new Image();
		img1.src = "<%=request.getContextPath()%>/img/loading.gif";
	}

	$(document).ready(function() {
		<%-- this is defined in itgUtilities.js --%>
		silkScreenBackup = $("div#fullscreensilk");
	
		$('.longer-loading').click(function(e) {
			setSilkScreenHideSecond (600, 'This may take a few minutes');
		});
	
	/* 	$('input.amount-field').click(function() {
			removeCommaOnFocus($(this)[0]);
		}).blur(function() {
			addCommaOnBlur($(this)[0]);
		});
	 */
});


</script>

</div>