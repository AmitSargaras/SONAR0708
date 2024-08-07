<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableCollateral"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.Constants"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.AbstractCommonMapper"%>
<%@page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%
List lineDetailList = null;
Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);
Boolean editMode = new Boolean(request.getParameter("editMode"));
Boolean isProcess = new Boolean(request.getParameter("isProcess"));

if(isProcess){
	IMarketableEquity stagingOB = (IMarketableEquity)request.getAttribute("stageEquity");
	IMarketableEquity originOB = (IMarketableEquity) request.getAttribute("actualEquity");
	if(( originOB != null && originOB.getLineDetails() != null) || ( stagingOB != null && stagingOB.getLineDetails() != null)){
		lineDetailList = CompareOBUtil.compOBArray(stagingOB != null && stagingOB.getLineDetails() != null
				? stagingOB.getLineDetails() : null
				, originOB != null && originOB.getLineDetails() != null ? originOB.getLineDetails() : null);		
	}
}
if(lineDetailList == null){
	lineDetailList = (List)session.getAttribute(MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST);
}
pageContext.setAttribute("editMode", editMode);
pageContext.setAttribute("isProcess", isProcess);
pageContext.setAttribute(IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST, lineDetailList);

String from_event = (String) request.getParameter("from_event");
String subtype = (String) request.getParameter("subtype");
String indexID = (String) request.getAttribute("indexID");

%>
<head>
	 <script language="JavaScript" type="text/JavaScript">
	 
	 function submitLineDetailPage(num, index, obj) {
		 if(num == 1) {
			 document.forms[0].action = "MarketPortItem.do";
			 document.forms[0].event.value="<%=subtype.toLowerCase()+"_"+MarketableEquityLineDetailAction.EVENT_PREPARE_CREATE_LINE_DETAIL%>";
		 }
		 if(num == 4){
			 document.forms[0].action = "MarketableEquityLineDetail.do";
			 if(obj.value == 'Edit'){
				 document.forms[0].event.value="<%=MarketableEquityLineDetailAction.EVENT_PREPARE_EDIT_LINE_DETAIL%>";
			 }
			 if(obj.value == 'Delete'){
				 if( confirm("Are you sure to delete this record ? ")){
					 document.forms[0].event.value="<%=MarketableEquityLineDetailAction.EVENT_DELETE_LINE_DETAIL%>";	 
				 }
				 else{
					 obj.selectedIndex=0;
					 return;
				 }
			 }
			 if(obj.value == 'View'){
				 document.forms[0].event.value="<%=MarketableEquityLineDetailAction.EVENT_VIEW_LINE_DETAIL%>";
			 }
			 document.forms[0].selectedItem.value = index;
		 }
		 document.forms[0].submit();
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
	 function formatAmt() {
		 var spanAmts = getElementsByClassName(document,'amtClass');
		 for(var i = 0; i < spanAmts.length; i++){
			 if(spanAmts[i].innerText && spanAmts[i].innerText != "-"){
			 	var formatedAmt = formatAmountAsCommaSeparated1(spanAmts[i].innerText);
			 	spanAmts[i].innerText = formatedAmt;
		 	}
		 }
	 }
	 
	 </script>
</head>
<input type="hidden" name="selectedItem"/>
<input type = "hidden" name="bondMarket" value="<%=request.getParameter("bondMarket")%>"/>
<input type = "hidden" name="isinCode" value="<%=request.getParameter("isinCode")%>"/>
<input type="hidden" name="bondType" value="<%=request.getParameter("bondType")%>"/>
<input type="hidden" name="bondMatDate" value="<%=request.getParameter("bondMatDate")%>"/>
<input type="hidden" name="unitPrice" value="<%=request.getParameter("unitPrice")%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	<thead>
	    <tr>
	        <td>
	        	<h3><bean:message key="label.security.line.details"/></h3>
	        </td>
	        <logic:equal value="true" name="editMode">
		        <td align="right" valign="baseline">
		        
				    <input class="btnNormal" type="button" name="lineDetailsSubmit" value="Add Line Details" onclick="javascript:submitLineDetailPage(1)"/>
			    </td>
		    </logic:equal>
	    </tr>
	    <tr>
	        <td colspan="2"><hr/></td>
	    </tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
					<thead>
						<tr>
							<td width="5%"><bean:message  key="label.global.sn"/></td>
							<td width="15%"><bean:message  key="label.security.line.number"/></td>
							<td width="15%"><bean:message  key="label.security.serial.no"/></td>
							<td width="15%"><bean:message  key="label.security.line.value"/></td>
							<td width="11%"><bean:message key ="label.global.action"/></td>
						</tr>
					</thead>
					<tbody>
					<% int srNo = 0, idx = 0; %>
					<logic:present name="<%=IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST%>">
							<logic:iterate id="genericLineDetail" name="<%=IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST%>"
								 scope="page" indexId="index">
								 <%
								 	srNo++;
								 	idx++;
								 	IMarketableEquityLineDetail lineDetail = null;
								    String key = "index";
								    boolean displayRecord = true;
								 %>
								 
								 <logic:equal value="true" name="isProcess">
								 	<%
									 	CompareResult result = (CompareResult) genericLineDetail;
									 	key = result.getKey();
									 	lineDetail = (IMarketableEquityLineDetail) result.getObj();
									 	if(key.equals(CompareOBUtil.OB_DELETED)){
									 		displayRecord = false;
									 		srNo--;
									 	}
								 	%>
								 </logic:equal>
								 <logic:equal value="false" name="isProcess">
								 	<%
								 		lineDetail = (IMarketableEquityLineDetail) genericLineDetail;
								 	%>
								 </logic:equal>
								 	<tr class="<%=(index % 2 )!= 0 ? "odd" : "even"%>">
										<td class="<%=key%>"><%= idx%></td>
										<td><%=StringUtils.isBlank(lineDetail.getLineNumber()) ? "-" : lineDetail.getLineNumber() %></td>
										<td><%=StringUtils.isBlank(lineDetail.getSerialNumber()) ? "-" : lineDetail.getSerialNumber() %></td>
										<td><span class="amtClass"><%=lineDetail.getLineValue() == null ? "-" : 
													lineDetail.getLineValue().toPlainString()%></span></td>
								 		<%if(displayRecord){ %>													
											<td style="text-align: center;">
												<logic:equal value="true" name="editMode">
													<select onchange="submitLineDetailPage(4,'<%=index%>', this)">
														<option value="">-<bean:message key="label.select"/>-</option>
														<option value="View">View</option>
														<option value="Edit">Edit</option>
														<option value="Delete">Delete</option>
													</select>
												</logic:equal>
												<logic:equal value="false" name="editMode">
													<select onchange="javascript:location.href = this.value;">
														<option value="">-<bean:message key="label.select"/>-</option>
														<option value="MarketableEquityLineDetail.do?event=view_line_detail&refId=<%=lineDetail.getRefID()%>&from_event=<%=from_event%>&subtype=<%=subtype%>&indexID=<%=indexID%>">View</option>
													</select>
												</logic:equal>
											</td>
										<%} else{ %>
											<td>&nbsp;</td>
										<%} %>	
									</tr>
							</logic:iterate>
					</logic:present>
					<logic:notPresent name="<%=IMarketableEquityLineDetailConstants.SESSION_LINE_DETAIL_LIST%>">
						<tr class="odd">
                        	<td colspan="13" style="text-align:center"><bean:message key="label.no.records.found"/></td>
                    	</tr>
                    </logic:notPresent>	
					</tbody>
				</table>
				
			</td>
		</tr>
	</tbody>
</table>
<span>
	<script type="text/javascript">
		formatAmt();
	</script>
</span>