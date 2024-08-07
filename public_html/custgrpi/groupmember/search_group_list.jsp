
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.custgrpi.groupmember.GroupMemberForm,
                 com.integrosys.component.bizstructure.app.bus.ITeam, java.util.List"%>
<%@ page import="com.integrosys.cms.ui.common.tag.TokenTag"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.groupmember.AddGroupMemberCommand"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    //System.out.println("Entered search_group_list.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }

    String GLOCAL_ADD_GROUP = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ AddGroupMemberCommand.GLOCAL_ADD_GROUP);
    session.setAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+AddGroupMemberCommand.GLOCAL_ADD_GROUP, "true");

%>

<%
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);

    GroupMemberForm aForm = (GroupMemberForm) request.getAttribute("GroupMemberForm");

     if (aForm ==null){
       aForm = new  GroupMemberForm();
     }
    List v = null;
    int nItems = 0;
    if (aForm != null) {
        v = (List) aForm.getSearchResult();
    }

    if (v != null) {
        pageContext.setAttribute("groupMemberSearchList", v);
    }

    int rowIdx = 0;
    int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}
    int numItem = aForm.getNumItems();


%>



   <%
             int index = 0;
            int counter = 0;
             String sii = (String) request.getAttribute("startIndex");
            if (sii != null) {
                index= Integer.parseInt(sii);
            }
            String alphaURL="/GroupMember.do?event=search_group_list";
        %>

<% try {  %>


<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
    <html:form action="GroupMember.do?event=search_group_list">

        <html:hidden property="customerSeach" value="false"/>
        <html:hidden property="startIndex" />
        <html:hidden property="numItems"  />

        <html:hidden property="searchGroupNo" />
        <html:hidden property="searchGroupID" />
        <html:hidden property="searchGroupName" />

        <html:hidden property="grpID" />
        <html:hidden property="groupName" />
        <html:hidden property="customerName" />
        <html:hidden property="legalName" />
        <html:hidden property="itemType"/>
        <html:hidden property="searchType"/>

        <input type="hidden" name="indicator" >
        <input type="hidden" name="all">


             <table width="70%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">

              <tr>
               <td>
                 <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td valign="bottom"><h3>Search Result</h3></td>
                    </tr>
                </table>
                <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                 <thead>
                  <tr>
                        <td width="3%"><bean:message key="label.global.sn"/></td>
                        <td width="10%"><bean:message key="label.group.id" /></td>
                        <td width="25%"><bean:message key="label.group.name" /></td>
                        <td width="15%"><bean:message key="label.group.link.group"/></td>
                  </tr>

                 </thead>
                 <tbody>
                   <% if(v!=null)  { %>
                          <logic:present name="groupMemberSearchList">
                           <logic:iterate id="OB" name="groupMemberSearchList"  type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
                      <%
                            String subprofileID = OB.getSubProfileID() +"";
                            String grpID = OB.getGrpID() +"";
                            String errEntityID = "errEntityID"+OB.getGrpID();
                            sno++;

                        %>
                   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td style="text-align:center" class="index"><%=sno%></td>
                      <td><integro:empty-if-null value="<%=OB.getGrpNo()%>"/>&nbsp; </td>
                      <td><a href="javascript:viewGroupSubGroup('<%=OB.getGrpID()%>');">
                                <integro:empty-if-null value="<%=OB.getGroupName()%>"/>
                            </a>
                        &nbsp; </td>
                      <td>
                            <%--<html:checkbox property="entityCheckBoxID" id="entityCheckBoxID" value="<%=grpID%>" />--%>
                           <html:checkbox property="entityCheckBoxID" value="<%=grpID%>" />
                            <html:errors property="<%=errEntityID %>" />
                        </td>
                     </tr>
                    </logic:iterate>
                   </logic:present>
                   <%
                    index++;
                       } else {%>
                   <td colspan="10" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                   <%}%>
                  </tbody>
                </table>
                <tr height="40">
                    <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                              onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                        <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                        <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()"
                        onmouseover="MM_swapImage('Image2','','img/cancel1.gif',1)">
                        <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                        <br>
                        <html:errors property="errDuplicate"/>
                    </td>
                    </tr>
                   </td>
              </tr>
             </table>
    </html:form>
  </td>
</tr>
<tr>
<td height="25">
     <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="580" valign="middle">
                <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                </td>
                <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                <td valign="middle" >
				<%
				String pageIndexUrl="GroupMember.do?event=search_group_list&pageIndex=true";
		    	if (aForm.getSearchType() != null && aForm.getSearchType().length()>0 ){
                  pageIndexUrl = pageIndexUrl + "&searchType=" + aForm.getSearchType();
                    }
                 pageIndexUrl = pageIndexUrl + "&startIndex=";
				%> 
                 <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%=pageIndexUrl%>' submitFlag='<%=new Boolean(false)%>'/>
                </td>
              </tr>
       </table>
</td>
</tr>

</table>

<script language="JavaScript">

    function submitForm(){
             var cstId  = <%=rowIdx%>;
               if (cstId ==0){
                   alert("Please select one record");
               } else{
                     var checkResult = false;
                     var field = document.forms["GroupMemberForm"].entityCheckBoxID;
                     var len =field.length ;
                     if (len > 1){
                         for (i = 0; i < field.length; i++){
                              if(field[i].checked){
                                 checkResult=true;
                                 break;
                               }
                         }
                     }else {
                        if (document.forms["GroupMemberForm"].entityCheckBoxID.checked){
                                checkResult=true;
                            }
                      }
                     if(!checkResult){
                            alert("Please select one record");
                     }else{
                          document.forms[0].action ="GroupMember.do?event=create";
                          document.forms[0].submit();
                     }
                }
           }

        function cancelForm(){
            document.forms[0].action ="GroupMember.do?event=cancel";
            document.forms[0].submit();
        }

    function JumpOnSelectactive(selectObj, customerID, limitProfileID, grpID){
  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "VIEW_GROUP"){
        	location.href = "GroupMember.do?event=read&grpID=" +grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}else if (selectObj.options[selectIndex].value == "DELETE_GROUP") {
            location.href = "GroupMember.do?event=prepare_delete&grpID=" +grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
     }

    function gotoPage() {
       //  alert("gotoPage "+ ind);
        parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        // alert("goNextPrev(ind) = "+ ind);
        document.forms["GroupMemberForm"].cusName.value='';
        document.forms["GroupMemberForm"].startIndex.value=ind;
        document.forms["GroupMemberForm"].numItems.value=<%=numItem%>;
    }

    function goPageIndex(ind) {
        /// alert("goPageIndex(ind) ="+ ind);
        document.forms["GroupMemberForm"].startIndex.value=ind;
        document.forms["GroupMemberForm"].numItems.value=<%=numItem%>;
        document.forms["GroupMemberForm"].submit();
    }

    function goAlphaIndex(ind) {
       // alert("goAlphaIndex(ind) = "+ ind);
       //document.forms["GroupMemberForm"].searchGroupName.value=ind;
        document.forms["GroupMemberForm"].customerName.value=ind;
        document.forms["GroupMemberForm"].searchGroupName.value=ind;
		if (ind == ''){
			document.forms["GroupMemberForm"].all.value = 'Y';
            document.forms["GroupMemberForm"].searchGroupName.value="";
            document.forms["GroupMemberForm"].searchGroupID.value="";
        }
        document.forms[0].indicator.value='*';
        document.forms["GroupMemberForm"].startIndex.value=0;
        document.forms[0].action ="GroupMember.do?event=searchGroup";
        document.forms["GroupMemberForm"].submit();
    }
    function goPage(pageNo){
       //  alert("goPage(pageNo)= "+ ind);
        document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
    }


</script>


</body>
</html>
<script type="text/javascript">
    <!--
        var token='<%=TokenTag.generateToken()%>';
        function viewGroupSubGroup(subProfileID) {
            var url = '<%=request.getContextPath()%>' +"/custgrpi/popup/popview_groupdetails.jsp?subGrpID=" + subProfileID  ;
            MM_openBrWindow(url, token, "left=220,top=10,height=600, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
            disableGoButtons(false) ;
        }
        function popupShareHolder(subProfileID) {
            var url = "GroupMember.do?event=popup_shareholder&sub_profile_id=" + subProfileID  ;
            MM_openBrWindow(url, token, "left=220,top=10,height=400, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
            disableGoButtons(false) ;
        }

    var w = null;
    function MM_openBrWindow(theURL,winName,features) {
         if(w != undefined && isOpen() && w.name == winName){
            w.location.replace(theURL);
         }else{
           w = window.open(theURL,winName,features);
        }
        w.focus();
    }

     function isOpen(){
      try{
        w.document;
        return true;
      } catch(ex){}
      return false;
    }
   -->
</script>


<%} catch(Exception e)
        { e.printStackTrace();
 }%>

