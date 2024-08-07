<%@ page import="java.util.ArrayList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam, 
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.checklist.CheckListUtil, 
				 com.integrosys.cms.app.limit.bus.ILimitProfile,                                 
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ArrayList list = (ArrayList)session.getAttribute("com.integrosys.cms.ui.cccoltask.CCColTaskAction.colTaskList");
    int normalListCount = 0 ;
    if(list!=null) {
        pageContext.setAttribute("colTaskList",list);
        normalListCount = list.size();
    }
    int row = 0;
    ArrayList status = (ArrayList)request.getAttribute("status");
    
    ArrayList list1 = (ArrayList)session.getAttribute("com.integrosys.cms.ui.cccoltask.CCColTaskAction.colTaskList1");
        if(list1!=null) {
            pageContext.setAttribute("colTaskList1",list1);
        }
        int row1 = 0;
    ArrayList statusDel = (ArrayList)request.getAttribute("status1");

 	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isCPCMaker=false;
  	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPC_MAKER){
                    isCPCMaker = true;
                    break TOP_LOOP;
                }
            }
        }
  	}        
%>
<%
ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ); 
ICMSCustomer iCustomer=(ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
boolean isInCountry=false;
if(limitProfile!=null){
isInCountry=CheckListUtil.isInCountry(userTeam,limitProfile);
}
else{
isInCountry=CheckListUtil.isInCountry(userTeam,iCustomer);
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



function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function createTask(ind) {
    document.forms[0].index.value=ind;
    document.forms[0].event.value="read_task";
    document.forms[0].submit();
}

function viewTask(ind){
    document.forms[0].index.value=ind;
    document.forms[0].event.value="view_task";
    document.forms[0].submit();
}

function updateTask(ind){
    document.forms[0].index.value=ind;
    document.forms[0].event.value="read_task_update";
    document.forms[0].submit();
}

function rejectTask(ind){
    document.forms[0].index.value=ind;
    document.forms[0].event.value="maker_pre_reject";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCColTask" >
<html:hidden property="event" />
<input type="hidden" name="index" />

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Create Constitutional / Contractual Collaboration Task</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="10%">Customer Category</td>
              <td width="10%">LE ID/Pledgor ID</td>
              <td width="15%">Legal Name</td>
              <td width="10%" nowrap>Documentation Originating Location</td>
              <td width="10%">Organisation Code</td>
              <td width="8%">Governing Law</td>
              <td width="8%">Status</td>
              <td width="8%">Action</td>
            </tr>
          </thead>
          <tbody>
          <% boolean exists =false; %> 
<logic:present name="colTaskList" >
   <logic:iterate id="OB" name="colTaskList"  type="com.integrosys.cms.app.checklist.bus.CCCheckListSummary"  >
<%  exists  =true;

    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String status1 = (String)status.get(row-1);
    
    CountryList cList = CountryList.getInstance();
    String countryName = cList.getCountryName(OB.getDomicileCtry());
    String orgCode = "-";
    orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,OB.getOrgCode());

   %>
            <tr class="<%=rowClass%>">
              <td class="index"><%=row%></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="custCategory" /></td>
              <% if ((OB.getLegalID() == null) || (OB.getLegalID().equals("0")))
                 {%>
              <td valign="top" >&nbsp;<%= "-"%>
              <% } else { %>
              <td valign="top" >&nbsp;<%=OB.getLegalID()%>
              <% } 
                if (OB.getPledgorReference() != null)
                {
              %><br><%= OB.getPledgorReference()%>
              <%}%>
              </td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="legalName" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=countryName%>" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=orgCode%>" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=OB.getGovernLaw()%>" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=OB.getCheckListStatus()%>" /></td>
              <td valign="top"> 

<%
boolean canCreate=false;
if(isInCountry&&!OB.getSameCountryInd()&&
   (OB.getTrxStatus()==null||
    (OB.getTrxStatus()!=null&&
	   !"Y".equals(OB.getDisableTaskInd())&&
       !ICMSConstant.STATE_PENDING_CREATE.equals(OB.getTrxStatus())&&
       !(ICMSConstant.STATE_REJECTED.equals(OB.getTrxStatus())&&
	     ICMSConstant.STATE_PENDING_CREATE.equals(OB.getTrxFromState())
	    )
    )
   )
  )
{
canCreate=true;
}

boolean canReject=false;
if(!isInCountry&&OB.getTrxStatus()==null)
{
canReject=true;
}
%>

                <%if(ICMSConstant.TASK_REQUIRED.equals(status1) && isCPCMaker) { %>
                    
                    <%if(canCreate){%>
                    <a href="#" onClick="createTask('<%=row-1%>')" >Create Task</a> 
					<%}%>
					
                <% } else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status1) && isCPCMaker) { %>
                    <a href="#" onClick="updateTask('<%=row-1%>')" >Update Task</a> 

					<%if(canReject){%>
                    <a href="#"  onclick="rejectTask('<%=row-1%>')" >Reject Task</a>
					<%}%>
               
                <% } else if (ICMSConstant.TASK_VIEW_ONLY.equals(status1)) { %>
                	<a href="#" onClick="viewTask('<%=row-1%>')" >View Task</a> 
				<% } else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status1) && !isCPCMaker) { %> 
					<a href="#" onClick="viewTask('<%=row-1%>')" >View Task</a> 
                <% } else { %> -  <% } %>
				&nbsp;
              </td>
            </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="colTaskList" >
<% exists  = true; %>
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
<% if(!exists ){%>
 	<tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
 <%}%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>



<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Create Deleted Constitutional / Contractual Collaboration Task</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="10%">Customer Category</td>
              <td width="10%">LE ID/Pledgor ID</td>
              <td width="15%">Legal Name</td>
              <td width="10%" nowrap>Documentation Originating Location</td>
              <td width="10%">Organisation Code</td>
              <td width="8%">Governing Law</td>
              <td width="8%">Status</td>
              <td width="8%">Action</td>
            </tr>
          </thead>
          <tbody>
          <% boolean exists1 =false; %> 
<logic:present name="colTaskList1"  >
   <logic:iterate id="OB" name="colTaskList1"  type="com.integrosys.cms.app.checklist.bus.CCCheckListSummary"  >
<% exists1 =true;
    String rowClass="";
    row1++;
    if(row1%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String status2 = (String)statusDel.get(row1-1);
    
    CountryList cList = CountryList.getInstance();
    String countryName = cList.getCountryName(OB.getDomicileCtry());
    String orgCode = "-";
    orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,OB.getOrgCode());

   %>
            <tr class="<%=rowClass%>">
              <td class="index"><%=row1%></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="custCategory" /></td>
              <% if ((OB.getLegalID() == null) || (OB.getLegalID().equals("0")))
                 {%>
              <td valign="top" >&nbsp;<%= "-"%>
              <% } else { %>
              <td valign="top" >&nbsp;<%=OB.getLegalID()%>
              <% } 
                if (OB.getPledgorReference() != null)
                {
              %><br><%= OB.getPledgorReference()%>
              <%}%>
              </td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="legalName" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=countryName%>" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=orgCode%>" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=OB.getGovernLaw()%>" /></td>
              <td valign="top" ><integro:empty-if-null value="<%=OB.getCheckListStatus()%>" /></td>
              <td valign="top"> 
                <%if(ICMSConstant.TASK_REQUIRED.equals(status2) && isCPCMaker) { %>
                    <a href="#" onClick="createTask('<%= normalListCount + row1-1%>')" >Create Task</a> 
                <% } else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status2) && isCPCMaker) { %>
                    <a href="#" onClick="updateTask('<%= normalListCount + row1-1%>')" >Update Task</a>     
                <% } else if (ICMSConstant.TASK_VIEW_ONLY.equals(status2)) { %>
                	<a href="#" onClick="viewTask('<%= normalListCount + row1-1%>')" >View Task</a>     
                <% } else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status2) && !isCPCMaker) { %>
                	<a href="#" onClick="viewTask('<%= normalListCount + row1-1%>')" >View Task</a>     
                <% } else { %> -  <% } %>
                &nbsp;
              </td>
            </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="colTaskList1" >
<% exists1  = true; %>
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
<% if(!exists1){%>
 	<tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
 <%}%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
