<%@ page import="com.integrosys.cms.ui.imageTag.ImageTagForm,
java.util.Collection,
com.integrosys.component.bizstructure.app.bus.ITeam,
com.integrosys.base.uiinfra.common.ICommonEventConstant,
com.integrosys.base.techinfra.util.DateUtil,
com.integrosys.base.uiinfra.tag.PageIndex,
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
	String userType=(String)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.userType");
	System.out.println("==============================userType==============================="+userType);
	
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
    
    com.integrosys.cms.ui.imageTag.ImageTagForm aForm;
    
    aForm = (com.integrosys.cms.ui.imageTag.ImageTagForm) request.getAttribute("ImageTagForm");
    
    if (aForm == null) {
    	//aForm = (com.integrosys.cms.ui.custodian.CustodianSearchForm) request.getAttribute("CustodianSearchForm");  //Shiv
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

	
    function gotoPage() {
	    parent.document.location="ImageTag.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].customerName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
        document.forms["ImageTagForm"].startIndex.value=ind;
        document.forms["ImageTagForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["ImageTagForm"].customerName.value=ind;

		if (ind == '')
		{
			document.forms["ImageTagForm"].all.value = 'Y';
		}        
        document.forms[0].indicator.value='*';
        document.forms["ImageTagForm"].startIndex.value=0;
         document.forms["ImageTagForm"].action='ImageTag.do?event=list_image';
        document.forms["ImageTagForm"].submit();
    }
    
    function goPage(pageNo){
	    document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
    }

</script>
<body>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="ImageTag.do?event=list_tag_page">
<html:hidden property="startIndex" />
<input type="hidden" name="customerName" >
<input type="hidden" name="legalName" >
<input type="hidden" name="indicator" >
<input type="hidden" name="all">

         <table width="60%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
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
               <td width="15%"><bean:message key="label.list.party.name"/><br/>
               <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                <bean:message key="label.customer.subprofile.name"/>
                <% } %>
                </td>
               <td width="10%"><bean:message key="label.list.party.id"/><br/>
               <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                <bean:message key="label.customer.subprofile.id"/></td>
                <% } %>
              <td width="7%"><bean:message key="label.global.action"/></td>
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
				 String searchLEID = OB.getLegalReference();
				 String searchCustomerName = OB.getCustomerName();
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
 			 %>
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
                  <td>
                  <%if("CHECKER".equals(userType)){ %>
                  <a href="ImageTagMap.do?event=list_tag_page_view&customerName=<%=OB.getCustomerName()%>&legalName=<%=OB.getLegalReference()%>&custId=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>&custLimitProfileID=<%=instrID%>&startIndex=<%=aForm.getStartIndex()%>">Tag </a>
                  <%}else{ %>
                  <a href="ImageTagMap.do?event=list_tag_page&customerName=<%=OB.getCustomerName()%>&legalName=<%=OB.getLegalReference()%>&custId=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>&custLimitProfileID=<%=instrID%>&startIndex=<%=aForm.getStartIndex()%>">Tag </a>
                  <%} %>           
                    </td>
                 </tr>
                 <script type="text/javascript">
				<!--
					Alert();
					//-->
</script>
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
        <% String alphaURL="/ImageTag.do?event=list_image";%>
<td height="25">
			<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="580" valign="middle">
                        <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <td valign="middle" >
                         <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="ImageTag.do?event=list_image&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
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

