
<%@ page import="java.util.*,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.cms.app.transaction.OBCMSTrxSearchResult,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.todo.TodoAction,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.workspace.WorkspaceForm,
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
	OBCommonUser user=(OBCommonUser) session.getAttribute(GlobalSessionConstant.LOS_USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    oneTeamMshipID = user.getTeamTypeMembership().getMembershipID();
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
    		|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
    		|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER
    		|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH	
    	) {
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

%>




<%@page import="com.crystaldecisions.sdk.plugin.desktop.user.IUser"%>
<%@page import="com.integrosys.component.login.ui.GlobalSessionConstant"%>
<%@page import="com.integrosys.component.user.app.bus.OBCommonUser"%><html>
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
    document.forms["WorkspaceForm"].userName.value='';
    document.forms["WorkspaceForm"].startIndex.value=ind;
}

function goPageIndex(ind) {
    document.forms["WorkspaceForm"].startIndex.value=ind;
    document.forms["WorkspaceForm"].submit();
}

function goAlphaIndex(ind) {
    document.forms["WorkspaceForm"].searchLegalName.value='';
    document.forms["WorkspaceForm"].searchLeID.value='';
    document.forms["WorkspaceForm"].legalName.value=ind;
    document.forms["WorkspaceForm"].startIndex.value=0;
    document.forms["WorkspaceForm"].submit();
}

function goPage(pageNo){
	document.forms[0].startIndex.value = pageNo*10;
}
function submitPage(idx) {
	if (idx == 1) {
		//document.forms[0].searchLeID.value='';
		//document.forms[0].searchCustomerName.value='';
	} else if (idx == 2) {
		//document.forms[0].searchCustomerName.value='';
		document.forms[0].searchAANumber.value='';
		document.forms[0].isBtnClicked.value='Y';
	} else if (idx == 3) {
		document.forms[0].searchLeID.value='';
		document.forms[0].searchAANumber.value='';
		//document.forms[0].searchLeIDType.value='';
		document.forms[0].isBtnClicked.value='Y';
	} else if (idx == 4) {
		document.forms[0].searchLeID.value='';
		//document.forms[0].searchLeIDType.value='';
		document.forms[0].searchCustomerName.value='';
		document.forms[0].isBtnClicked.value='Y';
	}else if (idx == 5) {
		//document.forms[0].searchLeID.value='';
		//document.forms[0].searchLeIDType.value='';
	//	document.forms[0].searchCustomerName.value='';
		//document.forms[0].searchAANumber.value='';
		//document.forms[0].searchLoginID.value='';
		document.forms[0].isBtnClicked.value='Y';
	}
	<% if (event.equals(TodoAction.EVENT_PREPARE)) { %>
	document.forms["WorkspaceForm"].event.value='<%=TodoAction.EVENT_SEARCH_TODO%>';
	<% } %>
    document.forms["WorkspaceForm"].legalName.value='';
    document.forms["WorkspaceForm"].startIndex.value=0;
    document.forms["WorkspaceForm"].submit();
}


function handleEnter (field, event, itemPressed) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == "" || field.value == null) {
			//
		}
		else {
			submitPage(itemPressed);
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
<input type="hidden" name="startIndex" value="0"/>
<input type="hidden" name="event" value="<%=event%>" />
<input type="hidden" name="legalName" value="<%=legalName%>"/>
<input type="hidden" name="isBtnClicked" value="N" />

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
                   <TABLE width="70%" class=tblinfo id=custsearch border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                     <THEAD>
                      <TR>
                        <TD colSpan=3 width="100%">Please enter search criteria</TD></TR></THEAD>
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
                      <TR class="odd">
                        <TD class="fieldname"><bean:message key="label.customer.id"/> :</TD>
                        <TD><html:text property="searchLeID" maxlength="20" size="30" onkeypress="return handleEnter(this, window.event||event, 2);" /> 
							<html:errors property="leIDError"/> 
						</TD>              
						<td><input class=btnNormal id=Search2 style="MARGIN-LEFT: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(2) type=button value=Go name=Search2>
						</td>          
                      </TR>
                      <TR class="even">
                        <TD class="fieldname" width="20%"><bean:message key="label.customer.name" /> :</TD>
                        <TD><html:text property="searchCustomerName" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 3);" /> 
							<html:errors property="customerNameError"/>
						</TD>
                        <TD><input class=btnNormal id=Search3 style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(3) type=button value=Go name=Search3>
                        </TD></TR>
                      <TR class="odd">
                        <TD class="fieldname" width="20%"><bean:message key="label.global.aa.number" /> :</TD>
                        <TD><html:text property="searchAANumber" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 4);" /> 
							<html:errors property="aaNumberError"/>
						</TD>
                        <TD><input class=btnNormal id=Search3 style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(4) type=button value=Go name=Search3>
                        </TD></TR>
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
		   <% 
          
        	  
        	  if (isSys) {  
        	  %>          
          <tr>
            <td valign="top">
              <table width="100%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="100%">
                   <TABLE width="70%" class=tblinfo id=custsearch border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                     <THEAD>
                      <TR>
                        <TD colSpan=3 width="100%">Please enter search criteria</TD></TR></THEAD>
                      <TBODY>
                      
                        <TR class="odd">
                        <TD class="fieldname" width="20%">Login Id :</TD>
                        <TD><html:text property="searchLoginID" maxlength="40" size="50" onkeypress="return handleEnter(this, window.event||event, 4);" /> 
							<html:errors property="loginID"/>
						</TD>
                        <TD><input class=btnNormal id=Search3 style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick=submitPage(5) type=button value=Go name=Search3>
                        </TD></TR>
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
			String title = "To Do List";
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
			  <%
                  int cols = 11;
                  if (isLimit && !isNewNonBorrower) {
                  cols = 8;
              %>
				<tr>
				  <td width="3%"><bean:message key="label.global.sn"/></td>
				  <td width="23%"><bean:message key="label.global.legal.name"/><br/>
				  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
					<bean:message key="label.customer.subprofile.name"/>
				  <% } %>
				  </td>
				  <td width="12%"><bean:message key="label.customer.id"/><br/>
				  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
					<bean:message key="label.customer.subprofile.id"/>
				  <% } %>
					</td>
				  <td width="11%"><bean:message key="label.global.aa"/> <bean:message key="label.global.approved.date"/></td>
				  <td width="15%"><bean:message key="label.global.aa"/> <bean:message key="label.global.originating.location"/></td>
				  <td width="15%"><bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
				  <td width="11%"><bean:message key="label.global.date.published"/></td>
				  <td width="10%"><bean:message key="label.global.action"/></td>
				</tr>
			  <% 
			  	} else if (isNewNonBorrower) { 
				  	cols = 6;
			  %>
				  <td width="4%"><bean:message key="label.global.sn"/></td>
				  <td width="40%"><bean:message key="label.global.legal.name"/><br/>
				  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
					<bean:message key="label.customer.subprofile.name"/>
				  <% } %>
					</td>
				  <td width="17%"><bean:message key="label.customer.id"/><br/>
				  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
					<bean:message key="label.customer.subprofile.id"/>
				  <% } %>
					</td>
				  <td width="15%">Instruction <bean:message key="label.global.originating.location"/></td>
				  <td width="14%"><bean:message key="label.global.date.published"/></td>
				  <td width="10%"><bean:message key="label.global.action"/></td>
				</tr>
			  <%
				  } else if (isSys) {
                  cols = 8;
              %>
                <tr>
				  <td width="4%"><bean:message key="label.global.sn"/></td>
				  <td width="11%"><bean:message key="label.todo.last.updated.by"/></td>
				  <td width="25%">Team Name / <br/>
					Login ID</td>
				  <td width="15%">Transaction Type</td>
				  <td width="15%">Transaction Date</td>
				  <td width="12%">Transaction ID</td>
				  <td width="10%">Status</td>
				  <td width="8%"><bean:message key="label.global.action"/></td>
				</tr>
				<%} else if (isSc) {
                    cols = 7;
                %>
                <tr>
				  <td width="4%"><bean:message key="label.global.sn"/></td>
				  <td width="18%"><bean:message key="label.todo.last.updated.by"/></td>
				  <td width="12%">Transaction Type</td>
				  <td width="12%">Transaction Date</td>
				  <td width="19%">Transaction ID</td>
				  <td width="18%">Status</td>
				  <td width="17%"><bean:message key="label.global.action"/></td>
				</tr>
                <%} else if (isMr) {
                    cols = 6;
                %>
                <tr>
                  <td width="4%"><bean:message key="label.global.sn"/></td>
                  <td width="22%">Transaction Type</td>
                  <td width="20%">Transaction Date</td>
                  <td width="19%">Transaction ID</td>
                  <td width="18%">Status</td>
                  <td width="17%"><bean:message key="label.global.action"/></td>
                </tr>
                <%
				  } else {
				%>
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
				  <td width="13%">Transaction Type</td>
				  <td width="9%">Transaction Date</td>
<%
	if (!isCPC && !isSSC && !isCust) {
%>				  
<!--				  <td width="16%">Deal No</td>-->
<%
	}
%>
				  <td width="11%">Transaction ID</td>
				  <td width="7%">Status</td>
				  <td width="7%"><bean:message key="label.global.action"/></td>
				</tr>
				<%
				  }
				%>
			  </thead>
			  <tbody>
              <!--//CR-120 Search To do -->
              <%  if (col == null || col.size() < 1) {%>
              <tr>
                  <td colspan="<%=cols%>" class="odd">
                  <bean:message key="label.global.not.found"/>
                  </td>
              </tr>
              <%}else{ %>
              <%
				  String shadeClassName = "even";
                  String siii = (String) request.getAttribute("startIndex");
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
                    <integro:empty-if-null value="<%=leName%>" />&nbsp;</td>
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
                      } else if (isSys) {
				  %>
				  <td><integro:empty-if-null value="<%=obTodoObject.getUserInfo()%>" /></td>
				  <td><integro:empty-if-null value="<%=obTodoObject.getCustomerName()%>" />&nbsp;</td>
				  <%
					  }
					  else if (isSc) {
				  %>
				  	<td><integro:empty-if-null value="<%=obTodoObject.getUserInfo()%>" /></td>
				  <%
					  }

					  if (!isLimit) {
				  %>
				  <td><%=obTodoObject.getUserTransactionType()%></td>
				  <td><integro:date object="<%=obTodoObject.getTransactionDate()%>" /></td>
				  <%
                    if (!isSys && !isCPC && !isSSC && !isCust && !isMr) {
				  %>
<!--				  <td><integro:empty-if-null value="<%=obTodoObject.getDealNo()%>"/>&nbsp;</td> -->
				  <%
				  	}
				  %>
				  <td><integro:empty-if-null value="<%=obTodoObject.getTrxHistoryID()%>" />&nbsp;</td>
				  <td><%=obTodoObject.getUserState()%></td>
				  <%
					  } else if (isNewNonBorrower) {
				  %>
				  <td><%=limitProfileRefNum%></td>
				  <td><integro:date object="<%=obTodoObject.getTransactionDate()%>" /></td>				  
				  <% } else { %>
				  <td><integro:date object="<%=obTodoObject.getSciApprovedDate()%>" /></td>
				  <td><%=limitProfileRefNum%></td>
				  <td><%=limitProfileRefNum%></td>
				  <td><integro:date object="<%=obTodoObject.getTransactionDate()%>" /></td>
				  <%
					  }
				  %>
				  <%
					  if (isLimit) {
						  String newurl = "ToDo.do?event=customertodo&" + IGlobalConstant.REQUEST_CUSTOMER_ID + "=" +
                                  obTodoObject.getSubProfileID();
                          if (obTodoObject.getLimitProfileID() != null) {
                              newurl += "&" + IGlobalConstant.REQUEST_LIMITPROFILE_ID + "=" + obTodoObject.getLimitProfileID();
                          }
                          newurl += "&transactionID=" + obTodoObject.getTransactionID();
                          String taskFlag = "";
                          if (obTodoObject.isMainTask()) taskFlag += "M";
                          if (obTodoObject.isCCColTask()) taskFlag += "C";
                          if (obTodoObject.isSecColTask()) taskFlag += "S";
                          if (obTodoObject.isLimitTask()) taskFlag += "L";
                          newurl += "&taskFlag=" + taskFlag;
				  %>
				  <td style="text-align:center"><a href="<%=newurl%>">Process</a></td>

				  <%
					  } else {
				  %>

				  <td > <select name="select6" onchange="MM_jumpMenu('self',this,0)">
					  <option value="#" selected="selected">Please Select</option>

					  <%
					  if ("totrack".equals(event)) {
						  String s = (String)obTodoObject.getTotrackActionUrls().keySet().iterator().next();
						  String url = obTodoObject.getTotrackActionUrls().get(s) + obTodoObject.getTransactionID();
					  
						  if (obTodoObject.getSubProfileID() != null && !obTodoObject.getSubProfileID().trim().equals("0")) {
							  url += "&" + IGlobalConstant.REQUEST_CUSTOMER_ID + "=" + obTodoObject.getSubProfileID();
						  }
						  if (obTodoObject.getLimitProfileID() != null && !obTodoObject.getLimitProfileID().trim().equals("0")) {
							  url += "&" + IGlobalConstant.REQUEST_LIMITPROFILE_ID + "=" + obTodoObject.getLimitProfileID();
						  }
					  %>
					  <option value="<%=url%>"><%=s%></option>
					  <%
					  } else {
                          Collection actions = obTodoObject.getActionUrls().keySet();
                          List ll = new ArrayList();
                          ll.addAll(actions);
                          Collections.sort(ll);
					  for (Iterator iterator2 = ll.iterator(); iterator2.hasNext();) {
						  String s = (String) iterator2.next();
						  String action = (String)obTodoObject.getActionUrls().get(s);		  
						  String url = action + obTodoObject.getTransactionID().trim();
						  
						  if (obTodoObject.getSubProfileID() != null  && !obTodoObject.getSubProfileID().trim().equals("0")) {
							  url += "&" + IGlobalConstant.REQUEST_CUSTOMER_ID + "=" + obTodoObject.getSubProfileID();
						  }
						  if (obTodoObject.getLimitProfileID() != null && !obTodoObject.getLimitProfileID().trim().equals("0")) {
							  url += "&" + IGlobalConstant.REQUEST_LIMITPROFILE_ID + "=" + obTodoObject.getLimitProfileID();
						  }
						  if (obTodoObject.getTransactionSubType() != null && obTodoObject.getTransactionSubType().trim().length() > 0) {
							  url += "&trxSubtype="+obTodoObject.getTransactionSubType();
						  }
					  %>
					  <option value="<%=url%>"><%=s%></option>
					  <%
					  } // for loop
					  } // if totrack check
					  %>
					</select> </td>
					<%
					  }
					%>
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
                            String sii = (String) request.getAttribute("startIndex");                            
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
