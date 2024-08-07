
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.relationship.RelationshipForm"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>	
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function create() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_SAVE %>";
		document.forms[0].submit();
	}
	function update() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_UPDATE %>";
		document.forms[0].submit();
	}
	function createNoFrame() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_SAVE_WO_FRAME %>";
		document.forms[0].submit();
	}
	function updateNoFrame() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_UPDATE_WO_FRAME %>";
		document.forms[0].submit();
	}
	function selectChecked(checked) {
		document.forms[0].guaranteeFlag[checked].checked=true;
		if (checked == "0") {
			document.forms[0].guaranteeAmount.value="";
		}
		else if (checked == "1") {
			document.forms[0].guaranteePercentage.value="";
		}
	}
</script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 1;

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	
	RelationshipForm form = (RelationshipForm) request.getAttribute("FacilityRelationshipForm");

    String legalReference = (String) request.getAttribute("legalReference");
    String legalName = (String) request.getAttribute("legalName");
    String currentTab = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.currentTab");

    String selectedIndex = (String) request.getAttribute("selectedId");
    int intIndex = 0;
    if (StringUtils.isNotEmpty(selectedIndex)) {
        intIndex = Integer.parseInt(selectedIndex);

        if (StringUtils.isNotEmpty(form.getCifNo()[intIndex]))
            legalReference = form.getCifNo()[intIndex];
        if (StringUtils.isNotEmpty(form.getPledgorName()[intIndex]))
            legalName = form.getPledgorName()[intIndex];
    }

//    DefaultLogger.debug(this, "HostAddressSequenceNumber : " + form.getHostAddressSequenceNumber());

    boolean onlyPrimary = false;
    ArrayList filterRelationshipPrimary = new ArrayList();
    ArrayList filterNonPrimary = new ArrayList();

    if (form.getHostAddressSequenceNumber() != null && StringUtils.isNotBlank(form.getHostAddressSequenceNumber())
            && Long.parseLong(form.getHostAddressSequenceNumber()) >= 1) {
        if (StringUtils.equals(form.getAccountRelationshipEntryCode(), ICMSConstant.ACCOUNT_RELATIONSHIP_PRIMARY)) {
            onlyPrimary = true;

            CommonCodeList relationList = CommonCodeList.getInstance(CategoryCodeConstant.RELATIONSHIP);
            if (relationList != null && relationList.getCommonCodeValues() != null
                    && relationList.getCommonCodeValues().size() > 0) {
                 Iterator itr = relationList.getCommonCodeValues().iterator();
                while (itr.hasNext()) {
                    String code = (String)itr.next();
                    if (StringUtils.equals(code, ICMSConstant.ACCOUNT_RELATIONSHIP_PRIMARY)) {
                        continue;
                    }
                    filterNonPrimary.add(code);
                }
            }
        } else {
            filterRelationshipPrimary.add(ICMSConstant.ACCOUNT_RELATIONSHIP_PRIMARY);
        }
    }

//    DefaultLogger.debug(this, "onlyPrimary : " + onlyPrimary);

%>
<body>
<html:form action="FacilityRelationship.do">
	<html:hidden property="event" />
	<html:hidden property="hostAddressSequenceNumber" />
	<input type="hidden" name="nextTab" value="<%=currentTab %>">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.relationship" /></h3>
				</td>
			</tr>
			<tr>
				<td width="70%">
				<html:errors property="uniqueCombination"/>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%"><%=limitProfile.getBCAReference()%></td>
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.code" /></span></td>
							<td width="30%"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limit.getFacilitySequence()%></td>
							 <td class="fieldname"><span class="stp">&nbsp;</span></td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.facility.cif.no" /></td>
							<td><%= legalReference != null ? legalReference : form.getLEReference()%> <html:hidden property="LEReference" value="<%=legalReference != null ? legalReference : form.getLEReference() %>"></html:hidden></td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.customer.rs.entity.name" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=legalName != null ? legalName : form.getLegalName() %><html:hidden property="legalName" value="<%=legalName != null ? legalName : form.getLegalName() %>"></html:hidden></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.account.relationship" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
                                <html:select property="accountRelationshipEntryCode">
                                    <% if (onlyPrimary) { %>
                                    <integro:common-code
                                            categoryCode="<%=CategoryCodeConstant.RELATIONSHIP%>" descWithCode="true"
                                            excludeList="<%=filterNonPrimary%>" pleaseSelect="false"/>
                                    <% } else { %>
                                    <integro:common-code
                                            categoryCode="<%=CategoryCodeConstant.RELATIONSHIP%>" descWithCode="true"
                                            excludeList="<%=filterRelationshipPrimary%>"/>
                                    <% } %>
                                </html:select>
                                <html:errors property="accountRelationshipEntryCode" />
                            </td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.share.holder.percentage" /></span></td>
							<td><html:text property="shareHolderPercentage"></html:text>
							<html:errors property="shareHolderPercentage" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.guarantee.percentage.amount" /></span></td>
							<td colspan="3"><html:radio property="guaranteeFlag"
								value="percentage"></html:radio> <html:text
								property="guaranteePercentage" onkeyup="selectChecked(0)"></html:text>
							% <html:errors property="guaranteePercentage" /> <html:radio
								property="guaranteeFlag" value="amount"></html:radio>
							<%if(limit.getApprovedLimitAmount() != null){ %>
 							<%=limit.getApprovedLimitAmount().getCurrencyCode()%>
							<%}else{ %>-<%} %>
							<html:text property="guaranteeAmount" onkeyup="selectChecked(1)"></html:text>
							<html:errors property="guaranteeAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.address.sequence.number" /></span></td>
							<td><integro:empty-if-null value="<%=form.getHostAddressSequenceNumber()%>" />&nbsp;</td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.receive.mail.code" /></span></td>
							<td><html:radio property="receiveMailCode" value="Y"
								styleId="receiveMailCodeYes">
								<label for="receiveMailCodeYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="receiveMailCode" value="N"
								styleId="receiveMailCodeNo">
								<label for="receiveMailCodeNo"><bean:message
									key="label.common.no" /></label>
							</html:radio></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.hold.mail.code" /></span></td>
							<td><html:select property="holdMailCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.HOLD_MAIL%>"
									descWithCode="true" />
							</html:select></td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.name.associated.with.facility.order" /></span></td>
							<td><html:text property="nameAssociateWithFacilityOrder"></html:text>
							<html:errors property="nameAssociateWithFacilityOrder" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.name.conjunction.position" /></span></td>
							<td>
							<html:radio property="nameConjunctionPosition" value="E"
								styleId="nameConjunctionPositionAfter">
								<label for="nameConjunctionPositionAfter"><bean:message
									key="label.common.end" /></label>
							</html:radio>&nbsp;<html:radio property="nameConjunctionPosition" value="B"
								styleId="nameConjunctionPositionBefore">
								<label for="nameConjunctionPositionBefore"><bean:message
									key="label.common.before" /></label>
							</html:radio></td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.name.conjunction" /></span></td>
							<td>
							<html:select property="nameConjunction">
							<integro:common-code
									categoryCode="<%=CategoryCodeConstant.NAME_CONJUNCTION%>" />
							</html:select></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.profit.ratio" /></span></td>
							<td><html:text property="profitRatio"></html:text> <html:errors
								property="profitRatio" /></td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.dividend.ratio" /></span></td>
							<td><html:text property="dividendRatio"></html:text> <html:errors
								property="dividendRatio" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
				<table width="150" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<%
							if (FacilityMainAction.EVENT_EDIT.equals(form.getEvent())) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="update()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331" /> </a></td>
						
						<td width="75" valign="baseline" align="center"><a
							href="FacilityRelationship.do?event=list"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a></td>
						<%
							}
								else if (FacilityMainAction.EVENT_EDIT_WO_FRAME.equals(form.getEvent())) {
						%>

						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="updateNoFrame()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331" /> </a></td>
						
						<td width="75" valign="baseline" align="center"><a
							href="FacilityRelationship.do?event=list_no_frame"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a></td>
						<%
							}
								else if (FacilityMainAction.EVENT_ADD.equals(form.getEvent())) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="create()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331" /> </a></td>
						
						<td width="75" valign="baseline" align="center"><a
							href="FacilityRelationship.do?event=prepare_search_customer"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a></td>
						<%
							}
								else if (FacilityMainAction.EVENT_ADD_WO_FRAME.equals(form.getEvent())) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="createNoFrame()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331" /> </a></td>
						
						<td width="75" valign="baseline" align="center"><a
							href="FacilityRelationship.do?event=prepare_search_customer_no_frame"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a></td>
						<%
							}
						%>
					</tr>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>