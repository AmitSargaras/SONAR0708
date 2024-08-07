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
    java.util.HashMap custResHash = (java.util.HashMap)request.getAttribute("innerOuterBcaObList");
	if(custResHash==null){
		custResHash = new java.util.HashMap();
	}
%>
<%
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	String bankingMethod = (String) request.getAttribute("bankingMethod");
	//System.out.println("bankingmethod---->"+bankingMethod);
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

    Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
    CheckListSearchResult camCheckList = (CheckListSearchResult)request.getAttribute("paripassuCheckList");
   String paripassuStatus;
   String paripassuLocation;
   String paripassuChecklistId;
   String paripassuCheckListType;
   //System.out.println("dfdfdf"+camCheckList);
   if(camCheckList!=null){
	    paripassuStatus=camCheckList.getCheckListStatus();
	    paripassuLocation=camCheckList.getCheckListLocation().getCountryCode();
	    paripassuChecklistId=String.valueOf(camCheckList.getCheckListID());
	    paripassuCheckListType=camCheckList.getCheckListType();
   }else{
	   paripassuStatus="NEW";
	    paripassuLocation="IN";
	    paripassuChecklistId="-999999999";
	    paripassuCheckListType="PARIPASSU";
   }
   // long camCheckListID = Long.parseLong(tcamCheckListID);
   // System.out.println("cam checklist id :::::::::::"+camCheckList );
    boolean isViewFlag = isViewFlagObj.booleanValue();
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
    formObj = document.forms["CAMCheckListForm"];
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
    formObj = document.forms["CAMCheckListForm"];
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
    formObj = document.forms["CAMCheckListForm"];
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
    formObj = document.forms["CAMCheckListForm"];
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
<html:form action="CAMCheckList.do" >
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
              PariPassu Document
              <%
                  }else{
              %>
             View Maintain PariPassu Document
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
    <%if(bankingMethod.equalsIgnoreCase("SOLE")||bankingMethod.equalsIgnoreCase("OUTSIDEMULTIPLE")||bankingMethod.equalsIgnoreCase("OUTSIDECONSORTIUM")){%>
		<tr class="odd">
					<td colspan="10">
					<bean:message key="label.paripassu.sole" />
					</td>
		</tr>
<%}
else
{%>
    <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
             <td width="3%"><bean:message key="label.global.sn"/></td>
             <td width="7%">CheckList Id</td>
             <td width="7%">CheckList Type</td>
            
              <td width="7%">CheckList Status</td>
       
              <td width="9%"><bean:message key="label.global.action"/></td>                    
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
              	<td valign="top" >&nbsp;<%=paripassuChecklistId %></td>
              	<td valign="top" >&nbsp;<%=paripassuCheckListType %></td>
              	<td valign="top" >&nbsp;<%=paripassuStatus%></td>	
              	<td valign="top" >&nbsp;



   
        <a href="MaintainPariPassuCheckListAction.do?event=view_maintain&&limitBkgLoc=IN&&orgCode=000&&checkListID=<%=paripassuChecklistId %>&&secType=PARIPASSU&&secSubType=PARIPASSU"  ><bean:message key="label.view"/></a>
   
        
</td>    
              	
   </tr>
   
<% if(row==0){%>
            <tr class="odd">
              <td colspan="12"><bean:message key="error.security.nolink"/></td>
            </tr>
<%}
}%>         
 </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
