<%@ page import="java.util.ArrayList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.customer.bus.ICustomerSearchResult,
                 java.util.HashMap,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam, 
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
				 com.integrosys.cms.app.limit.bus.ILimitProfile, 
				 com.integrosys.component.commondata.app.CommonDataSingleton,                                                 
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ArrayList list = (ArrayList)session.getAttribute("com.integrosys.cms.ui.seccoltask.SecurityColTaskAction.colTaskList");
    int normalListCount = 0 ;
    if(list!=null) {
        pageContext.setAttribute("colTaskList",list);
        normalListCount = list.size();
        DefaultLogger.debug(this,"SIZE: " + normalListCount);
    }
    int row = 0;
    ArrayList status = (ArrayList)request.getAttribute("status");
    CountryList cList = CountryList.getInstance();
    
    ArrayList list1 = (ArrayList)session.getAttribute("com.integrosys.cms.ui.seccoltask.SecurityColTaskAction.colTaskList1");
    if(list1!=null) {
		pageContext.setAttribute("colTaskList1",list1);
    }
    int row1 = 0;
    ArrayList statusDel = (ArrayList)request.getAttribute("status1");

	java.util.HashMap custResHash = (java.util.HashMap) request.getAttribute("innerOuterBcaObList");
	if(custResHash!=null){
		DefaultLogger.debug(this,"custResHash size="+custResHash.size());
	}else{
		DefaultLogger.debug(this,"custResHash Null");
		custResHash = new java.util.HashMap();
	}
	
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
boolean isInCountry=CheckListUtil.isInCountry(userTeam,limitProfile);
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px ;
}
</style>


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

function gotopage (aLocation) {
	window.location = aLocation ;
}

function createTask(ind) {
    document.forms[0].index.value= ind;
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

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="SecurityColTask" >
<html:hidden property="event" />
<input type="hidden" name="index" />
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

    <tr>

    <td width="78%" height="24">
      <h3> Create Security Collaboration Task</h3>
    </td>

    <td width="22%" align="right" valign="baseline" height="24">
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <hr /></td>
    </tr>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="7%">Limit ID</td>
              <td width="7%">Security ID</td>
              <td width="16%" nowrap>Security Type /<br />
                SubType</td>
              <td width="6%">Customer Category</td>  
              <!-- for R1.3 CR013 -->
              <td width="9%">LE ID /<br> Customer Name </td>
              <td width="9%">BCA Ref /<br> BCA Bkg Location</td>
              <td width="9%">Outer Limit ID</td>
              <!-------------------->
              <td width="10%">Security Location</td>
			  <td width="10%">Organisation Code</td>

          <td width="10%">Status</td>
              <td width="10%">Action</td>
            </tr>
          </thead>
          <tbody>
<% boolean exists =false; %>          
<logic:present name="colTaskList" >
   <logic:iterate id="OB" name="colTaskList"  type="com.integrosys.cms.app.checklist.bus.CollateralCheckListSummary"  >
	<% exists =true;
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String status1 = (String)status.get(row-1);
    DefaultLogger.debug(this,"Status "+status1);
    String countryName = cList.getCountryName(OB.getCollateralLocation());
   %>
        <tr class="<%=rowClass%>">
        	<td class="index"><%=row%></td>
            
            <!-- removed -->
            <td valign="top" >
                  <%	if(OB.getCustCategory().equals(ICMSConstant.CHECKLIST_MAIN_BORROWER) && OB.getLimitList() != null && OB.getLimitList().length > 0){	%>
                		<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
                  			<integro:empty-if-null value="<%=subOb.getLimitRef()%>"/>&nbsp;<br>&nbsp;<br>
		                </logic:iterate>
              	<% 	}else if(OB.getCustCategory().equals(ICMSConstant.CHECKLIST_CO_BORROWER) && OB.getCoborrowerLimitList() != null && OB.getCoborrowerLimitList().length > 0){	%>
                      <logic:iterate id="cbLimit" name="OB" property="coborrowerLimitList" type="com.integrosys.cms.app.limit.bus.ICoBorrowerLimit" >
                            <integro:empty-if-null value="<%=cbLimit.getLimitRef()%>"/>&nbsp;<br>&nbsp;<br>
                      </logic:iterate>
              	<% 	} else { %>
                 		-
              	<% 	}  %>
                </td>
            
            <!-- removed -->  
            <td valign="top" >&nbsp;<%=OB.getCollateralRef()%></td>
            
           	<td valign="top" >&nbsp;<bean:write name="OB" property="collateralType.typeName" /><br />
                <bean:write name="OB" property="collateralSubType.subTypeName" />
           	</td>
            <td valign="top"><%=OB.getCustCategory()%></td>
            <!-- for R1.3 CR013 -->		
           	<%
			java.util.HashMap bcaInfoMisc = null;
			%>
                
           <td nowrap="nowrap" valign="top" >
                <logic:present name="OB" property="limitList">
                	<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
						<%	bcaInfoMisc =(java.util.HashMap)custResHash.get(String.valueOf(subOb.getLimitID()));	
							if(bcaInfoMisc!=null){
               					//DefaultLogger.debug(this,"1> limitID ="+subOb.getLimitID()+"\t bcaInfo ="+bcaInfoMisc);%>
                				<%=((((String)bcaInfoMisc.get("leId"))==null)?" ":((String)bcaInfoMisc.get("leId")))%>&nbsp;<br>
                				<%=((((String)bcaInfoMisc.get("custName"))==null)?" ":((String)bcaInfoMisc.get("custName")))%>&nbsp;<br>
                		<%	}else{%>
                				&nbsp;<br>&nbsp;<br>
                		<%	}%>
                	</logic:iterate>
                </logic:present>
                <logic:notPresent name="OB" property="limitList">-&nbsp;<br>&nbsp;<br></logic:notPresent>
                </td>
                
            <td nowrap="nowrap" valign="top" >
                <logic:present name="OB" property="limitList">
					<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
						<%	bcaInfoMisc =(java.util.HashMap)custResHash.get(String.valueOf(subOb.getLimitID()));	
							if(bcaInfoMisc!=null){
               					//DefaultLogger.debug(this,"2> limitID ="+subOb.getLimitID()+"\t bcaInfo ="+bcaInfoMisc);%>
                				<%=((((String)bcaInfoMisc.get("bcaRef"))==null)?" ":((String)bcaInfoMisc.get("bcaRef")))%>&nbsp;<br>
                				<%=((((String)bcaInfoMisc.get("bkgLoc"))==null)?" ":cList.getCountryName((String)bcaInfoMisc.get("bkgLoc")))%>&nbsp;<br>
                		<%	}else{%>
                				&nbsp;<br>&nbsp;<br>
                		<%	}%>
                	</logic:iterate>
                </logic:present>
                <logic:notPresent name="OB" property="limitList">-&nbsp;<br>&nbsp;<br></logic:notPresent>
                </td>
            
            <td valign="top" >
                <% 	if (OB.getLimitList() != null && OB.getLimitList().length > 0){%>
                	<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
                	<% 	if((subOb.getOuterLimitRef()==null)||(subOb.getOuterLimitRef()).equals("0"))  {%>
							-&nbsp;<br>&nbsp;<br>
                	<% 	}else if(subOb.getIsInnerOuterSameBCA())  {%>
							<font color="000000">
								<integro:empty-if-null value="<%=subOb.getOuterLimitRef()%>"/>
							</font>&nbsp;<br>
		            <%	}else{%>
		            		<font color="FFOOCC">
								<integro:empty-if-null value="<%=subOb.getOuterLimitRef()%>"/>
							</font>&nbsp;<br>
		            <%	}%>
                	</logic:iterate>
              	<%	} else { %>
                 	-&nbsp;<br>&nbsp;<br>
              	<% 	}%>
              	</td>
            
            
            <td valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>
	<%	String securityOrg=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,OB.getSecurityOrganization());%> 	
      <td valign="top" >&nbsp;<integro:empty-if-null value="<%=securityOrg%>" /></td>
			
          	<td valign="top" >&nbsp;<bean:write name="OB" property="checkListStatus" /></td>
           	
           	<td valign="top" > 

 <%
 boolean canCreate=false;
if(isInCountry&&
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

           	<%	if(ICMSConstant.TASK_REQUIRED.equals(status1) && isCPCMaker){ 	%>
                	 
                	<%if(canCreate){%>
					<!-- added by zhaijian end-->
                	<a href="#" onClick="createTask('<%=row-1%>')" >Create Task</a>   
					<%}%>
					
           	<% 	}else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status1) && isCPCMaker){ 	%>           	           	
                  	<a href="#" onClick="updateTask('<%=row-1%>')" >Update Task</a> 
                    
                    <%if(canReject){%>
                    <a href="#"  onclick="rejectTask('<%=row-1%>')" >Reject Task</a>
					<%}%>
					
			<%  }else if (ICMSConstant.TASK_VIEW_ONLY.equals(status1)) { %>                  	    
				<a href="#" onClick="viewTask('<%=row-1%>')" >View Task</a>     
			<% 	}else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status1) && !isCPCMaker){ 	%>                  	
				<a href="#" onClick="viewTask('<%=row-1%>')" >View Task</a>     
			<% 	}else { %> 
					- 
           	<% 	}	%>&nbsp;
           	</td>
     	</tr>
	</logic:iterate>
</logic:present>
<logic:notPresent name="colTaskList" >
<% exists  = true; %>
            <tr class="odd">
              <td colspan="12">There is no document</td>
            </tr>
</logic:notPresent>
<% if(!exists){%>
 	<tr class="odd">
              <td colspan="12">There is no document</td>
            </tr>
 <%}%>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>

    <tr>

    <td width="78%" height="24">
      <h3> Create Deleted Security Collaboration Task</h3>
    </td>

    <td width="22%" align="right" valign="baseline" height="24">
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <hr /></td>
    </tr>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="7%">Limit ID</td>
              <td width="7%">Security ID</td>
              <td width="16%" nowrap>Security Type /<br />
                SubType</td>
              <td width="10%">Security Location</td>
           <td width="10%">Organisation Code</td>
          <td width="10%">Status</td>
              <td width="10%">Action</td>
            </tr>
          </thead>
          <tbody>
  <% boolean exists1 =false; %> 
<logic:present name="colTaskList1"  >
   <logic:iterate id="OB" name="colTaskList1"  type="com.integrosys.cms.app.checklist.bus.CollateralCheckListSummary"  >
<% exists1 =true;
    String rowClass="";
    row1++;
    if(row1%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String status2 = (String)statusDel.get(row1-1);
    String countryName = cList.getCountryName(OB.getCollateralLocation());
   %>
        <tr class="<%=rowClass%>">
          	<td class="index"><%=row1%></td>
            <!-- removed -->
            
            <td valign="top" >
            <% 	if(OB.getLimitList() == null) {%>
             		-
			<% 	}else{ %>
             	<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
	            	<integro:empty-if-null value="<%=subOb.getLimitRef()%>" />
	            </logic:iterate>
           	<% 	} %>
           	</td>
            <!-- removed -->  
            
            <td valign="top" >&nbsp;<%=OB.getCollateralRef()%></td>
            
            <td valign="top" >&nbsp;<bean:write name="OB" property="collateralType.typeName" /><br />
                <bean:write name="OB" property="collateralSubType.subTypeName" />
            </td>
            
            <td valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>
      <td valign="top" >&nbsp;<integro:empty-if-null value="<%=OB.getSecurityOrganization()%>" /></td>
          	<td valign="top" >&nbsp;<bean:write name="OB" property="checkListStatus" /></td>
            
            <td valign="top" > 
            	<%	if(ICMSConstant.TASK_REQUIRED.equals(status2) && isCPCMaker) { 	%>
                   		<a href="#" onClick="createTask('<%= normalListCount + row1-1%>')" >Create Task</a> 
                <% 	}else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status2) && isCPCMaker){ 	%>
                    	<a href="#" onClick="updateTask('<%= normalListCount + row1-1%>')" >Update Task</a>     
				<%  }else if (ICMSConstant.TASK_VIEW_ONLY.equals(status2)) { %>
						<a href="#" onClick="viewTask('<%= normalListCount + row1-1%>')" >View Task</a>     				                    	
                <% 	}else if (ICMSConstant.TASK_ALREADY_CREATED.equals(status2) && !isCPCMaker){ 	%>
                    	<a href="#" onClick="viewTask('<%= normalListCount + row1-1%>')" >View Task</a>     
				<% 	}else { %>
						 - 
                <% 	}%>&nbsp;
          	</td>
       	</tr>
	</logic:iterate>
</logic:present>
<logic:notPresent name="colTaskList" >
<% exists1  = true; %>
            <tr class="odd">
              <td colspan="8">There is no document</td>
            </tr>
</logic:notPresent>
<% if(!exists1){%>
 	<tr class="odd">
              <td colspan="8">There is no document</td>
            </tr>
 <%}%>
          </tbody>
        </table>
    </td>
    </tr>
  </tbody>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
