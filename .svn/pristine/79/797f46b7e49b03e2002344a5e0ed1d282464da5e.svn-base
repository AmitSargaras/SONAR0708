<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
				 com.integrosys.cms.app.customer.bus.ICMSCustomer,
				 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    String lableView ="Update" ;
    CountryList cList = CountryList.getInstance();
    boolean isFromCustodian=false; //invoked by custodian module events...
    if(request.getParameter("event")!=null && request.getParameter("event").equals("cust_list")){
        isFromCustodian=true;
    }
    ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isCPCChecker=false;
  	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPC_CHECKER){
                    isCPCChecker = true;
                    lableView ="View " ;
                    break TOP_LOOP;
                }
            }
        }
  	}        
%>
<%
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
    ICMSCustomer iCustomer =
            (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    //boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_CPC_MAKER == CheckListUtil.getTeamType(userTeam, user);
    //boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == CheckListUtil.getTeamType(userTeam, user);
    boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
    	    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
    //DefaultLogger.debug(this, ">>>>>>>> TEAM TYPE = " + CheckListUtil.getTeamType(userTeam, user));
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
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function maintain(checkListID,legalID,custCategory,limitBkgLoc,legalConstitution){
    formObj = document.forms["CCReceiptForm"];
    formObj.event.value="prepare_update";
    formObj.checkListID.value = checkListID;
    formObj.legalID.value = legalID;
    formObj.custCategory.value = custCategory;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.legalConstitution.value = legalConstitution;
    formObj.submit();

}

function view(checkListID,legalID,custCategory,limitBkgLoc,legalConstitution){
    formObj = document.forms["CCReceiptForm"];
    formObj.event.value="view";
    formObj.checkListID.value = checkListID;
    formObj.legalID.value = legalID;
    formObj.custCategory.value = custCategory;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.legalConstitution.value = legalConstitution;
    formObj.submit();

}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCReceipt.do" >
<input type="hidden" name="event" />
<input type="hidden" name="checkListID" />
<input type="hidden" name="limitBkgLoc" />
<input type="hidden" name="legalConstitution" />
<input type="hidden" name="legalID" />
<input type="hidden" name="custCategory" />

<html:hidden property="limitProfileID" />




<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>
          <%
             if(isViewFlag == true){
          %>
               <bean:message key="title.ccdoc.doc.receipt.view"/>
          <%
             }else{
          %>
               <bean:message key="title.ccdoc.doc.receipt.update"/> 
          <%
             }
          %>
    <%
        //---- commented below, to read from isViewFlag --
        /* if (!isFromCustodian){
            out.write(lableView + " Constitutional / Contractual Checklist") ;
        }else{
            out.write(lableView + " Constitutional / Contractual Doc") ;
       } */
    %>
    </h3></td>
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
              <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="7%"><bean:message key="label.document.checklistID"/></td>
              <td width="9%"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td width="9%"><bean:message key="label.ccdoc.docitem.cif"/></td>
              <td width="17%"><bean:message key="label.ccdoc.docitem.custName"/></td>
              <td width="8%"><bean:message key="label.document.status"/></td>
              <td width="10%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          <tbody>
<logic:present name="colChkLst"  scope="request" >
   <logic:iterate id="OB" name="colChkLst"  type="com.integrosys.cms.app.checklist.bus.CCCheckListSummary"  scope="request" >
<%
    String rowClass = "";
    row++;
    if (row % 2 != 0) {
        rowClass = "odd";
    } else {
        rowClass = "even";
    }

    boolean displayBCALoc = !OB.getCustCategory().equals(ICMSConstant.CHECKLIST_MAIN_BORROWER);
    String countryName = cList.getCountryName(OB.getDomicileCtry());
    String orgCode = "-";
    if (OB.getOrgCode() != null) {
        orgCode = OB.getOrgCode();
        orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, orgCode);
    }

    String categoryLabel = PropertyManager.getValue("cc.category." + OB.getCustCategory());
    categoryLabel = (categoryLabel == null) ? OB.getCustCategory() : categoryLabel;

%>
        <tr class="<%=rowClass%>">
              <td class="index" valign="top" ><%=row%></td>
              <td valign="top"><%=OB.getCheckListID()!=ICMSConstant.LONG_INVALID_VALUE ? String.valueOf(OB.getCheckListID()) : "-"%></td>
              <td valign="top" >&nbsp;<%=categoryLabel%></td>
              <% if ((OB.getLegalID() == null) || (OB.getLegalID().equals("0"))) {%>
              <td valign="top" >&nbsp;<%= "-"%>
              <% } else { %>
              <td valign="top" >&nbsp;<%=OB.getLegalID()%>
              <% }%>
<%--
              <% if (OB.getPledgorReference() != null) {
              %><br><%= OB.getPledgorReference()%>
              <%}%>
--%>            
              </td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="legalName" /></td>
             <!-- <td valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td> 
                <td valign="top" >&nbsp;<integro:empty-if-null value="<%=orgCode%>" /></td> 
                <td valign="top" >&nbsp;<bean:write name="OB" property="governLaw" /></td> -->
              <td valign="top" >&nbsp;<%=(PropertyManager.getValue("chklist.status." + OB.getCheckListStatus()) ==null) ?
                    OB.getCheckListStatus() : PropertyManager.getValue("chklist.status." + OB.getCheckListStatus())%>
              </td>
              <td valign="top" >
<%
boolean canMaintainCheckList=false;
boolean canView=false;

if(isInCountry&&OB.getSameCountryInd()&&isUserCpcMaker)
{
canMaintainCheckList=true;
}//in country same country

if(isInCountry&&!OB.getSameCountryInd()&&OB.getTrxStatus()!=null&&OB.getTaskTrx()==null&&isUserCpcMaker)
{
canMaintainCheckList=true;
}//in country not same country

if(!isInCountry&&OB.getSameCountryInd()&&OB.getTaskTrx()!=null&&!ICMSConstant.STATE_PENDING_REJECT.equals(OB.getTaskTrx(). getStatus())&&isUserCpcMaker)
{
canMaintainCheckList=true;
}//out country  same country
			
if(OB.getTrxStatus()!=null && !canMaintainCheckList)
{
	canView=true;
}

%>

              <%
              if(!isFromCustodian){     //by default not from custodian events....%>
              <%if(OB.getSameCountryInd()){

                          /* //This chunk of codes is not applicable for this project
                            if (limitProfile == null || limitProfile.getTATCreateDate() != null ||
                            ICMSConstant.STATE_DELETED.equals(limitProfile.getBCAStatus()) ){
							*/
                                if(canMaintainCheckList){
                                DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>>>>> should come in here - 2!");
                      %>
                            <a href="#" onClick="maintain('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                        '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >Update
                            </a>
                        <% //}
						} else if (OB.getCheckListID() != ICMSConstant.LONG_MIN_VALUE) { %>
                            <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                    '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                            </a>
                        <% } %> &nbsp;
              <%}else{
						   if(isInCountry&&isUserCpcMaker)						   
						   {
						   if(canMaintainCheckList){
						   %>
                   <a href="#" onClick="maintain('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
             '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >Update
                   </a>   
						  <%}
						   if(canView)
						   {%>
						    <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                        '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                                </a>
						  <%						
						   }						  
						  %>
						  <%
						  }else if (isCPCChecker &&
                                (limitProfile == null || limitProfile.getTATCreateDate() != null ||
                                                         ICMSConstant.STATE_DELETED.equals(limitProfile.getBCAStatus()))) {
                        %>
                                <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                        '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                                </a>
                        <% } else { %>
                                <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                        '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                                </a>
                        <% }} %>
                <%}else{    //gets here only if the evnt is driven by custodian module...%>
                <%if (OB.getCheckListID() != ICMSConstant.LONG_MIN_VALUE) { %>
                <a href="custodian.do?event=cc_doc_list&checklistid=<%=OB.getCheckListID()%>&instructionLoc=<%=OB.getDomicileCtry()%>&displayBCA=<%=displayBCALoc%>" >Update</a>
                <%}else {%>
                -
              <%}}%>
			  &nbsp;
              </td>
            </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="colChkLst" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>

<%--
        <br>
        <thead>
            <tr>
              <td><h3>
            <%  if (!isFromCustodian){
                out.write(lableView + " Deleted Constitutional / Contractual Checklist") ;
            }else{
                out.write(lableView + " Deleted Constitutional / Contractual Doc") ;
            }
            %>        
        </h3></td>
            </tr>
            <tr>
              <td><hr /></td>
            </tr>
        </thead>
        <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="5%">S/N</td>
              <td width="7%">Checklist ID</td>
              <td width="9%">Customer Category</td>
              <td width="9%">LE ID/Pledgor ID</td>
              <td width="17%">Legal Name</td>
              <td width="11%">Instr Bkg Loc Ctry</td>
              <td width="12%">Organisation Code</td>
              <td width="12%">Governing Law</td>
              <td width="8%">Status</td>
              <td width="10%">Action</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="delColChkLst"  scope="request" >
   <logic:iterate id="OB" name="delColChkLst"  type="com.integrosys.cms.app.checklist.bus.CCCheckListSummary"  scope="request" >
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    String countryName = cList.getCountryName(OB.getDomicileCtry());
    String orgCode = OB.getOrgCode();
    orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,orgCode);
   %>
        <tr class="<%=rowClass%>">
              <td class="index" valign="top" ><%=row%></td>
              <td valign="top"><%=OB.getCheckListID()!=ICMSConstant.LONG_INVALID_VALUE ? String.valueOf(OB.getCheckListID()) : "-"%></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="custCategory" /></td>
              <% if ((OB.getLegalID() == null) || (OB.getLegalID().equals("0")))  {%>
              <td valign="top" >&nbsp;<%= "-"%>
              <% } else { %>
              <td valign="top" >&nbsp;<%=OB.getLegalID()%>
              <% } 
                if (OB.getPledgorReference() != null) {
              %><br><%= OB.getPledgorReference()%>
              <%}%>
              </td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="legalName" /></td>
              <td valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>
              <td valign="top" >&nbsp;<integro:empty-if-null value="<%=orgCode%>" /></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="governLaw" /></td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="checkListStatus" /></td>
              <td valign="top" >
              <% if(!isFromCustodian){  //by default not from custodian events....%>
                  <%if(OB.getSameCountryInd()) {
                                  if (limitProfile == null || limitProfile.getTATCreateDate() != null ||
                                                              ICMSConstant.STATE_DELETED.equals(limitProfile.getBCAStatus()) ){
                                        %>
                                        <a href="#" onClick="maintain('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                                    '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >Update
                                        </a>
                                    <% } else if (OB.getCheckListID() != ICMSConstant.LONG_MIN_VALUE) { %>
                                        <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                                '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                                         </a>
                                    <% } %> &nbsp;
                    <% } else{
					  if(isInCountry&&isUserCpcMaker)						   
						   {%>
                   <a href="#" onClick="maintain('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
             '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >Update
                   </a>   
		<%}else if (isCPCChecker &&(limitProfile == null || limitProfile.getTATCreateDate() != null ||
                                                ICMSConstant.STATE_DELETED.equals(limitProfile.getBCAStatus()))) {
                        %>
                                <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                    '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                            </a>
                        <% } else { %>
                                <a href="#" onClick="view('<%=OB.getCheckListID()%>','<%=OB.getSubProfileID()%>',
                                                        '<%=OB.getCustCategory()%>','<%=OB.getLimitBkgLoc()%>','<%=OB.getLegalConstitution()%>')" >View
                        <% }
                   } %>
               <%}else{     //gets here only if the evnt is driven by custodian module...%>
                        <%if (OB.getCheckListID() != ICMSConstant.LONG_MIN_VALUE) { %>
                                <a href="custodian.do?event=cc_doc_list&checklistid=<%=OB.getCheckListID()%>&instructionLoc=<%=OB.getDomicileCtry()%>&displayBCA=true" >Update</a>
                        <%}else{%>
                           -
                        <%}
                }%>
              </td>
            </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="delColChkLst" >
            <tr class="odd">
              <td colspan="10">There is no deleted checklist(s)</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
--%>

</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
