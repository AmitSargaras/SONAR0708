<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.custgrpi.bus.CustGrpIdentifierSearchCriteria,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.custgrpi.CustGrpIdentifierForm,
                 com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<head>
 <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>
<%
      boolean isGEMS_MAKER = false;
    //System.out.println("Entered CustomerList.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }

    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

    boolean isEditable = false;
    TOP_LOOP:
    for (int i = 0; i < userTeam.getTeamMemberships().length; i++) {
        for (int j = 0; j < userTeam.getTeamMemberships()[i].getTeamMembers().length; j++) {
            if (userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() == user.getUserID()) {
            //    System.out.println("userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()  = " + userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() );
            //    System.out.println("userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()  = " + userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() );
                if (userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_GEMS_AM_MAKER){
                    isEditable = true;
                    isGEMS_MAKER = true;
                    break TOP_LOOP;
                }
            }
        }
    }

  // System.out.println("value of records_per_page"+records_per_page);
%>

<%
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    
   //Get the correct team type member ID
    String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	  long roleType = Long.parseLong(teamTypeMemID);

    if (teamTypeID == ICMSConstant.TEAM_TYPE_GEMS_MAKER ) {
      isGEMS_MAKER = true;
    }
    CustGrpIdentifierForm aForm = (CustGrpIdentifierForm) request.getAttribute("CustGrpIdentifierForm");

    int nItems =0;
    List v = (List) aForm.getSearchResult();

    if(v!=null) {
        pageContext.setAttribute(CustGroupUIHelper.form_groupResult,v);
       // System.out.println("v.size() = " + v.size());
    }

    CustGrpIdentifierSearchCriteria search = (CustGrpIdentifierSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTGRPIDENTIFIER_SEARCH_CRITERIA_OBJ);

    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
        nItems = aForm.getStartIndex();
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
       String sii = (String) request.getAttribute("startIndex");
       if (sii != null){
           index = Integer.parseInt(sii);
       }
       String alphaURL = "/CustGrpIdentifier.do?event=list";


       String pageIndexUrl = "CustGrpIdentifier.do?event=list&pageIndex=true" ;
       if (aForm.getCustomerSeach() != null && aForm.getCustomerSeach().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&customerSeach=" + aForm.getCustomerSeach();
       }
      /* if (aForm.getGrpNo() != null && aForm.getGrpNo().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&grpNo=" + aForm.getGrpNo();
       }*/
       if (aForm.getGrpID() != null && aForm.getGrpID().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&grpID=" + aForm.getGrpID();
       }
       if (aForm.getCustomerName() != null && aForm.getCustomerName().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&customerName=" + aForm.getCustomerName();
       }
       if (aForm.getGroupName() != null && aForm.getGroupName().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&groupName=" + aForm.getGroupName();
       }
       if (aForm.getLegalName() != null && aForm.getLegalName().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&legalName=" + aForm.getLegalName();
       }
       if (aForm.getSearchType() != null && aForm.getSearchType().length()>0 ){
           pageIndexUrl = pageIndexUrl + "&searchType=" + aForm.getSearchType();
       }
       pageIndexUrl = pageIndexUrl + "&startIndex=";
       boolean isSearchGroup = false;
       String searchType = (String)request.getAttribute("searchType");
       if (searchType != null && searchType.equalsIgnoreCase(CustGroupUIHelper.search_ByGroup))
           isSearchGroup = true;

   %>

<body >

<html:form action="CustGrpIdentifier.do?event=list">
    <html:hidden property="customerSeach"/>
    <html:hidden property="startIndex" />
    <html:hidden property="numItems"  />

    <html:hidden property="grpNo" />
    <html:hidden property="grpID" />
    <html:hidden property="groupName" />
    <html:hidden property="customerName" />
    <html:hidden property="legalName" />
    <html:hidden property="searchType" />

    <input type="hidden" name="indicator" >
    <input type="hidden" name="all">

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">

         <table width="70%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
          <tr>
           <td>
             <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                    <%if (isSearchGroup){%>
                        <td valign="bottom"><h3><bean:message key="label.cci.search.result" /> - <bean:message key="label.search.bygroup" /></h3></td>
                    <%}else{%>
                        <td valign="bottom"><h3><bean:message key="label.cci.search.result" /> - <bean:message key="label.search.bygroup.member" /></h3></td>
                    <%}%>
                    </tr>
             </table>
             <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                 <thead>
                  <tr>
                        <td width="3%"><bean:message key="label.global.sn"/></td>
                        <td width="10%"><bean:message key="label.group.id" /></td>
                        <td width="25%"><bean:message key="label.group.name" /></td>
                        <td width="15%"><bean:message key="label.global.action"/></td>
                  </tr>
                 </thead>
                <tbody>
                <% if(v!=null)  {%>
                    <logic:present name="<%=CustGroupUIHelper.form_groupResult%>">
                        <logic:iterate id="OB"
                                       name="<%=CustGroupUIHelper.form_groupResult%>"
                                       type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
                            <%
                                long subprofileID = OB.getSubProfileID();
                                long instrID = OB.getInstructionID();
                                String grpID = OB.getGrpID();
                               
                                sno++;

                            %>

                            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td style="text-align:center" class="index"><%=sno%></td>
                                <td><integro:empty-if-null value="<%=OB.getGrpNo()%>"/>&nbsp; </td>
                                <td><integro:empty-if-null value="<%=OB.getGroupName()%>"/></td>
                                <td>
                                    <select name="actionPerformed"   onChange="javascript:JumpOnSelectactive(this, '<%=subprofileID%>', '<%=instrID%>','<%=grpID%>')">
                                        <option selected="selected">Please Select</option>
                                        <option value="VIEW_GROUP">View Group</option>
                                        <%if(!(roleType == ICMSConstant.TEAM_TYPE_GEMS_AM_CHECKER || roleType == ICMSConstant.TEAM_TYPE_GEMS_CHECKER)){%>
                                        <option value="EDIT_GROUP">Edit Group</option>
                                        <%}%>
                                        <%if (isGEMS_MAKER){%>
                                            <option value="DELETE_GROUP">Delete Group</option>
                                        <%}%>
                                        <option value="VIEW_EXPOSURE">View Exposure</option>
                                    </select>
                                </td>
                            </tr>
                        </logic:iterate>
                    </logic:present>
                <%} else {%>
			        <td colspan="10" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
			    <%}%>
              </tbody>
			</table>
		   </td>
		  </tr>
		 </table>

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
                 <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page, numItem)%>'
                                    url='<%=pageIndexUrl%>'
                                    submitFlag='<%=new Boolean(false)%>'/>
                </td>
              </tr>
       </table>
</td>
</tr>
</table>

<script language="JavaScript">

    function JumpOnSelectactive(selectObj, customerID, limitProfileID, grpID){
  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "VIEW_GROUP"){
        	location.href = "CustGrpIdentifier.do?event=read&grpID=" +grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }else if (selectObj.options[selectIndex].value == "EDIT_GROUP"){
            <%if (!isEditable){%>
                location.href ="CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_MAKER2_EDIT%>&grpID=" +grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
            <%}else{%>
                location.href = "CustGrpIdentifier.do?event=<%=CustGrpIdentifierAction.EVENT_EDIT%>&grpID=" +grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
            <%}%>
   		}else if (selectObj.options[selectIndex].value == "DELETE_GROUP") {
            location.href = "CustGrpIdentifier.do?event=prepare_delete&grpID=" +grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		  }else if(selectObj.options[selectIndex].value == "VIEW_EXPOSURE"){
			      location.href = "GrpExposure.do?event=view_single_grp_exposure&grpID="+grpID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		  }
     }

    function gotoPage() {
       //  alert("gotoPage "+ ind);
        parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        //alert("goNextPrev(ind) = "+ ind);
        document.forms["CustGrpIdentifierForm"].cusName.value='';
        document.forms["CustGrpIdentifierForm"].startIndex.value=ind;
        document.forms["CustGrpIdentifierForm"].numItems.value=<%=numItem%>;
    }

    function goPageIndex(ind) {
        /// alert("goPageIndex(ind) ="+ ind);
        document.forms["CustGrpIdentifierForm"].startIndex.value=ind;

        document.forms["CustGrpIdentifierForm"].numItems.value=<%=numItem%>;
        document.forms["CustGrpIdentifierForm"].submit();
    }

    function goAlphaIndex(ind) {
        //alert("goAlphaIndex(ind) = "+ ind);
       // document.forms["CustGrpIdentifierForm"].grpNo.value=ind;
        document.forms["CustGrpIdentifierForm"].groupName.value=ind;
        document.forms["CustGrpIdentifierForm"].customerName.value=ind;
		if (ind == ''){
			document.forms["CustGrpIdentifierForm"].all.value = 'Y';
			document.forms["CustGrpIdentifierForm"].grpNo.value="";
		}
        document.forms[0].indicator.value='*';
        document.forms["CustGrpIdentifierForm"].startIndex.value=0;
        document.forms["CustGrpIdentifierForm"].submit();
    }
    function goPage(pageNo){
       //  alert("goPage(pageNo)= "+ ind);
        document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
    }
</script>

</html:form>
</body>
