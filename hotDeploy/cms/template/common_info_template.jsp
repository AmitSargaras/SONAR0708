
<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.HashMap,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 org.apache.struts.action.ActionMapping,
                  org.apache.struts.action.ActionForward,
                 org.apache.struts.config.FormBeanConfig,
                 com.integrosys.component.login.ui.GlobalSessionConstant,
                 com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralHelper" %>
<%@ page import="org.apache.struts.Globals"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	ActionMapping mapping = (ActionMapping) request.getAttribute(org.apache.struts.Globals.MAPPING_KEY);
	String event = (String)request.getParameter("event");
	String outputInfo;
	String actionForm = "";
	String formClassName = "";
	String actionPath = "";
	if (mapping != null) {        
		actionForm = mapping.getName();
		FormBeanConfig formConfig = mapping.getModuleConfig().findFormBeanConfig(actionForm);
		if (formConfig != null) {
			formClassName = formConfig.getType();
		}
		actionPath = mapping.getPath();
		actionPath = com.integrosys.cms.ui.common.UIUtil.stripCharacter(actionPath, new char[]{'/'});
		actionPath = actionPath +".do";

	}
	ActionForward actionForward = (ActionForward) session.getAttribute("com.integrosys.base.uiinfra.common.CommonAction.forward");
	
	outputInfo = "\n\n-------------------------------------------------------------------------------------------------------------------- ";
	outputInfo += "\n Main Frame\t: common_template.jsp";
	
	HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
	outputInfo += "\n Printing Map\t: "+map;
	
	ICommonUser loginInfo = (ICommonUser) session.getAttribute(GlobalSessionConstant.LOS_USER);
	if(null != loginInfo){
		outputInfo +="\n User\t\t: [id: "+loginInfo.getUserID()+", name: "+loginInfo.getUserName()+", role: "+request.getParameter("userRole")+" ]";
	}
    
    String mapTitle = (String)map.get(ICommonEventConstant.TITLE);
    session.setAttribute(IGlobalConstant.PAGE_TITLE_NAME, mapTitle);
    String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    outputInfo += "\n Right Frame\t: " + rightPath;
	if (!actionPath.isEmpty()) {
		outputInfo += "\n Request Path\t: " + actionPath + ((event!=null) ? "?event=" + event : "") + " ("+request.getRequestedSessionId()+") "
		+ ((request.getHeader("X-Requested-With") != null) ? "(AJAX Request)" : "");
	} else {
		outputInfo += "\n Request Path\t: " + request.getAttribute("javax.servlet.include.request_uri") 
		+ ((request.getAttribute("javax.servlet.include.query_string") != null) ? ("?" + request.getAttribute("javax.servlet.include.query_string")) : "")  
		+ " ("+request.getRequestedSessionId()+") "
		+ ((request.getHeader("X-Requested-With") != null) ? "(AJAX Request)" : "");
	}
    //if(request.getHeader("referer")!=null){
   // 	outputInfo += "\n Referrer\t: " + request.getHeader("referer");
    //}

    outputInfo += "\n ActionForm\t: " + actionForm + ", class: " + formClassName;
	if (actionForward != null) {
		outputInfo += "\n ActionForward\t: " + actionForward.getName() + ", path: "+ actionForward.getPath();
	}
   	String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
   	outputInfo += "\n IPin Path\t: "+ipinPath;
   	
   	String frameInd = (String)session.getAttribute(ipinPath+".frame");
   	outputInfo += "\n frameInd\t: "+frameInd;

    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);    
    if(customer != null){
		outputInfo +="\n Customer\t: [id: "+customer.getCustomerID();
		outputInfo += customer.getCustomerName() != null ? ", name: "+customer.getCustomerName() : "";
		outputInfo += customer.getCifId() != null ? ", cif: "+customer.getCifId()+"]" : "]";
     }
    
    ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    if(profile != null){
    	outputInfo +="\n Profile\t: [FA: "+profile.getLosLimitProfileReference()+"]";
    }
    ICollateralTrxValue collateralTrx = (ICollateralTrxValue)session.getAttribute(ipinPath+"."+"serviceColObj");
    if(collateralTrx!=null && collateralTrx.getCollateral()!=null){
    	ICollateral col = collateralTrx.getCollateral();
    	outputInfo +="\n Collateral\t: [id: "+col.getCollateralID()+", subtype: "+(col.getCollateralSubType()!=null ? col.getCollateralSubType().getSubTypeCode() : "") +"]";
    }
 	Object errors = request.getAttribute(Globals.ERROR_KEY);
 	if (errors != null) {
 		outputInfo += "\n Form Errors\t: " + errors ;
 	}
 	
outputInfo += "\n---------------------------------------------------------------------------------------------------------------------\n";
DefaultLogger.info("outputInfo:", outputInfo);
request.setAttribute("outputInfo", outputInfo);
%>
