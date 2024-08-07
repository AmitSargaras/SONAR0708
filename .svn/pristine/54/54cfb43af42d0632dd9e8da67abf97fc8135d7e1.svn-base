<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamForm,
                 com.integrosys.cms.ui.bizstructure.BizStructureHelper,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.cms.app.bizstructure.trx.OBCMSTeamTrxValue,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.*,
                 com.integrosys.component.bizstructure.app.bus.*,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%
    MaintainTeamForm form = (MaintainTeamForm)request.getAttribute("MaintainTeamForm");
    String event = request.getParameter("event");
    String teamTypeId = request.getParameter("teamTypeId");    
    
    DefaultLogger.debug("maker_add_eidt_team.jsp","Team Type id > " +event+"<>"+teamTypeId);
    List teamTypeList = (List)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.TeamTypeList");
    ITeamType teamType = null;
            //getTeamTypeFromList(teamTypeId,teamTypeList);
    ITeam team = null;
    ITeamMember[] teamMembers = null;
    if(event.equals("add_team_users_for_add")||event.equals("add_team_users_for_edit")
        ||event.equals("add_team_users_for_add_reject")||event.equals("add_team_users_for_edit_reject")){
        team = (ITeam)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.mapTeam");
        teamType = team.getTeamType();
        teamTypeId = ""+teamType.getTeamTypeID();
    }

    List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
    List ctryVals = (List)CountryList.getInstance().getCountryValues();

    ArrayList sgmtCodeLbls = (ArrayList)request.getAttribute("segmentCodeLabel");
    ArrayList sgmtCodeVals = (ArrayList)request.getAttribute("segmentCodeValue");
    ArrayList apptypeLbls = (ArrayList)request.getAttribute("apptypeLabel");
    ArrayList apptypeVals = (ArrayList)request.getAttribute("apptypeValue");

    if (sgmtCodeLbls == null)
    	sgmtCodeLbls = new ArrayList();
    if (sgmtCodeVals == null)
    	sgmtCodeVals = new ArrayList();

    String[] selectedCtryVals = form.getCtryCode();
    String[] selectedOrgCodeVals = form.getOrgCode();
    String[] selectedSgmtCodeVals = form.getSgmtCode();
    String[] selectedCmsSgmtCodeVals = form.getSgmtCodeCMS();
   // added on 10 February 2010 for applicationtype field
    //String[] selectedapplicationtype = form.getAppType();
    String[] selectedOrgGroupCodeVals = form.getOrgGroupCode();

    boolean isAdd=false;
    boolean isEdit=false;
    boolean isError=false;  //if validation error...
    boolean isRemarksNedded=false; //remarks needed when maker redo the checker rejected page..
    String actionEvent=null;
    String cancelEvent=null;
    String addUserEvent=null;
    String removeUserEvent=null;
    String addCtryCdEvent=null;
    String removeCtryCdEvent=null;
    String memshipTypeId=null;
    String remarks = null;
    String headingLable="Add New ";
    String rejectCncl = request.getParameter("Cncl");
    if(event.equals("maker_prepare_add_team")||event.equals("rejected_add_read")||
            event.equals("add_ctry_add_team")||event.equals("add_ctry_add_team_reject")||
            event.equals("del_ctry_add_team")||event.equals("del_ctry_add_team_reject")||
            event.equals("add_team_users_for_add")||event.equals("add_team_users_for_add_reject")||
            event.equals("remove_team_users_for_add")||event.equals("remove_team_user_for_add_reject")){
        isAdd = true;
        if(event.equals("maker_prepare_add_team")||event.equals("add_team_users_for_add")||event.equals("remove_team_users_for_add")
                    ||event.equals("add_ctry_add_team")||event.equals("del_ctry_add_team") ){
            actionEvent="maker_add_team";
            cancelEvent="bizstructure.do?event=maker_list_team&startIndex=0";
            addUserEvent="search_team_user_for_add";
            removeUserEvent="remove_team_users_for_add";
            addCtryCdEvent="add_ctry_add_team";
            removeCtryCdEvent="del_ctry_add_team";
            teamType = getTeamTypeFromList(teamTypeId,teamTypeList);
            headingLable="Add New ";
        }else{
            if(rejectCncl!=null && rejectCncl.equals("cncl")){
                actionEvent="maker_cncl_reject_add";
            }else{
                actionEvent="maker_edit_reject_add";
            }
            headingLable="Re Process - New ";
            cancelEvent="ToDo.do";
            addUserEvent="search_team_user_for_add_reject";
            removeUserEvent="remove_team_user_for_add_reject";
            addCtryCdEvent="add_ctry_add_team_reject";
            removeCtryCdEvent="del_ctry_add_team_reject";
            isRemarksNedded=true;
            isAdd=false;
        }
    }else if(event.equals("maker_add_team")||event.equals("maker_edit_reject_add")){
        //todo get add page vals from form..
        isError=true;
        isAdd = true;
        if(event.equals("maker_add_team")){
            actionEvent="maker_add_team";
            cancelEvent="bizstructure.do?event=maker_list_team&startIndex=0";
            addUserEvent="search_team_user_for_add";
            removeUserEvent="remove_team_users_for_add";
            addCtryCdEvent="add_ctry_add_team";
            removeCtryCdEvent="del_ctry_add_team";
            headingLable="Add New ";
            teamType = getTeamTypeFromList(teamTypeId,teamTypeList);
        }else{
            headingLable="Re Process - New ";
            actionEvent="maker_edit_reject_add";
            cancelEvent="ToDo.do";
            addUserEvent="search_team_user_for_add_reject";
            removeUserEvent="remove_team_user_for_add_reject";
            addCtryCdEvent="add_ctry_add_team_reject";
            removeCtryCdEvent="del_ctry_add_team_reject";
            isRemarksNedded=true;
        }
    }else if(event.equals("maker_edit_team_read")||event.equals("rejected_edit_read")||
            event.equals("add_ctry_edit_team")||event.equals("add_ctry_edit_team_reject")||
            event.equals("del_ctry_edit_team")||event.equals("del_ctry_edit_team_reject")||
            event.equals("add_team_users_for_edit")||event.equals("add_team_users_for_edit_reject")||
            event.equals("remove_team_users_for_edit")||event.equals("remove_team_user_for_edit_reject")){
        isEdit=true;
        addUserEvent="search_team_user_for_edit";
        if(event.equals("maker_edit_team_read")||event.equals("add_team_users_for_edit")||event.equals("remove_team_users_for_edit")
                    ||event.equals("add_ctry_edit_team")||event.equals("del_ctry_edit_team") ){
            actionEvent="maker_edit_team";
            cancelEvent="bizstructure.do?event=maker_list_team&startIndex=0";
            addUserEvent="search_team_user_for_edit";
            removeUserEvent="remove_team_users_for_edit";
            addCtryCdEvent="add_ctry_edit_team";
            removeCtryCdEvent="del_ctry_edit_team";
            headingLable="Edit ";
        }else{
            if(rejectCncl!=null && rejectCncl.equals("cncl")){
                actionEvent="maker_cncl_reject_edit";
            }else{
                actionEvent="maker_edit_reject_edit";
            }
            cancelEvent="ToDo.do";
            headingLable="Re Process - Edit ";
            addUserEvent="search_team_user_for_edit_reject";
            removeUserEvent="remove_team_user_for_edit_reject";
            addCtryCdEvent="add_ctry_edit_team_reject";
            removeCtryCdEvent="del_ctry_edit_team_reject";
            isRemarksNedded=true;
        }
    }else if(event.equals("maker_edit_team")||event.equals("maker_edit_reject_edit")){
        //todo get edit page vals from form..
        isError=true;
        isEdit=true;
        if(event.equals("maker_edit_team")){
            actionEvent="maker_edit_team";
            cancelEvent="bizstructure.do?event=maker_list_team&startIndex=0";
            addUserEvent="search_team_user_for_edit";
            removeUserEvent="remove_team_users_for_edit";
            addCtryCdEvent="add_ctry_edit_team";
            removeCtryCdEvent="del_ctry_edit_team";
            headingLable="Edit ";
        }else{
            actionEvent="maker_edit_reject_edit";
            cancelEvent="ToDo.do";
            addUserEvent="search_team_user_for_edit_reject";
            removeUserEvent="remove_team_user_for_edit_reject";
            addCtryCdEvent="add_ctry_edit_team_reject";
            removeCtryCdEvent="del_ctry_edit_team_reject";
            isRemarksNedded=true;
            headingLable="Re Process - Edit ";
        }
        headingLable="Edit ";
    }
        DefaultLogger.debug("maker_add_team.jsp","Am i here 111");
    OBCMSTeamTrxValue teamTrxVal = (OBCMSTeamTrxValue)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.TeamTrxValue");
    //DefaultLogger.debug("maker_add_team.jsp","Am i here 222 "+teamTrxVal);
    if(isEdit ||event.equals("rejected_add_read")||event.equals("rejected_edit_read")
            || event.equals("maker_edit_reject_add")||event.equals("maker_edit_reject_edit")){
        if(event.equals("rejected_add_read")||event.equals("rejected_edit_read")
            || event.equals("maker_edit_reject_add")||event.equals("maker_edit_reject_edit")){
            team = teamTrxVal.getStagingTeam();
        }else{
            team = teamTrxVal.getTeam();
        }
        teamType = team.getTeamType();
        if(!isError){
            selectedCtryVals = team.getCountryCodes();
            selectedOrgCodeVals = team.getOrganisationCodes();
            selectedSgmtCodeVals = team.getSegmentCodes();
            selectedCmsSgmtCodeVals = team.getCMSSegmentCodes();
            selectedOrgGroupCodeVals = team.getOrgGroupCode();
            remarks=teamTrxVal.getRemarks();
        }
    }
    if(event.equals("add_ctry_add_team")||event.equals("add_ctry_edit_team")
            ||event.equals("add_ctry_add_team_reject")||event.equals("add_ctry_edit_team_reject")
            ||event.equals("del_ctry_add_team")||event.equals("del_ctry_edit_team")
            ||event.equals("del_ctry_add_team_reject")||event.equals("del_ctry_edit_team_reject")

            ||event.equals("add_team_users_for_add")||event.equals("add_team_users_for_edit")
            ||event.equals("add_team_users_for_add_reject")||event.equals("add_team_users_for_edit_reject")
            ||event.equals("remove_team_users_for_add")||event.equals("remove_team_users_for_edit")
            ||event.equals("remove_team_user_for_add_reject")||event.equals("remove_team_user_for_edit_reject")

            || event.equals("maker_edit_reject_add")||event.equals("maker_edit_reject_edit")
            || event.equals("maker_add_team")||event.equals("maker_edit_team"))    {
        team = (ITeam)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.mapTeam");
        if(team!=null){
            teamType = team.getTeamType();
            teamTypeId = ""+teamType.getTeamTypeID();
        }
        if(team!=null && !isError){
            selectedCtryVals = team.getCountryCodes();
            selectedOrgCodeVals = team.getOrganisationCodes();
            selectedSgmtCodeVals = team.getSegmentCodes();
            selectedCmsSgmtCodeVals = team.getCMSSegmentCodes();
            selectedOrgGroupCodeVals = team.getOrgGroupCode();
        }
    }
    String teamTypeName = teamType.getDescription();
    DefaultLogger.debug("maker_add_team.jsp","team Remarks... is "+remarks);
    //DefaultLogger.debug("maker_add_team.jsp","team is "+team);
    DefaultLogger.debug("maker_add_team.jsp","event is "+event+isError+isAdd);

    //--------------------------------------CTRY ORG code mapping for data protection...-----------------------------
    ArrayList orgCodeVals = (ArrayList)request.getAttribute("orgListByCtryValue");
    ArrayList orgCodeLbls = (ArrayList)request.getAttribute("orgListByCtry");
    
    if ( orgCodeVals == null)
    	orgCodeVals = new ArrayList();
    if ( orgCodeLbls == null)
    	orgCodeLbls = new ArrayList();
    	
    DefaultLogger.debug("maker_add_team.jsp", "<<< orgCodeVals size: "+(orgCodeVals==null));
    DefaultLogger.debug("maker_add_team.jsp", "<<< size: "+orgCodeVals.size());
    DefaultLogger.debug("maker_add_team.jsp", "<<< orgCodeLbls size: "+(orgCodeLbls==null));   

    //--------------------------------------------------------------------------------------------

    long teamId = ICMSConstant.LONG_INVALID_VALUE;
    if (team != null) {
	    teamId = team.getTeamID();
    }
    boolean requireCMSSegment = BizStructureHelper.requireCMSSegment();
    boolean requiredOrgCodeFilter = BizStructureHelper.requireOrgCodeFilter();
    boolean requireBizSegment = BizStructureHelper.requireBizSegment();
    
    int cnt = 0;
%>
<%!
     private ITeamType getTeamTypeFromList(String teamTypeId, List teamTypeList){
        ITeamType teamType = null;
        for(int i=0; i<teamTypeList.size();i++){
            teamType = (ITeamType)teamTypeList.get(i);
            if(Long.parseLong(teamTypeId)==teamType.getTeamTypeID()){
                return teamType;
            }
        }
        return teamType;
    }
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>
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
function selectLists(){
    List = document.forms[0].orgCode;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
    }
    List = document.forms[0].ctryCode;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
    }
    <% if (requireBizSegment) { %>
    List = document.forms[0].sgmtCode;
    for (i=0;i<List.length;i++) {
    	List.options[i].selected = true;
    }
    <% } %>
    <% if (requiredOrgCodeFilter) { %>
    List = document.forms[0].orgGroupCode;
    for (i=0; i < List.length; i++) {
        List.options[i].selected = true;
    }
    <% } %>
    <% if (requireCMSSegment) { %>
    List = document.forms[0].sgmtCodeCMS;
    for (i=0;i<List.length;i++) {
    	List.options[i].selected = true;
    }
    <% } %>
    
}
function  getOrgCodesByCtryCodes(){
    selectLists();
    document.forms[0].action="bizstructure.do?event=<%=addCtryCdEvent%>";
    document.forms[0].submit();
}
function  delOrgCodesByCtryCodes(){
    selectLists();
    document.forms[0].action="bizstructure.do?event=<%=removeCtryCdEvent%>";
    document.forms[0].submit();
}
function submitPage() {
    selectLists();
    document.forms[0].action="bizstructure.do?event=<%=actionEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="<%=cancelEvent%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='bizstructure.do?&teamTypeId=<%=teamTypeId%>'>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><%=headingLable%><%=teamTypeName%>&nbsp;Team</h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td width="150" class="fieldname"><bean:message key="label.team.name"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="4"><input name="teamName" type="text" size="50" value="<%=(!isError&&team!=null)?team.getAbbreviation():form.getTeamName()%>"/>
                <br/><html:errors property="nameError" /> </td>
            </tr>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td width="150" class="fieldname"><bean:message key="label.team.desc"/></td>
              <td colspan="4"><input name="teamDesc" type="text" size="50" maxlength="45" value="<%=(!isError&&team!=null)?(team.getDescription()!=null?team.getDescription():""):form.getTeamDesc()%>"/>
              <br/><html:errors property="descError" /> </td>
            </tr>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.global.country"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top" style="border-right:0">
                    <html:errors property="ctryCodeError" />
                <br/> <select id="ctryCodeAvail" name="ctryCodeAvail" size="10" multiple="multiple" style="width:260">
                <% for(int i=0; i<ctryLbls.size(); i++){
                        if(selectedCtryVals==null || !Arrays.asList(selectedCtryVals).contains(ctryVals.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=ctryVals.get(i)%>'><%=ctryLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>

                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(ctryCodeAvail,ctryCode, false );getOrgCodesByCtryCodes();" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(ctryCode,ctryCodeAvail,false );delOrgCodesByCtryCodes()" class="btnNormal"/></td>

              <td width="288" style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="ctryCode" name="ctryCode" size="10" multiple="multiple" style="width:260">
                <% for(int i=0; i<ctryLbls.size(); i++){
                        if(selectedCtryVals!=null && Arrays.asList(selectedCtryVals).contains(ctryVals.get(i))){//if this value not in selected value print..
                %>
                  <option value='<%=ctryVals.get(i)%>' ><%=ctryLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>





            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.org.code"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
                <html:errors property="orgCodeError" />
                <br/> <select name="orgCodeAvail" size="10" multiple="multiple" id="orgCodeAvail" style="width:260">
                <% for(int i=0; i<orgCodeLbls.size(); i++){
                        if(selectedOrgCodeVals==null || !Arrays.asList(selectedOrgCodeVals).contains(orgCodeVals.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=orgCodeVals.get(i)%>'><%=orgCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(orgCodeAvail,orgCode, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(orgCode,orgCodeAvail,false )" class="btnNormal"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="orgCode" name="orgCode" size="10" multiple="multiple" style="width:260">
                  <% for(int i=0; i<orgCodeLbls.size(); i++){
                        if(selectedOrgCodeVals!=null && Arrays.asList(selectedOrgCodeVals).contains(orgCodeVals.get(i))){//if this value not in selected value print..
                    %>
                  <option value='<%=orgCodeVals.get(i)%>' ><%=orgCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>

            <% if (requireCMSSegment) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.team.cms.segment"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
              <html:errors property="cmsSgmtCodeError" />
				<br/> <select name="cmsSgmtCodeAvail" size="10" multiple="multiple" id="cmsSgmtCodeAvail" style="width:260">              				
		         <% for(int i=0;i<sgmtCodeLbls.size();i++){  
                        if(selectedCmsSgmtCodeVals==null || !Arrays.asList(selectedCmsSgmtCodeVals).contains(sgmtCodeVals.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=sgmtCodeVals.get(i)%>'><%=sgmtCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(cmsSgmtCodeAvail,sgmtCodeCMS, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(sgmtCodeCMS,cmsSgmtCodeAvail,false )" class="btnNormal"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="sgmtCodeCMS" name="sgmtCodeCMS" size="10" multiple="multiple" style="width:260">
                  <% for(int i=0; i<sgmtCodeLbls.size(); i++){
                        if(selectedCmsSgmtCodeVals!=null && Arrays.asList(selectedCmsSgmtCodeVals).contains(sgmtCodeVals.get(i))){//if this value not in selected value print..
                    %>
                  <option value='<%=sgmtCodeVals.get(i)%>' ><%=sgmtCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>
            <% } %>

            <% if (requireBizSegment) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
          <td class="fieldname"><bean:message key="label.application.type"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
              <html:errors property="sgmtCodeError" />
				<br/> <select name="sgmtCodeAvail" size="10" multiple="multiple" id="sgmtCodeAvail" style="width:260">
		         <% for(int i=0;i<apptypeLbls.size();i++){
                        if(selectedSgmtCodeVals==null || !Arrays.asList(selectedSgmtCodeVals).contains(apptypeVals.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=apptypeVals.get(i)%>'><%=apptypeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(sgmtCodeAvail,sgmtCode, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(sgmtCode,sgmtCodeAvail,false )" class="btnNormal"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="sgmtCode" name="sgmtCode" size="10" multiple="multiple" style="width:260">
                  <% for(int i=0; i<apptypeLbls.size(); i++){
                        if(selectedSgmtCodeVals!=null && Arrays.asList(selectedSgmtCodeVals).contains(apptypeVals.get(i))){//if this value not in selected value print..
                    %>
                  <option value='<%=apptypeVals.get(i)%>' ><%=apptypeLbls.get(i)%></option>
                  <%
                          }
                    }
                  %>
                </select></td>
            </tr>
			<% } %>
            <%--
              <% if (requireBizSegment) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.application.type"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
              <html:errors property="sgmtCodeError" />
				<br/> <select name="sgmtCodeAvail" size="10" multiple="multiple" id="sgmtCodeAvail" style="width:260">
		         <% for(int i=0;i<sgmtCodeLbls.size();i++){
                        if(selectedSgmtCodeVals==null || !Arrays.asList(selectedapplicationtype).contains(sgmtCodeVals.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=sgmtCodeVals.get(i)%>'><%=sgmtCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(sgmtCodeAvail,sgmtCode, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(sgmtCode,sgmtCodeAvail,false )" class="btnNormal"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="sgmtCode" name="sgmtCode" size="10" multiple="multiple" style="width:260">
                  <% for(int i=0; i<sgmtCodeLbls.size(); i++){
                        if(selectedSgmtCodeVals!=null && Arrays.asList(selectedSgmtCodeVals).contains(sgmtCodeVals.get(i))){//if this value not in selected value print..
                    %>
                  <option value='<%=sgmtCodeVals.get(i)%>' ><%=sgmtCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>
                      --%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>


<%
	int members = 0;
    boolean isMaker=false;
    ITeamTypeMembership[] teanTypeMemberships = teamType.getTeamTypeMemberships();
    for(int i=0;i<teanTypeMemberships.length;i++){
        if(teanTypeMemberships[i].getMembershipType().getMembershipTypeID()==1){//todo get memship type from const file
            isMaker=true;
        }
        memshipTypeId=""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID();
        teamMembers = null;
        int sno=0;
        String rowClass = null;
        if(team!=null){
            ITeamMembership[] teamMemberships = team.getTeamMemberships();
            //DefaultLogger.debug("... teanTypeMembership memship id from team type...",""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID());
            for(int j=0; j<teamMemberships.length; j++){
                //DefaultLogger.debug("... teanTypeMembership memship id from team ...",""+teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID());
                if(teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID()==teanTypeMemberships[i].getMembershipType().getMembershipTypeID()){
                    teamMembers = teamMemberships[j].getTeamMembers();
                    break;
                }
            }
        }

%>
<%if(isMaker){%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><%=teanTypeMemberships[i].getMembershipName()%></h3></td>
      <td align="right"  valign="bottom"><input  class="btnNormal" type="button" name="Submit222<%=i%>" value="Add New" onclick='addUserPage(<%=memshipTypeId%>);'/>
        <input name="Remove232<%=i%>" type="button"  value="Remove"  class="btnNormal" onclick="removeUserPage(<%=memshipTypeId%>,0);" /></td>
    </tr>
    <tr>
      <td width="100%" colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%"><bean:message key="label.global.sn"/></td>
              <td width="28%"><bean:message key="label.team.login.id"/></td>
              <td width="50%"><bean:message key="label.team.full.name"/></td>
              <td width="14%">&nbsp;</td>
            </tr>
          </thead>
          <tbody>
          <% if(teamMembers==null || teamMembers.length<1){%>
            <tr class="odd">
              <td colspan="4"><bean:message key="label.team.personnel.none"/></td>
            </tr>
          <%}else{
              for(int j=0; j<teamMembers.length; j++){
                  if(teamMembers[j].getTeamMemberUser().getStatus()!=null && !teamMembers[j].getTeamMemberUser().getStatus().equals("D")){
                        sno++;
                        if(sno%2!=0){
                            rowClass="odd";
                        }else{
                            rowClass="even";
                    }
                    members++;
                    boolean isSuperUser = MaintainTeamUtil.isSuperUser(teamMembers[j].getTeamMemberUser().getLoginID());                    
          %>
            <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              <td><%=teamMembers[j].getTeamMemberUser().getLoginID()%>&nbsp;</td>
              <td><%=teamMembers[j].getTeamMemberUser().getUserName()%>&nbsp;</td>
              <td style="text-align:center">
				<input type="checkbox" name="rmUser" value="<%=teamMembers[j].getTeamMemberUser().getUserID()%>" <%=isSuperUser?"disabled":"" %>/>
			  </td>
            </tr>
         <%}}}//end of if for and else..%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<input type="hidden" name="countMember<%=memshipTypeId%>" value="<%=members%>"/>
<%}}%>


<%
    isMaker=false;
    teanTypeMemberships = teamType.getTeamTypeMemberships();
    for(int i=0;i<teanTypeMemberships.length;i++){
        if(teanTypeMemberships[i].getMembershipType().getMembershipTypeID()==1){//todo get memship type from const file
            isMaker=true;
        }
        memshipTypeId=""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID();
        teamMembers = null;
        int sno=0;
        String rowClass = null;
        if(team!=null){
            ITeamMembership[] teamMemberships = team.getTeamMemberships();
            //DefaultLogger.debug("... teanTypeMembership memship id from team type...",""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID());
            for(int j=0; j<teamMemberships.length; j++){
                if(teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID()==teanTypeMemberships[i].getMembershipType().getMembershipTypeID()){
                    teamMembers = teamMemberships[j].getTeamMembers();
                    break;
                }
            }
        }

%>
<%if(!isMaker){%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><%=teanTypeMemberships[i].getMembershipName()%></h3></td>
      <td align="right"  valign="bottom"><input  class="btnNormal" type="button" name="Submit222<%=i%>" value="Add New" onclick='addUserPage(<%=memshipTypeId%>);'/>
        <input name="Remove232<%=i%>" type="button"  value="Remove"  class="btnNormal" onclick="removeUserPage(<%=memshipTypeId%>, <%=members%>);" /></td>
    </tr>
    <tr>
      <td width="100%" colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%"><bean:message key="label.global.sn"/></td>
              <td width="28%"><bean:message key="label.team.login.id"/></td>
              <td width="50%"><bean:message key="label.team.full.name"/></td>
              <td width="14%">&nbsp;</td>
            </tr>
          </thead>
          <tbody>
          <% if(teamMembers==null || teamMembers.length<1){%>
            <tr class="odd">
              <td colspan="4"><bean:message key="label.team.personnel.none"/> </td>
            </tr>
          <%}else{
              for(int j=0; j<teamMembers.length; j++){
                  if(teamMembers[j].getTeamMemberUser().getStatus()!=null && !teamMembers[j].getTeamMemberUser().getStatus().equals("D")){
                        sno++;
                        if(sno%2!=0){
                            rowClass="odd";
                        }else{
                            rowClass="even";
                    }
                    members++;
                    boolean isSuperUser = MaintainTeamUtil.isSuperUser(teamMembers[j].getTeamMemberUser().getLoginID());
          %>
            <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              <td><%=teamMembers[j].getTeamMemberUser().getLoginID()%>&nbsp;</td>
              <td><%=teamMembers[j].getTeamMemberUser().getUserName()%>&nbsp;</td>
              <td style="text-align:center">
				<input type="checkbox" name="rmUser" value="<%=teamMembers[j].getTeamMemberUser().getUserID()%>" <%=isSuperUser?"disabled":"" %>/>
			  </td>
            </tr>
         <%}}}//end of if for and else..%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<input type="hidden" name="countMember<%=memshipTypeId%>" value="<%=members%>"/>
<%}}%>


  <input type="hidden" name="teamTypeId" value=<%=teamTypeId%>>


  <%if(isRemarksNedded){%>
      <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <thead>
      </thead>
        <tbody>
            <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td class="fieldname"><bean:message key="label.remarks"/></td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                                </tr>
                                <tr>
                                  <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                                  <td class="even"><%=teamTrxVal.getUserInfo()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                                  <td><%=teamTrxVal.getRemarks()!=null?teamTrxVal.getRemarks():""%>&nbsp;</td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>
        </tbody>
</table>
<%}else{//DefaultLogger.debug("maker_add_edit_team.jsp"," In Add/Edit mode: Remarks are >> "+remarks);%>
<%}%>


<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="85">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<script language="JavaScript" type="text/JavaScript">
<!--
function addUserPage(memshipTypeId){
    selectLists();
    document.forms[0].action="bizstructure.do?event=<%=addUserEvent%>&teamTypeId=<%=teamType.getTeamTypeID()%>&memshipTypeId="+memshipTypeId+"&teamId=<%=teamId%>";
    document.forms[0].submit();
}
function removeUserPage(memshipTypeId, begin){
	if (document.forms[0].rmUser != null) {
		memberLen = document.forms[0].rmUser.length;

		endCount = eval('document.forms[0].countMember'+memshipTypeId+'.value');
		for (i = 0; i < begin; i++) {
			document.forms[0].rmUser[i].checked = false;
		}
		for (i = endCount; i < memberLen; i++) {
			document.forms[0].rmUser[i].checked = false;
		}
	}
    selectLists();
    document.forms[0].action="bizstructure.do?event=<%=removeUserEvent%>&memTypeId="+memshipTypeId;
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEnd -->
</html>