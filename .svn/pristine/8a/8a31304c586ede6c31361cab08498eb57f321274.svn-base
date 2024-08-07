<%@page import="java.util.Collections"%>
<%@page import="com.integrosys.cms.ui.manualinput.line.covenant.ILineCovenantConstants"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.util.Locale,
				 java.util.Collection,
				 java.util.Iterator,
				 java.util.LinkedHashSet,
				 java.util.List,
				 org.apache.struts.util.LabelValueBean,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBLimitTrxValue,
                 com.integrosys.cms.ui.manualinput.limit.MILimitUIHelper,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.manualinput.line.covenant.LineCovenantDetailForm,
                 com.integrosys.cms.app.customer.bus.ILineCovenant,
                  com.integrosys.cms.ui.common.CurrencyList,
                  java.text.DecimalFormat,
                  java.math.BigDecimal,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamEntry"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamGroup"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamDao"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    //ILimitTrxValue lmtTrxObj=(ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.covenant.LmtCovenantDetailAction.lmtTrxObj");
    ILimitTrxValue lmtTrxObj=(ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
    System.out.println("lmtTrxObj>>>>>>>>>>"+lmtTrxObj);
    System.out.println("lmtTrxObj.getLimit()>>>>>>>>>>"+lmtTrxObj.getLimit());
    System.out.println("lmtTrxObj.getStagingLimit()>>>>>>>>>>"+lmtTrxObj.getStagingLimit());

    ILineCovenant actualLimit= null;	
    ILineCovenant stageLimit = null;
    
    ILimitSysXRef[] refArr = null ;
 	ILimitSysXRef[] refStageArr = null ;
 	
 	if(lmtTrxObj.getLimit()!=null){
 		refArr = lmtTrxObj.getLimit().getLimitSysXRefs();
 	}
 	
 	 if(lmtTrxObj.getStagingLimit()!=null){
 		refStageArr = lmtTrxObj.getStagingLimit().getLimitSysXRefs();
 	 }
 	
 	if(null!=refStageArr){
		for(int k=0;k<refStageArr.length;k++){
		 if(null!=refStageArr[k].getCustomerSysXRef().getLineCovenant() && refStageArr[k].getCustomerSysXRef().getLineCovenant().length!=0 ){
			 stageLimit=refStageArr[k].getCustomerSysXRef().getLineCovenant()[0];
		 }
		}
 	}
 	if(null!=refArr){
		for(int k=0;k<refArr.length;k++){
		 if(null!=refArr[k].getCustomerSysXRef().getLineCovenant() && refArr[k].getCustomerSysXRef().getLineCovenant().length!=0){
			 actualLimit=refArr[k].getCustomerSysXRef().getLineCovenant()[0];
		 }
		}
 	}
 	

    boolean isMr = false;
    String scodLineNoList=PropertyManager.getValue("scod.linenocode.name");
    		//PropertyManager.getValue("scod.linenocode.name");
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
        isMr = true;
    }
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
   
    boolean isUserCpcMaker = false;       
    if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I){
    	isUserCpcMaker = true;
    }
    System.out.println("isUserCpcMaker>>>>>>>>>>"+isUserCpcMaker);
    MILimitUIHelper helper = new MILimitUIHelper();
    boolean isLmtSecChange = false;
    
    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");

    

	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String updateEvent=(String)request.getAttribute("updateEvent");
	if(updateEvent==null)
		updateEvent="";
	
	request.setAttribute("updateEvent",updateEvent);
	DecimalFormat dft = new DecimalFormat("#0.00");
	
	String isCreate=(String)request.getAttribute("isCreate");
	System.out.println("isCreate:"+isCreate);
	
	 String fcunsSystem=PropertyManager.getValue("fcubs.systemName");
	  String ubslimitSystem=PropertyManager.getValue("ubs.systemName"); 
	  IGeneralParamDao generalParamDao =(IGeneralParamDao)BeanHouse.get("generalParamDao");
	  IGeneralParamGroup generalParamGroup  =generalParamDao.getGeneralParamGroupByGroupType("actualGeneralParamGroup", "GENERAL_PARAM");
	  IGeneralParamEntry[]generalParamEntries= generalParamGroup.getFeedEntries();
	  String appDate="";
	  DateFormat df=new SimpleDateFormat("dd/MMM/yyyy");
	  for(int i=0;i<generalParamEntries.length;i++){
	  	if(generalParamEntries[i].getParamCode().equals("APPLICATION_DATE")){
	  		System.out.println("generalParamEntries[i].getParamValue():"+generalParamEntries[i].getParamValue());
	  		appDate=df.format(new Date((generalParamEntries[i].getParamValue())));
	  	}
	  }
	  
	  String status= (String) request.getAttribute("status");
	  

		
		 List restCountryListForLine = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.sessionCountryListForLine");
			if (!(restCountryListForLine == null)) {
				restCountryListForLine = new ArrayList<String>(new LinkedHashSet<String>(restCountryListForLine));
				pageContext.setAttribute("restCountryListForLine", restCountryListForLine);
			}else 
			{
				restCountryListForLine = new ArrayList();
				pageContext.setAttribute("restCountryListForLine", new ArrayList());
			}
			
	 List restBankListForLine = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.sessionBankListForLine");
				if (!(restBankListForLine == null)) {
						pageContext.setAttribute("restBankListForLine", restBankListForLine);
					restBankListForLine = new ArrayList<String>(new LinkedHashSet<String>(restBankListForLine));
				 	pageContext.setAttribute("restBankListForLine", restBankListForLine);
				}else 
				{
					restBankListForLine = new ArrayList();
					pageContext.setAttribute("restBankListForLine", new ArrayList());
				}
				
	 List restCurrencyListForLine = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.sessionCurrencyListForLine");
					if (!(restCurrencyListForLine == null)) {
						restCurrencyListForLine = new ArrayList<String>(new LinkedHashSet<String>(restCurrencyListForLine));
						pageContext.setAttribute("restCurrencyListForLine", restCurrencyListForLine);
					}else 
					{
						restCurrencyListForLine = new ArrayList();
						pageContext.setAttribute("restCurrencyListForLine", new ArrayList());
					}
					
	List restDrawerListForLine = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.sessionDrawerListForLine");
					if (!(restDrawerListForLine == null)) {
						restDrawerListForLine = new ArrayList<String>(new LinkedHashSet<String>(restDrawerListForLine));
						pageContext.setAttribute("restDrawerListForLine", restDrawerListForLine);
					}else 
					{
						restDrawerListForLine = new ArrayList();
						pageContext.setAttribute("restDrawerListForLine", new ArrayList());
					}				

	List restDraweeListForLine = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.sessionDraweeListForLine");
					if (!(restDraweeListForLine == null)) {
						restDraweeListForLine = new ArrayList<String>(new LinkedHashSet<String>(restDraweeListForLine));
						pageContext.setAttribute("restDraweeListForLine", restDraweeListForLine);
					}else 
					{
						restDraweeListForLine = new ArrayList();
						pageContext.setAttribute("restDraweeListForLine", new ArrayList());
					}
					
	List restBeneListForLine = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.sessionBeneListForLine");
					if (!(restBeneListForLine == null)) {
						restBeneListForLine = new ArrayList<String>(new LinkedHashSet<String>(restBeneListForLine));
						pageContext.setAttribute("restBeneListForLine", restBeneListForLine);
					}else 
					{
						restBeneListForLine = new ArrayList();
						pageContext.setAttribute("restBeneListForLine", new ArrayList());
					}
					int dwerNo = 0;
					int dweeNo = 0;
					int beneNo = 0;
					int countryNo = 0;
					int goodsNo= 0;
					int curNo = 0;
					int bankNo = 0;
					
					String fromEvent=(String)request.getAttribute("fromEvent");
					System.out.println("fromEvent:"+fromEvent);
					
					List covenantGoodsRestrictionList = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_COVENANT_GOODS_RESTRICTION_LIST_LINE);
					
					pageContext.setAttribute("covenantGoodsRestrictionList", covenantGoodsRestrictionList==null? Collections.emptyList():covenantGoodsRestrictionList);
					
					String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
					pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);
					String adhocFac =(String) request.getParameter("adhocFacility");
					System.out.println("Line_covenant_view.jsp=>adhocFac:"+adhocFac);
%>



<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceBeginEditable name="head" -->
    
    <script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
	<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
	<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>

    <script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script type="text/javascript" src="js/ajaxList.js"></script>
    <script type="text/javascript" src="js/ajaxSancAmount.js"></script>

    <script language="javascript">


function backToMainPage(){
	var fromEvent =  '<%=fromEvent%>';
	document.forms[0].action="MILineCovenant.do";
	if(fromEvent!="process" && fromEvent!="read" && fromEvent!="prepare_close" && fromEvent!="view" 
			&& fromEvent!="updateStatus" && fromEvent!="close" && fromEvent!="reopen" && fromEvent!="prepare_delete"){
		document.forms[0].event.value = "cancel_covenant_detail";
	}else if(fromEvent=="process" || fromEvent=="prepare_close" || fromEvent=="view" 
			|| fromEvent=="read" || fromEvent=="prepare_delete"){
		document.forms[0].event.value = "ok_covenant_detail_process";
	}else if(fromEvent=="updateStatus"){
		document.forms[0].event.value = "ok_covenant_detail_update_status";
	}else if(fromEvent=="close"){
		document.forms[0].event.value = "ok_covenant_detail_close";
	}else if(fromEvent=="reopen"){
		document.forms[0].event.value = "ok_covenant_detail_reopen";
	}else{
		document.forms[0].event.value = "ok_covenant_detail";
	}
    document.forms[0].submit();
}

function goToEditPage(){
	var adhocFac1 = '<%=adhocFac%>';
	document.forms[0].action="MILineCovenant.do";
	document.forms[0].action="MILineCovenant.do?event=edit_covenant_detail&adhocFacility="+adhocFac1;
	//document.forms[0].event.value = "edit_covenant_detail";
    document.forms[0].submit();
}

</script>
				
</head>

<body >
<br>
&nbsp;&nbsp;<html:errors property="facilitySystemID"/> 
<p class="required"><font color="#FF0000">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>


<html:form action="MILineCovenant.do">
    <input type="hidden" name="event" value="<%=request.getAttribute("event") %>"/>
    <input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
    <input type="hidden" name="fromEvent" value="<%=request.getAttribute("fromEvent") %>"/>
    <input type="hidden" name="indexID" value="<%=request.getAttribute("indexID") %>"/>
    <input type="hidden" name="lineDetailId" value=""/>
    <input type="hidden" name="itemType" value=""/>
    <input type="hidden" name="limitProfileID" value="<%=request.getAttribute("limitProfileID") %>"/>
	<input type="hidden" name="customerID" value="<%=request.getAttribute("customerID") %>"/>
	<input type="hidden" name="limitId" value="<%=request.getAttribute("limitId") %>"/>
	<input type="hidden" name="limitRef" value="<%=request.getAttribute("limitRef") %>"/>
	<input type="hidden" name="fromEventForLineCov" value="<%=request.getAttribute("fromEventForLineCov") %>"/>
	<input type="hidden" name="isLineCreate" value="<%=request.getAttribute("isLineCreate") %>"/>
	<input type="hidden" name="isCreate" value=""/>
	<input type="hidden" name="facilityType" value="<%=request.getParameter("facilityType") %>">
	<input type="hidden" name="adhocFacility" value="<%=request.getParameter("adhocFacility") %>">
	
	<%System.out.println("limitId "+request.getAttribute("limitId")); %>
	<%System.out.println("limitId "+request.getAttribute("customerID")); %>
	<%System.out.println("fromEventForLineCov "+request.getAttribute("fromEventForLineCov")); %>
   <%--  <html:hidden property="limitId"/>
    <html:hidden property="isCreate"/> --%>
    
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj" type="com.integrosys.cms.app.limit.trx.ILimitTrxValue" scope="session"/>
    <bean:define id="formObj" name="LineCovenantDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.line.covenant.LineCovenantDetailForm"/>
     <%if(!request.getAttribute("fromEvent").equals("process")
    		 && !request.getAttribute("fromEvent").equals("read")
    		 && !request.getAttribute("fromEvent").equals("view")
    		 && !request.getAttribute("fromEvent").equals("prepare_close")
    		 && !request.getAttribute("fromEvent").equals("prepare_delete")
    		 ){
    		 System.out.println("<<<<<<<LmtDetailForm:fromEvent:>>>>>>>"+request.getAttribute("fromEvent"));
    		 %>
    	<html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>  
     <%} %>
      <% String xReferenceId =(String) request.getAttribute("xReferenceId");
    if(xReferenceId!=null){
    	formObj.setLineNo(xReferenceId);
    } 
    System.out.println("xReferenceId====>"+xReferenceId);

     %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%"><h3>View CAM Covenant-Specific Covenant</h3></td>
        <td width="19%" align="right" valign="bottom">&nbsp; </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
  
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" border="0" align="center">
<tbody>
<tr class="odd">
      <td class="fieldname"><bean:message key="label.covenant.facility.id"/>&nbsp;</td>
    <td colspan="3">- &nbsp;
        <html:hidden property="facilityId"/>
    </td>
   <td class="fieldname"><bean:message key="label.covenant.line.no"/>&nbsp;</td>
    <td colspan="5"> <bean:write name="LineCovenantDetailForm" property="lineNo"/>&nbsp;
        <html:hidden property="lineNo"/>
    </td>
</tr>
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="even" >
	 <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"covenantReqd")?"fieldname":"fieldnamediff"%>" width="20%">
	 <bean:message key="label.covenant.applicable"/><font color="#FF0000">*</font> </td>
      	<td colspan="8" >  
      	<% if(formObj.getCovenantRequired()==null || formObj.getCovenantRequired().equals("")){%> 
      	<input type="radio" id="covenantRequired" name="covenantRequired"  value="Y" disabled="true"/> Required
  		<input type="radio" id="covenantRequired" name="covenantRequired" value="N" disabled="true" /> Not Required
  		<%}else if(formObj.getCovenantRequired().equals("N")){ %> 
  			<input type="radio" id="covenantRequired" name="covenantRequired"  value="Y" disabled="true"/> Required
  		<input type="radio" id="covenantRequired" name="covenantRequired" value="N" checked="checked" disabled="true" /> Not Required
  		<%}else { %> 
  		<input type="radio" id="covenantRequired" name="covenantRequired"  value="Y" checked="checked" disabled="true"/> Required
  		<input type="radio" id="covenantRequired" name="covenantRequired" value="N"  disabled="true"/> Not Required
  		<%} %>
	      <html:hidden property="covenantRequired"/>
       </td> 
</tr>
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="odd" >
 	 <td class="fieldname" >List of Specific Covenants</td>
      <td colspan="7" align="center">
      <% if(request.getAttribute("event").equals("prepare_edit_covenant_detail")||request.getAttribute("event").equals("prepare_create_covenant_detail") ){ %>
<%if(!"process".equals(request.getAttribute("fromEventForLineCov")) 
		&& !"read".equals(request.getAttribute("fromEventForLineCov"))
		&& !request.getAttribute("fromEvent").equals("process")
		&& !request.getAttribute("fromEvent").equals("read")
		&& !request.getAttribute("fromEvent").equals("view")
		&& !request.getAttribute("fromEvent").equals("prepare_close")
		&& !request.getAttribute("fromEvent").equals("updateStatus")
		&& !request.getAttribute("fromEvent").equals("close")
		&& !request.getAttribute("fromEvent").equals("reopen")
		&& !request.getAttribute("fromEvent").equals("prepare_delete")){%>
             <input class="btnNormal" type="button" name="btnedit" id="btnedit" value="Edit" onclick="javascript:goToEditPage()"> 
             <%} }%>
       </td> 
</tr>
<tr class="odd" >
 	 <td class="fieldname"></td>
      <td colspan="3">
       <% if(formObj.getCountryRestriction()==null || formObj.getCountryRestriction().equals("")||formObj.getCountryRestriction().equals("N")){%> 
	     <html:checkbox  property="countryRestriction" styleId="countryRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="countryRestriction" styleId="countryRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>
	      <bean:message key="label.covenant.country.restriction"/>&nbsp; 
	      <html:hidden property="countryRestriction"/>
       </td> 
       <td colspan="5">
	      <% if(formObj.getDrawerRestriction()==null || formObj.getDrawerRestriction().equals("")||formObj.getDrawerRestriction().equals("N")){%> 
	     <html:checkbox  property="drawerRestriction" styleId="drawerRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="drawerRestriction" styleId="drawerRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>  
	      <bean:message key="label.covenant.drawer"/>&nbsp;      
	      <html:hidden property="drawerRestriction"/>
       </td> 
</tr>
<tr class="even" >  
  	  <td class="fieldname"></td>
  	  <td colspan="3">
	      <% if(formObj.getDraweeRestriction()==null || formObj.getDraweeRestriction().equals("")||formObj.getDraweeRestriction().equals("N")){%>         
	    <html:checkbox  property="draweeRestriction" styleId="draweeRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="draweeRestriction" styleId="draweeRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>   
	      <bean:message key="label.covenant.drawee"/>&nbsp;  
	      <html:hidden property="draweeRestriction"/>
       </td> 
       <td colspan="5">
	       <% if(formObj.getBeneRestriction()==null || formObj.getBeneRestriction().equals("")||formObj.getBeneRestriction().equals("N")){%>         
	    <html:checkbox  property="beneRestriction" styleId="beneRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="beneRestriction" styleId="beneRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>  
	      <bean:message key="label.covenant.beneficiary"/>&nbsp;  
	      <html:hidden property="beneRestriction"/>
       </td> 
</tr>
<tr class="odd" >
	  <td class="fieldname"></td>
	   <td colspan="3">
	     <% if(formObj.getCombinedTenorRestriction()==null || formObj.getCombinedTenorRestriction().equals("")||formObj.getCombinedTenorRestriction().equals("N")){%>         
	     <html:checkbox  property="combinedTenorRestriction" styleId="combinedTenorRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="combinedTenorRestriction" styleId="combinedTenorRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>  
	      <bean:message key="label.covenant.combined.Tenor"/>&nbsp;     
	      <html:hidden property="combinedTenorRestriction"/>
       </td> 
       <td colspan="5" >
        <% if(formObj.getRunningAccountRestriction()==null || formObj.getRunningAccountRestriction().equals("")||formObj.getRunningAccountRestriction().equals("N")){%>         
	    <html:checkbox  property="runningAccountRestriction" styleId="runningAccountRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="runningAccountRestriction" styleId="runningAccountRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>  
	      <bean:message key="label.covenant.running.account"/>&nbsp;          
	      <html:hidden property="runningAccountRestriction"/>
       </td> 
</tr>
<tr class="even" >	  
       <td class="fieldname"></td>
        <td colspan="3" >
	        <% if(formObj.getSellDownRestriction()==null || formObj.getSellDownRestriction().equals("")||formObj.getSellDownRestriction().equals("N")){%>         
	     <html:checkbox  property="sellDownRestriction" styleId="sellDownRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="sellDownRestriction" styleId="sellDownRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>   
	      <bean:message key="label.covenant.sellDown"/>&nbsp;      
	      <html:hidden property="sellDownRestriction"/>
       </td> 
       <td colspan="5" >
	       <% if(formObj.getAvailDateRestriction()==null || formObj.getAvailDateRestriction().equals("")||formObj.getAvailDateRestriction().equals("N")){
	       System.out.println("<<<<<<<<formObj.getAvailDateRestriction()>>>>>>>>"+formObj.getAvailDateRestriction());
	       %>         
	     <html:checkbox  property="availDateRestriction" styleId="availDateRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="availDateRestriction" styleId="availDateRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>    
	      <bean:message key="label.covenant.lastAvailableDate"/>&nbsp;          
	      <html:hidden property="availDateRestriction"/>
       </td>
</tr>	
<tr class="odd" >	  
       <td class="fieldname"></td>  
       <td colspan="3" >
	     <% if(formObj.getMoratoriumRestriction()==null || formObj.getMoratoriumRestriction().equals("")||formObj.getMoratoriumRestriction().equals("N")){%>         
	    <html:checkbox  property="moratoriumRestriction" styleId="moratoriumRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="moratoriumRestriction" styleId="moratoriumRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>   
	      <bean:message key="label.covenant.moratorium"/>&nbsp; 
	      <html:hidden property="moratoriumRestriction"/>
       </td> 
       <td colspan="5">
	        <% if(formObj.getGoodsRestriction()==null || formObj.getGoodsRestriction().equals("")||formObj.getGoodsRestriction().equals("N")){%>         
	    <html:checkbox  property="goodsRestriction" styleId="goodsRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="goodsRestriction" styleId="goodsRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>   
	      <bean:message key="label.covenant.goods.restriction"/>&nbsp;
	      <html:hidden property="goodsRestriction"/>
       </td>
</tr>
<tr class="even" >	  
       <td class="fieldname"></td>	  
       <td colspan="3">
	      <% System.out.println(formObj.getCurrencyRestrictions());
	      if(formObj.getCurrencyRestrictions()==null || formObj.getCurrencyRestrictions().equals("")||formObj.getCurrencyRestrictions().equals("N")){%>         
	     <html:checkbox  property="currencyRestrictions" styleId="currencyRestrictions" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="currencyRestrictions" styleId="currencyRestrictions" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>  
	      <bean:message key="label.covenant.currency.restriction"/>&nbsp;  
	      <html:hidden property="currencyRestrictions"/>
       </td> 
       <td colspan="5">
	       <% if(formObj.getBankRestriction()==null || formObj.getBankRestriction().equals("")||formObj.getBankRestriction().equals("N")){%>         
	     <html:checkbox  property="bankRestriction" styleId="bankRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="bankRestriction" styleId="bankRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>   
	      <bean:message key="label.covenant.bank.restriction"/>&nbsp;   
	      <html:hidden property="bankRestriction"/>
       </td>
</tr>	
<tr class="odd" >	  
       <td class="fieldname"></td>  
       <td colspan="3">
	       <% if(formObj.getBuyersRatingRestriction()==null || formObj.getBuyersRatingRestriction().equals("")||formObj.getBuyersRatingRestriction().equals("N")){%>         
	    <html:checkbox  property="buyersRatingRestriction" styleId="buyersRatingRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="buyersRatingRestriction" styleId="buyersRatingRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>    
	      <bean:message key="label.covenant.buyers.rating"/>&nbsp;
	      <html:hidden property="buyersRatingRestriction"/>
       </td> 
       <td colspan="5" >
	         <% if(formObj.getEcgcCoverRestriction()==null || formObj.getEcgcCoverRestriction().equals("")||formObj.getEcgcCoverRestriction().equals("N")){%>         
	   <html:checkbox  property="ecgcCoverRestriction" styleId="ecgcCoverRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="ecgcCoverRestriction" styleId="ecgcCoverRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>  
	      <bean:message key="label.covenant.ecgcCover"/>&nbsp;   
	      <html:hidden property="ecgcCoverRestriction"/>
       </td>
</tr>
<tr>
<td colspan="8">&nbsp;</td></tr>   	
<tr class="even">
<td class="fieldname"><bean:message key="label.covenant.country.restriction"/></td>    
 <td colspan="7" >
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									
										<td>S/N</td>
										<td>Disallowed Country Name</td>
										<td>Currency & Amount</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restCountryListForLine">
										<logic:iterate id="ob" name="restCountryListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
											countryNo++;
														if (countryNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=countryNo%></td>
												<td>
												<center><%=ob.getRestrictedCountryname()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getRestrictedAmount()%>&nbsp;</center>
												</td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
	      <html:hidden property="countryRestrictionName"/>
</tr>	      
<tr><td colspan="8">&nbsp;</td></tr> 
<tr class="odd">	  
       <td class="fieldname"><bean:message key="label.covenant.drawer"/></td>  
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"drawerName")?"fieldname":"fieldnamediff"%>"  width="20%">
       <bean:message key="label.covenant.drawer.name"/></td>  
       <td colspan="7" >&nbsp;
	      <html:hidden property="drawerName"/></td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"drawerAmount")?"fieldname":"fieldnamediff"%>" width="20%">Amount(From CAM)</td>
	   <td colspan="7" >&nbsp;
	      <html:hidden property="drawerAmount"/>
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"drawerCustId")?"fieldname":"fieldnamediff"%>" width="20%" >UBS Id/Cust Id</td>   
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="drawerCustId"/>	   
	      </td>
 </tr>
<tr class="even" >	
       <td class="fieldname"></td>
         <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"drawerCustName")?"fieldname":"fieldnamediff"%>" width="20%">
         <bean:message key="label.covenant.customer.name"/></td>   
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="drawerCustName"/></td>
 </tr>
 <tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									<td>S/N</td>
										<td>Drawer Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Drawer Name</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restDrawerListForLine">
										<logic:iterate id="ob" name="restDrawerListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
											dwerNo++;
														if (dwerNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=dwerNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDrawerName()) && ob.getDrawerName() !=null && !"null".equalsIgnoreCase(ob.getDrawerName()))?ob.getDrawerName():"-"%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDrawerAmount()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDrawerCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDrawerCustName()) && ob.getDrawerCustName() !=null && !"null".equalsIgnoreCase(ob.getDrawerCustName()))?ob.getDrawerCustName():"-"%>&nbsp;</center>
												
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
</tr>	
 <tr><td colspan="8">&nbsp;</td></tr>

<tr class="odd" >		  
       <td class="fieldname"><bean:message key="label.covenant.drawee"/></td>  
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"draweeName")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.drawee.name"/></td>  
       <td colspan="7" >&nbsp;
	      	<html:hidden property="draweeName"/></td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"draweeAmount")?"fieldname":"fieldnamediff"%>" width="20%">Amount(From CAM)</td>
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="draweeAmount"/>
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"draweeCustId")?"fieldname":"fieldnamediff"%>" width="20%">UBS Id/Cust Id</td>   
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="draweeCustId"/></td>
 </tr>
<tr class="even" >	
       <td class="fieldname"></td>
         <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"draweeCustName")?"fieldname":"fieldnamediff"%>" width="20%">
         <bean:message key="label.covenant.customer.name"/></td>   
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="draweeCustName"/>
	   </td>
 </tr>
 <tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									<td>S/N</td>
										<td>Drawee Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Drawee Name</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restDraweeListForLine">
										<logic:iterate id="ob" name="restDraweeListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
											dweeNo++;
														if (dweeNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=dweeNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDraweeName()) && ob.getDraweeName() !=null && !"null".equalsIgnoreCase(ob.getDraweeName()))?ob.getDraweeName():"-"%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDraweeAmount()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDraweeCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDraweeCustName()) && ob.getDraweeCustName() !=null && !"null".equalsIgnoreCase(ob.getDraweeCustName()))?ob.getDraweeCustName():"-"%>&nbsp;</center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
</tr>
 <tr><td colspan="8">&nbsp;</td></tr> 
 
<tr class="odd" >		  
       <td class="fieldname"><bean:message key="label.covenant.beneficiary"/></td>  
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"beneName")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.beneficiary.name"/></td>  
       <td colspan="7" >&nbsp;
	      	<html:hidden property="beneficiaryName"/></td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"beneAmount")?"fieldname":"fieldnamediff"%>" width="20%">Amount(From CAM)</td>
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="beneficiaryAmount"/>	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"beneCustId")?"fieldname":"fieldnamediff"%>" width="20%">UBS Id/Cust Id</td>   
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="beneficiaryCustId"/></td>
 </tr>
<tr class="even" >	
       <td class="fieldname"></td>
         <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"beneCustName")?"fieldname":"fieldnamediff"%>" width="20%">
         <bean:message key="label.covenant.customer.name"/></td>   
	   <td colspan="7" >&nbsp;
	      	<html:hidden property="beneficiaryCustName"/>
	   </td>
 </tr>
 <tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									<td>S/N</td>
										<td>Beneficiary Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Beneficiary Name</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restBeneListForLine">
										<logic:iterate id="ob" name="restBeneListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
											beneNo++;
														if (beneNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=beneNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getBeneName()) && ob.getBeneName() !=null && !"null".equalsIgnoreCase(ob.getBeneName()))?ob.getBeneName():"-"%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getBeneAmount()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getBeneCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getBeneCustName()) && ob.getBeneCustName() !=null && !"null".equalsIgnoreCase(ob.getBeneCustName()))?ob.getBeneCustName():"-"%>&nbsp;</center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
</tr>	
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="odd" >		  
       <td class="fieldname"><bean:message key="label.covenant.combined.Tenor"/></td>  
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"maxCombinedTenor")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.max.Combined.Tenor"/></td>  
       <td colspan="7" >
       <bean:write name="LineCovenantDetailForm" property="maxCombinedTenor"/>&nbsp;
	      	<html:hidden property="maxCombinedTenor"/></td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"preshipmentLinkage")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.preShipment.Linkage"/></td>  
	   <td colspan="7" >
	   <bean:write name="LineCovenantDetailForm" property="preShipmentLinkage"/>&nbsp;
	      	<html:hidden property="preShipmentLinkage"/>
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"postShipmentLinkage")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.postShipmentLinkage"/></td>  
	   <td colspan="7" >
	   <bean:write name="LineCovenantDetailForm" property="postShipmentLinkage"/>&nbsp;
	      	<html:hidden property="postShipmentLinkage"/>
	   </td>
 </tr>
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="even" >		  
       <td class="fieldname">Running Account(EPC)</td>  
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"runningAccount")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.runningAccount"/></td>  
       <td colspan="7" >
        <bean:write name="LineCovenantDetailForm" property="runningAccount"/>&nbsp;
	      	<html:hidden property="runningAccount"/></td>
</tr>
<tr class="odd" >		  
       <td class="fieldname"></td>  
       <td colspan="7" class="fieldname">OR</td>  
</tr>
<tr class="even" >	
	   <td class="fieldname"></td> 
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"orderBackedbylc")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.orderBackedByLC"/></td>  
       <td colspan="7" >
       <bean:write name="LineCovenantDetailForm" property="orderBackedByLC"/>&nbsp;
	      	<html:hidden property="orderBackedByLC"/></td>
</tr>
<tr class="odd" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"incoTerm")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.incoTerm"/></td>
       <td >
        <bean:write name="LineCovenantDetailForm" property="incoTerm"/>&nbsp;
	      	<html:hidden property="incoTerm"/>
       </td>  
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"incoTermMarginPercent")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.incoMargin"/></td> 
	   <td>
	   <bean:write name="LineCovenantDetailForm" property="incoMargin"/>&nbsp;
	      	<html:hidden property="incoMargin"/></td>
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"incoTermDesc")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.incoDescription"/></td>
	   <td >
	   <bean:write name="LineCovenantDetailForm" property="incoDescription"/>&nbsp;
	      	<html:hidden property="incoDescription"/> </td>
	   
 </tr>
 <tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"moduleCode")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.moduleCode"/></td>  
	   <td>
	    <bean:write name="LineCovenantDetailForm" property="moduleCode"/>&nbsp;
	      	<html:hidden property="moduleCode"/>
	   </td>
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"commitmentTenor")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.commitmentTenor"/></td> 
	   <td colspan="5" >
	   <bean:write name="LineCovenantDetailForm" property="commitmentTenor"/>&nbsp;
	      	<html:hidden property="commitmentTenor"/> </td>
 </tr>
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="odd" >	
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"sellDown")?"fieldname":"fieldnamediff"%>" width="20%">
		<bean:message key="label.covenant.sellDown"/></td>  
	   <td colspan="7" >
	   <bean:write name="LineCovenantDetailForm" property="sellDown"/>&nbsp;
	      	<html:hidden property="sellDown"/>
	   </td>
</tr>  
<tr><td colspan="8">&nbsp;</td></tr>  
<tr class="even" >	
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"lastAvailableDate")?"fieldname":"fieldnamediff"%>" width="20%">
		<bean:message key="label.covenant.lastAvailableDate"/></td>  
	   <td  colspan="7" >
	   <bean:write name="LineCovenantDetailForm" property="lastAvailableDate"/>&nbsp;
	      	<html:hidden property="lastAvailableDate"/>
	   </td>
</tr>   
<tr><td colspan="8">&nbsp;</td></tr>  
<tr class="even" >
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"moratoriumPeriod")?"fieldname":"fieldnamediff"%>" width="20%">Moratorium Period(In Months)</td>
		<td colspan="7" >
		<bean:write name="LineCovenantDetailForm" property="moratorium"/>&nbsp;
	      	<html:hidden property="moratorium"/></td>
</tr>
<tr class="odd" >	
  <td class="fieldname"></td>  
      <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"emiFrequency")?"fieldname":"fieldnamediff"%>" width="20%">EMI Frequency</td>
	    <td >
	    <bean:write name="LineCovenantDetailForm" property="emiFrequency"/>&nbsp;
	      	<html:hidden property="emiFrequency"/>
	   </td> 
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"noOfInstallments")?"fieldname":"fieldnamediff"%>" width="20%">No Of Installments</td>  
	   <td  colspan="5" >
	   <bean:write name="LineCovenantDetailForm" property="noOfInsallments"/>&nbsp;
	      	<html:hidden property="noOfInsallments"/>
	   </td>
</tr> 
  
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="even" >	
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"goodsRestrictionCode")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.goods.restriction"/>  </td>
	    <td  colspan="7" >
	    	<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="goodsRestrictionCode"/></tr>
									<tr>
										<td>S/N</td>
										<td>Parent Goods Code</td>
										<td>Child Goods Code</td>
										<td>Sub Child Goods Code</td>
										<td>Select</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="covenantGoodsRestrictionList">
										<logic:iterate id="ob" name="covenantGoodsRestrictionList"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
																							goodsNo++;
																							if (goodsNo % 2 != 0) {
																								rowClass = "odd";
																							} else {
																								rowClass = "even";
																							}
																							
																					String goodsParentCodeStr = ob.getGoodsRestrictionParentCode();
																					String goodsChildCodeStr = ob.getGoodsRestrictionChildCode();
																					String goodsSubChildCodeStr = ob.getGoodsRestrictionSubChildCode();
																					String goodsRestrictionComboCodeStr = ob.getGoodsRestrictionComboCode();
																					//int goodsCodeStrLength = goodsCodeStr.trim().length();		
																					//String goodsCodeStr = ob.getGoodsRestrictionCode();	
																					//int goodsCodeStrLength = goodsCodeStr.trim().length();
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=goodsNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(goodsParentCodeStr) && (StringUtils.isBlank(goodsChildCodeStr) || "0".equalsIgnoreCase(goodsChildCodeStr))
														&& 
														(StringUtils.isBlank(goodsSubChildCodeStr)  || "0".equalsIgnoreCase(goodsChildCodeStr)))?goodsParentCodeStr:"-"%>&nbsp;
												</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(goodsParentCodeStr) && (StringUtils.isNotBlank(goodsChildCodeStr) && !"0".equalsIgnoreCase(goodsChildCodeStr)) && 
														(StringUtils.isBlank(goodsSubChildCodeStr)  || "0".equalsIgnoreCase(goodsSubChildCodeStr) ))?goodsChildCodeStr:"-"%>&nbsp;
												</center>												
												</td>
												<td>
												<center><%=(
														StringUtils.isNotBlank(goodsSubChildCodeStr) && !"0".equalsIgnoreCase(goodsSubChildCodeStr))?goodsSubChildCodeStr:"-"%>&nbsp;
												</center>												
												</td>
												<td><input type="checkbox" id="goodsRestrictionCheckbox" value="<%=goodsRestrictionComboCodeStr%>" disabled="disabled"></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
									
								</tbody>
							</table>
	     	<%-- <bean:write name="LineCovenantDetailForm" property="goodsRestrictionCode"/>&nbsp; 
	      	<html:hidden property="goodsRestrictionCode"/>--%>
	   </td>
</tr>   
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="even" >	  
       <td class="fieldname">
       <bean:message key="label.covenant.currency.restriction"/></td>    
	   <td colspan="7" ></td>
</tr>
<tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
										<td>S/N</td>
										<td>Restricted Currency</td>
										<td>Maximum Exposure Amount</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restCurrencyListForLine">
										<logic:iterate id="ob" name="restCurrencyListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
														curNo++;
														if (curNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=curNo%></td>
												<td>
												<center><%=ob.getRestrictedCurrency()%>&nbsp;</center>
												</td>
												<td><center><%=ob.getRestrictedCurrencyAmount()%>&nbsp;</center></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
	      	<html:hidden property="currencyRestrictionCode"/>
</tr>		
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="even" >	  
       <td class="fieldname" >
       <bean:message key="label.covenant.bank.restriction"/></td>    
	   <td colspan="7" ></td>
</tr>	
<tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
										<td>S/N</td>
										<td>Restricted Bank</td>
										<td>Maximum Exposure Amount</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restBankListForLine">
										<logic:iterate id="ob" name="restBankListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
														bankNo++;
														if (bankNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=bankNo%></td>
												<td>
												<center><%=ob.getRestrictedBank()%>&nbsp;</center>
												</td>
												<td><center><%=ob.getRestrictedBankAmount()%>&nbsp;</center></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
	      	<html:hidden property="bankRestrictionCode"/>
</tr>		
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="even" >
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"buyersRating")?"fieldname":"fieldnamediff"%>" width="20%">
		<bean:message key="label.covenant.buyers.rating"/></td>
		<td colspan="7" >
		<bean:write name="LineCovenantDetailForm" property="buyersRating"/>&nbsp;
	      	<html:hidden property="buyersRating"/></td>
</tr>
<tr class="odd" >	
  <td class="fieldname"></td>  
      <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"agencyMaster")?"fieldname":"fieldnamediff"%>" width="20%">Agency Master</td>
	    <td >
	   <bean:write name="LineCovenantDetailForm" property="agencyMasterCode"/>&nbsp;
	      	<html:hidden property="agencyMasterCode"/>
	   </td> 
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"ratingMaster")?"fieldname":"fieldnamediff"%>" width="20%">Rating Master</td>  
	   <td  colspan="4" >
	   <bean:write name="LineCovenantDetailForm" property="ratingMasterCode"/>&nbsp;
	      	<html:hidden property="ratingMasterCode"/>
	   </td>
</tr> 
  
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="odd" >	
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"ecgcCover")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.covenant.ecgcCover"/></td>  
	   <td  colspan="7" >
	   <bean:write name="LineCovenantDetailForm" property="ecgcCover"/>&nbsp;
	      	<html:hidden property="ecgcCover"/>
	   </td>
</tr>  
</tbody> 
</table>
</td>
</tr>
</tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="8">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="javascript:backToMainPage()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" /></a></td>
    </tr>
    <tr>
        <td colspan="8">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>     