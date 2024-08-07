<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.OBCollateralSearchResult"%>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil"%>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.customer.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.common.CountryList"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.OBCollateralLimitResult"%>
<%@ page import="java.util.*"%>
<%@ page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@ page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralSearchForm"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.CollateralSearchCriteria"%>
<%@ page import="com.integrosys.cms.ui.common.UIUtil"%>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/collateral_list.jsp,v 1.31 2006/09/05 13:16:14 jzhai Exp $
     * @author $Author: jzhai $<br>
     * @version $Revision: 1.31 $
     * @since $Date: 2006/09/05 13:16:14 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
//        System.out.println("Entered collateral_list.jsp");
ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"." + IGlobalConstant.USER);
long roleType=0;
//if (user != null) {
	//roleType = user.getRoleType().getRoleTypeID();
//}
//DefaultLogger.debug("topbanner.jsp", "userId: " + user.getUserID() + "  userName1:--------------------- " + roleType  );
    CollateralSearchForm aForm = (CollateralSearchForm) request.getAttribute("CollateralSearchForm");
    String currentSearchTotalCount = (String) request.getAttribute("totalCount");

   // Vector v = new Vector();
   // v = (Vector)aForm.getSearchResult();
   // int colSize = 0;

   // if( v != null) {
   //     colSize = v.size();
       //pageContext.setAttribute("collateralList", v);

   // }


    CountryList cList = CountryList.getInstance();
    OBCollateralSearchResult col = null;
    boolean  nonTypeCommodity = true;

    List  legalList  = new ArrayList() ;
    List  sourceSysNameList  = new ArrayList() ;

 %>

 <%

//   added for Advance Search Pagination , no need to get from form,, get from session
   SearchResult result = (SearchResult)session.getAttribute("com.integrosys.cms.ui.collateral.CollateralSearchAction.session_searchResult");

    Vector v = new Vector();
    v = (Vector)aForm.getSearchResult();
    int colSize = 0;

    if (result != null) {
        v = (Vector)result.getResultList();
    }

    if( v != null) {
        colSize = v.size();
        pageContext.setAttribute("collateralList", v);

    }
     CollateralSearchCriteria cSearch = (CollateralSearchCriteria) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+ IGlobalConstant.GLOBAL_COLLATERALSEARCH_OBJ);
     Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
     if (cSearch != null ){
            if (aForm != null){
                aForm.setCollSearchDetails(cSearch,locale)  ;
            }
      }

      
      int currentSearchTotalCountValue = (currentSearchTotalCount!=null) ? Integer.valueOf(currentSearchTotalCount).intValue() : 0;

%>





<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>


<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.component.user.app.bus.IRoleType"%>
<script language="javascript" type="text/javascript">
<!--
function goNextPrev(ind) {
    document.forms["CollateralSearchForm"].startIndex.value=ind;
}

function goPageIndex(ind) {
    document.forms["CollateralSearchForm"].startIndex.value=ind;
    document.forms["CollateralSearchForm"].submit();
}

function goAlphaIndex(ind) {
    //document.forms["CollateralSearchForm"].searchLegalName.value='';
   // document.forms["CollateralSearchForm"].searchLeID.value='';
   // document.forms["CollateralSearchForm"].legalName.value=ind;

    document.forms["CollateralSearchForm"].startIndex.value=0;
    document.forms["CollateralSearchForm"].submit();
}

function goPage(pageNo){
	document.forms[0].startIndex.value = pageNo*10;
}

-->
</script>

<body>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->
<html:form action="CollateralSearch.do?event=list">
    <!--for page Index-->
    <input type="hidden" name="startIndex" value="0"/>
    <input type="hidden" name="indicator" >
    <input type="hidden" name="all">
    <input type="hidden" name="totalCount" value="<%=currentSearchTotalCountValue%>">

    <!--for advance search (Common)-->
    <html:hidden property="advanceSearchType"/>
    <html:hidden property="advanceSearch"/>
    <html:hidden property="securityType"/>
    <html:hidden property="securitySubType"/>
    <html:hidden property="securityId"/>

    <!--for advance search (common_advance_search.jsp)-->
    <html:hidden property="customerName"/>
    <html:hidden property="leIDType"/>
    <html:hidden property="legalID"/>
    <html:hidden property="idNO"/>

    <!--Hidden value for advance_search_assetbased.jsp-->
     <html:hidden property="vehType"/>
     <html:hidden property="regN0"/>
     <html:hidden property="chassissNo"/>

     <html:hidden property="itemType"/>
     <html:hidden property="purchaseReceiptNo"/>
     <html:hidden property="goldGrade"/>

     <html:hidden property="assetType"/>
     <html:hidden property="yearOfManufacture"/>
     <html:hidden property="modelNo"/>

     <%--<html:hidden property="assetType"/>--%>
     <html:hidden property="flagRegistered"/>
     <html:hidden property="builtYear"/>
     <%--<html:hidden property="assetType"/>--%>
     <%--<html:hidden property="yearOfManufacture"/>--%>
     <%--<html:hidden property="modelNo"/>--%>

    <!--Hidden value for advance_search_gurantee.jsp-->
    <html:hidden property="issuer"/>
    <html:hidden property="standbyLCNo"/>
    <html:hidden property="fromExpDate"/>
    <html:hidden property="toExpDate"/>

    <!--Hidden value for advance_search_property.jsp-->
    <html:hidden property="titleNo"/>
    <html:hidden property="titleNoPrefix"/>
    <html:hidden property="titleTypeCD"/>
    <html:hidden property="stateCD"/>
    <html:hidden property="districtCD"/>
    <html:hidden property="mukimCD"/>

<%
    if (colSize !=0) {
        for ( int i=0 ; i < colSize; i++ ) {
            col = (OBCollateralSearchResult)v.elementAt(i);
            if (col.getTypeCode().equals (ICMSConstant.SECURITY_TYPE_COMMODITY)) {
                nonTypeCommodity= false;
%>
                 <table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
                  <thead>
                  </thead>
                  <tbody>
                    <tr class="odd">
                      <td style="text-align:center" valign="middle"><table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                          <thead>
                          </thead>
                          <tbody>
                            <tr>
                              <td class="even" style="text-align:center" valign="middle">
                                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                  <tr class="even">
                                    <td style="border:none;text-align:center"><strong><img src="img/info.gif" /></strong></td>
                                  </tr>
                                  <tr class="even">
                                    <td style="border:none;text-align:center"><strong><font size="2"><br />
                                      <bean:message key="error.collateral.search.commodity"/></font></strong></td>
                                  </tr>
                                </table> </td>
                            </tr>
                          </tbody>
                        </table></td>
                    </tr>
                  </tbody>
                </table>
<%
            }
    }

    if  (nonTypeCommodity) {
        %>

         	<table width="98%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
            	<tr>
                	<td  style="text-align:right" valign="bottom"></td>
                </tr>
                <tr>
                	<td><%--<% out.print(colSize); %> Security Found--%>&nbsp;</td>
                </tr>
                <tr>
                 	<td>
                 	<table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo">
                            <thead>
                              	<tr>
                                	<td width="2%" rowspan="2"><bean:message key="label.global.sn"/></td>
                                	<!--  <td width="12%" rowspan="2" ><bean:message key="label.security.id.cms"/></td>-->
                                	<td width="12%" rowspan="2" ><bean:message key="label.security.id"/></td>
                                	<td width="9%" rowspan="2" nowrap="nowrap"><bean:message key="label.security.type"/>/<br/><bean:message key="label.global.sub.type"/></td>
                                    <!--<td width="5%" rowspan="2"><bean:message key="label.security.loc"/></td>
                                    <td width="5%" rowspan="2"><bean:message key="label.org.code"/></td>

                                	--><% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                                	<td width="12%"><bean:message key="label.list.party.name"/><!--<bean:message key="label.global.legal.name"/>--></td>
                                	<td width="9%"><bean:message key="label.list.party.id"/><!--<bean:message key="label.customer.id"/>--></td>
                                	<% } else { %>
                                	<td width="15%" rowspan="2"><bean:message key="label.list.party.name"/><!--<bean:message key="label.global.legal.name"/>--></td>
                                	<td width="9%" rowspan="2"><bean:message key="label.list.party.id"/><!--<bean:message key="label.customer.id"/>--></td>
                                	<% } %>

                                	<td width="13%" rowspan="2"><bean:message key="label.list.party.cam.no"/><!--<bean:message key="label.global.aa"/> <bean:message key="label.global.reference"/>--></td>
                                	 <%-- Start Commented For HDFC as SRS
                                	<td width="5%" rowspan="2"><bean:message key="label.global.approved.date"/></td>
                                	End Commented For HDFC as SRS--%>
                                	<td width="10%" rowspan="2"><bean:message key="label.list.facility.id"/><!--<bean:message key="label.limit.id"/>--></td>

									<td width="10%" rowspan="2">Facility Name</td>

                                    <%-- for R1.3 CR013 --%>
                                    <%--
                                    <td width="9%" rowspan="2"><bean:message key="label.customer.id"/> /<br> <bean:message key="label.customer.name"/> </td>
                                    <td width="9%" rowspan="2"><bean:message key="label.global.aa"/> 
                                    	<bean:message key="label.global.reference"/> /<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/>
                                    </td>
                                    <td width="9%" rowspan="2"><bean:message key="label.global.outer.limit.id"/></td>
                                    --%>
              				        <%--------------------%>

                                	<td width="5%" rowspan="2"><bean:message key="label.security.facility.linkage"/><!--<bean:message key="label.security.limit.linkage"/>--></td>
                                	 <%-- Start Commented For HDFC as SRS
                                	<td width="10%" rowspan="2"><bean:message key="label.product.desc"/></td>
                                	<td width="5%" rowspan="2"><bean:message key="label.security.perfected"/></td>
                                	 End Commented For HDFC as SRS--%>
                                	
                                	<td width="5%" rowspan="2"><bean:message key="label.global.action"/></td>
                              	</tr>
                              	<tr>
                              		<% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                                	<td><br></td>
                                	<td>C<bean:message key="label.customer.subprofile.id"/></td>
                                	<% } %>
                              	</tr>
                            </thead>

                            <tbody>
                            <%
                             int counter= 1;

                              String siii = (String) request.getAttribute("startIndex");
                              int count = 1;
                              if (siii != null && siii.trim().length() > 0 && !siii.trim().equals("null")) {
                                  count = Integer.parseInt(siii) + 1;
                              }

                             for ( int i= 0 ; i < colSize; i++ ) {
                                    col = (OBCollateralSearchResult) v.elementAt(i);

                                    legalList = col.getOBCollateralLimitList() ;
                                    sourceSysNameList = col.getSecSystemName();
                                   if (legalList == null) {
                                       legalList =  new ArrayList() ;
                                   }
                                  if (sourceSysNameList == null) {
                                       sourceSysNameList =  new ArrayList() ;
                                   }
                                    String  secid= col.getSecurityID();
                                    String secname = col.getTypeName();
                                    String secsubtyename =col.getSubTypeName();
                                    String status = "No";
                                    if (col.getIsCollateralPerfected())
                                        status = "Yes";
                            	%>
                            	
                             	<tr class="<%=count%2==0?"even":"odd"%>">
                                	 <td class="index"><%=count++%></td>
                                  	<td>
                                  	<%	


										String LegalID ="";
                                  	
                                  	for ( int j=0 ; j < legalList.size() ; j++ ) {
                                        OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                        LegalID = OB.getLegalID();
                                        
                             }

										String  Viewpath="-";
                    					String ViewSubType = col.getSubTypeCode();
                                        Viewpath = SecuritySubTypeUtil.getUrl(ViewSubType,1);
                 						Viewpath=Viewpath+"&collateralID="+col.getCollateralID() + "&from=" + CollateralAction.READ_SECURITIES+"&customerID=-999999999&limitProfileID=-999999999"+ "&trxID="+ col.getCollateralID()+"&userName="+roleType ;

                 					    Viewpath=Viewpath+"&LegalID="+LegalID;

                                    %>
                                       <a href="<%=Viewpath%>"><integro:empty-if-null value="<%=String.valueOf(col.getCollateralID())%>"/></a>&nbsp;<br>	
                                       
                                  	<%	
										if(col.getCollateralStatus()!=null && (col.getCollateralStatus().equals(ICMSConstant.STATE_DELETED) || (col.getCollateralStatus().equals(ICMSConstant.STATE_PENDING_DELETE)) ) ){
									%>
                                			<br><font color="#FF0000" size="1">Deleted</font>
                                	<%	
										}
									%>
                                      </td>

									<td>
									<%=col.getTypeName()%>/<%=col.getSubTypeName()%>
									
									</td>
									
									<td nowrap="nowrap">
                                        <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
                                                <integro:empty-if-null value="<%=OB.getLegalName()%>"/>&nbsp;&nbsp;
                                          		<% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                                                    <integro:empty-if-null value="<%=OB.getCustomerName()%>"/>
                                                  <% } %>
                                          		<br>
                                     <% } %> &nbsp;
                                     </td>
										
					
									
                                  	

                                    <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
                                          		<%--<%=OB.getLegalID()%><br>--%>
                                                <integro:empty-if-null value="<%=OB.getLegalID()%>"/>&nbsp;&nbsp;
                                                <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                                    			   <%=OB.getSubProfileID()%>
                                                <% } %>
                                    			<br>

                                      <% } %> &nbsp;
                                     </td>

                                     <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
                                          		<integro:empty-if-null value="<%=OB.getInstructionRefNo()%>"/>&nbsp;<br>

                                      <% } %> &nbsp;
                                     </td>

									 <%-- Start Commented For HDFC as SRS
                                    <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
                                          		<integro:date object="<%=OB.getInstructionApprovedDate()%>" />&nbsp;<br>

                                      <% } %> &nbsp;
                                     </td>
                                     End Commented For HDFC as SRS--%>
                                     <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
                                                <integro:empty-if-null value="<%=OB.getSCILimitID()%>"/>&nbsp;<br>
                                                
                                      <% } %> &nbsp;
                                      
                                     </td>
                                     
                                     <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
                                                <integro:empty-if-null value="<%=OB.getSourceSystemName()%>"/>&nbsp;<br>
                                                
                                      <% } %> &nbsp;
                                      
                                     </td>
                                     
                                     <%-- inner limit belong to another aa, info goes from here --%>

                                     <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                    	   
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                               if (OB.getSCILimitID() != null) {
                                       %>
                                          		<%	if(OB.getSCILimitMapStatus()!=null && OB.getSCILimitMapStatus().equals(ICMSConstant.HOST_STATUS_DELETE) ) {        %>
                                      					Deleted
                                      			<%	}else {%>
														Active
                                      			<%	}%>
												<br>

                                      <% }} %> &nbsp;
                                     </td>
                                    <%-- Start Commented For HDFC as SRS
                                     <td nowrap="nowrap">
                                       <% for ( int j=0 ; j < legalList.size() ; j++ ) {
                                               OBCollateralLimitResult  OB = (OBCollateralLimitResult) legalList.get(j) ;
                                       %>
												<integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= OB.getProductDesc() %>" descWithCode="false"/> <br>
                                      <% } %> &nbsp;
                                     </td>


									<td><%= status %></td>

 									End Commented For HDFC as SRS--%>
                                    <td nowrap="nowrap">
                						<%	String  path="-";%>
                    					<% 		String SubType = col.getSubTypeCode();
                                                path = SecuritySubTypeUtil.getUrl(SubType,1);
                 								path=path+"&collateralID="+col.getCollateralID()+"&from=" + CollateralAction.READ_SECURITIES+"&customerID=-999999999&limitProfileID=-999999999";


                 						        path=path+"&LegalID="+LegalID;

                 						%>
                  							<a href="<%=path%>">View</a>
		               				</td>
                              	</tr>
                            </tbody>
                            <%
                                }
                            %>


                           </table>
                   	</td>
               	</tr>
          	</table>

<%		}
	} else{%>

             <table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
              <thead>
              </thead>
              <tbody>
                <tr class="odd">
                  <td style="text-align:center" valign="middle"><table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                      <thead>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="even" style="text-align:center" valign="middle">
                            <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <tr class="even">
                                <td style="border:none;text-align:center"><strong><img src="img/info.gif" /></strong></td>
                              </tr>
                              <tr class="even">
                                <td style="border:none;text-align:center">
                                  <strong><font size="2"><br /><bean:message key="label.global.not.found"/></font></strong>
                                </td>
                              </tr>
                            </table> </td>
                        </tr>
                      </tbody>
                    </table></td>
                </tr>
              </tbody>
            </table>
   <% } %>
</html:form>

	</td>
	</tr>
 <!-- End Content -->
   <!--Below added for Advance Search Pagination-->

<%
    String sii = (String) request.getAttribute("startIndex");
    String alphaURL="/CollateralSearch.do?event=list";

    int index = 0;
    if (sii != null && sii.trim().length() > 0 && !sii.trim().equals("null")) {
        index= Integer.parseInt(sii);
    }

    int records_per_page = UIUtil.getDefaultPaginationCount() ;


%>
  <!-- General Purpose Bar -->
	<tr id="generalPurposeBarTR">
	<td height="25">
		<table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">
		<tr>
			<td valign="middle">
        		<integro:pageindex pageIndex='<%=new PageIndex(index, records_per_page, result.getNItems())%>'
	        	url='<%=alphaURL %>' submitFlag='<%=new Boolean(true)%>'/>
    		</td>
	 	</tr>
		</table>
	</td>
	</tr>
</table>
</body>

