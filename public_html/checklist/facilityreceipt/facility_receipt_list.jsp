<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
				  com.integrosys.component.user.app.bus.ICommonUser,
				  com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.app.customer.bus.ICMSCustomer,
				 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Collection,
                 java.util.HashMap,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    CountryList cList = CountryList.getInstance();
    boolean isFromCustodian=false; //invoked by custodian module events...
    if(request.getParameter("event")!=null && request.getParameter("event").equals("cust_list")){
        isFromCustodian=true;
    }
    ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    ILimit[] limit= limitProfile.getLimits();
    
    
   // System.out.println(limit);
 java.util.HashMap checkListIDMap = (java.util.HashMap)request.getAttribute("checkListIDMap");
    
    //System.out.println(":::::::::::checklist Id map::::::::"+checkListIDMap);
    java.util.HashMap custResHash = (java.util.HashMap)request.getAttribute("innerOuterBcaObList");
	if(custResHash!=null){
		DefaultLogger.debug(this,"custResHash size="+custResHash.size());
	}else{
		DefaultLogger.debug(this,"custResHash Null");
		custResHash = new java.util.HashMap();
	}

%>
<%
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
    ICMSCustomer iCustomer =
            (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
            
    //Uma:To Give Document's authorization right's to Branch User.
    boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
    ||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID) 
    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID) 
    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID);
    boolean isInCountry = false;

    boolean isViewFlag = false;
    if(request.getAttribute("isViewFlag")!=null){
        Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
        isViewFlag = isViewFlagObj.booleanValue();
    }
    
    if (limitProfile != null) {
        isInCountry = CheckListUtil.isInCountry(userTeam, limitProfile);
    } else {
        isInCountry = CheckListUtil.isInCountry(userTeam, iCustomer);
    }
    
    //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
    boolean isActive=true;
    if(null!=iCustomer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(iCustomer.getStatus())){
    isActive=false;
    	}
    
    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
  //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
%>



<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.checklist.bus.CheckListSearchResult"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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


function maintain(checkListID,secType,secSubType,limitBkgLoc,collateralID, collateralRef, custCategory, subprofileID){
    formObj = document.forms["FacilityReceiptForm"];
    formObj.event.value="prepare_update";
    formObj.checkListID.value = checkListID;
    formObj.secType.value = secType;
    formObj.secSubType.value = secSubType;
    //formObj.secName.value = secName;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.collateralID.value = collateralID;
    formObj.collateralRef.value = collateralRef;
    formObj.custCategory.value = custCategory;
    formObj.legalID.value = subprofileID;
    formObj.submit();
}

function view(checkListID,secType,secSubType,limitBkgLoc,collateralID, collateralRef, custCategory, subprofileID){
    formObj = document.forms["FacilityReceiptForm"];
    formObj.event.value="view";
    formObj.checkListID.value = checkListID;
    formObj.secType.value = secType;
    formObj.secSubType.value = secSubType;
    //formObj.secName.value = secName;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.collateralID.value = collateralID;
    formObj.collateralRef.value = collateralRef;
    formObj.custCategory.value = custCategory;
    formObj.legalID.value = subprofileID;
    formObj.submit();
}



//-->
</script>

</head>

<body>
<html:form action="FacilityReceipt.do" >
<input type="hidden" name="event" />
<input type="hidden" name="checkListID" />
<input type="hidden" name="limitBkgLoc" />

<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName" />
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />
<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />


<table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
          <h3>
          <%
             if(isViewFlag == true){
          %>
              View Facility Receipt 
          <%
             }else{
          %>
               Update Facility Receipt 
          <%
             }
          %>
          </h3>
      </td>
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
            	 <td width="3%"><bean:message key="label.global.sn"/></td>
            	   <td width="7%">Checklist Id </td>
             <td width="7%">Facility Id </td>
              <td width="7%">Facility Category </td>
             <td width="7%">Facility Type </td>
             <td width="14%" nowrap>Facility Name<br /></td>
<!--             <td width="9%"><bean:message key="label.document.security.location"/></td>-->
             <td width="9%"><bean:message key="label.document.status"/></td>
              <td width="9%"><bean:message key="label.global.action"/></td>
            
<!--
              <td width="3%">S/N</td>
              <td width="9%">Checklist ID</td>
              <td width="7%">Limit ID</td>
              <td width="7%">Facility ID</td>
              <td width="11%" nowrap>Facility Type /<br />  SubType</td>

              <td width="7%">Customer Category</td> <!-- for R1.5 CR017 

              <!-- for R1.3 CR013 
              <td width="8%">LE ID /<br> Customer Name </td>
              <td width="8%">BCA Ref /<br> BCA Bkg Location</td>
              <td width="8%">Outer Limit ID</td>
             

              <td width="8%">Facility Location</td>
              <td width="8%">Organisation Code</td>

              <td width="8%">Status</td>
              <td width="8%">Action</td>
-->
            </tr>
          </thead>
          <tbody>
		 <%
          for(int i=0;i<limit.length;i++){
          	ILimit OB=limit[i];
          
          	CheckListSearchResult checkList=(CheckListSearchResult) checkListIDMap.get(new Long(OB.getLimitID()));
         //	 System.out.println("checklist  ::::::::::"+checkList);
          
          %>
   
   <%
 //  System.out.println("dddd");
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    String countryName = OB.getBookingLocation().getCountryCode();
    
   %>
    <tr class="<%=rowClass%>">
              	<td class="index" valign="top" ><%=row%></td>
              	  <% if(checkList!=null){ %> 
              		                <td valign="top" >&nbsp;<%=checkList.getCheckListID()%></td>
              		                <%}else{ %>
              		                <td valign="top" >-&nbsp;</td>
              		                <%} %>
              	<td valign="top" >&nbsp;<%=OB.getLimitRef()%></td>
              		<td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY %>" entryCode="<%=OB.getFacilityCat()%>" display="true" descWithCode="false" />&nbsp;</td>
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=OB.getFacilityType()%>"/></td>
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=OB.getFacilityName()%>"/></td>
<!--              		<td nowrap="nowrap" valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>-->
              		                 <% if(checkList!=null){ %> 
              		                <td valign="top" >&nbsp;<%=checkList.getCheckListStatus()%></td>
              		                <%}else{ %>
              		                <td valign="top" >&nbsp;NEW</td>
              		                <%} %>
                </td>
              	<td valign="top" >&nbsp;



  	<%
boolean canView=false;
boolean  displayDropDown=true;
if(!isUserCpcMaker || !isActive){
	canView=true;
}
if(checkList==null){
	displayDropDown=false;
}
//System.out.println("---------canView----------"+canView);

%>

   <% if(displayDropDown){
	   if(canView){
	   %>
              
   <a href="FacilityReceipt.do?event=view&&limitBkgLoc=IN&&orgCode=000&&checkListID=<%=checkList.getCheckListID() %>&&secType=FAC 2&&secSubType=FAC 2&&limitID=<%=OB.getLimitID() %>&&limitName=<%=OB.getFacilityName() %>"  ><bean:message key="label.view"/></a>
        <%}else{ %>
          <a href="FacilityReceipt.do?event=prepare_update&&limitBkgLoc=IN&&orgCode=000&&checkListID=<%=checkList.getCheckListID() %>&&secType=FAC 2&&secSubType=FAC 2&&limitID=<%=OB.getLimitID() %>&&limitName=<%=OB.getFacilityName() %>"  ><bean:message key="label.process"/></a>
        <%} %>
   <%}else{ %>
&nbsp;-     
<%} %>
  


	</td>    
              	
   </tr>
    <%} %>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="12"><bean:message key="error.facility.nolink"/></td>
            </tr>
<%}%>        
          </tbody>
        </table>
    </tr>
  </tbody>
</table>
<%--
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><%=!isFromCustodian?"Update Deleted Security Checklist":"Update Deleted Security Doc"%></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="10%">Checklist ID</td>
              <td width="13%">Security ID</td>
              <td width="11%" nowrap>Security Type /<br />
                SubType</td>

              <td width="9%">Security Location</td>
              <td width="9%">Organisation Code</td>
          <td width="9%">Status</td>
              <td width="9%">Action</td>
            </tr>
          </thead>
          <tbody>
<%  row = 0; %>
    <logic:present name="delColChkLst"  scope="request" >
    <logic:iterate id="OB" name="delColChkLst"  type="com.integrosys.cms.app.checklist.bus.CollateralCheckListSummary"  scope="request" >
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    String countryName = cList.getCountryName(OB.getCollateralLocation());
    String securityOrg=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,OB.getSecurityOrganization());
   %>

        <tr class="<%=rowClass%>">
            <td class="index" valign="top" >
				<%=row%>
			</td>

            <td valign="top">
				<%=OB.getCheckListID()!=ICMSConstant.LONG_INVALID_VALUE ? String.valueOf(OB.getCheckListID()) : "-"%>
            </td>

            <td valign="top" >
            	&nbsp;<%=OB.getCollateralRef()%>
            </td>

            <td valign="top" >
            	&nbsp;<bean:write name="OB" property="collateralType.typeName" /><br />
                <bean:write name="OB" property="collateralSubType.subTypeName" />
            </td>

            <td nowrap="nowrap" valign="top" >
            	&nbsp;<integro:empty-if-null value="<%=countryName%>" />
            </td>

            <td nowrap="nowrap" valign="top" >
                  <integro:empty-if-null value="<%=securityOrg%>" />
            &nbsp;</td>

            <td valign="top" >
          		&nbsp;<bean:write name="OB" property="checkListStatus" />
          	</td>

            <td valign="top" >
            &nbsp;	<%	if(!isFromCustodian){//by default not from custodian events....%>
              		<% 		if(OB.getSameCountryInd()){
                    			if (limitProfile.getTATCreateDate() != null || ICMSConstant.STATE_DELETED.equals(limitProfile.getBCAStatus())) {	%>
                					<a href="#" onClick="maintain('<%=OB.getCheckListID()%>','<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getCollateralID()%>', '<%=OB.getCustCategory()%>', '<%=OB.getSubProfileID()%>', '<%=OB.getCollateralName()%>')" >Update </a>
              		<%    		} else if (OB.getCheckListID() != ICMSConstant.LONG_MIN_VALUE) { %>
                        			<a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getCollateralID()%>', '<%=OB.getCustCategory()%>', '<%=OB.getSubProfileID()%>', '<%=OB.getCollateralName()%>')" >View </a>
               		<%   		}  %> &nbsp;
                  	<% 		} else { %>
					  <%if(isInCountry&&isUserCpcMaker)						   
						   {%>
<a href="#" onClick="maintain('<%=OB.getCheckListID()%>','<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getCollateralID()%>')" >Update </a>
 <%}else{%>
                				<a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getCollateralID()%>', '<%=OB.getCustCategory()%>', '<%=OB.getSubProfileID()%>', '<%=OB.getCollateralName()%>')" >View </a>
              		<% 		}} 		%>

              		<%	}else{//gets here only if the evnt is driven by custodian module...	%>
                        <%if (OB.getCheckListID() != ICMSConstant.LONG_MIN_VALUE) { %>
                			<a href="custodian.do?event=security_doc_list&checklistid=<%=OB.getCheckListID()%>&securityid=<%=""+OB.getCollateralID()%>&securityLoc=<%=OB.getCollateralLocation()%>" >Update </a>
                        <%}else{%>
                            -
              		<%	}}			%>
          	</td>
		</tr>
</logic:iterate>
</logic:present>
<% if(row==0){%>
            <tr class="odd">
              <td colspan="8">There are no deleted securities checklist(s) </td>
            </tr>
<% }%>
          </tbody>
        </table>
        
        
        </td>
    </tr>
    --%>
  </tbody>
</table>

<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
