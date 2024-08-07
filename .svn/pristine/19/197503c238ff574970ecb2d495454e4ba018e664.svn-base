<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cci.CounterpartySearchForm,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.cms.app.cci.bus.CounterpartySearchCriteria"%>
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
	
    CounterpartySearchCriteria search = (CounterpartySearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_COUNTERPARTY_SEARCH_CRITERIA_OBJ);

//    SearchResult result = (SearchResult)session.getAttribute("com.integrosys.cms.ui.collateral.CollateralSearchAction.session_searchResult");


    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
        nItems = aForm.getStartIndex();
    }
    int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}
    int numItem = aForm.getNumItems();

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

	function JumpOnSelectactive(selectObj, customerID, limitProfileID, agreementID){
  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "VIEW_CCI"){
        	location.href = "CounterpartyCCI.do?event=read&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}else if (selectObj.options[selectIndex].value == "DELETE_CCI") {
       		location.href = "CounterpartyCCI.do?event=DelCCINo&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
     }

    function gotoPage() {
        parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["CounterpartySearchForm"].cusName.value='';
        document.forms["CounterpartySearchForm"].startIndex.value=ind;
        document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
    }

    function goPageIndex(ind) {
        document.forms["CounterpartySearchForm"].startIndex.value=ind;
        document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
        document.forms["CounterpartySearchForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["CounterpartySearchForm"].customerName.value=ind;
		if (ind == ''){
			document.forms["CounterpartySearchForm"].all.value = 'Y';
		}        
        document.forms[0].indicator.value='*';
        document.forms["CounterpartySearchForm"].startIndex.value=0;
        document.forms["CounterpartySearchForm"].submit();
    }
    function goPage(pageNo){
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
<html:hidden property="startIndex" />
<html:hidden property="numItems" />
<input type="hidden" name="customerName" >
<input type="hidden" name="legalName" >
<input type="hidden" name="indicator" >
<input type="hidden" name="all">

         <table width="60%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">

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
                    <td width="20%"><bean:message key="label.customer.name"/>\<br><bean:message key="label.agreement.address"/></td>
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
				 long subprofileID = OB.getSubProfileID();
				 long instrID = OB.getInstructionID();

                 String aaType = OB.getLmtProfileType();
				 if( aaType != null && aaType.equals( ICMSConstant.AA_TYPE_TRADE ) ) {
					String type = OB.getAgreementType();
					agreementID = OB.getAgreementID();
				 }

				 
				 String rowClass="";
				 sno++;
				 if(sno%2!=0){
					rowClass="odd";
				 }else{
					rowClass="even";
				 }
 			 %>
               <input type="hidden" name="customerID" value ="<%=subprofileID%>">
               <input type="hidden" name="limitProfileID" value ="<%=instrID%>">
               <input type="hidden" name="agreementID" value ="<%=agreementID%>">
               <tr class="<%=rowClass%>">

                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td><integro:empty-if-null value="<%=OB.getGroupCCINo()%>"/>&nbsp; </td>
                  <%--<td><integro:htmltext value="<%=OB.getLegalName()%>"/></td>--%>
                  <td><integro:htmltext value="<%=OB.getCustomerName()%>"/></td>
                  <td><integro:empty-if-null value="<%=OB.getSourceID()%>"/>&nbsp; </td>
                  <td><%=OB.getLmpLeID()%> &nbsp; </td>
                  <td><integro:empty-if-null value="<%=OB.getIdNO()%>"/>&nbsp; </td>
                  <td>
                      <select name="actionPerformed"
                              onChange="javascript:JumpOnSelectactive(this, '<%=subprofileID%>', '<%=instrID%>','<%=agreementID%>')">
                          <option selected="selected" >Please Select</option>
                          <option value="VIEW_CCI">View CCI</option>
                          <option value="DELETE_CCI">Delete CCI</option>
                      </select>
                  </td>

                 </tr>
	            </logic:iterate>
               </logic:present>
               <%} else {%>
			   <td colspan="9" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
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
        <%
             int index = 0;
             String sii = (String) request.getAttribute("startIndex");
            if (sii != null) {
                index= Integer.parseInt(sii);
            }
            String alphaURL="/CounterpartyCCI.do?event=list";
        %>
<tr>
<td height="25">
    <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="middle">
                    <integro:pageindex pageIndex='<%=new PageIndex(index, records_per_page, nItems)%>'
	                url='<%=alphaURL %>' submitFlag='<%=new Boolean(true)%>'/>
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

