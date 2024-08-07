<%@ page import="com.integrosys.cms.ui.customer.ProcessDetailsCustomerForm,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,                 
                 com.integrosys.cms.app.customer.bus.*,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,                 
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.limit.trx.ILimitProfileTrxValue,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.techinfra.util.SortUtil,
                 com.integrosys.base.uiinfra.common.Constants,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.*,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.businfra.currency.CurrencyManager"%>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/ViewLimitProfile.jsp,v 1.66 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.66 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $

     * @author $Author: hmbao $<br>
     * @version $Revision: 1.66 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     * insert "STANDARD & POOR" credit grade
     * must display all four credit grades : "INTERNAL", "ORIGINAL", "MOODY'S", "STANDARD & POOR"
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%      Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);      
        OBCMSCustomer obCMSCustomer = (OBCMSCustomer)request.getAttribute("customerOb");
        ILimitProfileTrxValue iLimitProfileTrxVal = (ILimitProfileTrxValue)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.trxValue");
        ICMSLegalEntity legal = obCMSCustomer.getCMSLegalEntity();
        String transactionID = (String) request.getAttribute("transactionID");
      //  ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");         
        String custCategory =new String();
        String custLegalConst =new String();
        String custSegment =new String();
        if(obCMSCustomer!=null){
            if(obCMSCustomer.getNonBorrowerInd()) {
                if (obCMSCustomer.getCoBorrowerInd())
                    custCategory = "Co-Borrower";
                else
                    custCategory ="Non Borrower";
            }else
                  custCategory="Borrower";
            if(legal!=null)   {
                  custSegment =CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT, legal.getCustomerSegment());                  
            }
        }       

        OBLimitProfile limitprofile = (OBLimitProfile)request.getAttribute("limitprofileOb");
        long subpid = obCMSCustomer.getCustomerID();
        ILimit limits[] = null;
        if(limitprofile != null && !"".equals(limitprofile))
        {
       limits = limitprofile.getLimits();
        }
       
        String subprofid = Long.toString(subpid);
        String limitprofileid = null;
        if (limitprofile != null)
        {
            limitprofileid = Long.toString(limitprofile.getLimitProfileID());
        }
        
        String isiccd="-";
        String isicdesc="-";
          if(legal!=null)
        {
            IISICCode isiccode[] = legal.getISICCode();
            if(isiccode!=null && isiccode.length !=0) {
                for (int i=0;i <isiccode.length;i++)
                {
                    //if(isiccode[i].getISICType()!=null && isiccode[i].getISICType().equals("ISIC"))
                    //{
                    if(isiccode[i].getISICCode()!=null) {
                        isicdesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ISIC_CODE, isiccode[i].getISICCode().toString() );
                    isiccd = isiccode[i].getISICCode().toString();
                    }
                   //}

                }
            }
        }
            if(obCMSCustomer!=null)
            pageContext.setAttribute("customerOb",obCMSCustomer);
            
          //End: Uma Khot: Phase 3 CR:Customer details(summary Detail with CAM)
          List viewSystemList=(List)request.getAttribute("viewSystemList");
       //   DefaultLogger.debug(this, "viewSystemList size:"+viewSystemList.size());
            if(null!=viewSystemList){
            	pageContext.setAttribute("viewSystemList",viewSystemList);
            }
            
            int snoSys=1;
            String colorSys="";
            
            Map<String,String> creditApprovalMap =(Map)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.creditApprovalMap");
            DefaultLogger.debug(this,"creditAprrovalMap"+creditApprovalMap);
           
            String creditApprover1="-";
            String creditApprover2="-";
            String creditApprover3="-";
            String creditApprover4="-";
            String creditApprover5="-";
           // DefaultLogger.debug(this,"limitprofile"+limitprofile);
            obCMSCustomer.getRelationshipMgr();
            if(null!=limitprofile){
           
                	pageContext.setAttribute("limitprofile",limitprofile);
                	
				if(null!=creditApprovalMap){
					String limitCreditApprover1=limitprofile.getApproverEmployeeName1();
					String limitCreditApprover2=limitprofile.getApproverEmployeeName2();
					String limitCreditApprover3=limitprofile.getApproverEmployeeName3();
					String limitCreditApprover4=limitprofile.getApproverEmployeeName4();
					String limitCreditApprover5=limitprofile.getApproverEmployeeName5();
					
					if(null!=limitCreditApprover1 && null!=creditApprovalMap.get(limitCreditApprover1)){
						creditApprover1=creditApprovalMap.get(limitCreditApprover1);
					}
					if(null!=limitCreditApprover2 && null!=creditApprovalMap.get(limitCreditApprover2)){
						creditApprover2=creditApprovalMap.get(limitCreditApprover2);
					}
					if(null!=limitCreditApprover3 && null!=creditApprovalMap.get(limitCreditApprover3)){
						creditApprover3=creditApprovalMap.get(limitCreditApprover3);
					}
					if(null!=limitCreditApprover4 && null!=creditApprovalMap.get(limitCreditApprover4)){
						creditApprover4=creditApprovalMap.get(limitCreditApprover4);
					}
					if(null!=limitCreditApprover5 && null!=creditApprovalMap.get(limitCreditApprover5)){
						creditApprover5=creditApprovalMap.get(limitCreditApprover5);
					}
					
				}
            	
            }
          //End: Uma Khot: Phase 3 CR:Customer details(summary Detail with CAM)
        %>

<%
									
									IContact obContact = null;
									IContact obContactOff = null;
									IContact obContactRegOff = null;
									IContact address[] = obCMSCustomer.getCMSLegalEntity().getRegisteredAddress();
									
									if (address != null) {
										for (int i = 0; i < address.length; i++) {
											System.out.println("address[i].getContactType()"+address[i].getContactType());
											if (address[i].getContactType() != null
													&& address[i].getContactType().equals(
															ICMSConstant.REGISTERED)) {
												obContactRegOff = address[i];
											}
											else if (address[i].getContactType() != null
													&& address[i].getContactType().equals(
															ICMSConstant.OFFICE)) {
												obContactOff = address[i];
											}
											else if (address[i].getContactType() != null
													&& address[i].getContactType().equals(
															ICMSConstant.CORPORATE)) {
												obContact = address[i];
											}
										}
									}
									%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page import="com.integrosys.cms.app.customer.bus.IContact"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.base.businfra.currency.Amount"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.common.ForexHelper"%>
<%@page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.cms.app.limit.bus.ICollateralAllocation"%>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>


<%@page import="com.integrosys.cms.app.collateral.bus.OBCollateral"%>
<%@page import="com.integrosys.cms.app.collateral.bus.ICollateral"%>
<%@page import="com.integrosys.cms.app.collateral.bus.CollateralComparator"%>
<%@page import="com.integrosys.cms.app.limit.bus.OBLimit"%>
<%@page import="com.integrosys.cms.app.limit.bus.OBCoBorrowerLimit"%>
<%@page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>
<%@page import="com.integrosys.cms.app.limit.proxy.ILimitProxy"%>
<%@page import="com.integrosys.cms.app.limit.proxy.LimitProxyFactory"%>
<%@page import="com.integrosys.cms.ui.common.CommonCodeList"%><script language="JavaScript" type="text/JavaScript">
<!--
function gotopage(customerID,limitProfileID){

	 parent.document.location = "CustomerProcess.do?event=editLimitProfile&customerID=" +customerID+"&limitProfileID="+limitProfileID;
}
-->
</script>
<%
String pName = (String)request.getAttribute("partyGroupName");
String cityName=(String)request.getAttribute("cityName");
String stateName=(String)request.getAttribute("stateName");
String regionName=(String)request.getAttribute("regionName");
String countryName=(String)request.getAttribute("countryName");
String rmRegionName=(String)request.getAttribute("rmRegionName");
String relManagerName=(String)request.getAttribute("relManagerName");
Map collCodeDescMap = (Map) request.getAttribute("collCodeDescMap");
Map countryCodeNameMap = (Map) request.getAttribute("countryCodeNameMap");
Map sysBankBranchCodeNameMap = (Map) request.getAttribute("sysBankBranchCodeNameMap");
%>
<html:form  action="CustomerProcess.do?event=processcusdetails">
	
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>View Customer Details</h3></td>
      <% String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
      	long teamTypeMembershipID = Long.parseLong(teamTypeMemID);
		if (teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER 
				||teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
				||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
				||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
				||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
				||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
				) {
            if(!obCMSCustomer.getNonBorrowerInd()) {        //non borrower indicator
      %>
            <td width="50%" align="right" valign="baseline">
            <table width="150" border="0" cellspacing="0" cellpadding="0">
            <tr>
	        <%
	        if (limitprofile != null && limitprofile.getBCAStatus() != null &&
	            (limitprofile.getBCAStatus().equals (ICMSConstant.STATE_DELETED) || limitprofile.getBCAStatus().equals (ICMSConstant.STATE_PENDING_DELETE)) ) {
			%>
	            <td width="10%" align="right" valign="bottom"><p class="required"><font color="#FF0000"><b>
	            <%=limitprofile.getBCAStatus().equals(ICMSConstant.STATE_DELETED)?"Deleted":"Pending Delete"%> BCA
	            </b></font></p> </td>
	
	        <% } %>
<%--
	        <%
	        	if ((iLimitProfileTrxVal != null) 
	        		//&& !(iLimitProfileTrxVal.getStatus().equals(ICMSConstant.STATE_NEW))
	        		)
	        { %>
	              <td width="10%" align="right" valign="bottom"><input type="button" name="Button" value="Edit" class="btnNormal" style="width:50" onclick="gotopage('<%=subprofid%>', '<%=limitprofileid%>')"/></td>
	              </tr></table></td>
	        <% } else { %>
	              </tr></table></td>
	        <% }
--%>
		</tr></table></td>	        
	<%
        } 
        } 
     %>      
      <%
      
      String domicileCountry="";
      List ctryLbls = (List)CountryList.getInstance().getCountryLabels();
      List ctryVals = (List)CountryList.getInstance().getCountryValues();
/*      String approvingOfficerGrade ="-";
         if(limitprofile != null && limitprofile.getApprovingOfficerGrade()!=null && !limitprofile.getApprovingOfficerGrade().equals(""))
         {
              approvingOfficerGrade =limitprofile.getApprovingOfficerGrade();
         }
*/         
          //String fam = (String)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.fam");
          //String famcode = (String)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.famcode");

      %>

     </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td colspan="2">

<!--<%@ include file="/customer/common_limit_profile_detail.jsp"%>-->
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party ID </td>
										<td width="30%"><%=obCMSCustomer.getCifId() %></td>
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getCustomerName()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getStatus()%>"/></td>
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getMainBranch()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment</td>
										<td width="30%"><integro:common-code descWithCode="false" display="true"
												categoryCode="<%=com.integrosys.cms.ui.collateral.CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode='<%=obCMSCustomer.getCustomerSegment() %>'/>
										</td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%"><integro:date object="<%=obCMSCustomer.getCustomerRelationshipStartDate()%>"/></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo" id="addParty">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getCustomerName()%>"/></td>
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getStatus()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getMainBranch()%>"/>&nbsp;</td>
										<td class="fieldname" width="20%">Group</td>
										<td width="30%"><integro:empty-if-null value="<%=pName%>"/></td>

									</tr>
									<tr class="odd">
									  <!-- <td class="fieldname" width="20%">Region</td> -->
									  <!-- code start:Uma Khot 18/08/2015 Phase 3 CR:Rename Region to RM Region-->
										<td class="fieldname" width="20%">RM Region</td>
										<!-- code end:Uma Khot 18/08/2015 Phase 3 CR:Rename Region to RM Region -->
										<td width="30%"><integro:empty-if-null value="<%=rmRegionName%>"/></td>
										<td class="fieldname" width="20%">Relationship Manager</td>
										<td width="30%"><integro:empty-if-null value="<%=relManagerName%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">Cycle</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getCycle()%>"/>
										<td class="fieldname">Segment</td>
										<td><integro:common-code descWithCode="false" display="true"
												categoryCode="<%=com.integrosys.cms.ui.collateral.CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode='<%=obCMSCustomer.getCustomerSegment() %>'/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">Entity</td>
										<td>
										<integro:common-code
												categoryCode="<%=CategoryCodeConstant.ENTITY%>"
												entryCode="<%=obCMSCustomer.getEntity()%>"
												descWithCode="false"  display="true"/>
										</td>
										<td class="fieldname">Industry Name</td>
										<td>
										<integro:common-code
												categoryCode="<%=com.integrosys.cms.ui.collateral.CategoryCodeConstant.HDFC_INDUSTRY%>"
												entryCode="<%=obCMSCustomer.getIndustryName()%>"
												descWithCode="false"  display="true" />	
										</td>
										
									</tr>
									<tr class="odd">
									<td class="fieldname">RBI Industry Code</td>
										<td>
										<%=(obCMSCustomer.getRbiIndustryCode()== null ||"".equals(obCMSCustomer.getRbiIndustryCode()))?"":" "+obCMSCustomer.getRbiIndustryCode()+"-" %>
										<integro:common-code
												categoryCode="<%=com.integrosys.cms.ui.collateral.CategoryCodeConstant.HDFC_RBI_CODE%>"
												entryCode="<%=obCMSCustomer.getRbiIndustryCode()%>"
												descWithCode="false"  display="true" />
									    </td>
										
										<td class="fieldname">PAN</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getPan()%>"/></td>
									</tr>
									
									<tr class="even">
										<td class="fieldname">Address1</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;<%} %>&nbsp;</td>
										
										<td class="fieldname">Address2</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Address3</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getAddressLine3()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">Pincode</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;<%} %>&nbsp;</td>

									</tr>
									<tr class="odd">
										<td class="fieldname">Country</td>
										<td><%if(countryName!=null){ %><integro:empty-if-null value="<%=countryName%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">Region</td>
										<td><%if(regionName!=null){ %><integro:empty-if-null value="<%=regionName%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">State</td>
										<td><%if(stateName!=null){ %><integro:empty-if-null value="<%=stateName%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">City</td>
										<td><%if(cityName!=null){ %><integro:empty-if-null value="<%=cityName%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Telephone Number</td>
										<td><%if(obContact!=null){ %>
										<integro:empty-if-null value="<%=obContact.getStdCodeTelNo()%>"/>&nbsp;
										<integro:empty-if-null value="<%=obContact.getTelephoneNumer()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">Fax No.</td>
										<td><%if(obContact!=null){ %>
										<integro:empty-if-null value="<%=obContact.getStdCodeTelex()%>"/>&nbsp;
										<integro:empty-if-null value="<%=obContact.getTelex()%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Email</td>
										
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getEmailAddress()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>
						
						<tr><td>&nbsp;</td></tr>
						
					</table>
					</td>
				</tr>
		</table>
		</td>
	</tr>
	<!-- Start: Uma Khot: Phase 3 CR:Customer details(summary Detail with CAM) -->
	<tr>
	<td><table border="0" cellpadding="0" cellspacing="0" class="tblFormSection"
								style="margin-top: 0" width="98%" align="center">
								<thead>
									<tr>
										<td><h3>System Details</h3></td>
									</tr>
									<tr>
       									 <td><hr/></td>
    								</tr>
								</thead>
								<tbody>
								<tr><td>
		<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="98%" align="center">
								<thead>
									<tr>
									
										<td>S/N</td>
										<td>System</td>
										<td>System ID</td>
										
									</tr>
								</thead>
								<tbody>
									<logic:present name="viewSystemList">
									<logic:notEmpty name="viewSystemList">
										<logic:iterate id="ob" name="viewSystemList"
											type="com.integrosys.cms.app.customer.bus.OBSystem"
											 scope="page">
											<%if(snoSys % 2 == 0){
												colorSys="even";
												}else{
												colorSys="odd";	
												}%>
											<tr class=<%=colorSys %>>
												<td class="index"><%=snoSys++ %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystem()%>" />&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getSystemCustomerId()%>&nbsp;</center>
												</td>
												
											</tr>
										</logic:iterate>
										</logic:notEmpty>
										<logic:empty name="viewSystemList">
										<tr class="odd">
											<td colspan="4"><bean:message
												key="label.global.not.found" /></td>
										</tr>
										</logic:empty>
									</logic:present>
									<logic:notPresent name="viewSystemList">
										<tr class="odd">
											<td colspan="4"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
								</tbody>
							</table>
							</td>
							</tr>
						</tbody>
					</table>
					</td>
	</tr> 
	<tr>
	<td>
	          <table width="98%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center" style="margin-top: 0">
            <%
        	    int rowIdx = 0;
			
            %>
            <thead>
            <tr>
            <td><h3>Cam Details</h3></td>
            </tr>
            <tr>
            <td><hr/></td>
            </tr>
            </thead>
            <tbody>
            <tr>
            <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <logic:present name="limitprofile">
         	     <tr class="odd">
         	    <td class="fieldname" width="19%">CAM Type</td>
                <td width="30%"><%=limitprofile.getCamType()%>&nbsp;</td>
                <td class="fieldname" width="19%">CAM No</td>
                <td width="30%"><%=limitprofile.getBCAReference() %>&nbsp;</td>
                </tr>
           
             <tr class="even">
              <td class="fieldname" width="19%">CAM Date</td>
                <td width="30%"><%=DateUtil.formatDate(locale, limitprofile.getApprovalDate()) %>&nbsp;</td>
                <td class="fieldname" width="19%">CAM Login Date</td>
                <td width="30%"><%=DateUtil.formatDate(locale,limitprofile.getCamLoginDate()) %>&nbsp;</td>
              </tr>

              <tr class="odd">
               <td class="fieldname" width="19%">RAM Rating</td>
                <%if(limitprofile.getRamRating()!=null && !"".equals(limitprofile.getRamRating())){ %>
                <td width="30%"><%=limitprofile.getRamRating() %>&nbsp;</td>
                <%}else{ %>
                 <td width="30%">-&nbsp;</td>
                <%} %>
                <td class="fieldname">RAM Rating Year</td>
                <%if(limitprofile.getRamRatingYear()!=null && !"".equals(limitprofile.getRamRatingYear())){ %>
                	<td width="30%"><%=limitprofile.getRamRatingYear() %>&nbsp;</td>
                <%}else{ %>
                <td width="30%">-&nbsp;</td>
                <%} %>
              </tr>    
				<tr class="even">
				<td class="fieldname">Rating Type</td>
							 <%String strType = limitprofile.getRamRatingType();%>
               <%if(strType!=null && !strType.equals("")){ %>
            <td><integro:common-code-single entryCode="<%=strType%>"  display="true"
                                    		categoryCode="<%=com.integrosys.cms.ui.collateral.CategoryCodeConstant.CommonCode_SEC_RATING_TYPE%>" descWithCode="false" /></td>
            <%}else{ %>
             <td>-</td>
            <%} %>
                <td class="fieldname">&nbsp;</td>
              	<td>&nbsp;</td>
              </tr>    

             <tr class="odd">
              <td class="fieldname" width="20%">Expiry Date</td>
                <td width="30%"><%=DateUtil.formatDate(locale,limitprofile.getNextAnnualReviewDate())%>&nbsp;</td>
                <td class="fieldname" width="20%">Extension Date</td>
                <td width="30%"><%=DateUtil.formatDate(locale,limitprofile.getExtendedNextReviewDate()) %>&nbsp;</td>
              </tr>
              
              <tr class="even">
               <td class="fieldname" width="20%">Number of times extended</td>
                <td width="30%"><%=String.valueOf(limitprofile.getNoOfTimesExtended()) %>&nbsp;</td>
                <td class="fieldname" width="20%">Total Sanctioned Amount (INR)</td>
                <td width="30%"> 
                	<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),obCMSCustomer.getTotalSanctionedLimit())%>" />	
                </td>
              </tr>    

            <tr class="odd">
             <td class="fieldname" width="20%">Relationship Manager</td>
                <td width="30%"><integro:empty-if-null value="<%=relManagerName%>"/></td>
                <td class="fieldname" width="20%">Controlling Branch</td>
                <td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getMainBranch()%>"/>&nbsp;</td>
              </tr>
              <tr class="even">
               		<td class="fieldname" width="20%">Fully Cash Collateral</td>
							<td width="30%" >
						<%	if(limitprofile.getFullyCashCollateral()!=null && limitprofile.getFullyCashCollateral().equals("Y")){ %>
				    		<input type="checkbox" checked disabled="true"/>
				    	<%}else{ %>
				    		<input type="checkbox"  disabled="true"/>
				   		<% } %>
							</td>
							<td class="fieldname" width="20%">Total Sanctioned Amount Facility Level(INR)</td>
							<td width="30%">
									
							 <integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),limitprofile.getTotalSanctionedAmountFacLevel())%>" />
							
							</td>
			</tr>	
              
               <tr class="odd">
                  <td class="fieldname">Committee Approval</td>
							<td class="odd">
							<% if(null!=limitprofile.getCommitteApproval() && limitprofile.getCommitteApproval().equals("Y")){  %>
				    		<input type="checkbox" checked disabled="true"/>
				 			<% }else{  %> 
				    		<input type="checkbox"  disabled="true"/>
				 		  <% }  %></td>
							<td class="fieldname">Board Approval</td>
							<td>
							<% if(null!=limitprofile.getBoardApproval() && limitprofile.getBoardApproval().equals("Y")){  %>
				    			<input type="checkbox" checked disabled="true"/>
				   			 <% }else{  %>
				    			<input type="checkbox" disabled="true"/>
				   			 <%}  %>
							</td>
						</tr>
						<tr class="even">
						    <td class="fieldname">Credit Approvers 1</td>
							<td class="even"><%=creditApprover1  %></td>
							
							<td class="fieldname">Credit Approvers 4</td>
							<td class="even"><%=creditApprover4 %></td>
							
						</tr>
						<tr class="odd">
						 <td class="fieldname">Credit Approvers 2</td>
							<td><%=creditApprover2 %></td>
							<td class="fieldname">Credit Approvers 5</td>
							<td class="even"><%=creditApprover5%></td>
							
						</tr>
						<tr class="even">
						 <td class="fieldname">Credit Approvers 3</td>
							<td class="even"><%=creditApprover3  %></td>
						<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						 <tr class="odd">
						  <td class="fieldname" width="20%">RBI Asset  Classification</td>
                <td width="30%"><%=limitprofile.getRbiAssetClassification()%>&nbsp;</td>
                <td class="fieldname" width="20%">Asset Classification</td>
                <td width="30%"><%=limitprofile.getAssetClassification() %>&nbsp;</td>
               
              </tr>
              <tr>
              <td colspan="4">
               <table width="98%"  border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                <tr class="odd">
                    <td class="fieldname">Remarks</td>
                    <td><integro:empty-if-null value="<%=limitprofile.getDocRemarks() %>" /></td>
                </tr>
                </tbody>
            </table>
            </td>
            </tr>  
                
         	
				</logic:present>
				 <logic:notPresent name="limitprofile">
				 <tr>
				 <td colspan="4"><bean:message key="label.global.not.found" /></td>
				 </tr>
				 </logic:notPresent>
				 </table>
				 </td>
				 </tr>
            </tbody>
          </table>
	</td>
	</tr>
	
	<tr>
	<td>
	          <table width="98%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center" style="margin-top: 0">
            
         <!--   <thead>
            <tr>
            <td><h3>Add User Defined Fields (UDFs)</h3></td>
            </tr>
            <tr>
            <td><hr/></td>
            </tr>
            </thead>  --> 
            <tbody>
            <tr>
            <td>
      
            <tr>
        <td>&nbsp;</td>
     	 </tr>
           		 <tr>
					<td><udf:udfDisplay module="cam" action="view"/></td>
					</tr>
	 				<tr>
        <td>&nbsp;</td>
      </tr>
     				 <tr>
       				 <td> <jsp:include page="cam_images_list.jsp"></jsp:include></td>
    				  </tr>
    				  <tr>
        <td>&nbsp;</td>
      </tr>
         <tr>
        <td> &nbsp;</td>
      </tr>
        <tr>
     <tr>
        <td> <jsp:include page="view_audit_details.jsp"></jsp:include></td>
      </tr>
            </td>
            </tr>
            </tbody>
            </table>
            </td>
            </tr>
            
	<!-- //End: Uma Khot: Phase 3 CR:Customer details(summary Detail with CAM)  -->
	<tr>
	<td>
    <script language="JavaScript" src="js/imageLoad.js"></script>
    <script language="JavaScript" type="text/JavaScript">
    <!--
        function editLimits() {
            document.forms[0].event.value = "prepare_edit_limits";
            document.forms[0].customerID.value = <%=ICMSConstant.LONG_INVALID_VALUE%>;
            document.forms[0].submit();
        }

        function editCoBorrowerLimits(customerID) {
            document.forms[0].event.value = "prepare_edit_co_borrower_limits";
            document.forms[0].customerID.value = customerID;
            document.forms[0].submit();
        }
     -->
    </script>
    <%
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);    
    CurrencyCode usd = new CurrencyCode(CommonUtil.getBaseCurrency(user));
  //  Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);    
    CountryList cList = CountryList.getInstance();
        
     
     

/*
        String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
        long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong(roleType);

        ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

        boolean isEditAllowed = true;
        if (teamTypeMshipID == ICMSConstant.TEAM_TYPE_CPC_CHECKER || teamTypeMshipID == ICMSConstant.TEAM_TYPE_SSC_CHECKER)
        {
            isEditAllowed = false;
        }

        boolean isLimitEditAllowed = isEditAllowed;
        boolean isCoboEditAllowed = isEditAllowed;

        IDataProtectionProxy dpProxy = DataProtectionProxyFactory.getProxy();
        if (isEditAllowed) {
            // as long as any of it can be accessed, then show the edit button.
            for (int i = limits.length - 1; i >= 0; i--) {
                isLimitEditAllowed = dpProxy.isLocationAccessibleByUser(userTeam, cust.getCMSLegalEntity().getCustomerSegment(), limits[i].getBookingLocation());
                if (isLimitEditAllowed) {
                    isLimitEditAllowed = dpProxy.isDataAccessAllowed(ICMSConstant.INSTANCE_LIMIT, IDataProtectionProxy.DAP_EDIT, teamTypeMshipID,
                            new String[]{limits[i].getBookingLocation().getCountryCode()}, new String[]{limits[i].getBookingLocation().getOrganisationCode()}, true);
                    if (isLimitEditAllowed) {
                        break;
                    }
                }
            }
        }
*/
    
    %>
</head>

<body>
<%
 if(null == limits){
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Limit List</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
    <tr>&nbsp;</tr>
    </thead>
    <tbody>
        <tr class="odd">
            <td style="text-align:center" valign="middle">
                <table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="even" style="text-align:center" valign="middle">
                                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                    <tr class="even">
                                        <td style="border:none;text-align:center"><strong><img src="img/info.gif"/>
                                        </strong></td>
                                    </tr>
                                    <tr class="even">
                                        <td style="border:none;text-align:center">
                                          <strong><font size="2"><br/><bean:message key="label.global.not.found"/></font></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>&nbsp;</tr>
    </tbody>

</table>
<%}  else  if (limits != null && limits.length != 0) {
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Limit List</h3></td>
    </tr>
 
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td>
<table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
<thead>
    <tr>
        <td width="3%"><bean:message key="label.global.sn"/></td>
        <td width="9%"><bean:message key="label.facility.id"/></td>
       <!--  <td width="8%"><bean:message key="label.limit.facility.description"/></td> -->
        <td width="9%"><bean:message key="label.facility.name"/></td>
        <td width="8%"><bean:message key="label.facility.type"/></td>
        <%--<td width="8%">Facility Currency</td> --%>
        <td width="6%"><bean:message key="label.facility.sanctionedamount"/></td>
        <td width="7%"><bean:message key="label.facility.releasableamount"/></td>
        <td width="7%"><bean:message key="label.facility.releasedamount"/>  </td>
        <!-- <td width="7%">Coverage Amount</td> -->
        <td width="7%"><bean:message key="label.facility.securityid"/></td>
        
        <%--<td width="9%"><bean:message key="label.customer.id"/> /<br> Customer Name </td>--%>
<!--        <td width="15%">Limit Location</td>-->
        <%-- <td width="9%"><bean:message key="label.global.outer.limit.id"/></td>--%>
        <%--<td width="9%"><bean:message key="label.global.aa"/> 
        	<bean:message key="label.global.reference"/>/<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/>
        </td>--%>
        <%-- <td width="12%"><bean:message key="label.limit.approved.limit"/></td>--%>
        <%--<td width="12%"><bean:message key="label.limit.authorised.limit"/></td>--%>
        <%-- <td width="9%"><bean:message key="label.limit.drawing.limit"/></td>--%>
        <%-- <td width="9%"><bean:message key="label.limit.outstanding.balance"/></td>
        <td width="9%"><bean:message key="label.security.id.cms"/></td>
        <td><bean:message key="label.limit.required.security.coverage"/></td>--%>
        <td width="10%" nowrap="nowrap">Security Type/Subtype</td>
        <td width="9%">Limit-Security Linkage</td>
      
       
    </tr>
</thead>
<tbody>
<%

ForexHelper fr = new ForexHelper();
    String color = "";
    double totalAppLimitAmt = 0;
    double totalActLimitAmt = 0;
    double totalDrawLimitAmt = 0;
    double totalOutLimitAmt = 0;
    if (limits != null && limits.length != 0) {
        String reason = limits[0].getZerorisedReason();
        String zerorisedDate = limits[0].getZerorisedDate() == null ? "" : DateUtil.convertToDisplayDate(limits[0].getZerorisedDate());
        boolean isZerorised = limits[0].getIsLimitZerorised();
        for (int i = 0; i < limits.length; i++) {
			String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_SOURCE_SYSTEM, (limits[i].getSourceId() == null)?"":limits[i].getSourceId());	
			String limitID = String.valueOf(limits[i].getLimitID());		
            String limitRef = limits[i].getLimitRef() + ((sourceDesc == null)?"":(" - " + sourceDesc));
            /*String productKey = limits[i].getProductDesc();
            if (productKey == null)
                productKey = "";
            String productDesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, productKey);
            if (productDesc == null)
                productDesc = "-";
			*/  	              
        //////    HashMap outerLimitMisc = (HashMap) outerlimitObHash.get(String.valueOf(limitID));	
	//////        String leID = (String) outerLimitMisc.get("leId");
      //////        String custName = (String) outerLimitMisc.get("custName");
       
            String limitCountryCode = limits[i].getBookingLocation().getCountryCode();
			String limitOrgCode = limits[i].getBookingLocation().getOrganisationCode();
//            String limitLocation = cList.getInstance().getCountryName(limitCountryCode);
			String limitLocation = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,limitOrgCode)+ " ("+limitOrgCode+")";
            String outerLimitID = String.valueOf(limits[i].getOuterLimitID());
    //////      String bcaRef = (String) outerLimitMisc.get("bcaRef");
        //////      String bkgLoc = cList.getCountryName((String) outerLimitMisc.get("bkgLoc"));
            boolean isSameBCA = limits[i].getIsInnerOuterSameBCA();
            String outerLimitRef = limits[i].getOuterLimitRef();
            if (outerLimitRef == null || outerLimitRef.trim().length() == 0)
                outerLimitRef = "0";
            String limitStatus = limits[i].getLimitStatus();
            Amount appLimitAmt = limits[i].getApprovedLimitAmount();
            Amount actLimitAmt = limits[i].getActivatedLimitAmount();	
			Amount outstandingLimitAmt = limits[i].getOutstandingAmount();
            Amount drawingLimitAmt = limits[i].getDrawingLimitAmount();
			if (outerLimitRef.equals("0") && limitStatus != null && !limitStatus.equals(ICMSConstant.STATE_DELETED)) {
		        try{
		            if (appLimitAmt != null && appLimitAmt.getCurrencyCode()!=null){
			                    totalAppLimitAmt += fr.convert(appLimitAmt, usd).getAmount();
					}
			        if (actLimitAmt != null){
			                    totalActLimitAmt += fr.convert(actLimitAmt, usd).getAmount();
					}
					if (outstandingLimitAmt != null){
		                totalOutLimitAmt += fr.convert(outstandingLimitAmt, usd).getAmount();
		            }
					if (drawingLimitAmt != null){
		                totalDrawLimitAmt += fr.convert(drawingLimitAmt, usd).getAmount();
		            }
                }catch(Exception e){
					appLimitAmt = fr.getForexErrorAmount();
				}
            }	
           
            Amount actualSecCoverageAmt = limits[i].getActualSecCoverageAmt();
			String actualSecCoveragePercent = "-";
			if (actualSecCoverageAmt != null && 
					actualSecCoverageAmt.getCurrencyCode() != null && 
					actualSecCoverageAmt.getAmount() >= 0 	
				) {
				
				
				if (outstandingLimitAmt != null && 
					outstandingLimitAmt.getCurrencyCode() != null && 
					outstandingLimitAmt.getAmount() >= 0 	
				) {
					// sec coverage amt / outstanding value *100 = x%							
					BigDecimal result = 
						actualSecCoverageAmt.getAmountAsBigDecimal().divide( 
								outstandingLimitAmt.getAmountAsBigDecimal(), 4, BigDecimal.ROUND_HALF_UP ).multiply( new BigDecimal( 100 ) );
					
					result = result.setScale( 2 );				
					actualSecCoveragePercent = result.toString();
				}
			} 
				
            //String actualSecurityCoverage = "-";
            //if (limits[i].getActualSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
            //    actualSecurityCoverage = MapperUtil.mapDoubleToString(limits[i].getActualSecurityCoverage(), 2, locale);
            //}
            ICollateralAllocation[] collaterals = limits[i].getCollateralAllocations();
           
            String securityID = "";
            String linkage = "";
            String securityType = "";
            String location = "";
            String orgCode = "";
            String facilityType = limits[i].getFacilityType();
            if (collaterals != null) {
                for (int x = 0; x < collaterals.length; x++) {				
					securityID += String.valueOf(collaterals[x].getCollateral().getCollateralID()) + "<br>";
					/*
				    List sourceAlias = collaterals[x].getCollateral().getSourceSecIdAliases();	
				    if (sourceAlias != null)
				    {
						for(int n=0; n<sourceAlias.size(); n++)
						{ 				
			                securityID += (String)(sourceAlias.get(n)) + "<br>";
						}
				    }
					*/
					
                    String hostStatus = collaterals[x].getHostStatus();
                    if (hostStatus != null && hostStatus.equals( ICMSConstant.HOST_STATUS_DELETE )) {
                        linkage += "<span class=deleted> " + "Deleted" + "</span><br>";
                    } else
                        linkage += "Active" + "<br>";
                    String type = collaterals[x].getCollateral().getCollateralType().getTypeName();
                    String subType = collaterals[x].getCollateral().getCollateralSubType().getSubTypeName();
                    securityType += type + "/" + subType + "<br>";
//                    for (int k = 0; k < ctryLbls.size(); k++) {
                        if (collaterals[x].getCollateral().getCollateralLocation() != null)
                            location += cList.getInstance().getCountryName(collaterals[x].getCollateral().getCollateralLocation()) + "<br>";
//                    }
                    if (collaterals[x].getCollateral().getSecurityOrganization() != null) {
                        orgCode += CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,collaterals[x].getCollateral().getSecurityOrganization()) + "<br>";
                    }
                }
            }
			if("".equals(orgCode)) {
				orgCode=null;
			}
            String displayDel = "";
            if (limits[i].getLimitStatus() != null && limits[i].getLimitStatus().equals(ICMSConstant.STATE_DELETED))
                displayDel = "Deleted";
            String requiredSecurityCoverage = "-";
            

            
            //if (limits[i].getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
            //    requiredSecurityCoverage = MapperUtil.mapDoubleToString(limits[i].getRequiredSecurityCoverage(), 0, locale);
            //}  // Shiv 210911
            
            if (null != limits[i].getRequiredSecurityCoverage()  && ! "".equals(limits[i].getRequiredSecurityCoverage())) {
                requiredSecurityCoverage = limits[i].getRequiredSecurityCoverage();
                 
            }// Shiv 210911
            
             String strReleasableAmount = "-";
             if (null != limits[i].getReleasableAmount() && ! "".equals(limits[i].getReleasableAmount().trim())) {
               strReleasableAmount = limits[i].getReleasableAmount();
            }
             String strTotalReleasedAmount = "-";
             if (null != limits[i].getTotalReleasedAmount() && ! "".equals(limits[i].getTotalReleasedAmount().trim())) {
               strTotalReleasedAmount = limits[i].getTotalReleasedAmount();
            }
             String strLimitCur = "-";
             if (null != limits[i].getCurrencyCode() && ! "".equals(limits[i].getCurrencyCode().trim())) {
          	   strLimitCur = limits[i].getCurrencyCode();
             }
               if (i % 2 == 0)
                color = "even";
            else
                color = "odd";
%>
<tr class="<%=color%>">
    <td class="index"><%=i + 1%></td>
    <td nowrap="nowrap"><integro:empty-if-null value="<%=limitRef%>"/><font color="#FF0000" size="1"><%=displayDel%></font></td>
    <!-- <td><integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limits[i].getProductCode() %>" descWithCode="false"/>&nbsp;</td> -->
   
   <td nowrap="nowrap"><integro:empty-if-null value="<%=limits[i].getFacilityName()%>"/></td>
   <td nowrap="nowrap"><integro:empty-if-null value="<%=facilityType%>"/>&nbsp;</td>
      <%-- <td nowrap="nowrap"><integro:empty-if-null value="<%=strLimitCur%>"/>&nbsp;</td>--%>
   <td class="amount"><integro:empty-if-null value="<%= UIUtil.formatWithCommaAndDecimal(requiredSecurityCoverage) %>" /></td>
   <td class="amount"><integro:empty-if-null value="<%= UIUtil.formatWithCommaAndDecimal(strReleasableAmount) %>" /></td>
   <td class="amount"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(strTotalReleasedAmount) %>"/></td>
   <%--<td class="amount">&nbsp;-&nbsp;</td> --%>
    <%--<td><integro:empty-if-null value="<%=leID%>"/>&nbsp;<br><integro:empty-if-null value="<%=custName%>"/></td>--%>
<!--    <td nowrap="nowrap"><integro:empty-if-null value="<%=limitLocation%>"/>&nbsp;</td>-->
    <%------
        if (outerLimitRef.equals("0")) {
    %>
    <td>-&nbsp;</td>
    <%
    } else if (isSameBCA) {
    %>
    <td><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
    <%
    } else {
    %>
    <td class="outerlimit"><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
    <%
        }
    ---%>    
    <%--<td><integro:empty-if-null value="<%=bcaRef%>"/>&nbsp;<br><integro:empty-if-null value="<%=bkgLoc%>"/></td>--%>
    <%-------------------
        if (appLimitAmt != null) {
    %>
    <td class="amount"><integro:currency amount="<%=appLimitAmt%>" param="currency"/>&nbsp;
        <%
            if (outerLimitRef == null || outerLimitRef.equals("0")) {
        %>
        <integro:amount amount="<%=appLimitAmt%>" param="amount" decimal="2" />
        <%
        } else {
        %>
        (<integro:amount amount="<%=appLimitAmt%>" param="amount" decimal="2" />)
        <%
            }
        %>
    </td>
    <%
    } else {
    %>
    <td class="amount">-&nbsp;</td>
    <%
        }
    %>

    <%
       // if (actLimitAmt != null) {
    ------------------%>
    <!--<td class="amount"><integro:currency amount="<%=actLimitAmt%>" param="currency"/>&nbsp;
        <%
        //    if (outerLimitRef == null || outerLimitRef.equals("0")) {
        %>
        <integro:amount amount="<%=actLimitAmt%>" param="amount" decimal="2"/>
        <%
       // } else {
        %>
        (<integro:amount amount="<%=actLimitAmt%>" param="amount" decimal="2"/>)
        <%
          //  }
        %>
    </td>-->
    <%
   // } else {
    %>
    <!--<td class="amount">-&nbsp;</td>-->
    <%
      //  }
    %>

    <%--
        if (drawingLimitAmt != null) {
    %>
    <td class="amount"><integro:currency amount="<%=drawingLimitAmt%>" param="currency"/>&nbsp;
    <%
			if (outerLimitRef == null || outerLimitRef.equals("0")) {
	%>		
		<integro:amount amount="<%=drawingLimitAmt%>" param="amount" decimal="2"/>
	<% 		} else { %>
		(<integro:amount amount="<%=drawingLimitAmt%>" param="amount" decimal="2"/>)
    <% 		} %>
	</td>    
    <%
    } else {
    %>
    <td class="amount">-&nbsp;</td>
    <%
        }
    --%>

    <%--
        if (outstandingLimitAmt != null) {
    %>
	
    <td class="amount"><integro:currency amount="<%=outstandingLimitAmt%>" param="currency"/>&nbsp;
     <%
			if (outerLimitRef == null || outerLimitRef.equals("0")) {
	%>
	<integro:amount amount="<%=outstandingLimitAmt%>" param="amount" decimal="2"/>
	<% 		} else { %>
	(<integro:amount amount="<%=outstandingLimitAmt%>" param="amount" decimal="2"/>)
    <% 		} %>
	</td>
    <%
    } else {
    %>
    <td class="amount">-&nbsp;</td>
    <%
        }
    --%>
	
    <td nowrap="nowrap"><integro:empty-if-null value="<%=securityID%>"/>&nbsp;</td>    
    <td nowrap="nowrap"><integro:empty-if-null value="<%=securityType%>"/>&nbsp;</td>
    <td><integro:empty-if-null value="<%=linkage%>"/>&nbsp;</td>
    <%--/*******************************/--%>
    
  </tr>
<%
    } // End of for (int i = 0; i < limits.length; i++) 
%>

<%
    } // End of if (limits != null && limits.length != 0) 
%>
<!-- DO IT LATER -->
<%-------------------------------
<tr class="odd">
<!--    <td class="total" valign="top">&nbsp;</td>-->
    <td class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalAppLimitAmt,usd)%>" param="amount" decimal="2"/></td>
    <!--<td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalActLimitAmt,usd)%>" param="amount" decimal="2"/></td>-->
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalDrawLimitAmt,usd)%>" param="amount" decimal="2"/></td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalOutLimitAmt,usd)%>" param="amount" decimal="2"/></td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
     <td valign="top" class="total">&nbsp;</td>
<!--    <td valign="top" class="total">&nbsp;</td>-->
</tr>
-----------------------------------------%>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<%
} 
%>
</body>
</td>
</tr>

<tr>
<td>
<%
    Map rs = (Map) request.getAttribute("securityOb");

    String limitProfileID = (String) request.getAttribute("limitProfileID");
    String customerID = (String) request.getAttribute("customerID");
    String startIndex = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "startIndex");
    OBCollateral obcol = new OBCollateral();
    Set set = null;
    Collection col = null;
    if(rs != null)
    {	
    set = rs.keySet();
    col = rs.values();
    }
   
    String limitid = new String();
    String outerid = "-";
    String SubType = new String();
    String path = new String();
    String viewPath = new String();
    int sno = 0;
   

    HashMap custResHash = (HashMap) request.getAttribute("customerObList");
    if (custResHash != null) {
        DefaultLogger.debug(this, "custResHash size=" + custResHash.size());
    } else {
        DefaultLogger.debug(this, "custResHash Null");
        custResHash = new java.util.HashMap();
    }
%>



<!-- InstanceBeginEditable name="CssStyle" -->
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
    function MM_swapImgRestore() { //v3.0
        var i,x,a = document.MM_sr;
        for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }

    function MM_preloadImages() { //v3.0
        var d = document;
        if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
            for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) {
                    d.MM_p[j] = new Image;
                    d.MM_p[j++].src = a[i];
                }
        }
    }

    function MM_findObj(n, d) { //v4.01
        var p,i,x;
        if (!d) d = document;
        if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document;
            n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n];
        for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n);
        return x;
    }

    function MM_swapImage() { //v3.0
        var i,j = 0,x,a = MM_swapImage.arguments;
        document.MM_sr = new Array;
        for (i = 0; i < (a.length - 2); i += 3)
            if ((x = MM_findObj(a[i])) != null) {
                document.MM_sr[j++] = x;
                if (!x.oSrc) x.oSrc = x.src;
                x.src = a[i + 2];
            }
    }
-->
</script>
<!-- InstanceEndEditable -->



<!--<html:form action="CustomerProcess.do?event=viewsecurities">-->

<%if (set != null && set.size() != 0) { %>
<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Securities List</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>


<tbody>

<tr>
<td>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
    <tr>
        <td width="3%">S/N</td>
        <td width="7%">Source Security ID<%--<bean:message key="label.security.id.cms"/>--%></td>
        <td width="7%">Collateral Name</td>
        <td width="20%">Security Type /<br/>SubType</td>
        <%-- <td width="9%">Customer Category</td>--%>
        <td width="9%">Security Booking Location</td>
        <td width="7%">Security Branch Name</td>
        <td width="7%">Security Currency</td>
        <td width="7%">Security Priority</td>
        <%-- <td width="6%">Organisation Code</td>--%>
        <td width="9%">Open Market Value( OMV)<%--<bean:message key="label.valuation.omv"/>--%> </td>
        <td width="7%">Security Coverage (%)</td>
       <%--  <td width="9%"><bean:message key="label.valuation.fsv" /></td>--%>
        <td width="9%">Facility ID</td>
        <td width="9%">Security Limit Linkage Status</td>
        <td width="9%">Facility Name</td>
        <td width="7%">Insurance Coverage</td>
        <%--<td width="8%">Product Desc</td>
        <td width="9%">Outer Limit ID</td>

        --%><!-- for R1.3 CR013 -->
        <%-- <td width="9%">CIF No. /<br> Customer Name </td>
        <td width="9%"><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/> /<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
        --%>
        <!-------------------->

        <%-- <td width="5%">Security Details Completed</td>--%>
<!--        <td width="6%">Action</td>-->
    </tr>
</thead>
<tbody>

<%
ICollateral[] cols = null;
   if(set != null)
   {
 cols = (ICollateral[]) set.toArray(new ICollateral[0]);
   }
    boolean isCoBorrowerInd = false;
    Arrays.sort(cols, new CollateralComparator());
    Iterator abc = Arrays.asList(cols).iterator();
    String customerCategory = "";
	  String securityIDSec;

    String rowClass = "";
    ArrayList arrayListforOBLimit = new ArrayList();
    if(col != null)
    {
    Iterator j = col.iterator();
    }
    while (abc.hasNext()) {
        obcol = ((OBCollateral) abc.next());

        //cap at zero instead of showing negative
        Amount fsvAmt = null;
        if (obcol.getFSV() != null)
        {
            fsvAmt = new Amount(Math.max(obcol.getFSV().getAmount(), 0), obcol.getFSV().getCurrencyCode());
		}

        securityIDSec = String.valueOf(obcol.getCollateralID());
			/*
            List sourceAlias = obcol.getSecSystemName();
            if (sourceAlias != null)		    
		    {
				for(int n=0; n<sourceAlias.size(); n++)
				{
					securityID += (String)(sourceAlias.get(n)) + "<br>";
				}
			}
			*/
        arrayListforOBLimit = (ArrayList) rs.get(obcol);
        ArrayList newarrayList = new ArrayList();
        if(obcol.getCollateralLimits()[0]!=null){
        if ("MB".equals(obcol.getCollateralLimits()[0].getCustomerCategory()) && (obcol.getCollateralLimits()[0].getCoBorrowerLimitID() <= 0))
        {
            customerCategory = "Main Borrower";
            isCoBorrowerInd = false;
        } else {
            customerCategory = "Co-Borrower";
            isCoBorrowerInd = true;
        }
        }
        for (int l = 0; l < arrayListforOBLimit.size(); l++) {
            if (newarrayList.contains(arrayListforOBLimit.get(l))) {

            } else {
                newarrayList.add(arrayListforOBLimit.get(l));
            }
        }
        OBLimit oblimit[] = new OBLimit[arrayListforOBLimit.size()];

        OBCoBorrowerLimit[] obCoBorrowerLimit = new OBCoBorrowerLimit[arrayListforOBLimit.size()];
        sno++;
        String collaterallocation = "-";
        if (sno % 2 != 0) {
            rowClass = "odd";
        } else {
            rowClass = "even";
        }


%>
<tr class="<%=rowClass%>">

<td class="index" valign="top"><%=sno%></td>

<% 
		SubType = obcol.getCollateralSubType().getSubTypeCode();
    viewPath = SecuritySubTypeUtil.getUrl(SubType, 2);
    viewPath = viewPath + "&collateralID=" + obcol.getCollateralID() + "&from=" + CollateralAction.READ_SECURITIES_2;
%>

<td valign="top" nowrap="nowrap" ><%=securityIDSec%><BR>
    <%if (obcol.getStatus() != null && (obcol.getStatus().equals(ICMSConstant.STATE_DELETED) || (obcol.getStatus().equals(ICMSConstant.STATE_PENDING_DELETE)))) {%>
    <font color="#FF0000" size="1">Deleted</font>
    <%}%>
</td>
<td nowrap="nowrap" valign="top">
	<integro:empty-if-null value="<%=collCodeDescMap.get(obcol.getCollateralCode()) %>"/>
</td>
<td nowrap="nowrap" valign="top">
    <integro:empty-if-null value="<%=obcol.getCollateralType().getTypeName()%>"/>/
    <integro:empty-if-null value="<%=obcol.getCollateralSubType().getSubTypeName()%>"/>
</td>

<%-- 
<td nowrap="nowrap" valign="top"><integro:empty-if-null value="<%=customerCategory%>"/>&nbsp;</td>

<% for (int k = 0; k < ctryLbls.size(); k++) {
    if ((obcol.getCollateralLocation() != null) && (obcol.getCollateralLocation()).equals(ctryVals.get(k))) {  //if this value not in selected value print..
        collaterallocation = (String) ctryLbls.get(k);
%>
<%
        }
    }
%>

<td nowrap="nowrap" valign="top"><integro:empty-if-null value="<%=collaterallocation%>"/>&nbsp;</td>
--%><td nowrap="nowrap" valign="top">
     <integro:empty-if-null value="<%=countryCodeNameMap.get(obcol.getCollateralLocation())%>"/>
</td>

<td nowrap="nowrap" valign="top">
   <integro:empty-if-null value="<%=sysBankBranchCodeNameMap.get(obcol.getSecurityOrganization())%>"/>
</td>




<td nowrap="nowrap" valign="top">
    <integro:empty-if-null value="<%=obcol.getCurrencyCode()%>"/>
</td>
<td nowrap="nowrap" valign="top">
      <%if(obcol.getSecPriority()!=null){ %>
              	 <%=obcol.getSecPriority().equalsIgnoreCase("y")?"Primary":"Secondary"%>&nbsp;
              	 <%} else { %>
              	 -
              	 <%} %>
</td>

<%--
<%
    String securityOrg = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, obcol.getSecurityOrganization());%>
<td nowrap="nowrap" valign="top"><integro:empty-if-null value="<%=securityOrg%>"/>&nbsp;</td>
--%>
<td valign="top" class="amount"><integro:amount amount="<%=obcol.getCMV()%>" locale="<%=locale%>" decimal="2" />&nbsp;</td>
<%-- <td valign="top" class="amount"><integro:amount amount="<%=fsvAmt%>" locale="<%=locale%>" decimal="2" />&nbsp;</td>--%>

<%
    String limitRefSec[] = new String[arrayListforOBLimit.size()];
	String limitSecName[] = new String[arrayListforOBLimit.size()];
    String secLimitLinkage[] = new String[arrayListforOBLimit.size()];
    String productDesc[] = new String[arrayListforOBLimit.size()];
    String outerLimitRefSec[] = new String[arrayListforOBLimit.size()];
    String innerLimitID[] = new String[arrayListforOBLimit.size()];
    String limitSecCov[] = new String[arrayListforOBLimit.size()];
    boolean innerOuterSameBCA[] = new boolean[arrayListforOBLimit.size()];
    int counter = 0;
    if (isCoBorrowerInd) {
        for (int k = 0; k < newarrayList.size(); k++) {
            obCoBorrowerLimit[k] = (OBCoBorrowerLimit) newarrayList.get(k);
            if (obCoBorrowerLimit[k] != null) {
                if (obCoBorrowerLimit[k].getCollateralAllocations() != null) {
                    for (int m = 0; m < obCoBorrowerLimit[k].getCollateralAllocations().length; m++) {
                        if (obCoBorrowerLimit[k].getCollateralAllocations()[m].getCollateral() != null) {
                            if (obCoBorrowerLimit[k].getCollateralAllocations()[m].getCollateral().getCollateralID() == obcol.getCollateralID()) {
                                if(obCoBorrowerLimit[k].getLimitRef()!=null && ICMSConstant.LONG_INVALID_VALUE!=Long.parseLong(obCoBorrowerLimit[k].getLimitRef()))
								{
                                	limitRefSec[counter] = obCoBorrowerLimit[k].getLimitRef();
								}
                                else
                                	limitRefSec[counter] = "-";
                                if (obCoBorrowerLimit[k].getCollateralAllocations()[m].getHostStatus() != null && obCoBorrowerLimit[k].getCollateralAllocations()[m].getHostStatus().equals(ICMSConstant.HOST_STATUS_DELETE))
                                    secLimitLinkage[counter] = "<span class=deleted> "+ "Deleted" + " </span>";
                                else
                                    secLimitLinkage[counter] = "Active";

                                ILimitProxy limitproxy = LimitProxyFactory.getProxy();
                                ILimit limit = null;
                                if (obCoBorrowerLimit[k].getOuterLimitID() != ICMSConstant.LONG_INVALID_VALUE) {
                                    limit = limitproxy.getLimit(obCoBorrowerLimit[k].getOuterLimitID());
                                    productDesc[k] = limit.getProductCode();
                                    /*
                                    if (limit.getProductDesc() != null) {
                                        productDesc[k] = limit.getProductDesc()+"|"+(limit.getApprovedLimitAmount() != null ? limit.getApprovedLimitAmount().getCurrencyCode():"");
                                    }
                                    */
                                }

                                //if (CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.COMMON_CODE_PRODUCT_TYPE, productDesc[k]) != null)
                                    productDesc[counter] = CommonCodeList.getInstance(ICMSConstant.COMMON_CODE_PRODUCT_TYPE).getCommonCodeLabel(productDesc[k]);

                                if (obCoBorrowerLimit[k].getOuterLimitRef() != null) {
                                    outerid = obCoBorrowerLimit[k].getOuterLimitRef();
%>
<% if (outerid.equals("0")) {
	outerLimitRefSec[counter] = "-";
} else {
	outerLimitRefSec[counter] = obCoBorrowerLimit[k].getOuterLimitRef();
}
%>
<% } else {
	outerLimitRefSec[counter] = "-";
}
    innerLimitID[counter] = String.valueOf(obCoBorrowerLimit[k].getLimitID());
    //				innerOuterSameBCA[counter]=oblimit[k].getIsInnerOuterSameBCA();
%>
<% counter++;

}    //end of
}  // end of    if(oblimit[k].getCollateralAllocations()[m].getCollateral()!=null)
}    // end of for
}//end of  if( oblimit[k].getCollateralAllocations()!=null)
}     // end of     if(oblimit[k]!=null)
} // end of for
}


    if (!isCoBorrowerInd) {
        for (int k = 0; k < newarrayList.size(); k++) {
            oblimit[k] = (OBLimit) newarrayList.get(k);
            if (oblimit[k] != null) {
                if (oblimit[k].getCollateralAllocations() != null) {
                    for (int m = 0; m < oblimit[k].getCollateralAllocations().length; m++) {
                        if (oblimit[k].getCollateralAllocations()[m].getCollateral() != null) {
                            if (oblimit[k].getCollateralAllocations()[m].getCollateral().getCollateralID() == obcol.getCollateralID()) {

								String sourceDescSec = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_SOURCE_SYSTEM, (oblimit[k].getSourceId() == null)?"":oblimit[k].getSourceId());
								limitRefSec[counter] = oblimit[k].getLimitRef() + ((sourceDescSec == null)?"":(" - " + sourceDescSec));
								limitSecName[counter] = oblimit[k].getFacilityName() ;
                                if (oblimit[k].getCollateralAllocations()[m].getHostStatus() != null && oblimit[k].getCollateralAllocations()[m].getHostStatus().equals(ICMSConstant.HOST_STATUS_DELETE))
                                    secLimitLinkage[counter] = "<span class=deleted> " + "Deleted" + "</span>";
                                else
                                    secLimitLinkage[counter] = "Active";

                                if (oblimit[k].getCollateralAllocations()[m].getLmtSecurityCoverage() != null){
                                	limitSecCov[counter] = oblimit[k].getCollateralAllocations()[m].getLmtSecurityCoverage();
                                }
                               // if (oblimit[k].getProductDesc() != null) {
                               //     if (CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, oblimit[k].getProductDesc().toString()) != null)
                                        productDesc[counter] = CommonCodeList.getInstance(ICMSConstant.COMMON_CODE_PRODUCT_TYPE).getCommonCodeLabel(oblimit[k].getProductCode());
                               // }

                                if (oblimit[k].getOuterLimitRef() != null) {
                                    outerid = oblimit[k].getOuterLimitRef();
%>
<% if (outerid.equals("0")) {
	outerLimitRefSec[counter] = "-";
} else {
	outerLimitRefSec[counter] = oblimit[k].getOuterLimitRef();
}
%>
<% } else {
	outerLimitRefSec[counter] = "-";
}
    innerLimitID[counter] = String.valueOf(oblimit[k].getLimitID());
    innerOuterSameBCA[counter] = oblimit[k].getIsInnerOuterSameBCA();
%>
<% counter++;

}    //end of
}  // end of    if(oblimit[k].getCollateralAllocations()[m].getCollateral()!=null)
}    // end of for
}//end of  if( oblimit[k].getCollateralAllocations()!=null)
}     // end of     if(oblimit[k]!=null)
} // end of for
} %>

<td nowrap="nowrap" valign="top" class="amount">
<%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=limitSecCov[k]%>"/>&nbsp;<br>&nbsp;<br>	
    <%}%>
</td>
<td nowrap="nowrap" valign="top">
    <%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=limitRefSec[k]%>"/>&nbsp;<br>&nbsp;<br>	
    <%}%>
</td>
<td nowrap="nowrap" valign="top">
    <%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=secLimitLinkage[k]%>"/>&nbsp;<br>&nbsp;<br>
    <%}%>
</td>
<td nowrap="nowrap">
<%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=limitSecName[k]%>"/>&nbsp;<br>&nbsp;<br>	
    <%}%>

</td>
<!-- Do later -->
<td valign="top" class="amount">&nbsp;-&nbsp;</td>
<%--

<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=productDesc[k]%>"/>&nbsp;<br>&nbsp;<br>
    <%}%>
</td>

<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {
        if (innerOuterSameBCA[k]) { %>
    <font color="000000">
        <integro:empty-if-null value="<%=outerLimitRefSec[k]%>"/>
    </font>&nbsp;<br>&nbsp;<br>
    <% } else { %>
    <font color="000000">
        <integro:empty-if-null value="<%=outerLimitRefSec[k]%>"/>
    </font>&nbsp;<br>&nbsp;<br>
    <% } %>
    <% }%>
</td>
--%>
<% String status = "No";
    if (obcol.getIsPerfected())
        status = "Yes";
%>

<!-- for R1.3 CR013 -->
<%
    HashMap bcaInfoMisc = null;
%>
<%--
<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {
        bcaInfoMisc = (HashMap) custResHash.get(String.valueOf(innerLimitID[k]));
        if (bcaInfoMisc != null) {
            //DefaultLogger.debug(this,"1> limitID ="+innerLimitID[k]+"\t bcaInfo ="+bcaInfoMisc);%>
    <%=((((String) bcaInfoMisc.get("leId")) == null) ? " " : ((String) bcaInfoMisc.get("leId")))%>&nbsp;<br>
    <%=((((String) bcaInfoMisc.get("custName")) == null) ? " " : ((String) bcaInfoMisc.get("custName")))%>&nbsp;<br>
    <% } else {%>
    &nbsp;<br>&nbsp;<br>
    <% } %>
    <% }%>
</td>

<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {
        bcaInfoMisc = (HashMap) custResHash.get(String.valueOf(innerLimitID[k]));
        if (bcaInfoMisc != null) {
            //DefaultLogger.debug(this,"2> limitID ="+innerLimitID[k]+"\t bcaInfo ="+bcaInfoMisc);%>
    <%=((((String) bcaInfoMisc.get("bcaRef")) == null) ? " " : ((String) bcaInfoMisc.get("bcaRef")))%>&nbsp;<br>
    <%=((((String) bcaInfoMisc.get("bkgLoc")) == null) ? " " : cList.getCountryName((String) bcaInfoMisc.get("bkgLoc")))%>
    &nbsp;<br>
    <% } else {%>
    &nbsp;<br>&nbsp;<br>
    <% }%>
    <% }%>
</td>
--%>

<!-------------------->
<%-- 
<td nowrap="nowrap" valign="top">
    <integro:empty-if-null value="<%=status%>"/> &nbsp;
</td>
--%>
<% SubType = obcol.getCollateralSubType().getSubTypeCode();
    path = SecuritySubTypeUtil.getUrl(SubType, 2);
    path = path + "&collateralID=" + obcol.getCollateralID();
%>

<!--<td valign="top"><a href="<%=path%>">View/Re-value</a>-->
<!--</td>-->

<%}%>
</tr>

</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
<%} else { %>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td><h3>Securities List</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
    <tr>&nbsp;</tr>
    </thead>
    <tbody>
        <tr class="odd">
            <td style="text-align:center" valign="middle">
                <table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="even" style="text-align:center" valign="middle">
                                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                    <tr class="even">
                                        <td style="border:none;text-align:center"><strong><img src="img/info.gif"/>
                                        </strong></td>
                                    </tr>
                                    <tr class="even">
                                        <td style="border:none;text-align:center">
                                          <strong><font size="2"><br/><bean:message key="label.global.not.found"/></font></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>&nbsp;</tr>
    </tbody>
</table>
<%} %>
<!--</html:form>-->
<!-- InstanceEndEditable -->

<tr>
    <%  if(transactionID!=null){%>
   <td align="center"><a href="ToDo.do?event=customertodo&transactionID=<%=transactionID%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  <%} else {%>
    <td  align="center" ><a href="CustomerProcess.do?event=viewLimitProfile" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
    <%}%>
  </tr>
	
</table>


</td>
</tr>
</tbody>
</table>
</html:form>
