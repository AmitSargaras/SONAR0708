<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cci.CounterpartySearchForm,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.cms.app.cci.bus.CounterpartySearchCriteria"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper"%>
<%@ page import="java.util.List" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
  
%>

<%
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);

    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR ) {
      isMR = true;
    } else if (teamTypeID == ICMSConstant.TEAM_TYPE_SSC) {
        isSAC = true;
    }
    CounterpartySearchForm aForm = (CounterpartySearchForm) request.getAttribute("CounterpartySearchForm");
    int nItems =0;
    List v = (List)aForm.getSearchResult();

    if(v!=null) {
       pageContext.setAttribute("counterpartyList",v);
        
    }

    CounterpartySearchCriteria search = (CounterpartySearchCriteria)session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.counterpartySearchCriteria1");
    
//    SearchResult result = (SearchResult)session.getAttribute("com.integrosys.cms.ui.collateral.CollateralSearchAction.session_searchResult");


    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
        nItems = aForm.getStartIndex();
    }
    int rowIdx = 0;
    int sno = 0;
    int count = 1;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}
    int numItem = aForm.getNumItems();


%>



   <%
             int index = 0;
             String sii = (String) request.getAttribute("startIndex");
            if (sii != null) {
                index= Integer.parseInt(sii);
            }
            String alphaURL="/CounterpartyCCI.do?event=list";
        %>

<%

    try

    {
     %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript">

	function JumpOnSelectactive(selectObj, customerID, limitProfileID, groupCCINo){
  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "VIEW_CCI"){
        	location.href = "CounterpartyCCI.do?event=read&groupCCINo=" +groupCCINo+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        	//location.href = "CounterpartyCCI.do?event=ViewCCINo&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}else if (selectObj.options[selectIndex].value == "DELETE_CCI") {
            location.href = "CounterpartyCCI.do?event=prepare_delete&groupCCINo=" +groupCCINo+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
       		<%--location.href = "CounterpartyCCI.do?event=delete&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";--%>
		}
     }

    function gotoPage() {
       //  alert("gotoPage "+ ind);
        parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        // alert("goNextPrev(ind) = "+ ind);
        document.forms["CounterpartySearchForm"].cusName.value='';
        document.forms["CounterpartySearchForm"].startIndex.value=ind;
        document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
    }

    function goPageIndex(ind) {
        /// alert("goPageIndex(ind) ="+ ind);
        document.forms["CounterpartySearchForm"].startIndex.value=ind;
        document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
        document.forms["CounterpartySearchForm"].submit();
    }

    function goAlphaIndex(ind) {
       // alert("goAlphaIndex(ind) = "+ ind);

        document.forms["CounterpartySearchForm"].customerName.value=ind;
		if (ind == ''){
			document.forms["CounterpartySearchForm"].all.value = 'Y';
            document.forms["CounterpartySearchForm"].groupCCINo.value="";
        }
        document.forms[0].indicator.value='*';
        document.forms["CounterpartySearchForm"].startIndex.value=0;
        document.forms["CounterpartySearchForm"].submit();
    }
    function goPage(pageNo){
       //  alert("goPage(pageNo)= "+ ind);
        document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
    }
</script>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="CounterpartyCCI.do?event=list">
    <html:hidden property="customerSeach" value="false"/>
    <html:hidden property="startIndex" />
    <html:hidden property="numItems"  />

    <html:hidden property="groupCCINo" />
    <html:hidden property="customerName" />
    <html:hidden property="legalName" />
    <!--<input type="hidden" name="groupCCINo" >-->
    <!--<input type="hidden" name="customerName1" >-->
    <!--<input type="hidden" name="legalName" >-->
    <input type="hidden" name="indicator" >
    <input type="hidden" name="all">


         <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">

          <tr>
           <td>
             <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tr>
                        <td valign="bottom"><h3><bean:message key="label.cci.search.result" /></h3></td>
                    </tr>
                </table>
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr>
                    <td width="3%"><bean:message key="label.global.sn"/></td>
                    <td width="12%"><bean:message key="label.cci.cciNo"/></td>
                    <td width="20%"><bean:message key="label.customer.name"/>/<br><bean:message key="label.agreement.address"/></td>
                    <td width="10%"><bean:message key="label.customer.doincorp"/></td>
                    <td width="15%"><bean:message key="label.customer.id.source"/></td>
                    <td width="15%"><bean:message key="label.customer.id"/></td>
                    <td width="25%"><bean:message key="label.col.owner.id.no"/></td>
                    <td width="15%"><bean:message key="label.global.action"/></td>
              </tr>

             </thead>
             <tbody>
       <% if(v!=null)  {%>
              <logic:present name="counterpartyList">
               <logic:iterate id="OB" name="counterpartyList"  type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
<%
        		 long agreementID = ICMSConstant.LONG_INVALID_VALUE;
				 String groupCCINo   = OB.getGroupCCINo() ;
				 long subprofileID = OB.getSubProfileID();
				 long instrID = OB.getInstructionID();
                 sno++;

 			 %>
               <input type="hidden" name="customerID" value ="<%=subprofileID%>">
               <input type="hidden" name="limitProfileID" value ="<%=instrID%>">
               <input type="hidden" name="agreementID" value ="<%=agreementID%>">
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td><integro:empty-if-null value="<%=OB.getGroupCCINo()%>"/>&nbsp; </td>
                  <%--<td><integro:empty-if-null value="<%=OB.getLegalName()%>"/>--%>
                   <td><integro:empty-if-null value="<%=OB.getCustomerName()%>"/>
                         <br><%=CounterpartyUIHelper.displayAddress(OB.getAddress())%> </td>
                 <%--<td><integro:empty-if-null value="<%=OB.getDob()%>"/></td>--%>
                  <td>
                      <% if (OB.getDob() != null){%>
                        <integro:date object="<%=OB.getDob()%>"/>
                      <%}else {%>
                       -
                       <%}%>
                  </td>
                  <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, OB.getSourceID())%>"/>&nbsp; </td>
                  <td><integro:empty-if-null value="<%=OB.getLmpLeID()%>"/>&nbsp; </td>
                  <td><integro:empty-if-null value="<%=OB.getIdNo()%>"/>&nbsp; </td>
                  <td>
                      <select name="actionPerformed"
                              onChange="javascript:JumpOnSelectactive(this, '<%=subprofileID%>', '<%=instrID%>','<%=groupCCINo%>')">
                          <option selected="selected" >Please Select</option>
                          <option value="VIEW_CCI">View CCI</option>
                          <option value="DELETE_CCI">Delete CCI</option>
                      </select>
                      <html:errors property="errDuplicate" />
                  </td>

                 </tr>
	            </logic:iterate>
               </logic:present>
               <%} else {%>
			   <td colspan="8" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
			   <%}%>
              </tbody>
			</table>
		   </td>
		  </tr>
		 </table>
</html:form>
 </td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->

<tr>
<td height="25">
     <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="580" valign="middle">
                <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                </td>
                <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                <td valign="middle" >
                 <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%=request.getContextPath()+"/CounterpartyCCI.do?event=list&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
                </td>
              </tr>
       </table>
</td>
</tr>

</table>

</body>
</html>


<%} catch(Exception e)
        { e.printStackTrace();  }%>

