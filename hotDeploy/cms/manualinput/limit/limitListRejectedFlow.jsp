<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.manualinput.aa.AAUIHelper,
				 com.integrosys.base.uiinfra.exception.AccessDeniedException,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
				 com.integrosys.component.bizstructure.app.bus.ITeam ,
				 java.util.Locale,
				 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
				 com.integrosys.base.uiinfra.tag.PageIndex        
"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = false;       
if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER 
    ||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
	||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
	||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
	isUserCpcMaker = true;
} else {
	isUserCpcMaker=false;
}
Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
String sessionCriteria = (String) request.getAttribute("sessionCriteria");
request.setAttribute("sessionCriteria", sessionCriteria);
System.out.println(">>>>>>>lmtlistcmd>>>>>>>>session criteria"+sessionCriteria); 

/* List sr = (List)request.getAttribute("limitList");
System.out.print("sr "+sr.size());
if(sr!=null){
		pageContext.setAttribute("limitList",sr);
}

int sno = 0;
int startIndex = 0;
String indx= (String) request.getAttribute("startIndex");
if(indx!=null && (!indx.equals("")))
	 startIndex = Integer.parseInt(indx);

System.out.print("startIndex "+startIndex);
System.out.print(" ind "+indx); */

%>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
.table-scroll{
	width:98%;
	
	overflow-x: scroll;
}
</style>
<script language="JavaScript" type="text/JavaScript">
  function createLimit()
  {
  }

  function selectLimit(selectObj, lmtId, limitProfileId, customerID,sessionCriteria)
  {
    var curInd = selectObj.selectedIndex;
    if (curInd == 1)
    {
        document.forms[0].event.value = "show_rejected_lmt_detail";
        document.forms[0].limitId.value = lmtId;
        document.forms[0].limitProfileID.value = limitProfileId;
        document.forms[0].customerID.value = customerID;
        document.forms[0].action="MILimitList.do?sessionCriteria="+sessionCriteria;
        document.forms[0].submit();
    }
    else if (curInd == 2)
    {
        document.forms[0].event.value = "prepare_update_rejected";
        document.forms[0].limitId.value = lmtId;
        document.forms[0].limitProfileID.value = limitProfileId;
        document.forms[0].customerID.value = customerID;
        document.forms[0].action="MILimit.do?sessionCriteria="+sessionCriteria;
        document.forms[0].submit();
    }
    else if (curInd == 3)
    {
        document.forms[0].event.value = "del_limit";
        document.forms[0].limitId.value = lmtId;
        document.forms[0].submit();
    }
  }

  function returnAAList()
  {
    document.location.href = "MICustomerSearch.do?event=customer_rejectedFlow_search&source=limit";
  }
</script>

<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="MILimitList.do" style="height:98%;">
<html:hidden property="limitProfileID"/>
<html:hidden property="customerID"/>
<input type="hidden" name="event" />
<input type="hidden" name="limitId" value=""/>
<div class="table-scroll">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Facility List</h3></td>
      <td align="right" valign="bottom">
        <!-- present name="isManualInput" scope="request">
          input onclick="javascript:createLimit()" name="AddNew1" type="button" id="AddNew1" value="Add New Limit"  class="btnNormal" style="margin-right:5px;margin-left:10;width:110px"
        -->
        &nbsp;
      </td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
  <%
  AAUIHelper aaHelper = new AAUIHelper();
  ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
          
  %>
    <tr>
      <td colspan="2">
        <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="3%"><bean:message key="label.global.sn"/></td>
              <td width="9%">Party Name/Party ID</td>
              <td width="9%"><bean:message key="label.facility.id"/></td>
              <td width="7%"><bean:message key="label.facility.name"/></td>
              <td width="5%"><bean:message key="label.facility.type"/></td>
              <td width="6%"><bean:message key="label.facility.sanctionedamount"/></td>
              <td width="7%"><bean:message key="label.facility.releasableamount"/></td>
       
              <td width="7%"><bean:message key="label.facility.releasedamount"/>  </td>
              <td width="7%"><bean:message key="label.facility.securityid"/></td>
              <!--<td width="7%"><bean:message key="label.facility.collateralname"/> </td>-->
              <td width="11%" nowrap><bean:message key="label.facility.securitytype.subtype"/></td>
              <td width="9%">Action</td>
            </tr>
          </thead>
          <tbody>
            
	      <% int limitSize = ((List)(request.getAttribute("limitList"))).size(); %>
	      <% if (limitSize > 0) { %>
	      		<logic:present name="limitList" scope="request">
              		<logic:iterate name="limitList" id="element" indexId="ind" type="com.integrosys.cms.ui.manualinput.limit.LimitListSummaryItem">
              			<% String rowClass = (ind.intValue()%2==0?"even":"odd"); %>
						<tr class="<%=rowClass%>">
						<%
		  					List secDtlList = element.getSecItemList();
		  					String strlmtId[]=new String[2];
		  					int colspanSize = (secDtlList == null)?1:secDtlList.size();
		  
		   	 				boolean canAccess = true;
							try {
								aaHelper.canAccess( userTeam, element.getLimitBookingLoc() );
							} catch(AccessDeniedException adex)
							{
								canAccess = false;
							}
							int i = 0;
							String strSec ="";
							String strSecType ="";
							while(secDtlList.size() >= i){
								strSec = strSec +element.getSecurityIdListDisp(i) + "<br>";
								strSecType = strSecType + element.getSecTypeSubtypeListDisp(i) + "<br>";
								i++;
							}
							strlmtId=element.getLimitId().split("-");
						%>
            			<td class="index" rowspan="<%= colspanSize %>" valign="top" width="3%"><%= ind.intValue() + 1 %></td>
            			<td valign="top" rowspan="<%= colspanSize %>" width="6%" ><%= element.getPartyName() %>/<%= element.getPartyID() %></td>
          				<td valign="top" rowspan="<%= colspanSize %>" width="6%" ><%=strlmtId[0]%></td>
          				<td valign="top" rowspan="<%= colspanSize %>" width="5%" >&nbsp;<bean:write name="element" property="facilityDesc"/></td>
          				<td valign="top" rowspan="<%= colspanSize %>" width="5%" >&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=element.getFacilityTypeCode() %>" display="true" descWithCode="false" /></td>
          				<td valign="top" rowspan="<%= colspanSize %>" width="6%" >&nbsp;          		
          					<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),element.getActualSecCoverageDisp())%>" />
          				</td>
          				<td valign="top" rowspan="<%= colspanSize %>" class="amount" width="7%">&nbsp;          		
          					<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),element.getApproveAmountDisp())%>" />
          				</td>
          				<td valign="top" rowspan="<%= colspanSize %>" class="amount" width="7%">&nbsp;          		
          					<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),element.getDrawingAmountDisp())%>" />
          				</td>
          					<td width="7%" valign="top">&nbsp;<integro:empty-if-null value="<%=strSec %>" /></td>
          				<!--<td valign="top" rowspan="<%= colspanSize %>" class="amount" width="7%">&nbsp;<bean:write name="element" property="outstandingAmountDisp"/></td>-->
          	
          				<td width="11%" valign="top">&nbsp;<integro:empty-if-null value="<%= strSecType %>" /></td>
          				<td width="11%" rowspan="<%= colspanSize %>" valign="middle">
                  		<%-- <logic:present name="isManualInput" scope="request"> --%>
                    		<select name="select2" onchange="selectLimit(this, '<%= element.getCmsLimitId() %>','<%= element.getLimitProfileId()%>','<%=element.getCustomerID()%>','<%=sessionCriteria%>')">
                      			<option value="">Please Select</option>
                      			<option value="view">View </option>
                     			<% if(isUserCpcMaker){%>
                      				<option value="edit">Edit </option>
                     			<% }%>
                    		</select>
                  		<%-- </logic:present> --%>
                 		 &nbsp;
                		</td>
						</tr>
						<logic:present name="element" property="secItemList">
		  					<logic:iterate name="element" property="secItemList" id="curSec" indexId="secInd" type="com.integrosys.cms.app.limit.bus.LimitListSecItemBase">
		     				<% if (secInd.intValue() > 0) {%>
								<tr class="<%=rowClass%>">
		     					<%-- <!--<td width="9%" valign="top">&nbsp;<%= element.getSecurityIdListDisp(secInd.intValue()) %></td> -->
          	     				<!--	<td width="13%" valign="top">&nbsp;<%= element.getSecTypeSubtypeListDisp(secInd.intValue()) %></td> -->
          	     				<!--	<td width="7%" valign="top">&nbsp;<%= element.getSecLocListDisp(secInd.intValue()) %></td> -->
          	    	 			<!--	<td width="7%" valign="top">&nbsp; -->
                 				<!--      <%String orgCode1=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, element.getSecOrgListDisp(secInd.intValue())); %> -->
                 				<!--          <integro:empty-if-null value="<%=orgCode1%>" /> -->
                       			<!-- </td> -->
								</tr> --%>
		     				<% } %>
		  					</logic:iterate>
						</logic:present>
              		</logic:iterate>
            	</logic:present>
            <%} else {%>
	    		<%-- <logic:notPresent name="limitList" scope="request">
	      			<logic:equal name="limitSize" value="0"> --%>
						<tr class="odd">
                  			<td colspan="15"><bean:message key="label.global.not.found"/></td>
                		</tr>
	      			<%-- </logic:equal>
	    		</logic:notPresent> --%>
	    	<%} %>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
</div>
<p>&nbsp;</p>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-bottom: 200px;">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:returnAAList()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
</table>
<%-- <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
		<logic:present name="limitList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table  width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 5, sr.size())%>"
					                            url="MILimitList.do?event=list_pagination&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
                   </table>
                 </td>
              </tr>
      </logic:present>
</table>	 --%>	
<!-- InstanceEndEditable -->
</html:form>
</body>