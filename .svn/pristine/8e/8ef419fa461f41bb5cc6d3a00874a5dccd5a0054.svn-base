<%@ page import="com.integrosys.cms.ui.customer.CustomerSearchForm,
                 java.util.Collection,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.AgreementTypeList"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/CustomerList.jsp,v 1.39 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.39 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    System.out.println("Entered CustomerList.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
  // System.out.println("value of records_per_page"+records_per_page);
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
    
    com.integrosys.cms.ui.customer.CustomerSearchForm aForm;
    
    aForm = (com.integrosys.cms.ui.customer.CustomerSearchForm) request.getAttribute("CustomerSearchForm");
    
    if (aForm == null) {
    	aForm = (com.integrosys.cms.ui.custodian.CustodianSearchForm) request.getAttribute("CustodianSearchForm");
    }
    
    CountryList cList = CountryList.getInstance();
	AgreementTypeList aList = AgreementTypeList.getInstance();

    Collection results = aForm.getSearchResult();
    if(results!=null) {
       pageContext.setAttribute("customerList",results);
    }
	
    CustomerSearchCriteria search = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
    }
   int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}

%>

<% 

    try

    {
     %>


<html>
<head>


<script language="JavaScript">
<!--
	function JumpOnSelectactive(selectObj, customerID, limitProfileID, agreementID)
	{

  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "processcusdetails")
		{
        	location.href = "CustomerProcess.do?event=view_borrower_list&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        		//"CustomerProcess.do?event=processcusdetails&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}
		else if (selectObj.options[selectIndex].value == "viewlimits")
        {
       		location.href = "Limits.do?event=viewlimits&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
		else if (selectObj.options[selectIndex].value == "viewsecurities")
        {
        	location.href = "CustomerProcess.do?event=viewsecurities&customerID="+customerID+"&limitProfileID="+limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
		else if (selectObj.options[selectIndex].value == "viewISDACSADeal")
        {
        	location.href = "ISDACSADealVal.do?event=view_isda_deal_detail&agreementID="+agreementID+"&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
		else if (selectObj.options[selectIndex].value == "viewGMRADeal")
        {
        	location.href = "GMRADeal.do?event=view_gmra_deal_detail&agreementID="+agreementID+"&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
        else if (selectObj.options[selectIndex].value == "viewContractFinance")
        {
            location.href = "ContractFinancing.do?event=list_summary&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }
        else if (selectObj.options[selectIndex].value == "viewBridgingLoan")
        {
            location.href = "BridgingLoan.do?event=list_summary&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }

     }

    function gotoPage() {
	    parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].cusName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
        document.forms["CustomerSearchForm"].startIndex.value=ind;
        document.forms["CustomerSearchForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["CustomerSearchForm"].customerName.value=ind;
		if (ind == '')
		{
			document.forms["CustomerSearchForm"].all.value = 'Y';
		}        
        document.forms[0].indicator.value='*';
        document.forms["CustomerSearchForm"].startIndex.value=0;
        document.forms["CustomerSearchForm"].submit();
    }
    function goPage(pageNo){
	    document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
    }
-->
</script>

<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="CustomerSearch.do?event=list">
<html:hidden property="startIndex" />
<input type="hidden" name="customerName" >
<input type="hidden" name="legalName" >
<input type="hidden" name="indicator" >
<input type="hidden" name="all">

         <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
<%--
          <tr>
           <td>
             <%if(results!=null){%>
             <%=aForm.getNumItems()%> Record(s) Found
             <%}else{ %>
             0 Record(s) Found
             <%}%>
           </td>
          </tr>
--%>          
          <tr>
           <td>
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr>
               <td width="4%"><bean:message key="label.global.sn"/></td>
               <td width="18%"><bean:message key="label.global.party.name"/><br/>
               <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                <bean:message key="label.customer.subprofile.name"/>
                <% } %>
                </td>
               <td width="11%"><bean:message key="label.partycode.id"/><br/>
               <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                <bean:message key="label.customer.subprofile.id"/></td>
                <% } %>
               <%--<td width="10%"><bean:message key="label.global.aa"/>/Instruction<br>Originating Location</td>
               --%><td width="21%"><bean:message key="label.global.host.cam.number"/></td>
               <td width="8%"><bean:message key="label.global.approved.date"/></td>
               <% if( isMR ) { %>
               <td width="13%">Agreement Type</td>
               <% } %>
              <td width="15%"><bean:message key="label.global.action"/></td>
              </tr>
             </thead>
             <tbody>
       <% if(results!=null)  {%>
              <logic:present name="customerList">
               <logic:iterate id="OB" name="customerList"  type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
<%               
				 boolean isISDACSADeal = false;
				 boolean isGMRADeal = false;
				 long agreementID = ICMSConstant.LONG_INVALID_VALUE;
				 long subprofileID = OB.getSubProfileID();
				 long instrID = OB.getInstructionID();
				 boolean isNoLimits = OB.getNoLimitsInd();
                 boolean hasContractFinance = OB.getHasContractFinance();
                 boolean hasBridgingLoan = OB.getHasBridgingLoan();
                 boolean isDeleted = false;

                 String aaType = OB.getLmtProfileType();
				 if( aaType != null && aaType.equals( ICMSConstant.AA_TYPE_TRADE ) )
				 {				 
					String type = OB.getAgreementType();
					agreementID = OB.getAgreementID();
					if( type != null && type.equals( ICMSConstant.GMRA_TYPE ) )
					{
						isGMRADeal = true;
					}
					else if( type != null && type.equals( ICMSConstant.ISDA_CSA_TYPE ) )
					{
						isISDACSADeal = true;
					}
				 }

				 
				 String rowClass="";
				 sno++;
				 if(sno%2!=0){
					rowClass="odd";
				 }else{
					rowClass="even";
				 }
				 
				//Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
				 boolean isActive=true;
				 if(null!=OB.getCustomer() && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(OB.getCustomer().getStatus())){
					 isActive=false;
				 }
				//End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
 			 %>
               <input type="hidden" name="customerID" value ="<%=subprofileID%>">
               <input type="hidden" name="limitProfileID" value ="<%=instrID%>">
               <input type="hidden" name="agreementID" value ="<%=agreementID%>">
                  <tr class="<%=rowClass%>">
                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td><%--<integro:htmltext value="<%=OB.getLegalName()%>"/>--%>
                  <integro:htmltext value="<%=OB.getCustomerName()%>"/>&nbsp;<br>
                  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                  <integro:htmltext value="<%=OB.getCustomerName()%>"/>&nbsp;
                  <% } %>
                  </td>
                  <td><integro:empty-if-null value="<%=OB.getLegalReference()%>"/>&nbsp;<br>
                  <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                  <integro:empty-if-null value="<%=OB.getSubProfileReference()%>"/>&nbsp;
                  <% } %>
                  </td>
                  
                  <%-- if (OB.getBcaOrigLocation().getCountryCode() == null) { %>
                      <td><integro:empty-if-null value="<%= cList.getCountryName (OB.getInstrOrigLocation().getCountryCode()) %>"/>&nbsp;</td>
                  <% } else { %>
                      <td><integro:empty-if-null value="<%= cList.getCountryName (OB.getBcaOrigLocation().getCountryCode()) %>"/>&nbsp;
                      <% if (OB.getBcaStatus() != null && OB.getBcaStatus().equals (ICMSConstant.STATE_DELETED)) { 
                      		isDeleted = true;
                      %>
                      <br><font color="#FF0000" size="1"><b>( Deleted AA )</b></font></br>
                      <% } %>
                      </td>
                  <% } --%>
                  <td><integro:empty-if-null value="<%=OB.getInstructionRefNo()%>"/>&nbsp;/&nbsp;<integro:empty-if-null value="<%=OB.getLosLimitProfileRef()%>"/>&nbsp;</td>
                  <td><integro:date object="<%=OB.getInstructionApprovedDate()%>" />&nbsp;</td>
			      
               	  <% if( isMR ) { %>
			      <td><integro:empty-if-null value="<%= aList.getAgreementTypeName( OB.getAgreementType() ) %>"/>&nbsp;</td>
                  <% } %>

                  <td>
                  <select name="actionPerformed"  onchange="javascript:JumpOnSelectactive(this, '<%=subprofileID%>', '<%=instrID%>','<%=agreementID%>')">
                      <option selected="selected" >Please Select</option>
                      <option value="processcusdetails">Process Customer Details</option>
                      <%
                        if(false == isNoLimits) {
                      %>
                          <option value="viewlimits">View Limits</option>
               	  		<% if( OB.getInstructionRefNo() != null) { %>
                          <option value="viewsecurities">View Securities</option>
                     	<% } %>
                      <% } %>
                      <%
                        if(isGMRADeal) {
                      %>
                          <option value="viewGMRADeal">View Deal</option>
                      <% } %>
                      <%
                        if(isISDACSADeal) {
                      %>
                          <option value="viewISDACSADeal">View Deal</option>
                      <% } %>
                      <% if(isSAC) { %>
                          <% if(hasContractFinance) { %>
                                <option value="viewContractFinance">View Contract Finance</option>
                          <% } %>
                          <% if(hasBridgingLoan) { %>
                          <option value="viewBridgingLoan">View Bridging Loan</option>
                          <% } %>
                      <% } %>
                  </select></td>

                 </tr>
	            </logic:iterate>
               </logic:present>
               <%} else {%>
			   <td colspan="7" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
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
        <% String alphaURL="/CustomerSearch.do?event=list";%>
<tr>
<td height="25">
			<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="580" valign="middle">
                        <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <td valign="middle" >
                         <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="CustomerSearch.do?event=list&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
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

