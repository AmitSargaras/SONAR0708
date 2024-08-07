<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header:
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.10 $
     * @since $Date: 2006/10/27 08:11:20 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@ page import="java.util.List,
                 java.util.Vector,
                 com.integrosys.cms.ui.user.NewUserSearchForm,
                 com.integrosys.component.user.app.bus.OBSearchCommonUser,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.bizstructure.BizStructureHelper,
                 java.util.ArrayList"%>

<%
    String fromFlag = (String)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.fromFlag");
    String event = request.getParameter("event");
    String urlEvent = "";
    if(event.equals("start")||event.equals("list")){
        urlEvent = "list";
    }else{
        urlEvent = "list_rejected";
    }
    //DefaultLogger.debug("list_users","Entered.."+fromFlag+event);
    String actionUrl = null;
    String cnclUrl = null;
    if(fromFlag.equals("search_team_user_for_add")){
        actionUrl=response.encodeURL("bizSearch.do?event=add_users_for_add");
        cnclUrl=response.encodeURL("bizSearch.do?event=cancle_add_users_for_add");
    }else if(fromFlag.equals("search_team_user_for_add_reject")){
        actionUrl=response.encodeURL("bizSearch.do?event=add_users_for_add_reject");
        cnclUrl=response.encodeURL("bizSearch.do?event=cancle_add_users_for_add_reject");
    }else if(fromFlag.equals("search_team_user_for_edit")){
        actionUrl=response.encodeURL("bizSearch.do?event=add_users_for_edit");
        cnclUrl=response.encodeURL("bizSearch.do?event=cancle_add_users_for_edit");
    }else if(fromFlag.equals("search_team_user_for_edit_reject")){
        actionUrl=response.encodeURL("bizSearch.do?event=add_users_for_edit_reject");
        cnclUrl=response.encodeURL("bizSearch.do?event=cancle_add_users_for_edit_reject");
    }
    NewUserSearchForm form = (NewUserSearchForm) request.getAttribute("BizSearchForm");
    List selectedList = (List)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.userMap");
    SearchResult sr = (SearchResult)request.getAttribute("UserList");
    Vector v = new Vector();
    v = (Vector)sr.getResultList();
    if(v!=null) {
        pageContext.setAttribute("userList",v);
    }
    int sno = 0;
//    DefaultLogger.debug("list_users",".."+form+selectedList+sr);
    sno = form.getStartIndex();
//    DefaultLogger.debug("list_users",".."+form+selectedList+sr);

    String memshipTypeId = request.getParameter("memshipTypeId");
    ITeam team = (ITeam)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.mapTeam");
    try{
    resolveMemUserList(team, memshipTypeId);
    }catch(Exception e){e.printStackTrace();}
    

%>
<%!
    public ArrayList teamMemberUserList = new ArrayList();
    boolean allowMakerCheckerSameUser = BizStructureHelper.allowMakerCheckerSameUser();    
    private void resolveMemUserList(ITeam team, String memshipTypeId){
        teamMemberUserList=new ArrayList();
        if(team!=null && team.getTeamMemberships()!=null){
            for(int i=0; i<team.getTeamMemberships().length;i++){
	            if (allowMakerCheckerSameUser) {
	                if(memshipTypeId.equals(String.valueOf(team.getTeamMemberships()[i].getTeamTypeMembership().getMembershipType().getMembershipTypeID()))
	                	&& team.getTeamMemberships()[i].getTeamMembers()!=null){
	                    for(int j=0;j<team.getTeamMemberships()[i].getTeamMembers().length; j++){
	                        teamMemberUserList.add(""+team.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID());
	                    }
	                }
            	} else {
	                if(team.getTeamMemberships()[i].getTeamMembers()!=null){
	                    for(int j=0;j<team.getTeamMemberships()[i].getTeamMembers().length; j++){
	                        teamMemberUserList.add(""+team.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID());
	                    }
	                }	            	
            	}
            }
        }
    }
    private boolean isPresent(long id){
        if(teamMemberUserList.contains(""+id))
            return true;
        else
            return false;
    }

%>



<html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable --> <!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" --> <!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" --> <!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--

function gotopage(aLocation) {
	window.location= aLocation ;
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
function onOK(){
    document.forms[0].action="<%=actionUrl%>";
    document.forms[0].submit();
}
function onCancle(){
    document.forms[0].action="<%=cnclUrl%>";
    document.forms[0].submit();
}
function goPageIndex(ind) {
//alert('here ind is '+ind);
    document.forms[0].startIndex.value=ind;
    document.forms[0].submit();
}
function goAlphaIndex(ind) {
//alert('here ind is '+ind);
    document.forms[0].userName.value=ind;
    document.forms[0].startIndex.value=0;
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
   <%   String action = "bizSearch.do?event="+urlEvent;%>
<html:form action='<%=action%>'>
<html:hidden property="startIndex" />
<html:hidden property="userName" />

<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->

                    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td> <h3><bean:message key="label.team.add.new.user"/></h3></td>
                        </tr>
                        <tr>
                          <td><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="7%"><bean:message key="label.global.sn"/></td>
                                  <td width="18%"><bean:message key="label.todo.pending.select"/></td>
                                  <td width="29%"><bean:message key="label.team.login.id"/></td>
                                  <td width="46%"><bean:message key="label.team.full.name"/></td>
                                </tr>
                              </thead>
                              <tbody>
                              <logic:present name="userList">
                                <logic:iterate id="OB" name="userList"  type="com.integrosys.component.user.app.bus.OBSearchCommonUser" scope="page">
                                   <%
                                       String rowClass="";
                                       sno++;
                                      if(sno%2!=0){
                                           rowClass="odd";
                                       }else{
                                           rowClass="even";
                                       }

                          %>
                                <tr class="<%=rowClass%>">
                                  <td class="index"><%=sno%></td>
                                  <td style="text-align:center">
                                  <input name="checkedUsers" type="checkbox" <%=isPresent(OB.getUserID())?"disabled":""%>
                                            <%=(selectedList!=null && selectedList.contains(""+OB.getUserID()))?"checked":""%> value="<%=OB.getUserID()%>" />
                                  <html:hidden property="pageUsers"  value='<%=""+OB.getUserID()%>' />
                                  <td><%=OB.getLoginID()!=null?OB.getLoginID():""%>&nbsp;</td>
                                  <td><%=OB.getUserName()!=null?OB.getUserName():""%></td>
                                </tr>
                              </logic:iterate>
                        </logic:present>
                      <% 
                          if (sr.getResultList().size() == 0) {
                      %>
                         <tr class="odd">
                      	    <td colspan="4"><bean:message key="label.global.not.found"/></td>
                      	 </tr> 
                      <%
                      	  }
                      %>
                        
                              </tbody>
                            </table></td>
                        </tr>                        
                      </tbody>
                    </table>

					<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
    <td width="73">&nbsp;</td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
                        <td><a href="javascript:onOK();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3" width="70" height="20" border="0" id="Image3" /></a></td>
                        <td><a href="javascript:onCancle();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    </td>
</tr>
<tr>
    <td height="25">

                    <!-- InstanceEndEditable -->
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="564" valign="middle">
                        Index:&nbsp;<integro:alphaindex url='<%="bizSearch.do?event="+urlEvent+"&userName="%>' submitFlag='<%=new Boolean(true)%>' />
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <%
                            String pageIndexUrl=null;
                            if(form.getUserName()!=null&&form.getUserName().length()>0){
                                pageIndexUrl = "bizSearch.do?event="+urlEvent+"&userName="+form.getUserName()+"&startIndex=";
                            }else{
                                pageIndexUrl = "bizSearch.do?event="+urlEvent+"&startIndex=";
                            }
                        %>
                        <td width="86" valign="middle">
                            &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(form.getStartIndex(),10,sr.getNItems())%>'
                                url='<%=pageIndexUrl%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>

                      </tr>
                    </table>
                    <!-- InstanceEndEditable -->
    </td>
</tr>
</table>
</body>
</html:form>
<!-- InstanceEnd --></html>