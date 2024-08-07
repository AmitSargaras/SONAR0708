
<%@ page import="java.util.*,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.cms.app.transaction.OBCMSTrxSearchResult,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.todo.TodoAction,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
	OBCommonUser user=(OBCommonUser) session.getAttribute(GlobalSessionConstant.LOS_USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    
    String id = (String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
    long oneTeamMshipID = Long.parseLong(id);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    //oneTeamMshipID = user.getTeamTypeMembership().getMembershipID();
    
    //System.out.println("teamTypeID"+teamTypeID);
    //System.out.println("oneTeamMshipID"+oneTeamMshipID);
    //System.out.println("oneTeamMshipID:::::::::::::::::"+id);
    boolean isCPC = false;
    boolean isSSC = false;
    boolean isCust = false;    
    boolean isSys = false;
    boolean isSc = false;
    boolean isMr = false;
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_CHECKER) {
        isSys = true;
    }
    
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_MAKER 
    		||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
    		||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER
            ||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH) {
        isSc = true;
    }
/*    
    if (teamTypeID==ICMSConstant.TEAM_TYPE_CPC) {
    	isCPC = true;
    }
*/    
    if(teamTypeID==ICMSConstant.TEAM_TYPE_SSC) {
    	isSSC = true;
    }
/*    
    if (teamTypeID==ICMSConstant.TEAM_TYPE_CPCCUSTODIAN) {
    	isCust = true;
    }
*/    
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
        isMr = true;
    }
    boolean isLimit = false;
    String event = request.getParameter("event");
    if (event == null) event = "prepare";
    if (TodoAction.EVENT_NEW_LIMIT_PROFILE.equals(event) || 
    	TodoAction.EVENT_EXISTING_LIMIT_PROFILE.equals(event) || 
    	TodoAction.EVENT_NEW_BORROWER.equals(event) || 
    	TodoAction.EVENT_NEW_NONBORROWER.equals(event)) {
        isLimit = true;
    }
    boolean isNewNonBorrower= false;
    if (TodoAction.EVENT_NEW_NONBORROWER.equals(event)) {
	    isNewNonBorrower = true;
    }
    
    String legalName = request.getParameter("legalName");
    if (legalName == null) legalName = "";
    SearchResult result = (SearchResult)request.getAttribute("searchResult");

    if (result == null)
        result = (SearchResult)session.getAttribute("com.integrosys.cms.ui.todo.TodoAction.session.searchResult");

    Collection col = null;
    if (result != null)
        col = result.getResultList();
    
    String lastUpdatedBy=(String)session.getAttribute("com.integrosys.cms.ui.todo.TodoAction.session.lastUpdatedBy");
    String searchAANumber=(String)session.getAttribute("com.integrosys.cms.ui.todo.TodoAction.session.searchAANumber"); 
    String searchCustomerName=(String)session.getAttribute("com.integrosys.cms.ui.todo.TodoAction.session.searchCustomerName");
    String searchLeID=(String)session.getAttribute("com.integrosys.cms.ui.todo.TodoAction.session.searchLeID"); 
    System.out.println("********************* lastUpdatedBy:- "+lastUpdatedBy);
%>
<%
//List transactionTypeList = (List) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionTypeList");
//System.out.println("********************* transactionTypeList:- "+transactionTypeList.size());
//pageContext.setAttribute("transactionTypeList",transactionTypeList);


  
   // String lastUpdatedBySession=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"lastUpdatedBySession");
    
    String toDoStatus=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"toDoStatus"); 
    String statusSession=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"statusSession"); 
    
   
    String searchAANumberSession=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"searchAANumberSession"); 
   
      //String searchCustomerName=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"searchCustomerName"); 
    String searchCustomerNameSession=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"searchCustomerNameSession");
    
     //String searchLeID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"searchLeID"); 
    String searchLeIDSession=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"searchLeIDSession"); 
    
	String transactionType=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionType"); 
    String transactionTypeSession=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionTypeSession"); 

    String sort=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"sort");
    String field=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"field");
   
	
    boolean isAdm=false; // show all search criteria for adm users
    
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_CHECKER) {
        isSys = true;
    }
    // for adm users to show all search criteria
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SSC_MAKER 
        ||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
    	||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SSC_CHECKER
    	||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH
    	||oneTeamMshipID==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
    	||oneTeamMshipID==ICMSConstant.TEAM_TYPE_BRANCH_CHECKER
    	||oneTeamMshipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I
    	||oneTeamMshipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
        ||oneTeamMshipID==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH
        ||oneTeamMshipID==ICMSConstant.TEAM_TYPE_BRANCH_CHECKER_WFH
		) {
        isAdm = true;
    }
    
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_MAKER 
    		|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
    		|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER
    		|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH) {
        isSc = true;
    }
/*    
    if (teamTypeID==ICMSConstant.TEAM_TYPE_CPC) {
    	isCPC = true;
    }
*/    
    if(teamTypeID==ICMSConstant.TEAM_TYPE_SSC) {
    	isSSC = true;
    }
/*    
    if (teamTypeID==ICMSConstant.TEAM_TYPE_CPCCUSTODIAN) {
    	isCust = true;
    }
*/    
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
        isMr = true;
    }
    
   
%>



<%@page import="com.crystaldecisions.sdk.plugin.desktop.user.IUser"%>
<%@page import="com.integrosys.component.login.ui.GlobalSessionConstant"%>
<%@page import="com.integrosys.component.user.app.bus.OBCommonUser"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%><html>
<head>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;

}
//-->
</script>

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

function goNextPrev(ind) {
    document.forms["DiscrepencyForm"].userName.value='';
    document.forms["DiscrepencyForm"].startIndexMain.value=ind;
}

function goPageIndex(ind) {
    document.forms["WorkspaceForm"].startIndexMain.value=ind;
    document.forms["WorkspaceForm"].submit();
}

function goAlphaIndex(ind) {
    document.forms["DiscrepencyForm"].searchLegalName.value='';
    document.forms["DiscrepencyForm"].searchLeID.value='';
    document.forms["DiscrepencyForm"].legalName.value=ind;
    document.forms["DiscrepencyForm"].startIndexMain.value=0;
    document.forms["DiscrepencyForm"].submit();
}

function goPage(pageNo){
	document.forms[0].startIndexMain.value = pageNo*10;
}
function submitPage() {
	
	document.forms["WorkspaceForm"].event.value='search_discrepancy_todo';
    document.forms["WorkspaceForm"].startIndexMain.value=0;
    document.forms["WorkspaceForm"].submit();
}


function handleEnter (field, event, itemPressed) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);
	alert(itemPressed);
	if (keyCode == 13) {
		if (field.value == "" || field.value == null) {
			//
		}
		else {
			submitPage();
		}
		return false;
	} 
	else
	return true;
}

function resetCriteria1(event1){
	alert("event1 "+event1);
	document.forms["WorkspaceForm"].action="ToDo.do?event=search_discrepancy_todo";
	document.forms["WorkspaceForm"].lastUpdatedBy.value="";
	document.forms["WorkspaceForm"].transactionType.value="";
	document.forms["WorkspaceForm"].toDoStatus.value="";
	  submitPage();
	}

function resetCriteria(event1){
	
	document.forms["WorkspaceForm"].action="ToDo.do?event=search_discrepancy_todo";
	document.forms["WorkspaceForm"].searchCustomerName.value="";
	document.forms["WorkspaceForm"].searchLeID.value="";
	document.forms["WorkspaceForm"].searchAANumber.value="";
	document.forms["WorkspaceForm"].lastUpdatedBy.value="";
	
	  submitPage();
	}

function handleEnter (field, event, itemPressed) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == "" || field.value == null) {
			//
		}
		else {
			submitPage();
		}
		return false;
	} 
	else
	return true;
}

//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->


<html:form action="ToDo.do">
<input type="hidden" name="startIndexMain" value="0"/>
<input type="hidden" name="event" value=<%=event %> />
<input type="hidden" name="customerID" />
<input type="hidden" name="transactionDate" />
<input type="hidden" name="legalName" value="<%=legalName%>"/>
<input type="hidden" name="isBtnClicked" value="N" />
<input type="hidden" name="" value="" />


	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	  <thead>
          <!--//CR-120 Search To Do list-->
          <% 
          if (!isSys && !isSc && !isMr) {
        	  
        	 
        	  %>          
          <tr>
            <td valign="top">
               <table width="100%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="100%">
                   <TABLE width="100%" class=tblinfo id=custsearch border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                     <THEAD>
                      <TR>
                        <TD colSpan=4 width="100%">Please enter search criteria</TD></TR></THEAD>
                      <TBODY>
                      <%--
	                      <TR class=odd>
	                        <TD class=fieldname width="20%"><bean:message key="label.global.legal.name"/> :</TD>
	                        <TD><html:text property="searchLegalName" maxlength="40" size="50"/> <html:errors property="legalNameError"/></TD>
	                        <TD><input class=btnNormal id=Search1 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(1) type=button value=Go name=Search1>
	                        </TD>
	                      </TR>
                      --%>
					<%--
						<TR class=even>
                      	<TD class=fieldname><bean:message key="label.customer.id"/> Type:</TD>
                        <TD>
                        	<%
                        			CommonCodeList commonCode = CommonCodeList.getInstance(
															null,
															null,
															ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
															Collection leTypeValues = commonCode.getCommonCodeValues();
															Collection leTypeLabels = commonCode.getCommonCodeLabels();
															pageContext.setAttribute("leTypeValues",leTypeValues);
															pageContext.setAttribute("leTypeLabels",leTypeLabels);
                        	%>
                        	<html:select property="searchLeIDType">
					  								<option value="" selected="selected">Please Select</option>
					  								<html:options name="leTypeValues" labelName="leTypeLabels"/>
					  							</html:select>
					  	    <html:errors property="searchLeIDType"/> 
                        </TD>
                        <TD rowspan='2'>
                        	<input class=btnNormal id=Search2 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(2) type=button value=Go name=Search2>
                        </TD>
                      </TR>
                     --%>
                      <TR class="even">
                        <TD class="fieldname"><bean:message key="label.customer.id"/> :</TD>
                        <TD><html:text property="searchLeID" value="<%= searchLeID %>" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 2);" /> 
							<html:errors property="leIDError"/> 
						</TD>              
						 
                       <TD class="fieldname" width="20%"><bean:message key="label.customer.name" /> :</TD>
                        <TD><html:text property="searchCustomerName" value="<%= searchCustomerName %>" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 3);" /> 
							<html:errors property="customerNameError"/>
						</TD>
                       
                       <!-- put here -->
                        </TR>
                      <TR class="odd">
                        <TD class="fieldname" width="20%"><bean:message key="label.global.aa.number" /> :</TD>
                        <TD><html:text property="searchAANumber" value="<%= searchAANumber %>" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 4);" /> 
							<html:errors property="aaNumberError"/>
						</TD>
                      
                        
                        <TD class="fieldname" width="20%"><bean:message key="label.todo.last.updated.by" /> :</TD>
                        <TD><html:text property="lastUpdatedBy" value="<%= lastUpdatedBy %>" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 3);" /> 
							<html:errors property="lastupdatedbyerror"/>
							
						</TD>
                       
                       
                        </TR>
                        
                        <tr class="even">
                        
                        <td colspan="2">
                        <center><input class=btnNormal id=Search2 style="MARGIN-LEFT: 10px; WIDTH: 100px; MARGIN-RIGHT: 5px" onclick=submitPage() type=button value=Go name=Search2>
						</center>
						</td> 
						 <td colspan="2"> <center>
                       <input class=btnNormal  style="margin-left: 18px; WIDTH: 100px; MARGIN-RIGHT: 5px" onclick=resetCriteria("<%= event %>") type=button value="Reset Criteria"/>
                        </center></td>     
                        </tr>
                   
                     
                        
                   
                        
<!--                        <TR class="odd">-->
<!--                        <TD class="fieldname" width="20%">Login Id :</TD>-->
<!--                        <TD><html:text property="searchLoginID" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 4);" /> -->
<!--							<html:errors property="loginID"/>-->
<!--						</TD>-->
<!--                        <TD><input class=btnNormal id=Search3 style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(5) type=button value=Go name=Search3>-->
<!--                        </TD></TR>-->
                      </TBODY>
                    </TABLE>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
		  <% } %>
		  
        <tr>
		<%		
			String title = "To Do List (Discrepency)";
			if ("prepare".equals(event)) title = "To Do (Item) List";
			else if ("totrack".equals(event)) title = "To Track List";
			else if ("existinglimitprofile".equals(event)) title = "To Do (In-Progress Customer) List";
			//else if ("newlimitprofile".equals(event)) title = "To Do (New Customer) List";
			else if ("newborrower".equals(event)) title = "To Do (New Borrowing Customer) List";
			else if ("newnonborrower".equals(event)) title = "To Do (New Non-borrowing Customer) List";

		%>

		  <td style="padding-left:5"> <h3><%=title%></h3></td>
		</tr>
		<tr>
		  <td align="center"><hr /></td>
		</tr>
	  </thead>
	  <tbody>
		<tr>
		  <td align="center">
		  	<table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
			  <thead>
			
				<tr>
				  <td width="3%"><bean:message key="label.global.sn"/></td>
				  <td width="11%"><bean:message key="label.todo.last.updated.by"/></td>
				  <td width="13%"><bean:message key="label.todo.borrower.name"/>/<bean:message key="label.todo.security.name"/>/<br/>
                      <bean:message key="label.todo.group.name"/><br/>
                      <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                        <bean:message key="label.customer.subprofile.name"/> 
                      <% } %>
                  </td>
				  <td width="8%"><bean:message key="label.customer.id"/>/<bean:message key="label.security.id"/><br/>
                      <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                        <bean:message key="label.customer.subprofile.id"/>
                      <% } %>
				  </td>
                    <%--
                        <td width="10%">AM</td>
                    --%>
				  <td width="8%"><bean:message key="label.global.aa.number"/></td>
				  <td width="8%">Transaction Type</td>
				 <td width="8%">Transaction Date</td>
				  <td width="7%"><bean:message key="label.global.action"/></td>
				</tr>
				<tr>
				<td></td>
				<td>
				  <a href="ToDo.do?event=prepare_discrepancy_sort&sort=asc&field=user_info"><img width="14px" height="14px" src="img/arrowup.gif" border="0"/></a> 
				   <a href="ToDo.do?event=prepare_discrepancy_sort&sort=desc&field=user_info"><img width="14px" height="14px" src="img/arrowdown.gif" border="0"/></a>
				</td>
				<td>
				<a href="ToDo.do?event=prepare_discrepancy_sort&sort=asc&field=customer_name"><img width="14px" height="14px" src="img/arrowup.gif" border="0"/></a> 
				   <a href="ToDo.do?event=prepare_discrepancy_sort&sort=desc&field=customer_name"><img width="14px" height="14px" src="img/arrowdown.gif" border="0"/></a>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td>
				<a href="ToDo.do?event=prepare_discrepancy_sort&sort=asc&field=transaction_date"><img width="14px" height="14px" src="img/arrowup.gif" border="0"/></a> 
				   <a href="ToDo.do?event=prepare_discrepancy_sort&sort=desc&field=transaction_date"><img width="14px" height="14px" src="img/arrowdown.gif" border="0"/></a>
				</td>
				<td></td>
				</tr>
			  </thead>
			  <tbody>
              <!--//CR-120 Search To do -->
              <%  if (col == null || col.size() < 1) {%>
              <tr>
                  <td colspan="<%=8%>" class="odd">
                  <bean:message key="label.global.not.found"/>
                  </td>
              </tr>
              <%}else{ %>
              <%
				  String shadeClassName = "even";
                  String siii = (String) request.getAttribute("startIndexMain");
				  int count = 1;
				  if (siii != null) {
					  count = Integer.parseInt(siii) + 1;
				  }
				  for (Iterator iterator = col.iterator(); iterator.hasNext();) {
					  OBCMSTrxSearchResult obTodoObject = (OBCMSTrxSearchResult) iterator.next();
					  String leID = "-", subprofileid = "-", limitProfileRefNum = "-", leName = "-";
					  if (obTodoObject.getSciLegalID() != null && 
					  	!obTodoObject.getSciLegalID().equals(String.valueOf(ICMSConstant.LONG_MIN_VALUE))) {
					  		leID = obTodoObject.getSciLegalID();
					  }else{
						  leID = obTodoObject.getLeID();
					  }

                      //Andy Wong, 29 June 2010: fix ABCMS-938, leName not set when LE ID exists
                      if(obTodoObject.getTransactionType().equalsIgnoreCase("COL")){
                      	leName = obTodoObject.getLegalName()+" ("+obTodoObject.getCustomerName()+")";
                      }else{
                    	  leName = obTodoObject.getLegalName();
                      }	
					  
					  if (obTodoObject.getSciSubprofileID() != 0) {
						  long sp = obTodoObject.getSciSubprofileID();
						  if (sp != ICMSConstant.LONG_MIN_VALUE) {
							  subprofileid = String.valueOf(obTodoObject.getSciSubprofileID());
						  }
					  }
					  if (obTodoObject.getLimitProfileReferenceNumber() != null && !obTodoObject.getLimitProfileReferenceNumber().trim().equals("")) {
						  limitProfileRefNum = obTodoObject.getLimitProfileReferenceNumber();
					  }
			  %>
				<tr class="<%=shadeClassName%>">
				  <td class="index"><%=count++%></td>
				  <%
                      if (!isSys && !isSc && !isMr) {
				  %>
				  <td><integro:empty-if-null value="<%=obTodoObject.getUserInfo()%>" /></td>
				  <td>
					<%--<integro:empty-if-null value="<%=obTodoObject.getLegalName()%>" />&nbsp;<br/>--%>
					<%--<integro:empty-if-null value="<%=obTodoObject.getCustomerName()%>" />&nbsp;</td>--%>
                    <integro:empty-if-null value="<%=obTodoObject.getCustomerName()%>" />&nbsp;</td>
				  <td>
				    <%--
                        added by bharat - showing cif id
                    --%>
                    <%if(obTodoObject.getTransactionType().equals("CUSTOMER")){ %>
				  <integro:empty-if-null value="<%=limitProfileRefNum%>" /><br/>
				  <%}else{ %>
				   <integro:empty-if-null value="<%=leID%>" /><br/>
				  <%} %>
				  
				  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
					<%=subprofileid%>
					<% } %>
					</td>
					<%
						  if (!isLimit) {
					%>
                    <%--
                        <td><integro:empty-if-null value="<%=obTodoObject.getFam()%>" />&nbsp;</td>
                    --%>
                      <%--
                        added by bharat - showing cif id
                    --%>
                     <%if(obTodoObject.getTransactionType().equals("CUSTOMER")){ %>
                     <td><integro:empty-if-null value="<%=leID%>" /></td>
                       <%}else{ %>
					<td><integro:empty-if-null value="<%=limitProfileRefNum%>" /></td>
					  <%} %>
					<%
						  }
					%>
				  <%
                      } 

					 
				  %>
				  <td><%=obTodoObject.getTransactionType()%></td>
				   <td><%= df.format(obTodoObject.getTransactionDate())%></td>
				 <td>
				 <% 
				 System.out.println("oneTeamMshipID"+oneTeamMshipID);
				 if (oneTeamMshipID == ICMSConstant.CPU_MAKER || oneTeamMshipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I || oneTeamMshipID == ICMSConstant.TEAM_TYPE_BRANCH_MAKER
				 ||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
					|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH 
					||oneTeamMshipID==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH
				 ) { 
				 
				 %>
				 <select name="select6" onchange="MM_jumpMenu('self',this,0)">
				 <%String urlClose = "Discrepency.do?customerID="+obTodoObject.getSubProfileID()+"&transactionDate="+df.format(obTodoObject.getTransactionDate())+"&loginId="+obTodoObject.getLogin_id()+"&event=maker_close_bulk_discrepancy";
					 String urlProcess ="Discrepency.do?customerID="+obTodoObject.getSubProfileID()+"&transactionDate="+df.format(obTodoObject.getTransactionDate())+"&loginId="+obTodoObject.getLogin_id()+"&event=maker_process_bulk_discrepancy";				 
				 %>
				 <option value="#" selected="selected">Please Select</option>
				  <option value="<%=urlProcess %>" >Process</option>
				   <option value="<%=urlClose %>" >Close</option>
				 </select>
				
				 <%}else{ %>
				 <a href="Discrepency.do?customerID=<%=obTodoObject.getSubProfileID()%>&transactionDate=<%=df.format(obTodoObject.getTransactionDate()) %>&loginId=<%=obTodoObject.getLogin_id()%>&event=process_bulk_discrepancy"  >Process</a>
				 <%} %>
				 </td>
				 
				</tr>
				<%
					  if (shadeClassName.equals("even")) shadeClassName = "odd";
					  else shadeClassName = "even";
				  }
                    }// else col not null
                %>
			  </tbody>
			</table></td>
		</tr>
		<tr>
		  <td align="center">&nbsp;</td>
		</tr>
	  </tbody>
	</table>
</html:form>
 </td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->
                        <%
                            String sii = (String) request.getAttribute("startIndexMain");                            
                            int six = 0;
                            if (sii != null) {
                                six= Integer.parseInt(sii);
                            }
                        %>

<tr id="generalPurposeBarTR">
<td height="25">
	<table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">

	<tr>
    <%
        if (isLimit) {
    %>
                        <td width="580" valign="middle">
                        <integro:alphaindex url='dd' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
   <%
        }
   %>

<% if (result!=null) { %>
	<td valign="middle">   <integro:pageindex pageIndex='<%=new PageIndex(six,10, result.getNItems())%>'
	url='<%="ToDo.do"%>' submitFlag='<%=new Boolean(true)%>'/>             </td>
<% } %>
	 </tr>

	</table>
</td>
</tr>

</table>

</body>
</html>
