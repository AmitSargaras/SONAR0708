<%@ page import="java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.component.user.app.bus.ICommonUser,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.limit.bus.ILimitProfile, 
				 com.integrosys.cms.ui.checklist.CheckListUtil, 
				 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    int row = 0;
    CountryList cList = CountryList.getInstance();
    List ccList = (List)request.getAttribute("colChkLst");
%>
<%
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    ICMSCustomer iCustomer = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    //boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == CheckListUtil.getTeamType(userTeam, user);
    boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
    		||ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
    	    ||ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
    boolean isInCountry = false;

    Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
    boolean isViewFlag = isViewFlagObj.booleanValue();

    if (limitProfile != null) {
        isInCountry = CheckListUtil.isInCountry(userTeam, limitProfile);
    } else {
        isInCountry = CheckListUtil.isInCountry(userTeam, iCustomer);
    }

// OBCMSCustomer obCMSCustomer = (OBCMSCustomer)request.getAttribute("customerOb");
// String ss = obCMSCustomer.getCMSLegalEntity().getLEReference();
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

function maintain(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType){
    formObj = document.forms["CCCheckListForm"];
    formObj.event.value="maintain";
    formObj.checkListID.value = checkListID;
    formObj.legalID.value = legalID;
    formObj.custCategory.value = custCategory;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.legalConstitution.value = legalConstitution;
    formObj.law.value = law;
    formObj.sameCountryInd.value = sameCountryInd;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}
function maintain_out(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType){
    formObj = document.forms["CCCheckListForm"];
    formObj.event.value="dispatch";
    formObj.checkListID.value = checkListID;
    formObj.legalID.value = legalID;
    formObj.custCategory.value = custCategory;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.legalConstitution.value = legalConstitution;
    formObj.law.value = law;
    formObj.sameCountryInd.value = sameCountryInd;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

function view(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType){
    formObj = document.forms["CCCheckListForm"];
    formObj.event.value="view";
    formObj.checkListID.value = checkListID;
    formObj.legalID.value = legalID;
    formObj.custCategory.value = custCategory;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.legalConstitution.value = legalConstitution;
    formObj.law.value = law;
    formObj.sameCountryInd.value = sameCountryInd;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

function delete_checklist(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType){
    formObj = document.forms["CCCheckListForm"];
    formObj.event.value="delete";
    formObj.checkListID.value = checkListID;
    formObj.legalID.value = legalID;
    formObj.custCategory.value = custCategory;
    formObj.limitBkgLoc.value = limitBkgLoc;
    formObj.orgCode.value = orgCode;
    formObj.legalConstitution.value = legalConstitution;
    formObj.law.value = law;
    formObj.sameCountryInd.value = sameCountryInd;
    formObj.applicationType.value = applicationType;
    formObj.submit();
}

/*
function perform(selObj, checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType)
{
    temp = selObj.options[selObj.selectedIndex].value;
    if(temp=="") {
        return false;
    }
    else{
        if (temp == "maintain") 
        {
            maintain(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType);
         }
		else if (temp=="maintain_out")
			 {
	         maintain_out(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType);
			 }
		else if (temp == "delete") 
		     {
             delete_checklist(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType);
             }
        else
             {
              view(checkListID,legalID,custCategory,limitBkgLoc,orgCode,legalConstitution,law,sameCountryInd,applicationType);
             }
    }
}  */

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCCheckList.do" >
<input type="hidden" name="event" />
<input type="hidden" name="checkListID" />
<input type="hidden" name="limitBkgLoc" />
<input type="hidden" name="orgCode" />
<input type="hidden" name="legalConstitution" />
<input type="hidden" name="law" />
<input type="hidden" name="sameCountryInd" />
<input type="hidden" name="applicationType" />
<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td>
          <h3>
              <%
                 if(isViewFlag == true){
              %>
                  <bean:message key="title.ccdoc.doc.checklist.view"/>
              <%
                 }else{
              %>
                  <bean:message key="title.ccdoc.doc.checklist.maintain"/> 
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
              <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="20%"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td width="20%"><bean:message key="label.ccdoc.docitem.cif"/></td>
              <td width="25%"><bean:message key="label.ccdoc.docitem.custName"/></td>
              <td width="10%"><bean:message key="label.document.status"/></td>
              <td width="15%"><bean:message key="label.global.action"/></td>
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
    String countryName = cList.getCountryName(OB.getDomicileCtry());
    String orgCode = OB.getOrgCode();

    orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, orgCode);
    String categoryLabel = PropertyManager.getValue("cc.category." + OB.getCustCategory());
    categoryLabel = (categoryLabel == null) ? OB.getCustCategory() : categoryLabel;

%>
        <tr class="<%=rowClass%>">
              <td class="index" valign="top" ><%=row%></td>
              <td valign="top" >&nbsp;<%=categoryLabel%></td>
              <% if ((OB.getLegalID() == null) || (OB.getLegalID().equals("0")))
                 {%>
              <td valign="top" >&nbsp;<%= "-"%>
              <% } else { %>
              <td valign="top" >&nbsp;<%=OB.getLegalID()%>
              <% } %> 
              <%--
               <% if (OB.getPledgorReference() != null)
                {
              %><br><%= OB.getPledgorReference()%>
              <%}%>
				--%>
              </td>
              <td valign="top" >&nbsp;<bean:write name="OB" property="legalName" /></td>
              <td valign="top" >&nbsp;<%=(PropertyManager.getValue("chklist.status." + OB.getCheckListStatus()) ==null) ?
                    OB.getCheckListStatus() : PropertyManager.getValue("chklist.status." + OB.getCheckListStatus())%>
              </td>
              <td valign="top" >

       <%
String locCode = OB.getDomicileCtry();
if (ICMSConstant.CHECKLIST_MAIN_BORROWER.equals(OB.getCustCategory()))
{
	locCode = OB.getLimitBkgLoc();
}
	  %>
		


<%
boolean canDisableTask=false;
boolean canMaintainCheckList=false;
boolean canDelete=false;
boolean canView=false;


if(isInCountry&&!OB.getSameCountryInd()&&OB.getTrxStatus()==null&&OB.getTaskTrx()==null&&isUserCpcMaker)
{
canDisableTask=true;
}

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

if(OB.getSameCountryInd()&&
   OB.getAllowDeleteInd())
  //ICMSConstant.STATE_CHECKLIST_DELETED.equals(OB.getCheckListStatus())&& - CMS-3471  
  // Not checkling for Checklist Status as AllowDeleteInd is set based on items deleted or perm-uplifted
{
canDelete=true;
}

if(OB.getTrxStatus()!=null && !canDelete && !canMaintainCheckList)
{
canView=true;
}

boolean  displayDropDown=true;
if(!canDisableTask&&!canMaintainCheckList&&!canDelete&&!canView)
{
displayDropDown=false;
}
%>
<%if(displayDropDown){%>

    <%
    if(canDisableTask || canMaintainCheckList || canDelete){
    %>
        <a href="#" onClick="maintain('<%=OB.getCheckListID()%>', '<%=OB.getSubProfileID()%>','<%=OB.getCustCategory()%>','<%=locCode%>','<%=OB.getOrgCode()%>','<%=OB.getLegalConstitution()%>', '<%=OB.getGovernLaw()%>', '<%=OB.getSameCountryInd()%>','<%=OB.getApplicationType()%>')" ><bean:message key="label.process"/></a>
    <%
    }else if(canView){
    %>
        <a href="#" onClick="view('<%=OB.getCheckListID()%>', '<%=OB.getSubProfileID()%>','<%=OB.getCustCategory()%>','<%=locCode%>','<%=OB.getOrgCode()%>','<%=OB.getLegalConstitution()%>', '<%=OB.getGovernLaw()%>', '<%=OB.getSameCountryInd()%>','<%=OB.getApplicationType()%>')" ><bean:message key="label.view"/></a>
    <%
    }
    %>

<!--Does not need by Alliance, commented the whole block-->
<!--[Start] -->
<!--<select name="menu2" onChange="perform(this, '<%//=OB.getCheckListID()%><!--', '--><%//=OB.getSubProfileID()%><!--', '--><%//=OB.getCustCategory()%><!--','--><%//= locCode%><!--','--><%//= OB.getOrgCode()%><!--','--><%//=OB.getLegalConstitution()%><!--','--><%//=OB.getGovernLaw()%><!--','--><%//=OB.getSameCountryInd()%><!--', '--><%//=OB.getApplicationType()%><!--')"-->
<!--                  <option value="" selected>Please Select</option> -->
                  <%//if(canDisableTask){%>
<!--                  <option value="maintain">Maintain Checklist</option> -->
                   <%//}%>
				 <%//if(canMaintainCheckList){%>
<!--                  <option value="maintain">Maintain Checklist</option> -->
                  <%//}%>
				  <%//if(canDelete){%>
<!--                  <option value="delete">Delete Checklist</option>  -->
                  <%//}%>
				  <%//if(canView){%>
<!--                  <option value="view">View Checklist</option> -->
                  <%//}%>
 <!--</select>-->
 <!--[End] -->    
 <%}else{out.print("&nbsp;-");}%>     

              </td>
            </tr>
</logic:iterate>
</logic:present>

<!-- <logic:notPresent name="colChkLst" > -->
<!-- </logic:notPresent> -->

<%	//bernard - the above doesn't work, changed to the condition below
	if (ccList==null || ccList.size()<1)
	{
%>
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
<%	}
%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
