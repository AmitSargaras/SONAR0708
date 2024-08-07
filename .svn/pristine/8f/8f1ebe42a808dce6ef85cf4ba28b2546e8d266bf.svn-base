<%@page import="com.integrosys.cms.app.collateral.bus.type.guarantee.linedetail.ILineDetail"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
				com.integrosys.base.techinfra.diff.CompareResult"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.guarantee.IGuaranteeCollateral"%>
<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%>
<%@page import="com.integrosys.cms.ui.collateral.guarantees.linedetail.ILineDetailConstants"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.Constants"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.AbstractCommonMapper"%>
<%@page import="com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction"%>
<%@page import="java.util.List"%>
<%@ page import="com.integrosys.cms.ui.collateral.guarantees.linedetail.LineDetailAction" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%
List lineDetailList = null;

Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);

Boolean editMode = new Boolean(request.getParameter("editMode"));
Boolean isProcess = new Boolean(request.getParameter("isProcess"));
String viewUrl = "GLineDetail.do?event=" + LineDetailAction.EVENT_VIEW_LINE_DETAIL + "&selectedItem=";
if(isProcess){
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(GuaranteesAction.class.getName() + ".serviceColObj");
	IGuaranteeCollateral oldCollateral = (IGuaranteeCollateral) itrxValue.getCollateral();
	IGuaranteeCollateral newCollateral = (IGuaranteeCollateral) itrxValue.getStagingCollateral();
	if(newCollateral.getLineDetails() != null || oldCollateral.getLineDetails() != null)
		lineDetailList = CompareOBUtil.compOBArray( newCollateral.getLineDetails(),	oldCollateral.getLineDetails() == null ? null : oldCollateral.getLineDetails());
}
if(lineDetailList == null){
	lineDetailList = (List)session.getAttribute(GuaranteesAction.class.getName() + "." + ILineDetailConstants.SESSION_LINE_DETAIL_LIST);
}

pageContext.setAttribute("editMode", editMode);
pageContext.setAttribute("isProcess", isProcess);
pageContext.setAttribute(ILineDetailConstants.SESSION_LINE_DETAIL_LIST, lineDetailList);

%>
<head>
	 <script language="JavaScript" type="text/JavaScript">
	 function gotoPage(aLocation){
		 var subtype = document.getElementsByName('subtype')[0].value
		 var from_event = document.getElementsByName('from_event')[0].value;
		 window.location = aLocation + "&subtype=" + subtype + "&from_event=" + from_event;
	 }
	 function submitInnerPage(num, index) {
		 if(num == 3) {
			 var subtypeTemp = document.getElementsByName('subtype')[0].value
			 var from_eventTemp = document.getElementsByName('from_event')[0].value;
			  document.forms[0].action = "GLineDetail.do";
			  <%-- document.forms[0].event.value="<%=LineDetailAction.EVENT_PREPARE_CREATE_LINE_DETAIL%>"; --%>
			  if(subtypeTemp == "GteBankSame"){
			  document.forms[0].event.value="saveDetailsOfGuaranteeForBank";
			  }else{
				  document.forms[0].event.value="saveDetailsOfGuaranteeForLC";
			  }
		 }
		 if(num == 4) {
			 document.forms[0].action = "GLineDetail.do";
			 document.forms[0].event.value="<%=LineDetailAction.EVENT_PREPARE_EDIT_LINE_DETAIL%>";
			 document.forms[0].selectedItem.value = index;
		 }
		 if(num == 5) {
			 var removeItems = getElementsByClassName(document, "removeItem");
			 var idxs = []
			 for(var i = 0;i< removeItems.length;i++){
				 if(removeItems[i].checked){
					 idxs.push(removeItems[i].value);
				 }
			 }
			 if(idxs.length == 0){
				 alert("Please select alteast one record");
				 return;
			 }
			 document.forms[0].action = "GLineDetail.do";
			 document.forms[0].event.value="<%=LineDetailAction.EVENT_DELETE_LINE_DETAIL%>";
			 document.forms[0].selectedItemForRemoval.value = idxs.toString();
		 }
		 if(num == 6){
			 document.forms[0].action = "GLineDetail.do";
			 document.forms[0].event.value="<%=LineDetailAction.EVENT_VIEW_LINE_DETAIL%>";
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
<input type="hidden" name="selectedItemForRemoval"/>
<input type="hidden" name="selectedItem"/>
<logic:equal value="true" name="editMode">
	<html:hidden property="totalLineLevelSecurityOMV"/>
</logic:equal>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	<thead>
	    <tr>
	    	<td>
	    		<html:errors property="totalLineLevelSecurityOMV"/>
	    	</td>
	    </tr>
	    <tr>
	        <td>
	        	<h3><bean:message key="label.guarantee.line.details"/></h3>
	        </td>
	        <logic:equal value="true" name="editMode">
		        <td align="right" valign="baseline">
		        
				    <input class="btnNormal" type="button" name="lineDetailsSubmit" value="Add New" onclick="javascript:submitInnerPage(3, 1)"/>
	    			&nbsp; 
	    			<input name="lineDetailsRemove" type="button" class="btnNormal" value="Remove" onclick="javascript:submitInnerPage(5, 0)"/>
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
							<td width="5%"> <bean:message  key="label.global.sn"/> </td>
							<td width="15%"> <bean:message  key="label.guarantee.line.number"/> </td>
							<td width="15%"> <bean:message  key="label.guarantee.serial.no"/> </td>
							<td width="10%"> <bean:message  key="label.guarantee.lcn.no"/> </td>
							<td width="20%"><bean:message  key="label.guarantee.line.level.security.omv"/> </td>
							<td width="11%"> <bean:message key ="label.global.action"/></td>
							<logic:equal value="true" name="editMode">
								<td width="5%"> <bean:message key ="label.global.delete"/></td>
							</logic:equal>
						</tr>
					</thead>
					<tbody>
					<% int srNo = 0, idx=0; %>
					<logic:present name="<%=ILineDetailConstants.SESSION_LINE_DETAIL_LIST%>">
							<logic:iterate id="genericLineDetail" name="<%=ILineDetailConstants.SESSION_LINE_DETAIL_LIST%>" scope="page" indexId="index">
								 <%
								 	srNo++;
								 	idx++;
								    ILineDetail lineDetail = null;
								    String key = "index";
								    boolean displayRecord = true;
								 %>
								 <logic:equal value="true" name="isProcess">
								 	<%
									 	CompareResult result = (CompareResult) genericLineDetail;
									 	key = result.getKey();
									 	lineDetail = (ILineDetail) result.getObj();
									 	if(key.equals(CompareOBUtil.OB_DELETED)){
									 		displayRecord = false;
									 		srNo--;
									 	}
								 	%>
								 </logic:equal>
								 <logic:equal value="false" name="isProcess">
								 	<%
								 		lineDetail = (ILineDetail) genericLineDetail;
								 	%>
								 </logic:equal>
									<tr class="<%=(index % 2 )!= 0 ? "odd" : "even"%>">
										<td class="<%=key%>"><%=idx%></td>	
										<td><%=AbstractCommonMapper.isEmptyOrNull(lineDetail.getLineNo()) ? "-" : lineDetail.getLineNo() %></td>
										<td><%=AbstractCommonMapper.isEmptyOrNull(lineDetail.getSerialNo()) ? "-" : lineDetail.getSerialNo() %></td>
										<td><%=lineDetail.getLcnNo() == null  ? "-" : lineDetail.getLcnNo() %></td>
										<td>
											<span class="amtClass"><%=lineDetail.getLineLevelSecurityOMV() == null ? "-" : 
												lineDetail.getLineLevelSecurityOMV().toPlainString()%></span>		
										</td>
										<%if(displayRecord) {%>
										<td style="text-align: center;">
											<logic:equal value="true" name="editMode">
												<a href="javascript:submitInnerPage(6,'<%=index%>')">View</a>/<a href="javascript:submitInnerPage(4,'<%=index%>')">Edit</a>
											</logic:equal>
											<logic:equal value="false" name="editMode">
												<a href="#" onclick="gotoPage('<%=viewUrl + index%>')">View</a>
											</logic:equal>
										</td>
										<%}else{ %>
											<td>&nbsp;</td>
										<%} %>
										<logic:equal value="true" name="editMode">
											<td style="text-align: center;">
												<input type="checkbox" class="removeItem" value="<%=index%>"/>
											</td>								
										</logic:equal>
									</tr>
							</logic:iterate>
					</logic:present>
					<logic:notPresent name="<%=ILineDetailConstants.SESSION_LINE_DETAIL_LIST%>">
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