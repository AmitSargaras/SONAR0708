<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.OBMutualFundsFeedEntry"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailForm"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

	String selectedItem = (String) request.getAttribute("selectedItem");
	String context = request.getContextPath() + "/";
	MarketableEquityLineDetailForm form = (MarketableEquityLineDetailForm) request.getAttribute("MarketableEquityLineDetailForm");
	String pageMode = request.getParameter("pageMode");
	Boolean editMode = new Boolean(request.getParameter("editMode"));
	String subtype = (String) request.getAttribute("subtype");
	String from_event = (String) request.getAttribute("from_event");
	String indexID = (String) request.getAttribute("indexID");
	String itemType = (String) request.getAttribute("itemType");
	String submitEvent = request.getParameter("submitEvent");
	String stockExchange = (String) request.getAttribute("stockExchange");
	String scriptCode = (String) request.getAttribute("scriptCode");
	String schemeName = (String) request.getParameter("schemeName");
	String schemeType = (String) request.getParameter("schemeType");
	String startDate = (String) request.getParameter("startDate");
	String endDate = (String) request.getParameter("endDate");
    String nominalValue = (String) request.getParameter("nominalValue");
	System.out.println("schemeName "+schemeName);
	
	Boolean isProcess = "process".equals(from_event);
	IMarketableEquityLineDetail stagingOB = null;
	IMarketableEquityLineDetail originOB = null;
	if(isProcess){
		stagingOB = (IMarketableEquityLineDetail)request.getAttribute(IMarketableEquityLineDetailConstants.REQUEST_STAGING_MARKETABLE_EQUITY_LINE_DETAIL_LIST);
		originOB = (IMarketableEquityLineDetail) request.getAttribute(IMarketableEquityLineDetailConstants.REQUEST_MARKETABLE_EQUITY_LINE_DETAIL_LIST);
	}
		
	List facNameList = (List)session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_FAC_NAME_LIST);
	List facIdList = (List)session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_FAC_ID_LIST);
	List facLineNoList = (List)session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_FAC_LINE_NO_LIST);
	
	
	pageContext.setAttribute(IMarketableEquityLineDetailConstants.SESSION_FAC_NAME_LIST ,facNameList);
	pageContext.setAttribute(IMarketableEquityLineDetailConstants.SESSION_FAC_ID_LIST ,facIdList);
	pageContext.setAttribute(IMarketableEquityLineDetailConstants.SESSION_FAC_LINE_NO_LIST ,facLineNoList);
	pageContext.setAttribute("editMode", editMode);
	IMutualFundsFeedEntry obMutualFundsEntry = null;
	if(session.getAttribute("fundsFeedEntry")!= null){
	obMutualFundsEntry = (OBMutualFundsFeedEntry)session.getAttribute("fundsFeedEntry");
	System.out.println("In Line_detail.jsp "+obMutualFundsEntry);
	System.out.println("In Line_detail.jsp "+obMutualFundsEntry.getSchemeType());
	}else{
		System.out.println("In Line_detail.jsp object is null");
	}
%>

<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<title>Untitled Document</title>

<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

<script language="JavaScript" type="text/JavaScript">

	
function submitPage(num) 
{	
	if(num == 1){
		document.forms[0].event.value = "<%=submitEvent%>";
	}
	else if(num == 2){
		document.forms[0].event.value = "<%=MarketableEquityLineDetailAction.EVENT_CANCEL_LINE_DETAIL%>";
	}
	 document.forms[0].submit();
}

function refreshFacilityDetails(dropdown, targetDropdownName){
	
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 if(curSel==""){
		 if(name == "facilityId"){
			clearDisplayDropdown("facilityId")
		 }
		 return;
	}
	 var url = '/cms/MarketableEquityLineDetail.do?event=refresh_facility_dropdown&curSel='+ curSel +'&dropdownName='+targetDropdownName;
	 sendLoadDropdownReq(targetDropdownName, url);
}


</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="MarketableEquityLineDetail.do">
	<body>
		<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
			<thead>
			    <tr>
			        <td width="100%" valign="bottom">
			        	<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
			        		<tr>
			        			 <td width="100%">
			        			 	<h3><%=pageMode %> Line Details</h3>
		      						<hr/>
		      						<table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">
		      							 <tbody> 
		      							 	<tr>
		      							 		<td>
		      							 			<br/>
		      							 			 <table class="tblInput" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">
		      							 			 	<tbody>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"facilityName")?"fieldname":"fieldnamediff"):"fieldname"%>">
		      							 			 				 <bean:message key="label.facility.name"/>
		      							 			 				<logic:equal value="Y" name="MarketableEquityLineDetailForm" property="facDetailMandatory">
		      							 			 					<font color="red">*</font>
		      							 			 				</logic:equal>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:select name="MarketableEquityLineDetailForm" property="facilityName" onchange="javascript:refreshFacilityDetails(this,'facilityId')">
			      							 			 					<option value="">Please Select</option>
			      							 			 					<html:options collection="<%=IMarketableEquityLineDetailConstants.SESSION_FAC_NAME_LIST%>" labelProperty="label" property="value" />
			      							 			 				</html:select>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="facilityName"/>
			      							 			 				<html:hidden name="MarketableEquityLineDetailForm" property="facilityName" />
		      							 			 				</logic:equal>
		      							 			 				<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="facilityName"/>
		      							 			 				</logic:equal>
		      							 			 			</td>
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"facilityId")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.facility.id"/>
		      							 			 				<logic:equal value="Y" name="MarketableEquityLineDetailForm" property="facDetailMandatory">
		      							 			 					<font color="red">*</font>
		      							 			 				</logic:equal>		      							 			 				
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:select name="MarketableEquityLineDetailForm" property="facilityId">
			      							 			 					<option value="">Please Select</option>
			      							 			 					<html:options collection="<%=IMarketableEquityLineDetailConstants.SESSION_FAC_ID_LIST%>" labelProperty="label" property="value" />
			      							 			 				</html:select>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="facilityId"/>
			      							 			 				<html:hidden name="MarketableEquityLineDetailForm" property="facilityId" />
		      							 			 				</logic:equal>
		      							 			 				<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="facilityId"/>
		      							 			 				</logic:equal>		      							 			 				
		      							 			 			</td>    
		      							 			 		</tr>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"lineNumber")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.line.no"/>
		      							 			 				<font color="red">*</font>	      							 			 				
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:select name="MarketableEquityLineDetailForm" property="lineNumber">
			      							 			 					<option value="">Please Select</option>
			      							 			 					<html:options collection="<%=IMarketableEquityLineDetailConstants.SESSION_FAC_LINE_NO_LIST%>" labelProperty="label" property="value" />
			      							 			 				</html:select>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="lineNumber"/>
			      							 			 				<html:hidden name="MarketableEquityLineDetailForm" property="lineNumber" />
			      							 			 			</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="lineNumber"/>
		      							 			 				</logic:equal>	
		      							 			 			</td> 
		      							 			 			<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"fasNumber")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.fas.no"/>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="MarketableEquityLineDetailForm" property="fasNumber" styleId="fasNumber" maxlength="30" size="15"/>&nbsp;
			      							 			 				<br>
			      							 			 				<html:hidden name="MarketableEquityLineDetailForm" property="fasNumber" />
			      							 			 				<html:errors property="fasNumber"/>
			      							 			 			</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="fasNumber"/>
		      							 			 				</logic:equal>			      							 			 				
		      							 			 			</td>      							 			 				
		      							 			 		</tr>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"serialNumber")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.serial.no"/>
		      							 			 				<font color="red">*</font>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="MarketableEquityLineDetailForm" property="serialNumber" size="10" maxlength="30"></html:text>&nbsp;
																		<br>
																		<html:errors property="serialNumber"/>
																		<html:hidden name="MarketableEquityLineDetailForm" property="serialNumber" />
																	</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="serialNumber"/>
		      							 			 				</logic:equal>																			
		      							 			 			</td>
		      							 			 			<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"ltv")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.ltv"/>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="MarketableEquityLineDetailForm" property="ltv" styleId="ltv" maxlength="30" size="10" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="ltv"/>
			      							 			 				<html:hidden name="MarketableEquityLineDetailForm" property="ltv" />
			      							 			 			</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="ltv"/>
		      							 			 					<logic:empty name="MarketableEquityLineDetailForm" property="ltv">-</logic:empty>
		      							 			 				</logic:equal>	
		      							 			 												
		      							 			 			</td>      							 			 				
		      							 			 		</tr>   
		      							 			 		
		      							 			 		<tr class="even">
		      							 			 			<td width="40%"  class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.remarks"/>
		      							 			 			</td>	
		      							 			 			<td colspan="3">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:textarea name="MarketableEquityLineDetailForm" property="remarks" cols="95" rows="3"/>&nbsp;
																		<br>
																		<html:errors property="remarks"/>
																		<html:hidden name="MarketableEquityLineDetailForm" property="remarks" />
																	</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="MarketableEquityLineDetailForm" property="remarks"/>
		      							 			 				</logic:equal>	
		      							 			 			</td>
		      							 			 	</tbody>
		      							 			 </table>  	
		      							 		</td>
		      							 	</tr>
		      							 </tbody>
		      						</table>
		      						<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
		      							  <tr>
		      							  	<td>&nbsp;</td>
		      							  </tr>
		      							  <tr>
      							    		<td align="center">
      							    			<logic:equal value="true" name="editMode">
   													<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save1.gif',1)">
   													<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" onclick="javascript:submitPage(1)"/></a>
   												</logic:equal>
   												<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)">
   												<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="javascript:submitPage(2)"/></a>	        	
    										</td>
		      							  </tr>
		      						</table>
			        			 </td>
			        		</tr>
			        	</table>
			        </td>
			    </tr>
			</thead>
		</table>	
	</body>
	<html:hidden name="MarketableEquityLineDetailForm" property="lineDetailId" />
	<html:hidden name="MarketableEquityLineDetailForm" property="refID" />
	<html:hidden name="MarketableEquityLineDetailForm"  property="totalLtv"/>
	<%-- <html:hidden name="MarketableEquityLineDetailForm" property="collateralID" /> --%>
	<html:hidden name="MarketableEquityLineDetailForm" property="facDetailMandatory" />
	<html:hidden property="event"/>
	<input type="hidden" name="from_event" value="<%=from_event%>"/>
	<input type="hidden" name="indexID" value="<%=indexID%>"/>
	<input type="hidden" name="subtype" value="<%=subtype%>"/>
	<input type="hidden" name="selectedItem" value="<%=selectedItem%>"/>
	<input type="hidden" name="itemType" value="<%=itemType%>"/>
	<input type="hidden" name="stockExchange" value="<%=stockExchange%>"/>
	<input type="hidden" name="scriptCode" value="<%=scriptCode%>"/>
	<input type = "hidden" name="schemeName" value="<%=schemeName%>"/>
	<input type = "hidden" name="schemeType" value="<%=schemeType%>"/>
	<input type = "hidden" name="startDate" value="<%=startDate%>"/>
	<input type = "hidden" name="endDate" value="<%=endDate%>"/>
	<input type = "hidden" name="nominalValue" value="<%=nominalValue%>"/>
	
		
	
</html:form>