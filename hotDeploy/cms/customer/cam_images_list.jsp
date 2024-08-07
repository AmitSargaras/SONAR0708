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
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<%
    int row = 0;

   // ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
  //  ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
  //  String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);

	//ILimitProfile limitProfile = (ILimitProfile) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.session.obLimitProfile");
    //boolean isInCountry = CheckListUtil.isInCountry(userTeam, limitProfile);
    //boolean isUserCpcMaker=ICMSConstant.TEAM_TYPE_CPC_MAKER==CheckListUtil.getTeamType(userTeam,user);
	String event=(String)request.getAttribute("event");
	System.out.println("////////////////************** event-"+event);
  //  boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID);
  //  Boolean isViewFlagObj = (Boolean)request.getAttribute("isViewFlag");
    ArrayList camChecklistArray =(ArrayList)session.getAttribute("com.integrosys.cms.ui.customer.CustomerProcessDetailsAction.camChecklistArray");
    System.out.println("////////////////************** camChecklistArray"+camChecklistArray );
    //System.out.println("////////////////************** camChecklistArray-"+camChecklistArray.size());
	
  
 
   String camCheckListType;
   String camDate;
   String camType;
   String camNumber;
   
  
   camCheckListType="CAM";
   camDate="-";
   camType="-";
   camNumber="-";
   
    
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
	alert("aaaa");
	window.location = aLocation ;
}



function handleEnter (field, event) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == null) {
			//
		}
		else {
			searchCam();
		}
		return false;
	} 
	else
	return true;
}
function viewImage(camType,camNo,camDate){
	
	 document.forms[0].action = "CustomerProcess.do?event=view_edit_cam_image&&camType=camType&&camNumber=camNo&&camDate=camDate";
	 document.forms[0].submit();
}

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
 <table width="98%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center" style="margin-top: 0">
 <thead>
    <tr>
      <td>
          <h3>          
              CAM Images List
          </h3>
      </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    
  
  </thead>
  <tbody>
    <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" >
          <thead>
            <tr>
             <td width="2%"><bean:message key="label.global.sn"/></td>             
              <td width="5%">CAM Type</td>
              <td width="5%">CAM Number</td>
              <td width="5%">CAM Date</td>
              <td width="3%"><bean:message key="label.global.action"/></td>      
   
            </tr>
          </thead>
          <tbody>
		 
   
   <%
  
 
   if(camChecklistArray !=null && camChecklistArray.size()!=0){
   for(int i =0;i<camChecklistArray.size();i++){
	   
	   CheckListSearchResult camCheckList=(CheckListSearchResult)camChecklistArray.get(i);
   
   
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
              	<%if(camCheckList.getCamType()!=null){ %>
              	<td valign="top" >&nbsp;<%=camCheckList.getCamType()%></td>	
              	<%}else{ %>
              	<td valign="top" >&nbsp;-</td>
              	<%}if(camCheckList.getCamNumber()!=null){ %>
              	<td valign="top" >&nbsp;<%=camCheckList.getCamNumber()%></td>
              	<%}else{ %>
              	<td valign="top" >&nbsp;-</td>
              	<%}if(camCheckList.getCamDate()!=null){ %>	              	
              	<td valign="top" >&nbsp;<integro:date object="<%=camCheckList.getCamDate()%>"/></td>	
              	<%} else{%>
              	<td valign="top" >&nbsp;-</td>
              	<%} %>
              	           	
              	<%if("processcusdetails".equals(event)){ %>
              <td valign="top"><center>	<a href="CustomerProcess.do?event=view_cam_image&&camType=<%=camCheckList.getCamType() %>&&camNumber=<%=camCheckList.getCamNumber() %>&&camDate=<%=camCheckList.getCamDate()%>"  >View Images</a></center></td>
              	<%}%>
   
              	
   </tr>  
   <%}}else{
	     String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }%>
       <tr class=<%=rowClass%>>
		<td colspan="6">
		No records found.
	</td>
	</tr>   
   <%} %>
   
 
         
 </tbody>
        </table></td>
    </tr>
      
    
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
