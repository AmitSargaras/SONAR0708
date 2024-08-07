<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.integrosys.cms.ui.image.ImageUploadForm,
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
	String userType=(String)session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.userType");
System.out.println("==============================userType==============================="+userType);

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
   
String sTeamTypeMembershipID  =(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
long teamTypeMembershipID= Long.parseLong(sTeamTypeMembershipID);  
long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);
    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR ) {
      isMR = true;
    } else if (teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SC_MAKER 
    		|| teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
    		|| teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SC_CHECKER 
    		|| teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH
    		|| teamTypeMembershipID == ICMSConstant.ALL_VIEW_REPORT 
    		|| teamTypeMembershipID == ICMSConstant.ALL_VIEW_REPORT_WFH
    		|| teamTypeMembershipID == ICMSConstant.TEAM_TYPE_BRANCH_VIEW
    		|| teamTypeMembershipID == ICMSConstant.TEAM_TYPE_BRANCH_VIEW_WFH) {
        isSAC = true;
    }
    
    com.integrosys.cms.ui.image.ImageUploadForm aForm;
    
    aForm = (com.integrosys.cms.ui.image.ImageUploadForm) request.getAttribute("ImageUploadForm");
    
    if (aForm == null) {
    	//aForm = (com.integrosys.cms.ui.custodian.CustodianSearchForm) request.getAttribute("CustodianSearchForm");  //Shiv
    }else{
    	
    	if("null".equals(aForm.getCategory())){
    		aForm.setCategory("-");
    	}
    	if("null".equals(aForm.getFromDateDoc())){
    		aForm.setFromDateDoc("-");
    	}
    	if("null".equals(aForm.getToDatedoc())){
    		aForm.setToDatedoc("-");
    	}
    	if("null".equals(aForm.getFromAmount())){
    		aForm.setFromAmount("-");
    	}
    	if("null".equals(aForm.getToAmount())){
    		aForm.setToAmount("-");
    	}
    	
    	System.out.println("aForm.getCategory() =====================>"+aForm.getCategory()+"*");
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

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	}
		
    function gotoPage() {
	    parent.document.location="ImageUpload.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].customerName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
    	var custName=document.forms[0].customerName.value;
    	if (custName == '')
		{
			document.forms["ImageUploadForm"].all.value = 'Y';
		}
    	document.forms["ImageUploadForm"].action='ImageUpload.do?event=list_image&startIndex='+ind;
        document.forms["ImageUploadForm"].startIndex.value=ind;
        document.forms["ImageUploadForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["ImageUploadForm"].customerName.value=ind;
		if (ind == '')
		{
			document.forms["ImageUploadForm"].all.value = 'Y';
		}        
        document.forms[0].indicator.value='*';
        document.forms["ImageUploadForm"].startIndex.value=0;
        document.forms["ImageUploadForm"].action='ImageUpload.do?event=list_image';
        document.forms["ImageUploadForm"].submit();
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

<html:form action="ImageUpload.do">
<html:hidden property="startIndex" />
<html:hidden property="customerName" />
<html:hidden property="event" />
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
                  <%
                  String cuName = "";
                  cuName = OB.getCustomerName();
                  cuName = cuName.replaceAll("%", "%25");
                 // cuName = cuName.replaceAll("$", "%24");
                 //cuName = cuName.replaceAll(".", "%2E");
                  cuName = cuName.replaceAll(" ", "%20");
                  cuName = cuName.replaceAll("!", "%21");
                  cuName = cuName.replaceAll("\"", "%22");
                  cuName = cuName.replaceAll("#", "%23");                               
                  cuName = cuName.replaceAll("&", "%26");
                  cuName = cuName.replaceAll("\'", "%27");
                  //cuName = cuName.replaceAll("(", "%28"); 
                 // cuName = cuName.replaceAll(")", "%29");
                // cuName = cuName.replaceAll("*", "%2A");
              //   cuName = cuName.replaceAll("+", "%2B");
                cuName = cuName.replaceAll(",", "%2C");
                  cuName = cuName.replaceAll("-", "%2D");
                  
                cuName = cuName.replaceAll("/", "%2F");
                  
                 // cuName = cuName.replace('\'', '*');
                // System.out.println("cuName ===============> "+ cuName);
         	    //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
         	     
    			boolean isActive=true;
    			if(null != OB && null!=OB.getCustomer()){
         	    if(ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(OB.getCustomer().getStatus())){
         	        isActive=false;
         	    }
    			}
         	   //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
                   %>
                  <!--<a href="ImageUploadAdd.do?event=list_upload_page&customerName=<%=cuName%>&legalName=<%=OB.getLegalReference()%>">Upload </a>-->           
                   
                   <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                      <option value="#" selected>Please Select</option>
                      <%if("CHECKER".equals(userType)||isSAC){ %>
                      <option value='ImageUploadAdd.do?event=view_uploaded_image_listing&customerName=<%=cuName%>&legalName=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>&reset=Y'>View</option>
                      <%}else{
                    	  //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
                    	  if(!isActive){%>
                    	   <option value='ImageUploadAdd.do?event=view_uploaded_image_listing&customerName=<%=cuName%>&legalName=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>&reset=Y'>View</option>
                    	   <%}else{
                    		   //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties%>
                      <option value='ImageUploadAdd.do?event=view_uploaded_image_listing&customerName=<%=cuName%>&legalName=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>&reset=Y'>View</option>
                      <option value='ImageUploadAdd.do?event=remove_uploaded_image_listing&customerName=<%=cuName%>&legalName=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>&reset=Y'>Delete</option>
                      <option value='ImageUploadAdd.do?event=list_upload_page&customerName=<%=cuName%>&legalName=<%=OB.getLegalReference()%>&customerID=<%=subprofileID%>&limitProfileID=<%=instrID%>'>Upload</option>
                      <%}} %>
                    </select>
                    </td>
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
		 <table align="center">
		<tr align="center">
            			<td width="100" valign="baseline" align="center">
						 <a href="ImageUpload.do?event=image_upload"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
						</td>
            		</tr>
            		</table>
</html:form>

 </td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->
        <% String alphaURL="/ImageUpload.do?event=list_image";%>
<td height="25">
			<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="580" valign="middle">
                        <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <td valign="middle" >
                        <%String pageIndexUrl="ImageUpload.do?event=list_image&startIndex="; %>
                         <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="ImageUpload.do?event=list_image&startIndex="%>' submitFlag='<%=new Boolean(true)%>'/>
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

