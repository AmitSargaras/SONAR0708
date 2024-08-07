<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.covenant.ILmtCovenantConstants"%>
<%@page import="sun.reflect.ReflectionFactory.GetReflectionFactoryAction"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.util.Locale,
				 java.util.Collection,
				 java.util.Collections,
				 java.util.Iterator,
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
                 com.integrosys.cms.ui.manualinput.limit.covenant.LmtCovenantDetailForm,
                 com.integrosys.cms.app.limit.bus.ILimitCovenant,
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

    ILimitCovenant actualLimit = null;	
    ILimitCovenant stageLimit = null;
    
    if(lmtTrxObj.getLimit()!=null){
    if(lmtTrxObj.getLimit().getLimitCovenant()!=null && lmtTrxObj.getLimit().getLimitCovenant().length!=0 ){
    	actualLimit = lmtTrxObj.getLimit().getLimitCovenant()[0];
    }}
    if(lmtTrxObj.getStagingLimit()!=null){
    if(lmtTrxObj.getStagingLimit().getLimitCovenant()!=null && lmtTrxObj.getStagingLimit().getLimitCovenant().length!=0){
    	stageLimit = lmtTrxObj.getStagingLimit().getLimitCovenant()[0];
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
    System.out.println("isUserCpcMaker>>>>>>>>>>"+isUserCpcMaker+"================"+isMr);
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
	
	String fromEvent=(String)request.getAttribute("fromEvent");
	System.out.println("fromEvent:"+fromEvent);
	
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
	  
 List restCountryList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCountryList");
		if (!(restCountryList == null)) {
				pageContext.setAttribute("restCountryList", restCountryList);
		}else 
		{
			restCountryList = new ArrayList();
			pageContext.setAttribute("restCountryList", new ArrayList());
		}
List facCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerList");
pageContext.setAttribute("facCoBorrowerList", facCoBorrowerList);

String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);


 List restBankList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restBankList");
			if (!(restBankList == null)) {
					pageContext.setAttribute("restBankList", restBankList);
			}else 
			{
				restBankList = new ArrayList();
				pageContext.setAttribute("restBankList", new ArrayList());
			}
			
 List restCurrencyList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCurrencyList");
				if (!(restCurrencyList == null)) {
						pageContext.setAttribute("restCurrencyList", restCurrencyList);
				}else 
				{
					restCurrencyList = new ArrayList();
					pageContext.setAttribute("restCurrencyList", new ArrayList());
				}
				
List restDrawerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restDrawerList");
				if (!(restDrawerList == null)) {
						pageContext.setAttribute("restDrawerList", restDrawerList);
				}else 
				{
					restDrawerList = new ArrayList();
					pageContext.setAttribute("restDrawerList", new ArrayList());
				}				

List restDraweeList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restDraweeList");
				if (!(restDraweeList == null)) {
						pageContext.setAttribute("restDraweeList", restDraweeList);
				}else 
				{
					restDraweeList = new ArrayList();
					pageContext.setAttribute("restDraweeList", new ArrayList());
				}
				
List restBeneList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restBeneList");
				if (!(restBeneList == null)) {
						pageContext.setAttribute("restBeneList", restBeneList);
				}else 
				{
					restBeneList = new ArrayList();
					pageContext.setAttribute("restBeneList", new ArrayList());
				}
				int dwerNo = 0;
				int dweeNo = 0;
				int beneNo = 0;
				int countryNo = 0;
				int goodsNo = 0;
				int curNo = 0;
				int bankNo = 0;
				
				List covenantGoodsRestrictionList = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILmtCovenantConstants.SESSION_COVENANT_GOODS_RESTRICTION_LIST);
				
				pageContext.setAttribute("covenantGoodsRestrictionList", covenantGoodsRestrictionList==null? Collections.emptyList():covenantGoodsRestrictionList);
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
	document.forms[0].action="MILimitCovenant.do";
	if(fromEvent!="process" && fromEvent!="read" && fromEvent!="prepare_close"
			&& fromEvent!="prepare_delete" && fromEvent!="process_delete"){
		document.forms[0].event.value = "cancel_covenant_detail";
	}else if(fromEvent=="process"){
		document.forms[0].event.value = "ok_covenant_detail_process";
	}else if(fromEvent=="prepare_close"){
		document.forms[0].event.value = "ok_covenant_detail_prepare_close";
	}else if(fromEvent=="prepare_delete"){
		document.forms[0].event.value = "ok_covenant_detail_prepare_delete";
	}else if(fromEvent=="process_delete"){
		document.forms[0].event.value = "ok_covenant_detail_process_delete";
	}else{
		document.forms[0].event.value = "ok_covenant_detail";
	}
    document.forms[0].submit();
}

function goToEditPage(){
	document.forms[0].action="MILimitCovenant.do";
	document.forms[0].event.value = "edit_covenant_detail";
    document.forms[0].submit();
}

</script>
				
</head>

<body >
<br>
&nbsp;&nbsp;<html:errors property="facilitySystemID"/> 
<p class="required"><font color="#FF0000">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>


<html:form action="MILimitCovenant.do">
	<html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
    <input type="hidden" name="event" value="<%=request.getAttribute("event") %>"/>
    <input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
    <input type="hidden" name="fromEvent" value="<%=request.getAttribute("fromEvent") %>"/>
    <input type="hidden" name="indexID" value=""/>
    <input type="hidden" name="lineDetailId" value=""/>
    <input type="hidden" name="itemType" value=""/>
    <input type="hidden" name="isCreate" value="<%=request.getAttribute("isCreate") %>"/>
    <input type="hidden" name="limitProfileID" value="<%=request.getAttribute("limitProfileID") %>"/>
	<input type="hidden" name="customerID" value="<%=request.getAttribute("customerID") %>"/>
	<input type="hidden" name="limitId" value="<%=request.getAttribute("limitId") %>"/>
	<input type="hidden" name="limitRef" value="<%=request.getAttribute("limitRef") %>"/>
	<%System.out.println("isCreate "+request.getAttribute("isCreate")); %>
	<%System.out.println("limitId "+request.getAttribute("customerID")); %>
	<%System.out.println("limitRef "+request.getAttribute("limitRef")); %>
	<%System.out.println("FromEvent "+request.getAttribute("fromEvent")); %>
   <%--  <html:hidden property="limitId"/>
    <html:hidden property="isCreate"/> --%>
    
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj" type="com.integrosys.cms.app.limit.trx.ILimitTrxValue" scope="session"/>
    <bean:define id="formObj" name="LmtCovenantDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.covenant.LmtCovenantDetailForm"/>
     <% String lmtRef = (String)request.getAttribute("limitRef");
    if(lmtRef!=null){
    	formObj.setFacilityId(lmtRef);
    }
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
    <td colspan="3">
        <bean:write name="LmtCovenantDetailForm" property="facilityId" />&nbsp;
        <html:hidden property="facilityId"/>
    </td>
   <td class="fieldname"><bean:message key="label.covenant.line.no"/>&nbsp;</td>
    <td colspan="5">- &nbsp;
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
      <% if(request.getAttribute("event").equals("prepare_edit_covenant_detail")||request.getAttribute("event").equals("prepare_create_covenant_detail") ){ 
         if(!request.getAttribute("fromEvent").equals("process") 
        		 && !request.getAttribute("fromEvent").equals("read")
        		 && !request.getAttribute("fromEvent").equals("prepare_close")
        		 && !request.getAttribute("fromEvent").equals("prepare_delete")
        		 && !request.getAttribute("fromEvent").equals("process_delete")
        		 ){%>
             <input class="btnNormal" type="button" name="btnedit" id="btnedit" value="Edit" onclick="javascript:goToEditPage()"> 
             <%}} %>
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
	       <% if(formObj.getAvailDateRestriction()==null || formObj.getAvailDateRestriction().equals("")||formObj.getAvailDateRestriction().equals("N")){%>         
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
	      <% if(formObj.getCurrencyRestriction()==null || formObj.getCurrencyRestriction().equals("")||formObj.getCurrencyRestriction().equals("N")){%>         
	     <html:checkbox  property="currencyRestriction" styleId="currencyRestriction" disabled = "true" value ="N"></html:checkbox>
	     <%}else{ %>
	     <html:checkbox  property="currencyRestriction" styleId="currencyRestriction" disabled = "true" value ="Y"></html:checkbox>
	     <%} %>   
	      <bean:message key="label.covenant.currency.restriction"/>&nbsp;  
	      <html:hidden property="currencyRestriction"/>
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
										<td>Disallowed Country</td>
										<td>Currency & Amount</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="restCountryList">
										<logic:iterate id="ob" name="restCountryList"
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
									<logic:present name="restDrawerList">
										<logic:iterate id="ob" name="restDrawerList"
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
												<center><%=ob.getDrawerName()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDrawerAmount()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDrawerCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDrawerCustName()%>&nbsp;</center>
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
									<logic:present name="restDraweeList">
										<logic:iterate id="ob" name="restDraweeList"
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
												<center><%=ob.getDraweeName()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDraweeAmount()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDraweeCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDraweeCustName()%>&nbsp;</center>
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
									<logic:present name="restBeneList">
										<logic:iterate id="ob" name="restBeneList"
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
												<center><%=ob.getBeneName()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getBeneAmount()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getBeneCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getBeneCustName()%>&nbsp;</center>
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
       <bean:write name="LmtCovenantDetailForm" property="maxCombinedTenor"/>&nbsp;
	      	<html:hidden property="maxCombinedTenor"/></td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"preshipmentLinkage")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.preShipment.Linkage"/></td>  
	   <td colspan="7" >
	   <bean:write name="LmtCovenantDetailForm" property="preShipmentLinkage"/>&nbsp;
	      	<html:hidden property="preShipmentLinkage"/>
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"postShipmentLinkage")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.postShipmentLinkage"/></td>  
	   <td colspan="7" >
	   <bean:write name="LmtCovenantDetailForm" property="postShipmentLinkage"/>&nbsp;
	      	<html:hidden property="postShipmentLinkage"/>
	   </td>
 </tr>
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="even" >		  
       <td class="fieldname">Running Account(EPC)</td>  
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"runningAccount")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.runningAccount"/></td>  
       <td colspan="7" >
        <bean:write name="LmtCovenantDetailForm" property="runningAccount"/>&nbsp;
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
       <bean:write name="LmtCovenantDetailForm" property="orderBackedByLC"/>&nbsp;
	      	<html:hidden property="orderBackedByLC"/></td>
</tr>
<tr class="odd" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"incoTerm")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.incoTerm"/></td>
       <td >
        <bean:write name="LmtCovenantDetailForm" property="incoTerm"/>&nbsp;
	      	<html:hidden property="incoTerm"/>
       </td>  
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"incoTermMarginPercent")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.incoMargin"/></td> 
	   <td>
	   <bean:write name="LmtCovenantDetailForm" property="incoMargin"/>&nbsp;
	      	<html:hidden property="incoMargin"/></td>
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"incoTermDesc")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.incoDescription"/></td>
	   <td >
	   <bean:write name="LmtCovenantDetailForm" property="incoDescription"/>&nbsp;
	      	<html:hidden property="incoDescription"/> </td>
	   
 </tr>
 <tr class="even" >	
       <td class="fieldname"></td>
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"moduleCode")?"fieldname":"fieldnamediff"%>" width="20%">
       <bean:message key="label.covenant.moduleCode"/></td>  
	   <td>
	    <bean:write name="LmtCovenantDetailForm" property="moduleCode"/>&nbsp;
	      	<html:hidden property="moduleCode"/>
	   </td>
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"commitmentTenor")?"fieldname":"fieldnamediff"%>" width="20%">
	   <bean:message key="label.covenant.commitmentTenor"/></td> 
	   <td colspan="5" >
	   <bean:write name="LmtCovenantDetailForm" property="commitmentTenor"/>&nbsp;
	      	<html:hidden property="commitmentTenor"/> </td>
 </tr>
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="odd" >	
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"sellDown")?"fieldname":"fieldnamediff"%>" width="20%">
		<bean:message key="label.covenant.sellDown"/></td>  
	   <td colspan="7" >
	   <bean:write name="LmtCovenantDetailForm" property="sellDown"/>&nbsp;
	      	<html:hidden property="sellDown"/>
	   </td>
</tr>  
<tr><td colspan="8">&nbsp;</td></tr>  
<tr class="even" >	
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"lastAvailableDate")?"fieldname":"fieldnamediff"%>" width="20%">
		<bean:message key="label.covenant.lastAvailableDate"/></td>  
	   <td  colspan="7" >
	   <bean:write name="LmtCovenantDetailForm" property="lastAvailableDate"/>&nbsp;
	      	<html:hidden property="lastAvailableDate"/>
	   </td>
</tr>   
<tr><td colspan="8">&nbsp;</td></tr>  
<tr class="even" >
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"moratoriumPeriod")?"fieldname":"fieldnamediff"%>" width="20%">Moratorium Period(In Months)</td>
		<td colspan="7" >
		<bean:write name="LmtCovenantDetailForm" property="moratorium"/>&nbsp;
	      	<html:hidden property="moratorium"/></td>
</tr>
<tr class="odd" >	
  <td class="fieldname"></td>  
      <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"emiFrequency")?"fieldname":"fieldnamediff"%>" width="20%">EMI Frequency</td>
	    <td >
	    <bean:write name="LmtCovenantDetailForm" property="emiFrequency"/>&nbsp;
	      	<html:hidden property="emiFrequency"/>
	   </td> 
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"noOfInstallments")?"fieldname":"fieldnamediff"%>" width="20%">No Of Installments</td>  
	   <td  colspan="5" >
	   <bean:write name="LmtCovenantDetailForm" property="noOfInsallments"/>&nbsp;
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
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
												<center><%=(StringUtils.isNotBlank(goodsParentCodeStr) && StringUtils.isBlank(goodsChildCodeStr) && 
														StringUtils.isBlank(goodsSubChildCodeStr))?goodsParentCodeStr:"-"%>&nbsp;
												</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(goodsParentCodeStr) && StringUtils.isNotBlank(goodsChildCodeStr) && 
														StringUtils.isBlank(goodsSubChildCodeStr))?goodsChildCodeStr:"-"%>&nbsp;
												</center>												
												</td>
												<td>
												<center><%=(
														StringUtils.isNotBlank(goodsSubChildCodeStr))?goodsSubChildCodeStr:"-"%>&nbsp;
												</center>												
												</td>
												<td><input type="checkbox" id="goodsRestrictionCheckbox" value="<%=goodsRestrictionComboCodeStr%>" disabled="disabled"></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
									
								</tbody>
							</table>
	    
	     	<%-- <bean:write name="LmtCovenantDetailForm" property="goodsRestrictionCode"/>&nbsp;
	      	<html:hidden property="goodsRestrictionCode"/> --%>
	   </td>
</tr>   
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="even">
 <td class="fieldname">
       <bean:message key="label.covenant.currency.restriction"/></td>    
	    <td colspan="7" >
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
									<logic:present name="restCurrencyList">
										<logic:iterate id="ob" name="restCurrencyList"
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
												<td>
												<center><%=ob.getRestrictedCurrencyAmount()%>&nbsp;</center>
												</td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							</td>
	      	<html:hidden property="currencyRestrictionCode"/>
</tr>		
<tr><td colspan="8">&nbsp;</td></tr>

<tr class="even">
<td class="fieldname" > 
<bean:message key="label.covenant.bank.restriction"/></td>    
	   <td colspan="7" >
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
									<logic:present name="restBankList">
										<logic:iterate id="ob" name="restBankList"
											type="com.integrosys.cms.app.limit.bus.OBLimitCovenant"
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
												<td>
												<center><%=ob.getRestrictedBankAmount()%>&nbsp;</center>
												</td>
												 
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
		<bean:write name="LmtCovenantDetailForm" property="buyersRating"/>&nbsp;
	      	<html:hidden property="buyersRating"/></td>
</tr>
<tr class="odd" >	
  <td class="fieldname"></td>  
      <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"agencyMaster")?"fieldname":"fieldnamediff"%>" width="20%">Agency Master</td>
	    <td >
	   <bean:write name="LmtCovenantDetailForm" property="agencyMasterCode"/>&nbsp;
	      	<html:hidden property="agencyMasterCode"/>
	   </td> 
	   <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"ratingMaster")?"fieldname":"fieldnamediff"%>" width="20%">Rating Master</td>  
	   <td  colspan="4" >
	   <bean:write name="LmtCovenantDetailForm" property="ratingMasterCode"/>&nbsp;
	      	<html:hidden property="ratingMasterCode"/>
	   </td>
</tr> 
  
<tr><td colspan="8">&nbsp;</td></tr>
<tr class="odd" >	
		<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"ecgcCover")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.covenant.ecgcCover"/></td>  
	   <td  colspan="7" >
	   
	   <%="Y".equalsIgnoreCase(formObj.getEcgcCover())?"Yes":"No" %>
	   
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
        <td>
        <a href="javascript:backToMainPage()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img
									src="img/ok1.gif" name="Image4411" border="0" id="Image4411" /></a>
							
        </td>
    </tr>
    <tr>
        <td colspan="8">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>     