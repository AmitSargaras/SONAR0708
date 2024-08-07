
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 java.util.Vector,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamForm,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.List,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeamType"%>

<%
    try{
    SearchResult sr = (SearchResult)request.getAttribute("TeamList");

    MaintainTeamForm form = (MaintainTeamForm)request.getAttribute("MaintainTeamForm");

    List teamList = null;
    if(sr!=null){
        teamList = (List)sr.getResultList();
        pageContext.setAttribute("TeamList",teamList);
    }
    int sno=form.getStartIndex();
    String teamTypeId=request.getParameter("teamTypeId");
    String teamTypeName = request.getParameter("teamTypeName");
    if(teamTypeName==null){
        teamTypeName=(String)request.getAttribute("teamTypeName");
    }
    String event=request.getParameter("event");
    if(event.equals("start")){
        teamTypeId = (String)request.getAttribute("teamTypeId");
    }
    DefaultLogger.debug("maker_list_team.jsp","team type id is " + teamTypeId + "  event: " + event);
    List teamTypeList = (List)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.TeamTypeList");
    teamTypeName = getTeamTypeFromList(teamTypeId,teamTypeList).getDescription();
    
    String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMembershipID = Long.parseLong(teamTypeMemID);    
	boolean isEditAccess = (teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_MAKER); 
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




<html>
<head>
<title>Maker Team Listing</title>



<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

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

//-->
</script>
</head>

<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->
		<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		  <thead>
			<tr>
			  <td width="82%"><h3>Maintain <%=teamTypeName%> Team(s)</h3></td>
			  <td width="18%" align="right" valign="bottom">
				<% if (isEditAccess) { %>
				<input type="button" name="Submit" value="Add New Team" class="btnNormal" onclick="gotopage('bizstructure.do?event=maker_prepare_add_team&teamTypeId=<%=teamTypeId%>');"/>
				<% } %>
			  </td>
			</tr>
			<tr>
			  <td colspan="2"><hr /></td>
			</tr>
		  </thead>
		  <tbody>
			<tr>
			  <td colspan="2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
				  <thead>
					<tr>
					  <td width="7%"><bean:message key="label.global.sn"/></td>
					  <td width="21%"><bean:message key="label.team.name"/></td>
					  <td width="58%"><bean:message key="label.team.desc"/></td>
					  <td width="14%"><bean:message key="label.global.action"/></td>
					</tr>
				  </thead>
				  <tbody>
					<logic:present name="TeamList">
		<logic:iterate id="ob" name="TeamList"  type="com.integrosys.component.bizstructure.app.bus.OBTeamSearchResult" scope="page">
			<%
				//DefaultLogger.debug("maker_list_team.jsp","..."+teamList.get(0).getClass());
				String rowClass="";
				sno++;
				if(sno%2!=0){
					rowClass="odd";
				}else{
					rowClass="even";
				}

				teamTypeId=""+ob.getTeamType().getTeamTypeID();
			%>
					<tr class="<%=rowClass%>">
					  <td class="index"><%=sno%></td>
					  <td><%=ob.getAbbreviation()%>&nbsp;</td>
					  <td><%=ob.getDescription()!=null?ob.getDescription():""%>&nbsp;</td>
					  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
						  <option value="#" selected>Please Select</option>
						  <option value='bizstructure.do?event=maker_view_team&teamTypeId=<%=teamTypeId%>&TeamId=<%=ob.getTeamID()%>'>View</option>
						<% if (isEditAccess) { %>
						  <option value='bizstructure.do?event=maker_edit_team_read&teamTypeId=<%=teamTypeId%>&TeamId=<%=ob.getTeamID()%>'>Edit</option>
						  <option value='bizstructure.do?event=maker_delete_team_read&teamTypeId=<%=teamTypeId%>&TeamId=<%=ob.getTeamID()%>'>Delete</option>
						<% } %>
						</select> </td>
					</tr>
		</logic:iterate>
	</logic:present>
	<logic:notPresent name="TeamList">
	 <tr class="odd">
		<td colspan=4 class="label">
			<bean:message key="label.global.not.found"/>
		</td>
	 </tr>
	</logic:notPresent>
				  </tbody>
				</table></td>
			</tr>
		  </tbody>
		</table>

</td>
</tr>
 <!-- End Content -->

    <!-- General Purpose Bar -->

<logic:present name="TeamList">

<tr>
<td height="25">
	<table id="GeneralPurposeBar" width="100%" style="margin-left:10px" border="0" cellspacing="0" cellpadding="5" align="center">
	  <tr>
		<%
			String pageIndexUrl=null;
			if(form.getTeamName()!=null&&form.getTeamName().length()>0){
				pageIndexUrl = "bizstructure.do?event=maker_list_team&teamTypeId="+teamTypeId+"&name="+form.getTeamName()+"&startIndex=";
			}else{
				pageIndexUrl = "bizstructure.do?event=maker_list_team&teamTypeId="+teamTypeId+"&startIndex=";
			}


		%>
		<td width="650" valign="middle">
		<logic:present name="TeamList">
		   &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(form.getStartIndex(),10,sr.getNItems())%>'
				url='<%=pageIndexUrl%>' />
		</logic:present>&nbsp;
		</td>
	  </tr>
	</table>

</logic:present>

</td>
</tr>

</table>

</body>
</html>

<%}catch(Exception e){
        e.printStackTrace();
    }

        %>

