<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.HashMap,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%

    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    //System.out.println(map);
    String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    DefaultLogger.debug(this,"Main Frame: common_template.jsp, Right Frame: " + rightPath);
	//String frameInd = request.getParameter("frame");
	//System.out.println("<<<<<<<< frameInd: "+frameInd);
	//if (frameInd == null) {
    	String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
    	String imgFlage = (String)request.getAttribute("event");
    	String frameInd = (String)session.getAttribute(ipinPath+".frame");
    String frameInd2 = (String)session.getAttribute("IPinPath.frame");
    
	//}
	boolean hasFrame = (frameInd != null && frameInd.equals("true"));
%>

<%if(hasFrame == true && imgFlage!=null &&  !"".equals(imgFlage) && 
		(imgFlage.equals("retrieveImageGallarySecurityDoc") || 
				imgFlage.equals("retrieveImageGallaryCAMDoc") || 
				imgFlage.equals("retrieveImageGallaryFacilityDoc") || 
				imgFlage.equals("retrieveImageGallaryLADDoc") ||
				imgFlage.equals("retrieveImageGallaryCaseCreation") ||
				imgFlage.equals("retrieveImageGallaryRecurrentDoc") ||
				imgFlage.equals("retrieveImageGallaryOtherDoc") ||
				imgFlage.equals("retrieveMigImageGallaryCAMDoc") || 
				imgFlage.equals("retrieveMigImageGallaryRecurrentDoc") ||
				imgFlage.equals("retrieveMigImageGallaryOtherDoc")
		
		)){ %>
<template:insert template='/template/common_basic_image_container.jsp'>
	             <template:put name='rightContainer' content='<%=rightPath%>' />
                </template:insert>


<%}else  if (hasFrame) { %>
<template:insert template='/template/common_frame_container.jsp'>
	<template:put name='leftContainer' content='/template/common_left_frame.jsp'/>
	<template:put name='rightContainer' content='<%=rightPath%>' />
</template:insert>

<%}else {
		ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	//	System.out.println("common profile is"+profile);
		if(profile == null &&  imgFlage!=null && !"".equals(imgFlage) && imgFlage.equals("retrieveUntagImageGallary")){%>
		
		<template:insert template='/template/common_basic_image_container.jsp'>
	             <template:put name='rightContainer' content='<%=rightPath%>' />
                </template:insert>
		
		
   <%}else	if (profile != null) {
			  
			if(imgFlage!=null && !"".equals(imgFlage) && 
					(imgFlage.equals("retrieveImageGallary") ||
							imgFlage.equals("retrieveViewImageGallary") || 
							imgFlage.equals("retrieveImageGallaryMakerTodo")||
							imgFlage.equals("retrieveImageGallaryMakerClose")||
							imgFlage.equals("retrieveImageGallaryChecker")
							
					) )
	    	{
			%>
				<template:insert template='/template/common_basic_image_container.jsp'>
	             <template:put name='rightContainer' content='<%=rightPath%>' />
                </template:insert>
			<%
	    	}else{
%>
<template:insert template='/template/common_view_container.jsp'>
	<template:put name='rightContainer' content='<%=rightPath%>'/>
</template:insert>
<%} %>
<% } else { %>
<template:insert template='/template/common_container.jsp'>
    <%
    if(rightPath.indexOf("contractfinancing")>-1 && !rightPath.equals("/contractfinancing/contractfinancing_list.jsp")){
        %><template:put name='rightContainerTab' content='/contractfinancing/contractfinancing_frame.jsp'/><%
    }
    else if(rightPath.indexOf("bridgingloan")>-1 && !rightPath.equals("/bridgingloan/bridgingloan_list.jsp")){
        %><template:put name='rightContainerTab' content='/bridgingloan/bridgingloan_frame.jsp'/><%
    }
    %>
    <template:put name='rightContainer' content='<%=rightPath%>'/>
</template:insert>
<% }} %>