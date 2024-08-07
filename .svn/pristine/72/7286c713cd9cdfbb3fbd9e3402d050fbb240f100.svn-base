<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="java.util.List"%>
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
	String pageMode = request.getParameter("pageMode");
	Boolean editMode = new Boolean(request.getParameter("editMode"));
	String subtype = (String) request.getAttribute("subtype");
	String from_event = (String) request.getAttribute("from_event");
	String indexID = (String) request.getAttribute("indexID");
	String itemType = (String) request.getAttribute("itemType");
	String submitEvent = request.getParameter("submitEvent");
	String stockExchange = (String) request.getAttribute("stockExchange");
	String scriptCode = (String) request.getAttribute("scriptCode");
	String bondMarket = (String) request.getParameter("bondMarket");
	String isinCode = (String) request.getParameter("isinCode");
	String bondMatDate = (String) request.getParameter("bondMatDate");
	String bondType = (String) request.getParameter("bondType");
	String unitPrice = (String) request.getParameter("unitPrice");
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

%>

<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
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
	function formatAmtEdit() {
		 var spanAmts = getElementsByClassName(document,'amtClass');
		 for(var i = 0; i < spanAmts.length; i++){
			 if(spanAmts[i].value && spanAmts[i].value != "-")
			 	formatAmountAsCommaSeparated(spanAmts[i]);
		 }
	}
	function formatAmtView() {
		 var spanAmts = getElementsByClassName(document,'amtClassView');
		 for(var i = 0; i < spanAmts.length; i++){
			 if(spanAmts[i].innerText && spanAmts[i].innerText != "-"){
			 	var formatedAmt = formatAmountAsCommaSeparated1(spanAmts[i].innerText);
				spanAmts[i].innerText = formatedAmt;
			}
		 }
	}
	function getElementsByClassName(document, className) {
		if(document.getElementsByClassName){
			return document.getElementsByClassName(className);
		}else{
			var elements = document.body.getElementsByTagName("*");
			var retNodes = []
			for (var i = 0; i < elements.length; i++) {
		    	if ((elements[i].className).indexOf(className) > -1) {
		        	retNodes.push(elements[i]);
		        }
		 	}
			return retNodes;
		}
	}
</script>
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
		      							 			 					<logic:empty name="MarketableEquityLineDetailForm" property="facilityName">-</logic:empty>
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
		      							 			 					<logic:empty name="MarketableEquityLineDetailForm" property="facilityId">-</logic:empty>
		      							 			 				</logic:equal>		      							 			 				
		      							 			 			</td>    
		      							 			 		</tr>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"lineNumber")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.line.no"/>.
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
		      							 			 					<logic:empty name="MarketableEquityLineDetailForm" property="lineNumber">-</logic:empty>
		      							 			 				</logic:equal>	
		      							 			 			</td> 
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
		      							 			 					<logic:empty name="MarketableEquityLineDetailForm" property="serialNumber">-</logic:empty>
		      							 			 				</logic:equal>																			
		      							 			 			</td>    							 			 				
		      							 			 		</tr>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"lineValue")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.security.line.value"/>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="MarketableEquityLineDetailForm" styleId="lineValue" property="lineValue" styleClass="amtClass" onblur="javascript:formatAmountAsCommaSeparated(this)" 
			      							 			 				size="10"></html:text>&nbsp;
																		<br>
																		<html:errors property="lineValue"/>
																		<html:hidden name="MarketableEquityLineDetailForm" property="lineValue" />
																	</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<span class="amtClassView"><bean:write name="MarketableEquityLineDetailForm" property="lineValue"/></span>
		      							 			 					<logic:empty name="MarketableEquityLineDetailForm" property="lineValue">-</logic:empty>
		      							 			 				</logic:equal>																			
		      							 			 			</td>
		      							 			 			<td>&nbsp;</td>
		      							 			 			<td>&nbsp;</td>
		      							 			 		</tr>   
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
		<logic:equal value="true" name="editMode">
			<script type="text/javascript">
				formatAmtEdit();
			</script>	
		</logic:equal>
		<logic:equal value="false" name="editMode">
			<script type="text/javascript">
				formatAmtView();
			</script>			
		</logic:equal>	
	</body>
	<html:hidden name="MarketableEquityLineDetailForm" property="lineDetailId" />
	<html:hidden name="MarketableEquityLineDetailForm" property="refID" />
	<html:hidden name="MarketableEquityLineDetailForm" property="facDetailMandatory" />
	<html:hidden property="event"/>
	<input type="hidden" name="from_event" value="<%=from_event%>"/>
	<input type="hidden" name="indexID" value="<%=indexID%>"/>
	<input type="hidden" name="subtype" value="<%=subtype%>"/>
	<input type="hidden" name="selectedItem" value="<%=selectedItem%>"/>
	<input type="hidden" name="itemType" value="<%=itemType%>"/>
	<input type="hidden" name="stockExchange" value="<%=stockExchange%>"/>
	<input type="hidden" name="scriptCode" value="<%=scriptCode%>"/>
	<input type="hidden" name="bondMarket" value="<%=bondMarket%>"/>
	<input type="hidden" name="isinCode" value="<%=isinCode%>"/>
	<input type="hidden" name="bondType" value="<%=bondType%>"/>
	<input type="hidden" name="unitPrice" value="<%=unitPrice%>"/>
	<input type="hidden" name="bondMatDate" value="<%=bondMatDate%>"/>
</html:form>