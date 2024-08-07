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

  //Uma:To Give Document's authorization right's to Branch User.
    boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)	
    || ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_BRANCH_MAKER == Long.parseLong(teamTypeMemID) 
    || ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_CPU_MAKER_II == Long.parseLong(teamTypeMemID)
    || ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH == Long.parseLong(teamTypeMemID);
    Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
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

function maintain(checkListID,secType,secSubType,limitBkgLoc,orgCode, collateralID, custCategory, subprofileID, applicationType){
	//alert(checkListID,secType,secSubType,limitBkgLoc,orgCode, collateralID, custCategory, subprofileID, applicationType);
    formObj = document.forms["SecurityCheckListForm"];
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
    formObj = document.forms["SecurityCheckListForm"];
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
    formObj = document.forms["SecurityCheckListForm"];
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
    formObj = document.forms["SecurityCheckListForm"];
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
<html:form action="SecurityCheckList.do" >
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
              <bean:message key="title.security.doc.view"/>
              <%
                  }else{
              %>
              <bean:message key="title.security.doc.checklist.maintain"/>
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
             <td width="7%"><bean:message key="label.security.docitem.source.securityID"/></td>
             <td width="7%">Collateral Name</td>
             <td width="14%" nowrap><bean:message key="label.security.docitem.securitytype"/><br /><bean:message key="label.security.docitem.subtype"/></td>
             <!-- Commented out for all regrdlesss on view or maintain page. This field is not needed by alliance
             <td width="10%">Security Name</td>
             -->
             <td width="9%"><bean:message key="label.document.security.location"/></td>
             <td width="9%"><bean:message key="label.document.status"/></td>
              <td width="9%"><bean:message key="label.global.action"/></td>
            
           <!-- 
              <td width="3%">S/N</td>
              <td width="7%">Limit ID</td>
              <td width="7%">Security ID</td>
              <td width="14%" nowrap>Security Type /<br />SubType</td>

              <td width="6%">Customer Category</td> 

              
              <td width="9%">LE ID /<br> Customer Name </td>
              <td width="9%">BCA Ref /<br> BCA Bkg Location</td>
              <td width="9%">Outer Limit ID</td>

              <td width="9%">Security Location</td>
			  <td width="9%">Organisation Code</td>

          	  <td width="9%">Status</td>
              <td width="9%">Action</td>
           --> 
            </tr>
          </thead>
          <tbody>
		<logic:present name="colChkLst"  scope="request" >
   <logic:iterate id="OB" name="colChkLst"  type="com.integrosys.cms.app.checklist.bus.CollateralCheckListSummary"  scope="request" >
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
    String custCategory = OB.getCustCategory();
    long subprofileID = OB.getSubProfileID();
    //System.out.println("::::::::::::::::::::::::::::::"+OB.getco);

   %>

        <tr class="<%=rowClass%>">
              	<td class="index" valign="top" ><%=row%></td>
             <!--  
              	<td valign="top" >
                  <%	if(OB.getCustCategory().equals(ICMSConstant.CHECKLIST_MAIN_BORROWER) && OB.getLimitList() != null && OB.getLimitList().length > 0){	%>
                		<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
                  			<integro:empty-if-null value="<%=subOb.getLimitRef()%>"/>&nbsp;<br>&nbsp;<br>
		                </logic:iterate>
              	<% 	}else if(OB.getCustCategory().equals(ICMSConstant.CHECKLIST_CO_BORROWER) && OB.getCoborrowerLimitList() != null && OB.getCoborrowerLimitList().length > 0){	%>
                      <logic:iterate id="cbLimit" name="OB" property="coborrowerLimitList" type="com.integrosys.cms.app.limit.bus.ICoBorrowerLimit" >
                            <integro:empty-if-null value="<%=cbLimit.getLimitRef()%>"/>&nbsp;<br>&nbsp;<br>
                      </logic:iterate>
              	<% 	} else { %>
                 		-
              	<% 	}  %>
                </td>
             --> 
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=OB.getCollateralRef()%>"/></td>
              	<td valign="top" >&nbsp;<integro:empty-if-null value="<%=OB.getCollateralName()%>"/></td>

                <td valign="top" >&nbsp;<bean:write name="OB" property="collateralType.typeName" /><br />
                	<bean:write name="OB" property="collateralSubType.subTypeName" />
              	</td>
                <%  //Commented out for all regrdlesss on view or maintain page. This field is not needed by alliance
                    //<td valign="top" >&nbsp;<bean:write name="OB" property="collateralName" /></td>
                %>

 <!--
                <td valign="top"><%=custCategory%></td>  

                
                <%
				java.util.HashMap bcaInfoMisc = null;
                %>
                
                <td nowrap="nowrap" valign="top" >
                <logic:present name="OB" property="limitList">
                	<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
						<%	bcaInfoMisc =(java.util.HashMap)custResHash.get(String.valueOf(subOb.getLimitID()));	
							if(bcaInfoMisc!=null){
               					//DefaultLogger.debug(this,"1> limitID ="+subOb.getLimitID()+"\t bcaInfo ="+bcaInfoMisc);%>
                				<%=((((String)bcaInfoMisc.get("leId"))==null)?" ":((String)bcaInfoMisc.get("leId")))%>&nbsp;<br>
                				<%=((((String)bcaInfoMisc.get("custName"))==null)?" ":((String)bcaInfoMisc.get("custName")))%>&nbsp;<br>
                		<%	}else{%>
                				&nbsp;<br>&nbsp;<br>
                		<%	}%>
                	</logic:iterate>
                </logic:present>
                <logic:notPresent name="OB" property="limitList">-&nbsp;<br>&nbsp;<br></logic:notPresent>
                </td>
                
                <td nowrap="nowrap" valign="top" >
                <logic:present name="OB" property="limitList">
					<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
						<%	bcaInfoMisc =(java.util.HashMap)custResHash.get(String.valueOf(subOb.getLimitID()));	
							if(bcaInfoMisc!=null){
               					//DefaultLogger.debug(this,"2> limitID ="+subOb.getLimitID()+"\t bcaInfo ="+bcaInfoMisc);%>
                				<%=((((String)bcaInfoMisc.get("bcaRef"))==null)?" ":((String)bcaInfoMisc.get("bcaRef")))%>&nbsp;<br>
                				<%=((((String)bcaInfoMisc.get("bkgLoc"))==null)?" ":cList.getCountryName((String)bcaInfoMisc.get("bkgLoc")))%>&nbsp;<br>
                		<%	}else{%>
                				&nbsp;<br>&nbsp;<br>
                		<%	}%>
                	</logic:iterate>
                </logic:present>
                <logic:notPresent name="OB" property="limitList">-&nbsp;<br>&nbsp;<br></logic:notPresent>
                </td>
              	
              	
                <td valign="top" >
                <% 	if (OB.getLimitList() != null && OB.getLimitList().length > 0){%>
                	<logic:iterate id="subOb" name="OB" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
                	<% 	if((subOb.getOuterLimitRef()==null)||(subOb.getOuterLimitRef()).equals("0"))  {%>
							-&nbsp;<br>&nbsp;<br>
                	<% 	}else if(subOb.getIsInnerOuterSameBCA())  {%>
							<font color="000000">
								<integro:empty-if-null value="<%=subOb.getOuterLimitRef()%>"/>
							</font>&nbsp;<br>
		            <%	}else{%>
		            		<font color="FFOOCC">
								<integro:empty-if-null value="<%=subOb.getOuterLimitRef()%>"/>
							</font>&nbsp;<br>
		            <%	}%>
                	</logic:iterate>
              	<%	} else { %>
                 	-&nbsp;<br>&nbsp;<br>
              	<% 	}%>
              	</td>
-->             
              	<td nowrap="nowrap" valign="top" >&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>
 <!--
				<td nowrap="nowrap" valign="top" ><integro:empty-if-null value="<%=securityOrg%>" />&nbsp;</td>
 -->
                <td valign="top" >&nbsp;<%=(PropertyManager.getValue("chklist.status." + OB.getCheckListStatus()) == null) ?
                        OB.getCheckListStatus() : PropertyManager.getValue("chklist.status." + OB.getCheckListStatus())%>
                </td>
              	<td valign="top" >&nbsp;

<%
boolean canDisableTask=false;
boolean canMaintainCheckList=false;
boolean canDelete=false;
boolean canView=false;

//if(isInCountry&&!OB.getSameCountryInd()&&OB.getTrxStatus()==null&&OB.getTaskTrx()==null&&isUserCpcMaker)
	if(OB.getTrxStatus()==null&&OB.getTaskTrx()==null&&isUserCpcMaker)
{
canDisableTask=true;
}

if(isUserCpcMaker)
{
canMaintainCheckList=true;
}//in country same country

if(OB.getTrxStatus()!=null&&OB.getTaskTrx()==null&&isUserCpcMaker)
{
canMaintainCheckList=true;
}//in country not same country

if(OB.getTaskTrx()!=null&&!ICMSConstant.STATE_PENDING_REJECT.equals(OB.getTaskTrx(). getStatus())&&isUserCpcMaker)
{
canMaintainCheckList=true;
}//out country  same country

if(ICMSConstant.STATE_CHECKLIST_DELETED.equals(OB.getCheckListStatus()) 
	&& OB.getAllowDeleteInd())
{
	canDelete=true;
}

if(OB.getTrxStatus()!=null && !canDelete && !canMaintainCheckList)
{
	canView=true;
}

if(isUserCpcMaker && !isActive){
	canView=true;
}
boolean  displayDropDown=true;
if(!canDisableTask&&!canMaintainCheckList&&!canDelete&&!canView)
{
	displayDropDown=false;
}

 
if(!(OB.getCheckListID()== ICMSConstant.LONG_INVALID_VALUE)){
if(!("ACTIVE".equals(OB.getTrxStatus()))){
	displayDropDown=false;
	}
}

%>
<%
//System.out.println("--------displayDropDown-----------"+displayDropDown);
//System.out.println("---------canDisableTask----------"+canDisableTask);
//System.out.println("---------canMaintainCheckList----------"+canMaintainCheckList);
//System.out.println("---------canDelete----------"+canDelete);
//System.out.println("---------canView----------"+canView);

%>
 <%if(displayDropDown){%>

    <%
    if((canDisableTask || canMaintainCheckList || canDelete) && isActive){
    %>
        <a href="#" onClick="maintain('<%=OB.getCheckListID()%>', '<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getSecurityOrganization()%>','<%=OB.getCollateralID()%>', '<%=custCategory%>', '<%=subprofileID%>','<%=OB.getApplicationType()%>')" ><bean:message key="label.process"/></a>
    <%
    }else if (canDisableTask && !isActive){ %>
    &nbsp;-
    <%}else if(canView){
    %>
     <!-- <a href="#" onClick="view('<%=OB.getCheckListID()%>', '<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getSecurityOrganization()%>','<%=OB.getCollateralID()%>', '<%=custCategory%>', '<%=subprofileID%>','<%=OB.getApplicationType()%>')" ><bean:message key="label.view"/></a> -->
        
         <a href="SecurityCheckList.do?event=view&&checkListID=<%=OB.getCheckListID()%>&&secType=<%=OB.getCollateralType().getTypeCode()%>&&secSubType=<%=OB.getCollateralSubType().getSubTypeCode()%>&&limitBkgLoc=<%=OB.getCollateralLocation()%>&&orgCode=<%=OB.getSecurityOrganization()%>&&collateralID=<%=OB.getCollateralID()%>&&custCategory=<%=custCategory%>&&legalID=<%=subprofileID%>&&applicationType=<%=OB.getApplicationType()%>" ><bean:message key="label.view"/></a>
    <%
    }else{
    %>
<!--    <a href="#" onClick="maintain('<%=OB.getCheckListID()%>', '<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getSecurityOrganization()%>','<%=OB.getCollateralID()%>', '<%=custCategory%>', '<%=subprofileID%>','<%=OB.getApplicationType()%>')" ><bean:message key="label.process"/></a>-->
    <%} %>
<!--Does not need by Alliance, commented the whole block-->
<!--[Start] -->
<!--<select name="menu2" onChange="perform(this, '<%//=OB.getCheckListID()%><!--', '--><%//=OB.getCollateralType().getTypeCode()%><!--','--><%//=OB.getCollateralSubType().getSubTypeCode()%><!--','--><%//=OB.getCollateralLocation()%><!--','--><%//=OB.getSecurityOrganization()%><!--','--><%//=OB.getCollateralID()%><!--', '--><%//=custCategory%><!--', '--><%//=subprofileID%><!--','--><%//=OB.getApplicationType()%><!--')">-->
<!--                  <option value="" selected>Please Select</option>-->
                  <%//if(canDisableTask){%>
<!--                  <option value="maintain_out">Maintain Checklist</option>-->
                  <%//}%>
				  <%//if(canMaintainCheckList){%>
<!--                  <option value="maintain">Maintain Checklist</option>-->
                  <%//}%>
				  <%//if(canDelete){%>
<!--                  <option value="delete">Delete Checklist</option>-->
                  <%//}%>
				  <%//if(canView){%>
<!--                  <option value="view">View Checklist</option>-->
                  <%//}%>
<!--</select>-->
<!--[End] -->
                      
<%}else{
	out.print("&nbsp;-");}
	%>
<!--	 <a href="#" onClick="maintain('<%=OB.getCheckListID()%>', '<%=OB.getCollateralType().getTypeCode()%>','<%=OB.getCollateralSubType().getSubTypeCode()%>','<%=OB.getCollateralLocation()%>','<%=OB.getSecurityOrganization()%>','<%=OB.getCollateralID()%>', '<%=custCategory%>', '<%=subprofileID%>','<%=OB.getApplicationType()%>')" ><bean:message key="label.process"/></a>-->
	 <%//} %>
              </td>
            </tr>
</logic:iterate>
</logic:present>
<% if(row==0){%>
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
