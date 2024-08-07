<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.guarantee.linedetail.ILineDetail"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.guarantees.linedetail.LineDetailAction,
				com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction,
				com.integrosys.cms.ui.collateral.guarantees.linedetail.ILineDetailConstants"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
	String selectedItem = (String) request.getAttribute("selectedItem");
	String subtype = (String) request.getAttribute("subtype");
	String from_event = (String) request.getAttribute("from_event");
	
	String context = request.getContextPath() + "/";
	
	String pageMode = request.getParameter("pageMode");
	Boolean editMode = new Boolean(request.getParameter("editMode"));
	String submitEvent = request.getParameter("submitEvent");

	List<LabelValueBean> facNameList = (List<LabelValueBean>)session.getAttribute(GuaranteesAction.class.getName() + "." + ILineDetailConstants.SESSION_FAC_NAME_LIST);
	List<LabelValueBean> facIdList = (List<LabelValueBean>)session.getAttribute(GuaranteesAction.class.getName() + "." + ILineDetailConstants.SESSION_FAC_ID_LIST);
	List<LabelValueBean> facLineNoList = (List<LabelValueBean>)session.getAttribute(GuaranteesAction.class.getName() + "." + ILineDetailConstants.SESSION_FAC_LINE_NO_LIST);
	
	ILineDetail stageOb = null;
	ILineDetail actualOb = null;
	boolean isProcess = "process".equals(from_event);
	if(isProcess){
		stageOb = (ILineDetail) request.getAttribute("stageLineDetail");
		actualOb = (ILineDetail) request.getAttribute("actualLineDetail");
	}
	
	pageContext.setAttribute(ILineDetailConstants.SESSION_FAC_NAME_LIST ,facNameList);
	pageContext.setAttribute(ILineDetailConstants.SESSION_FAC_ID_LIST ,facIdList);
	pageContext.setAttribute(ILineDetailConstants.SESSION_FAC_LINE_NO_LIST ,facLineNoList);
	pageContext.setAttribute("editMode", editMode);
	
%>
<head>
	<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
	<script type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
	<script language="JavaScript" type="text/JavaScript">
		function submitPage(num) {
	        if (num == 1) {
	            document.forms[0].event.value="<%=submitEvent%>";
	        }
	        if (num == 3) {
	            document.forms[0].event.value="<%=LineDetailAction.EVENT_CANCEL_LINE_DETAIL%>";
	        }
	        document.forms[0].submit();
		}

		function refreshFacilityDropdown(dropdown,name)
		{
			 var curSel = "";
			 for(i=0; i<dropdown.options.length; i++)
			 {
				if (dropdown.options[i].selected == true)
				{
				    curSel = dropdown.options[i].value;	
				}    	
			 }
			 if(curSel==""){
				 if(name == "facilityID"){
					clearDisplayDropdown("facilityID")
				 }
				 return;
			}
			 var url = '/cms/GLineDetail.do?event=refresh_facility_dropdown&curSel='+ curSel +'&dropdownName='+name;
			 sendLoadDropdownReq(name, url);
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
<html:form action="GLineDetail.do">
	<body>
		<table width="65%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
			<thead>
			    <tr>
			        <td width="100%" valign="bottom">
			        	<table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
			        		<tr>
			        			 <td width="100%">
			        			 	<h3><%=pageMode %> <bean:message key="label.guarantee.line.details"/></h3>
		      						<hr/>
		      						<table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">
		      							 <tbody> 
		      							 	<tr>
		      							 		<td>
		      							 			<br/>
		      							 			 <table class="tblInput" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">
		      							 			 	<tbody>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageOb,actualOb,"facilityName")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.facility.name"/>
		      							 			 				<logic:equal value="Y" name="LineDetailForm" property="facDetailMandatory">
		      							 			 					<font color="red">*</font>
		      							 			 				</logic:equal>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:select name="LineDetailForm" property="facilityName" onchange="javascript:refreshFacilityDropdown(this,'facilityID')">
			      							 			 					<option value=""><bean:message key="label.please.select"/></option>
			      							 			 					<html:options collection="<%=ILineDetailConstants.SESSION_FAC_NAME_LIST%>" labelProperty="label" property="value" />
			      							 			 				</html:select>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="facilityName"/>
		      							 			 				</logic:equal>
		      							 			 				<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="LineDetailForm" property="facilityName"/>
		      							 			 					<logic:empty name="LineDetailForm" property="facilityName">-</logic:empty>
		      							 			 				</logic:equal>
		      							 			 			</td>
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageOb,actualOb,"facilityID")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.facility.id"/>
		      							 			 				<logic:equal value="Y" name="LineDetailForm" property="facDetailMandatory">
		      							 			 					<font color="red">*</font>
		      							 			 				</logic:equal>		      							 			 				
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:select name="LineDetailForm" property="facilityID">
			      							 			 					<option value=""><bean:message key="label.please.select"/></option>
			      							 			 					<html:options collection="<%=ILineDetailConstants.SESSION_FAC_ID_LIST%>" labelProperty="label" property="value" />
			      							 			 				</html:select>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="facilityID"/>
			      							 			 				<html:hidden name="LineDetailForm" property="facilityID" />
		      							 			 				</logic:equal>
		      							 			 				<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="LineDetailForm" property="facilityID"/>
		      							 			 					<logic:empty name="LineDetailForm" property="facilityID">-</logic:empty>
		      							 			 				</logic:equal>		      							 			 				
		      							 			 			</td>      							 			 				
		      							 			 		</tr>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageOb,actualOb,"lineNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
		      							 			 				<bean:message key="label.guarantee.line.no"/>.
		      							 			 				<font color="red">*</font>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:select name="LineDetailForm" property="lineNo">
			      							 			 					<option value=""><bean:message key="label.please.select"/></option>
			      							 			 					<html:options collection="<%=ILineDetailConstants.SESSION_FAC_LINE_NO_LIST%>" labelProperty="label" property="value" />
			      							 			 				</html:select>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="lineNo"/>
			      							 			 				<html:hidden name="LineDetailForm" property="lineNo" />
			      							 			 			</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="LineDetailForm" property="lineNo"/>
		      							 			 					<logic:empty name="LineDetailForm" property="lineNo">-</logic:empty>
		      							 			 				</logic:equal>	
		      							 			 			</td> 
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageOb,actualOb,"lineLevelSecurityOMV")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.guarantee.line.level.security.omv"/>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="LineDetailForm" property="lineLevelSecurityOMV" styleId="lineLevelSecurityOMV" size="20" styleClass="amtClass" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
			      							 			 				<br>
			      							 			 				<html:errors property="lineLevelSecurityOMV"/>
			      							 			 			</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<span class="amtClassView"><bean:write name="LineDetailForm" property="lineLevelSecurityOMV"/></span>
		      							 			 					<logic:empty name="LineDetailForm" property="lineLevelSecurityOMV">-</logic:empty>
		      							 			 				</logic:equal>			      							 			 				
		      							 			 			</td>      							 			 				
		      							 			 		</tr>
		      							 			 		<tr class="even">
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageOb,actualOb,"serialNo")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.guarantee.serial.no"/>.
		      							 			 				<font color="red">*</font>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="LineDetailForm" property="serialNo" size="10"></html:text>&nbsp;
																		<br>
																		<html:errors property="serialNo"/>
																	</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="LineDetailForm" property="serialNo"/>
		      							 			 					<logic:empty name="LineDetailForm" property="serialNo">-</logic:empty>
		      							 			 				</logic:equal>																			
		      							 			 			</td>
		      							 			 			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageOb,actualOb,"lcnNo")?"fieldname":"fieldnamediff"):"fieldname"%>" >
		      							 			 				<bean:message key="label.guarantee.lcn.no"/>
		      							 			 			</td>
		      							 			 			<td width="20%">
		      							 			 				<logic:equal value="true" name="editMode">
			      							 			 				<html:text name="LineDetailForm" property="lcnNo" maxlength="2" size="10"></html:text>&nbsp;
																		<br>
																		<html:errors property="lcnNo"/>
																	</logic:equal>
			      							 			 			<logic:equal value="false" name="editMode">
		      							 			 					<bean:write name="LineDetailForm" property="lcnNo"/>
		      							 			 					<logic:empty name="LineDetailForm" property="lcnNo">-</logic:empty>
		      							 			 				</logic:equal>																			
		      							 			 			</td>      							 			 				
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
   												<img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" onclick="javascript:submitPage(3)"/></a>	        	
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
	<html:hidden name="LineDetailForm" property="lineDetailID" />
	<html:hidden name="LineDetailForm" property="collateralId" />
	<html:hidden name="LineDetailForm" property="facDetailMandatory" />
	<html:hidden name="LineDetailForm" property="refId" />
	<html:hidden property="event"/>
	<input type="hidden" name="from_event" value="<%=from_event%>"/>
	<input type="hidden" name="subtype" value="<%=subtype%>"/>
	<input type="hidden" name="selectedItem" value="<%=selectedItem%>"/>
</html:form>