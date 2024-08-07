<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bizstructure.trx.OBCMSTeamTrxValue,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.Arrays,
                 com.integrosys.component.bizstructure.app.bus.*,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.bizstructure.BizStructureHelper,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 java.util.ArrayList"%>
<%

    DefaultLogger.debug("maker_add_team.jsp","Common Data ......... > ");
    List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
    List ctryVals = (List)CountryList.getInstance().getCountryValues();
    ArrayList orgCodeVals = (ArrayList)request.getAttribute("orgListByCtryValue");
    ArrayList orgCodeLbls = (ArrayList)request.getAttribute("orgListByCtry");
    ArrayList sgmtCodeLbls = (ArrayList)request.getAttribute("segmentCodeLabel");
    ArrayList sgmtCodeVals = (ArrayList)request.getAttribute("segmentCodeValue");
     ArrayList apptypeLbls = (ArrayList)request.getAttribute("apptypeLabel");
    ArrayList apptypeVals = (ArrayList)request.getAttribute("apptypeValue");

    String event = request.getParameter("event");
    DefaultLogger.debug("maker_view_delete_team.jsp","event from getParameter is > "+event);
    boolean isView=false;        //default to delete
    String actionEvent="maker_delete_team";
    String cancelEvent="bizstructure.do?event=maker_list_team";//list page
    String headingLable="Delete ";
    if(event.equals("maker_view_team")){
        isView=true;
        actionEvent="";//not integrated with view..
        cancelEvent="bizstructure.do?event=maker_list_team";//return when its view to list page..
        headingLable="View ";
    }
    else if(event.equals("maker_view_team_wf")) {
    	headingLable="View ";
    }
    ITeam team = null;
    OBCMSTeamTrxValue teamTrxVal = (OBCMSTeamTrxValue)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.TeamTrxValue");

    boolean isDeleteAndSuperUser = false;
    if(event.equals("maker_view_team")||event.equals("maker_delete_team_read")||
    		event.equals("maker_view_team_wf") || event.equals("maker_delete_team")){
        team = teamTrxVal.getTeam();
        DefaultLogger.debug("maker_view_delete_team.jsp","team is "+team.getDescription());
        
        if (event.equals("maker_delete_team_read"))
        	isDeleteAndSuperUser = MaintainTeamUtil.hasSuperUser(team);
    }
    

    ///// Logic when control is from rejected events............................................
    boolean isRemarksNedded=false;
    boolean isRejected = false;
    boolean isCncl=false;
    boolean isToTrack=false;
    boolean isRejectSubmit = false;
    if(event.equals("rejected_delete_read")){
        team = teamTrxVal.getStagingTeam();
        isRejected = true;
        isRejectSubmit = true;
        cancelEvent="ToDo.do?";
        String from = request.getParameter("from");
        if(request.getParameter("Cncl")!=null){
            isRejectSubmit = false;
            isCncl=true;
            if("add".equals(from)){
                headingLable="Close - Create ";
                actionEvent="maker_cncl_reject_add";
            }else if("edit".equals(from)){
                headingLable="Close - Edit ";
                actionEvent="maker_cncl_reject_edit";
            }else if("del".equals(from)){
                headingLable="Close - Delete ";
                actionEvent="maker_cncl_reject_delete";
            }
        }
        if(request.getParameter("toTrack")!=null){
            isView=true;
            isRejected = false;
            isToTrack=true;
            cancelEvent="ToDo.do?event=totrack";
            headingLable= "View ";
            /*
            String prevState=teamTrxVal.getFromState();
            String status = teamTrxVal.getStatus();
            String op = teamTrxVal.getOpDesc();
            if(prevState.equals(ICMSConstant.STATE_ND)||prevState.equals(ICMSConstant.STATE_PENDING_CREATE)
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_CREATE))
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && op.equals("MAKER_CANCEL_CREATE_TEAM"))){
                headingLable="Add ";
            }else if(prevState.equals(ICMSConstant.STATE_PENDING_UPDATE)
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_UPDATE))
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && op.equals("MAKER_CANCEL_UPDATE_TEAM"))){
                headingLable="Edit ";
            }else if(prevState.equals(ICMSConstant.STATE_PENDING_DELETE)
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_DELETE))
                || (prevState.equals(ICMSConstant.STATE_REJECTED) && op.equals("MAKER_CANCEL_DELETE_TEAM"))){
                headingLable="Delete ";
            }
            */
            isCncl=true;
        }
        if(!isCncl){
            isRemarksNedded=true;
            actionEvent="maker_edit_reject_delete";
            headingLable="Re Edit - Delete ";//todo confirm the label...
        }
    }
    //common for view-delete and reject operations...
    String teamTypeId = ""+team.getTeamType().getTeamTypeID();
    String[] selectedCtryVals = team.getCountryCodes();
    String[] selectedOrgCodeVals = team.getOrganisationCodes();
    String[] selectedSgmtCodeVals = team.getSegmentCodes();
    String[] selectedCmsSgmtCodeVals = team.getCMSSegmentCodes();
    String[] selectedOrgGroupCodeVals = team.getOrgGroupCode();    
    String teamTypeName = team.getTeamType().getDescription();

    boolean requireCMSSegment = BizStructureHelper.requireCMSSegment();
    boolean requiredOrgCodeFilter = BizStructureHelper.requireOrgCodeFilter();
    boolean requireBizSegment = BizStructureHelper.requireBizSegment();
    
    int cnt = 0;
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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
function submitPage() {
    document.forms[0].action="bizstructure.do?event=<%=actionEvent%>&teamTypeId=<%=teamTypeId%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="<%=cancelEvent%>&teamTypeId=<%=teamTypeId%>";
    document.forms[0].submit();
}

function gotoMaintainFunction() {
	document.forms[0].action="MaintainFunction.do?event=list_read";
    document.forms[0].submit();
}

function checkIsDeleteAndSuperUser() {
	<% if (isDeleteAndSuperUser) { %>
		alert('<bean:message key="error.team.delete"/>');
	<% } %>	
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='bizstructure.do?'>

<body>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
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
      <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td width="150" class="fieldname"><bean:message key="label.team.name"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="4"><%=team.getAbbreviation()%></td>
            </tr>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td width="150" class="fieldname"><bean:message key="label.team.desc"/></td>
              <td colspan="4"><%=team.getDescription()!=null?team.getDescription():""%>&nbsp;</td>
            </tr>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.global.country"/>&nbsp;<font color="#0000FF">* </font></td>
              <td valign="top" colspan="2" style="border-right:0">&nbsp;
                <select name="fieldsAvail" size="10" multiple="multiple" id="fieldsAvail" style="width:260">
                  <% for(int i=0; i<ctryLbls.size(); i++){
                        if(selectedCtryVals==null || !Arrays.asList(selectedCtryVals).contains(ctryVals.get(i))){  //if this value not in selected value print..
                %>
                  <option ><%=ctryLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input name="Button" type="button" disabled="true" class="btnNormal" style="width:80" onclick="moveDualList(fieldsAvail,fieldSelected, false )" value="Add&gt;&gt;"/>
                <br/> <br/> <input name="Button" type="button" disabled="true" class="btnNormal" style="width:80" onclick="moveDualList(fieldSelected,fieldsAvail,false )" value="&lt;&lt;Remove"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/><br />
                <select name="fieldSelected" size="10" multiple="multiple" id="fieldSelected" style="width:260">
                  <% for(int i=0; i<ctryLbls.size(); i++){
                        if(selectedCtryVals!=null && Arrays.asList(selectedCtryVals).contains(ctryVals.get(i))){//if this value not in selected value print..
                %>
                  <option ><%=ctryLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>
			<% if (requiredOrgCodeFilter) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.global.org.group"/>&nbsp; <bean:message key="label.mandatory"/></td>
              <td colspan="2" valign="top"style="border-right:0">
                <br/> 
				<select name="orgGroupCodeAvail" size="10" multiple="multiple" id="orgGroupCodeAvail" style="width:260">
                <% 
					ArrayList orgGroupListByCtryValue = (ArrayList)request.getAttribute("orgGroupListByCtryValue");
					ArrayList orgGroupListByCtry = (ArrayList)request.getAttribute("orgGroupListByCtry");
					if (orgGroupListByCtryValue == null) 
						orgGroupListByCtryValue = new ArrayList();
					if (orgGroupListByCtry == null)
						orgGroupListByCtry = new ArrayList();
					
					for(int i=0; i<orgGroupListByCtryValue.size(); i++){
                        if(selectedOrgGroupCodeVals==null || !Arrays.asList(selectedOrgGroupCodeVals).contains(orgGroupListByCtryValue.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=orgGroupListByCtryValue.get(i)%>'><%=orgGroupListByCtry.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" disabled style="width:80" onclick="moveDualList(orgGroupCodeAvail,orgGroupCode, false),getOrgCodesByCtryCodes()" class="btnNormal"/>
                <br/> <br/> 
				<input type="button" name="Button" value="&lt;&lt;Remove" disabled style="width:80" onclick="moveDualList(orgGroupCode,orgGroupCodeAvail,false),delOrgCodesByCtryCodes()" class="btnNormal"/>
			  </td>
              <td style="border-left:0;border-right:0">Selected Fields <br />
                <select id="orgGroupCode" name="orgGroupCode" size="10" multiple="multiple" style="width:260">
                  <% for(int i=0; i<orgGroupListByCtryValue.size(); i++){
                        if(selectedOrgGroupCodeVals!=null && Arrays.asList(selectedOrgGroupCodeVals).contains(orgGroupListByCtryValue.get(i))){//if this value not in selected value print..
                    %>
                  <option value='<%=orgGroupListByCtryValue.get(i)%>' ><%=orgGroupListByCtry.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>
			<% } %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.org.code"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
                <br/> <select name="orgAvail" size="10" multiple="multiple" id="orgAvail" style="width:260">
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
                <input type="button" name="Button" value="Add&gt;&gt;" disabled="disabled" style="width:80" onclick="moveDualList(orgAvail,orgSelected, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" disabled="disabled" style="width:80" onclick="moveDualList(orgSelected,orgAvail,false )" class="btnNormal"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/><br />
                <select id="orgSelected" name="orgSelected" size="10" multiple="multiple" style="width:260">
                  <% for(int i=0; i<orgCodeLbls.size(); i++){
                        if(selectedOrgCodeVals!=null && Arrays.asList(selectedOrgCodeVals).contains(orgCodeVals.get(i))){//if this value not in selected value print..
                    %>
                  <option value='<%=orgCodeVals.get(i)%>'><%=orgCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select></td>
            </tr>
<%--			<% if (requireBizSegment) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.team.segment"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
				<br/> <select name="sgmtCodeAvail" size="10" multiple="multiple" id="sgmtCodeAvail" style="width:260">              
		         <% for(int i=0;i<sgmtCodeLbls.size();i++){  
                        if(selectedSgmtCodeVals==null || !Arrays.asList(selectedSgmtCodeVals).contains(sgmtCodeVals.get(i))){  //if this value not in selected value print..
                %>
                  <option value='<%=sgmtCodeVals.get(i)%>'><%=sgmtCodeLbls.get(i)%></option>
                  <%
                        }
                    }
                  %>
                </select> </td>
              <td width="235" valign="middle" style="border-left:0;border-right:0;text-align:center">
                <input type="button" name="Button" value="Add&gt;&gt;" disabled="disabled" style="width:80" onclick="moveDualList(sgmtCodeAvail,sgmtCode, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" disabled="disabled" style="width:80" onclick="moveDualList(sgmtCode,sgmtCodeAvail,false )" class="btnNormal"/></td>
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
			<% } %>--%>
            <% if (requireCMSSegment) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class="fieldname"><bean:message key="label.team.cms.segment"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
				<br/> <select name="cmsSgmtCodeAvail" size="10" multiple="multiple" id="sgmtCodeAvail" style="width:260">              
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
                <input type="button" name="Button" value="Add&gt;&gt;" disabled="disabled" style="width:80" onclick="moveDualList(cmsSgmtCodeAvail,sgmtCodeCMS, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" disabled="disabled" style="width:80" onclick="moveDualList(sgmtCodeCMS,cmsSgmtCodeAvail,false )" class="btnNormal"/></td>
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
                <input type="button" name="Button" value="Add&gt;&gt;" disabled="disabled" style="width:80" onclick="moveDualList(sgmtCodeAvail,sgmtCode, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" disabled="disabled" style="width:80" onclick="moveDualList(sgmtCode,sgmtCodeAvail,false )" class="btnNormal"/></td>
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
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%
    boolean isMaker=false;
    ITeamTypeMembership[] teanTypeMemberships = team.getTeamType().getTeamTypeMemberships();
    for(int i=0;i<teanTypeMemberships.length;i++){
        if(teanTypeMemberships[i].getMembershipType().getMembershipTypeID()==1){//todo get memship type from const file
            isMaker=true;
        }
        ITeamMember[] teamMembers = null;
        int sno=0;
        String rowClass = null;
        if(team!=null){
            ITeamMembership[] teamMemberships = team.getTeamMemberships();
            DefaultLogger.debug("... teanTypeMembership memship id from team type...",""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID());
            for(int j=0; j<teamMemberships.length; j++){
                DefaultLogger.debug("... teanTypeMembership memship id from team ...",""+teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID());
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
      <td><h3><%=teanTypeMemberships[i].getMembershipType().getMembershipTypeName()%></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%"><bean:message key="label.global.sn"/></td>
              <td width="30%"><bean:message key="label.team.login.id"/></td>
              <td width="62%"><bean:message key="label.team.full.name"/></td>
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
          %>
            <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              <td><%=teamMembers[j].getTeamMemberUser().getLoginID()%>&nbsp;</td>
              <td><%=teamMembers[j].getTeamMemberUser().getUserName()%>&nbsp;</td>
            </tr>
         <%}}}//end of if for and else..%>
          </tbody>
        </table></td>
    </tbody>
</table>
<%}}%>


<%
    isMaker=false;
    teanTypeMemberships = team.getTeamType().getTeamTypeMemberships();
    for(int i=0;i<teanTypeMemberships.length;i++){
        if(teanTypeMemberships[i].getMembershipType().getMembershipTypeID()==1){//todo get memship type from const file
            isMaker=true;
        }
        ITeamMember[] teamMembers = null;
        int sno=0;
        String rowClass = null;
        if(team!=null){
            ITeamMembership[] teamMemberships = team.getTeamMemberships();
            DefaultLogger.debug("... teanTypeMembership memship id from team type...",""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID());
            for(int j=0; j<teamMemberships.length; j++){
                DefaultLogger.debug("... teanTypeMembership memship id from team ...",""+teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID());
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
      <td><h3><%=teanTypeMemberships[i].getMembershipType().getMembershipTypeName()%></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="8%"><bean:message key="label.global.sn"/></td>
              <td width="30%"><bean:message key="label.team.login.id"/></td>
              <td width="62%"><bean:message key="label.team.full.name"/></td>
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
          %>
            <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              <td><%=teamMembers[j].getTeamMemberUser().getLoginID()%>&nbsp;</td>
              <td><%=teamMembers[j].getTeamMemberUser().getUserName()%>&nbsp;</td>
            </tr>
         <%}}}//end of if for and else..%>
          </tbody>
        </table></td>
    </tbody>
</table>
<%}}%>



<%if(isRemarksNedded || isRejected){%>
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
                              <%if(!isRejected||isRejectSubmit){%>
                                <tr>
                                  <td class="fieldname"><bean:message key="label.remarks"/></td>
                                  <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
                                </tr>
                                <%}%>
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
<br>
<center><html:errors property="teamErr"/></center>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">
    &nbsp;
	</td>
  </tr>
  <tr>
  <% if(event.equals("maker_view_team_wf")) { %>
    <td><a href="javascript:gotoMaintainFunction();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /></a></td>
  <%} else { %>
	  <% if(!isView && !isRejected){%>
	    <td>
			<% if (!isDeleteAndSuperUser) { %>
				<a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a>
			<% } %>
		</td>
	    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
	  <%}else if(isRejected && !isRejectSubmit){%>
	    <td><a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
	  <%}else if(isRejected && isRejectSubmit){%>
	    <td> <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
	    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
	  <%}else if(isToTrack) {%>
	    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	  <%}else {%>
	    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /></a></td>
 	 <%}%>
  <%}%>
  
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<script language="JavaScript" type="text/JavaScript">
checkIsDeleteAndSuperUser();
</script>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd --></html>
