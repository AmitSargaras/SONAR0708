<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.customer.bus.ICustomerSearchResult,
                 java.util.Collection,
                 java.util.HashMap,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.component.user.app.bus.ICommonUser,
				 com.integrosys.cms.ui.checklist.CheckListUtil, 
				 com.integrosys.cms.app.limit.bus.ILimitProfile,
				 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
int row2 = 0;
    CountryList cList = CountryList.getInstance();
    java.util.HashMap custResHash = (java.util.HashMap)request.getAttribute("innerOuterBcaObList");
	if(custResHash==null){
		custResHash = new java.util.HashMap();
	}
%>
<%
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);

    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    boolean isInCountry = CheckListUtil.isInCountry(userTeam, limitProfile);
    //boolean isUserCpcMaker=ICMSConstant.TEAM_TYPE_CPC_MAKER==CheckListUtil.getTeamType(userTeam,user);

    boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
    	    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
    Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
    CheckListSearchResult recurrentDocCheckList = (CheckListSearchResult)request.getAttribute("recurrentDocCheckList");
    ArrayList migCheckList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.migCheckList");
   String recurrentDocStatus;
   String recurrentDocLocation;
   String recurrentDocChecklistId;
   String recurrentDocCheckListType;
   if(recurrentDocCheckList!=null){
	    recurrentDocStatus=recurrentDocCheckList.getCheckListStatus();
	    recurrentDocLocation=recurrentDocCheckList.getCheckListLocation().getCountryCode();
	    recurrentDocChecklistId=String.valueOf(recurrentDocCheckList.getCheckListID());
	    recurrentDocCheckListType=recurrentDocCheckList.getCheckListType();
   }else{
	   recurrentDocStatus="NEW";
	    recurrentDocLocation="IN";
	    recurrentDocChecklistId="-999999999";
	    recurrentDocCheckListType="REC";
   }
   // long recurrentDocCheckListID = Long.parseLong(trecurrentDocCheckListID);
  //  System.out.println("recurrentDoc checklist id :::::::::::"+recurrentDocCheckList );
    boolean isViewFlag = isViewFlagObj.booleanValue();
    
    //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    boolean isActive=true;
    if(null!=customer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(customer.getStatus())){
    isActive=false;
    	}
    
    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
  //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
  %>



<%@page import="com.integrosys.cms.app.checklist.bus.CheckListSearchResult"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function maintain(checkListID,secType,secSubType,limitBkgLoc,orgCode, collateralID, custCategory, subprofileID, applicationType){
    formObj = document.forms["RecurrentDocCheckListForm"];
    formObj.event.value="maintain";
    formObj.checkListID.value = checkListID;
    formObj.secType.value = secType;
    formObj.secSubType.value = secSubType;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.collateralID.value = collateralID;
    formObj.custCategory.value = custCategory;
    formObj.legalID.value = subprofileID;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

function maintain_out(checkListID,secType,secSubType,limitBkgLoc,orgCode, collateralID, custCategory, subprofileID, applicationType){
    formObj = document.forms["RecurrentDocCheckListForm"];
	formObj.event.value="disable_security_col_task";
    formObj.checkListID.value = checkListID;
    formObj.secType.value = secType;
    formObj.secSubType.value = secSubType;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.collateralID.value = collateralID;
    formObj.custCategory.value = custCategory;
    formObj.legalID.value = subprofileID;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

function view(checkListID,secType,secSubType,limitBkgLoc,orgCode,collateralID, custCategory, subprofileID, applicationType){
    formObj = document.forms["RecurrentDocCheckListForm"];
    formObj.event.value="view";
    formObj.checkListID.value = checkListID;
    formObj.secType.value = secType;
    formObj.secSubType.value = secSubType;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.collateralID.value = collateralID;
    formObj.custCategory.value = custCategory;
    formObj.legalID.value = subprofileID;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

function delete_checklist(checkListID,secType,secSubType,limitBkgLoc,orgCode, collateralID, custCategory, subprofileID, applicationType){
    formObj = document.forms["RecurrentDocCheckListForm"];
    formObj.event.value="delete";
    formObj.checkListID.value = checkListID;
    formObj.secType.value = secType;
    formObj.secSubType.value = secSubType;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.collateralID.value = collateralID;
    formObj.custCategory.value = custCategory;
    formObj.legalID.value = subprofileID;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

/*
function perform(selObj, checkListID,secType,secSubType,limitBkgLoc,orgCode,collateralID, custCategory, subprofileID, applicationType)
{
    temp = selObj.options[selObj.selectedIndex].value;
    if(temp=="") {
        return false;
    }
    else{
         if (temp == "maintain") {
                 maintain(checkListID,secType,secSubType,limitBkgLoc,orgCode,collateralID, custCategory, subprofileID, applicationType);
           }
		else if(temp == "maintain_out"){
		         maintain_out(checkListID,secType,secSubType,limitBkgLoc,orgCode,collateralID, custCategory, subprofileID, applicationType);
		   }
		else if (temp == "delete") {
                delete_checklist(checkListID,secType,secSubType,limitBkgLoc,orgCode,collateralID, custCategory, subprofileID, applicationType);
            }
        else{
                view(checkListID,secType,secSubType,limitBkgLoc,orgCode,collateralID, custCategory, subprofileID, applicationType);
            }
        
    }
} */

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="RecurrentDocCheckList.do" >
<input type="hidden" name="event" />
<input type="hidden" name="checkListID" />
<input type="hidden" name="limitBkgLoc" />
<input type="hidden" name="orgCode"/>
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="collateralID" />
<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="applicationType" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
          <h3>
              <%
                 if(isViewFlag == true){
              %>
              Recurrent Document
              <%
                  }else{
              %>
             Update Recurrent Document
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
             <td width="7%">CheckList Id</td>
             <td width="7%">CheckList Type</td>
            
<!--             <td width="9%"><bean:message key="label.document.security.location"/></td>-->
              <td width="7%">CheckList Status</td>
       
              <td width="9%"><bean:message key="label.global.action"/></td>
            
           <!-- 
              <td width="3%">S/N</td>
              <td width="7%">Limit ID</td>
              <td width="7%">RecurrentDoc ID</td>
              <td width="14%" nowrap>RecurrentDoc Type /<br />SubType</td>

              <td width="6%">Customer Category</td> 

              
              <td width="9%">LE ID /<br> Customer Name </td>
              <td width="9%">BCA Ref /<br> BCA Bkg Location</td>
              <td width="9%">Outer Limit ID</td>

              <td width="9%">RecurrentDoc Location</td>
			  <td width="9%">Organisation Code</td>

          	  <td width="9%">Status</td>
              <td width="9%">Action</td>
           --> 
            </tr>
          </thead>
          <tbody>
		 
   
   <%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
   
    
   %>
    <tr class="<%=rowClass%>">
              	<td class="index" valign="top" ><%=row%></td>
              	<%
              	if(recurrentDocChecklistId=="-999999999"){
              	%>
              	<td valign="top" >-&nbsp;</td>
              	<%}else{ %>
              	<td valign="top" >&nbsp;<%=recurrentDocChecklistId %></td>
              	<%} %>
              		<td valign="top" >&nbsp; <% if(recurrentDocCheckListType.equals("REC") ) {%>
              	Recurrent <%} %>

</td>
<!--              	<td valign="top" >&nbsp;<%=recurrentDocLocation%></td>-->
              	<td valign="top" >&nbsp;<%=recurrentDocStatus%></td>	
              	<td valign="top" >&nbsp;

	
              	<%
boolean canView=false;
boolean  displayDropDown=true;
if(!isUserCpcMaker ||  !isActive){
	canView=true;
}
if(recurrentDocCheckList==null){
	displayDropDown=false;
}
//if(recurrentDocCheckList.getTrxStatus()==null){
//	canView=true;
//}
//if(recurrentDocCheckList.getTrxStatus()!=null && !(recurrentDocCheckList.getTrxStatus().equals("ACTIVE"))){
	//canView=true;
//}

//System.out.println("---------canView----------"+canView);

%>

   <% if(displayDropDown){
	   if(canView){
	   %>
              
   <a href="RecurrentDocReceipt.do?event=view&&limitBkgLoc=IN&&orgCode=000&&checkListID=<%=recurrentDocChecklistId %>&&secType=O&&secSubType=O"  ><bean:message key="label.view"/></a>
        <%}else{ %>
          <a href="RecurrentDocReceipt.do?event=prepare_update&&limitBkgLoc=IN&&orgCode=000&&checkListID=<%=recurrentDocChecklistId %>&&secType=O&&secSubType=O"  ><bean:message key="label.process"/></a>
        <%} %>
   <%}else{ %>
&nbsp;-     
<%} %>

   
       
   
        
</td>    
              	
   </tr>
   
<% if(row==0){%>
            <tr class="odd">
              <td colspan="12"><bean:message key="error.security.nolink" /></td>
            </tr>
<%}%>         
 </tbody>
        </table></td>
    </tr>
    
   <tr>
      <td>
         &nbsp;
      </td>
    </tr>
    <tr>
      <td>
          <h3>
             
             Migrated Recurrent Document
              
          </h3>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
        <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
             <td width="3%"><bean:message key="label.global.sn"/></td>
             <td width="7%">Document Type</td>
             <td width="7%">Document Id</td>
              <td width="7%">Document Name</td>
             <td width="7%">Document Version</td>
       
              <td width="9%"><bean:message key="label.global.action"/></td>
            
           <!-- 
              <td width="3%">S/N</td>
              <td width="7%">Limit ID</td>
              <td width="7%">CAM ID</td>
              <td width="14%" nowrap>CAM Type /<br />SubType</td>

              <td width="6%">Customer Category</td> 

              
              <td width="9%">LE ID /<br> Customer Name </td>
              <td width="9%">BCA Ref /<br> BCA Bkg Location</td>
              <td width="9%">Outer Limit ID</td>

              <td width="9%">CAM Location</td>
			  <td width="9%">Organisation Code</td>

          	  <td width="9%">Status</td>
              <td width="9%">Action</td>
           --> 
            </tr>
          </thead>
          <tbody>
		 
   
   <%
    
   
  if(migCheckList!=null){
	  //System.out.println("migCheckList:"+migCheckList.size());
   for(int abn=0;abn<migCheckList.size(); abn++ ){
	   String[] Document2=new String[3];
	   Document2=(String[])migCheckList.get(abn);
	  String DocumentType=(String)Document2[0];
	  String DocumentId=(String)Document2[1];
	  String DocumentVersion=(String)Document2[2];
	  String DocumentName=(String)Document2[3];
  
    String rowClass2="";
    row2++;
    if(row2%2!=0){
       rowClass2="odd";
    }else{
       rowClass2="even";
    }
   
    
   %>
    <tr class="<%=rowClass2%>">
              	<td class="index" valign="top" ><%=row2%></td>
              	
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=DocumentType%>"/></td>
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=DocumentId %>"/></td>
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=DocumentName %>"/></td>
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=DocumentVersion%>"/></td>	
              	<td valign="top" >&nbsp;

	
              	

  
              
   <a href="RecurrentDocReceipt.do?event=view_mig_image_page&&documentID=<%=DocumentId %>&&documentType=<%=DocumentType %>&&documentVersion=<%=DocumentVersion%>"  >View Images</a>
        
    
</td>    
              	
   </tr>
   
<% }} if(row2==0){%>
            <tr class="odd">
              <td colspan="12"><bean:message key="error.security.nolink"/></td>
            </tr>
<%}%>         
 </tbody>
        </table></td>
    </tr>
    
    
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
