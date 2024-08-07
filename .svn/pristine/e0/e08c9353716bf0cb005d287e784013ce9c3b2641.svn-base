<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.bizstructure.trx.OBCMSTeamTrxValue,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.Arrays,
                 com.integrosys.component.bizstructure.app.bus.ITeamTypeMembership,
                 com.integrosys.component.bizstructure.app.bus.ITeamMembership,
                 com.integrosys.component.bizstructure.app.bus.ITeamMember,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.bizstructure.BizStructureHelper,
                 java.util.ArrayList"%>
<%
    String event = request.getParameter("event");
    DefaultLogger.debug("checker_team.jsp","event from getParameter is > "+event);

    List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
    List ctryVals = (List)CountryList.getInstance().getCountryValues();
    ArrayList sgmtCodeLbls = (ArrayList)request.getAttribute("segmentCodeLabel");
    ArrayList sgmtCodeVals = (ArrayList)request.getAttribute("segmentCodeValue");
     ArrayList apptypeLbls = (ArrayList)request.getAttribute("apptypeLabel");
    ArrayList apptypeVals = (ArrayList)request.getAttribute("apptypeValue");


    String approveEvent=null;
    String rejectEvent=null;
    String cancelEvent=null;
    String headingLable="Process Create ";

    if(event.equals("checker_add_read")||event.equals("checker_approve_add")){
        approveEvent="checker_approve_add";
        rejectEvent="checker_reject_add";
        headingLable="Process - Create ";
    }else if(event.equals("checker_edit_read")||event.equals("checker_approve_edit")){
        approveEvent="checker_approve_edit";
        rejectEvent="checker_reject_edit";
        headingLable="Process - Edit ";
    }else if(event.equals("checker_delete_read")){
        approveEvent="checker_approve_delete";
        rejectEvent="checker_reject_delete";
        headingLable="Process - Delete ";
    }
    DefaultLogger.debug("checker_team.jsp","here.." );
    OBCMSTeamTrxValue teamTrxVal = (OBCMSTeamTrxValue)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.TeamTrxValue");
    ITeam team = teamTrxVal.getTeam();
    ITeam stageTeam = teamTrxVal.getStagingTeam();
    String[] selectedCtryVals = stageTeam.getCountryCodes();
    String[] selectedOrgCodeVals = stageTeam.getOrganisationCodes();
    String[] selectedSgmtCodeVals = stageTeam.getSegmentCodes();
    String[] selectedCmsSgmtCodeVals = stageTeam.getCMSSegmentCodes();    
    String[] selectedOrgGroupCodeVals = stageTeam.getOrgGroupCode();
    
    DefaultLogger.debug("checker_team.jsp","here..123 "+selectedCtryVals+selectedOrgCodeVals+selectedSgmtCodeVals);
    DefaultLogger.debug("checker_team.jsp","team is "+stageTeam.getDescription());


//--------------------------------------CTRY ORG code mapping for data protection...-----------------------------
    ArrayList orgCodeVals = (ArrayList)request.getAttribute("orgListByCtryValue");
    ArrayList orgCodeLbls = (ArrayList)request.getAttribute("orgListByCtry");

    if (orgCodeVals == null) {orgCodeVals = new ArrayList(); }
    if (orgCodeLbls == null) {orgCodeLbls = new ArrayList();}
    if (sgmtCodeLbls == null) {sgmtCodeLbls = new ArrayList();}
    if (sgmtCodeVals == null) {sgmtCodeVals = new ArrayList(); }    
    //--------------------------------------------------------------------------------------------

    boolean requireCMSSegment = BizStructureHelper.requireCMSSegment();
    boolean requiredOrgCodeFilter = BizStructureHelper.requireOrgCodeFilter();  
    boolean requireBizSegment = BizStructureHelper.requireBizSegment();
    
    int cnt = 0;
%>
<%!
    private boolean isEqual(String[] stg ,String[] bus){
        if(stg==null || bus==null){
            return false;
        }
        if(stg.length!=bus.length){
            return false;
        }else{
            boolean isEqual=false;
            for(int i=0;i<stg.length;i++){
                isEqual=false;
                for(int j=0;j<bus.length;j++){
                    if(stg[i]!=null && bus[j]!=null){
                        if(stg[i].equals(bus[j])){
                            isEqual=true;
                            break;
                        }
                    }
                }
                if(!isEqual){
                    return false;
                }else{
                    break;
                }
            }
        }
        return true;
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

function approvePage() {
    document.forms[0].action="bizstructure.do?event=<%=approveEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="bizstructure.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
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
      <td><h3><%=headingLable+stageTeam.getTeamType().getDescription()+" Team"%></h3></td>
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
              <td width="150" class='<%=CompareOBUtil.compOB(stageTeam,team,"abbreviation")?"fieldname":"fieldnamediff"%>'>
              	<bean:message key="label.team.name"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="4"><%=stageTeam.getAbbreviation()%></td>
            </tr>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td width="150" class='<%=CompareOBUtil.compOB(stageTeam,team,"description")?"fieldname":"fieldnamediff"%>'><bean:message key="label.team.desc"/></td>
              <td colspan="4"><%=stageTeam.getDescription()!=null?stageTeam.getDescription():""%>&nbsp;</td>
            </tr>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class='<%=(stageTeam!=null && team!=null) && isEqual(stageTeam.getCountryCodes(),team.getCountryCodes())?"fieldname":"fieldnamediff"%>'>
              	<bean:message key="label.global.country" />&nbsp;<font color="#0000FF">* </font></td>
              <td valign="top" colspan="2" style="border-right:0"><br/>
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
              <td class="<%=(stageTeam!=null && team!=null) && isEqual(stageTeam.getOrgGroupCode(),team.getOrgGroupCode())?"fieldname":"fieldnamediff"%>"><bean:message key="label.global.org.group"/>&nbsp; <bean:message key="label.mandatory"/></td>
              <td colspan="2" valign="top"style="border-right:0">
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
                <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" disabled onclick="moveDualList(orgGroupCodeAvail,orgGroupCode, false),getOrgCodesByCtryCodes()" class="btnNormal"/>
                <br/> <br/> 
				<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" disabled onclick="moveDualList(orgGroupCode,orgGroupCodeAvail,false),delOrgCodesByCtryCodes()" class="btnNormal"/>
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
              <td class='<%=(stageTeam!=null && team!=null) && isEqual(stageTeam.getOrganisationCodes(),team.getOrganisationCodes())?"fieldname":"fieldnamediff"%>'>
              	<bean:message key="label.org.code "/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
                <br/> <select name="orgAvail" size="10" multiple="multiple"  id="orgAvail" style="width:260">
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
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="orgSelected" name="orgSelected" size="10"  multiple="multiple" style="width:260">
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
            <% if (requireCMSSegment) { %>
            <tr class="<%=cnt++%2==0?"odd":"even" %>">
              <td class='<%=(stageTeam!=null && team!=null) && isEqual(stageTeam.getCMSSegmentCodes(),team.getCMSSegmentCodes())?"fieldname":"fieldnamediff"%>'>
              	<bean:message key="label.team.cms.segment"/>&nbsp;<font color="#0000FF">* </font></td>
              <td colspan="2" valign="top"style="border-right:0">
				<br/> <select name="cmsSgmtCodeAvail" size="10" multiple="multiple"  id="sgmtCodeAvail" style="width:260">              
				<html:errors property="cmsSgmtCodeError" />
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
                <input type="button" name="Button" value="Add&gt;&gt;" disabled="disabled" style="width:80" onclick="moveDualList(cmsSgmtCodeAvail,cmsSgmtCode, false )" class="btnNormal"/>
                <br/> <br/> <input type="button" name="Button" value="&lt;&lt;Remove" disabled="disabled" style="width:80" onclick="moveDualList(cmsSgmtCode,cmsSgmtCodeAvail,false )" class="btnNormal"/></td>
              <td style="border-left:0;border-right:0"><bean:message key="label.global.selected.fields"/> <br />
                <select id="cmsSgmtCode" name="cmsSgmtCode" size="10" multiple="multiple"  style="width:260">
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
    ITeamTypeMembership[] teanTypeMemberships = stageTeam.getTeamType().getTeamTypeMemberships();
    for(int i=0;i<teanTypeMemberships.length;i++){
        if(teanTypeMemberships[i].getMembershipType().getMembershipTypeID()==1){//todo get memship type from const file
            isMaker=true;
        }
        ITeamMember[] teamMembers = null;
        int sno=0;
        String rowClass = null;
        if(stageTeam!=null){
            ITeamMembership[] teamMemberships = stageTeam.getTeamMemberships();
            DefaultLogger.debug("... teanTypeMembership memship id from team type...",""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID());
            for(int j=0; j<teamMemberships.length; j++){
                DefaultLogger.debug("... teanTypeMembership memship id from team ...",""+teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID());
                if(teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID()==teanTypeMemberships[i].getMembershipType().getMembershipTypeID()){
                    teamMembers = teamMemberships[j].getTeamMembers();
                    break;
                }
            }
        }
////////////////  Get actual Team members.../////////////////////////////////////
        ITeamMember[] bussTeamMembers=null;
        if(team!=null){
            ITeamMembership[] bussTeamMemberships = team.getTeamMemberships();
            for(int j=0; j<bussTeamMemberships.length; j++){
                if(bussTeamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID()==teanTypeMemberships[i].getMembershipType().getMembershipTypeID()){
                    bussTeamMembers = bussTeamMemberships[j].getTeamMembers();
                    break;
                }
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////


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
              <td width="28%"><bean:message key="label.team.login.id"/></td>
              <td width="50%"><bean:message key="label.team.full.name"/></td>
            </tr>
          </thead>
          <tbody>
			<%
			List compList = null;
			if (teamMembers != null || bussTeamMembers != null)
				compList = CompareOBUtil.compOBArray(teamMembers,bussTeamMembers);			
			%>
            <% if(compList == null || compList.size() == 0){%>
            <tr class="odd">
              <td colspan="4"><bean:message key="label.team.personnel.none"/> </td>
            </tr>
          <%}else{
                //----------------------------------------------------------------------------------                 
                String key=null;
                //------------------------------------------------------------------------------------
              for(int j=0; j<compList.size(); j++){
                  ITeamMember compTeamMember = (ITeamMember)((CompareResult)compList.get(j)).getObj();
                  key = ((CompareResult)compList.get(j)).getKey();
                  if(compTeamMember.getTeamMemberUser().getStatus()!=null && !compTeamMember.getTeamMemberUser().getStatus().equals("D")){
                    sno++;
                    if(sno%2!=0){
                        rowClass="odd";
                    }else{
                        rowClass="even";


                    }
                       DefaultLogger.debug(">>>>>>>>>>>>key value is: ",(String)key);
          %>
            <tr class="<%=rowClass%>">
              <td class="<%=key%>"><%=sno%></td>
              <td><%=compTeamMember.getTeamMemberUser().getLoginID()%>&nbsp;</td>
              <td><%=compTeamMember.getTeamMemberUser().getUserName()%>&nbsp;&nbsp;
                <br/><html:errors property='<%="userError"+compTeamMember.getTeamMemberUser().getLoginID()%>' /></td>
            </tr>
         <%}}}//end of for and else..%>
          </tbody>
        </table></td>
    </tbody>
</table>
<%}}%>

<%
    isMaker=false;
    teanTypeMemberships = stageTeam.getTeamType().getTeamTypeMemberships();
    for(int i=0;i<teanTypeMemberships.length;i++){
        if(teanTypeMemberships[i].getMembershipType().getMembershipTypeID()==1){//todo get memship type from const file
            isMaker=true;
        }
        ITeamMember[] teamMembers = null;
        int sno=0;
        String rowClass = null;
        if(stageTeam!=null){
            ITeamMembership[] teamMemberships = stageTeam.getTeamMemberships();
            DefaultLogger.debug("... teanTypeMembership memship id from team type...",""+teanTypeMemberships[i].getMembershipType().getMembershipTypeID());
            for(int j=0; j<teamMemberships.length; j++){
                DefaultLogger.debug("... teanTypeMembership memship id from team ...",""+teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID());
                if(teamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID()==teanTypeMemberships[i].getMembershipType().getMembershipTypeID()){
                    teamMembers = teamMemberships[j].getTeamMembers();
                    break;
                }
            }
        }
        ////////////////  Get actual Team members.../////////////////////////////////////
        ITeamMember[] bussTeamMembers=null;
        if(team!=null){
            ITeamMembership[] bussTeamMemberships = team.getTeamMemberships();
            for(int j=0; j<bussTeamMemberships.length; j++){
                if(bussTeamMemberships[j].getTeamTypeMembership().getMembershipType().getMembershipTypeID()==teanTypeMemberships[i].getMembershipType().getMembershipTypeID()){
                    bussTeamMembers = bussTeamMemberships[j].getTeamMembers();
                    break;
                }
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////

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
              <td width="28%"><bean:message key="label.team.login.id"/></td>
              <td width="50%"><bean:message key="label.team.full.name"/></td>
            </tr>
          </thead>
          <tbody>
            <% List compList = null;
            	if (teamMembers != null || bussTeamMembers != null)
            		compList = CompareOBUtil.compOBArray(teamMembers,bussTeamMembers);
            		if(compList == null || compList.size() == 0){%>
            <tr class="odd">
              <td colspan="4"><bean:message key="label.team.personnel.none"/> </td>
            </tr>
          <%}else{
                //----------------------------------------------------------------------------------
                 
                String key=null;
                //------------------------------------------------------------------------------------
              for(int j=0; j<compList.size(); j++){
                  ITeamMember compTeamMember = (ITeamMember)((CompareResult)compList.get(j)).getObj();
                  key = ((CompareResult)compList.get(j)).getKey();
                  if(compTeamMember.getTeamMemberUser().getStatus()!=null && !compTeamMember.getTeamMemberUser().getStatus().equals("D")){
                    sno++;
                    if(sno%2!=0){
                        rowClass="odd";
                    }else{
                        rowClass="even";
                    }
          %>
            <tr class="<%=rowClass%>">
              <td class="<%=key%>"><%=sno%></td>
              <td><%=compTeamMember.getTeamMemberUser().getLoginID()%>&nbsp;</td>
              <td><%=compTeamMember.getTeamMemberUser().getUserName()%>&nbsp;&nbsp;
                <br/><html:errors property='<%="userError"+compTeamMember.getTeamMemberUser().getLoginID()%>' /></td>
            </tr>
         <%}}}//end of for and else..%>
          </tbody>
        </table></td>
    </tbody>
</table>
<%}}%>


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

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
