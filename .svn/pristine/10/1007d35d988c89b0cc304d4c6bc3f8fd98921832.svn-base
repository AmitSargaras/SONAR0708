
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.multitierfin.MultiTierFinForm"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil,
				java.util.Locale" %>

<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMultiTierFinancing"%><html>
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
</script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 0;

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
	MultiTierFinForm form = (MultiTierFinForm) request.getAttribute("FacilityMultiTierFinForm");

    String currentTab = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.currentTab");
	
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	
    String selectedIndex = (String) request.getAttribute("selectedId");
    int intIndex = 0;
    if (StringUtils.isNotEmpty(selectedIndex)) {
        intIndex = Integer.parseInt(selectedIndex);

//        if (StringUtils.isNotEmpty(form.getCifNo()[intIndex]))
//            legalReference = form.getCifNo()[intIndex];
//        if (StringUtils.isNotEmpty(form.getPledgorName()[intIndex]))
//            legalName = form.getPledgorName()[intIndex];
    }
    
    IFacilityMultiTierFinancing multiTierFin = null;
    
    if (facilityMasterObj != null) {
    	if (facilityMasterObj.getFacilityMultiTierFinancingSet() != null && StringUtils.isNotEmpty(selectedIndex)) {
    		intIndex = Integer.parseInt(selectedIndex);
    		IFacilityMultiTierFinancing[] arrays = (IFacilityMultiTierFinancing[])(facilityMasterObj.getFacilityMultiTierFinancingSet())
    							.toArray(new IFacilityMultiTierFinancing[0]);
    		if (arrays.length > intIndex)
    			multiTierFin = arrays[intIndex];
    	}
    }
%>
<body>
<html:form action="FacilityMultiTierFin.do">
	<html:hidden property="event" />
    <html:hidden property="tierSeqNo" value="<%= form.getTierSeqNo()%>"/>
	<html:hidden property="rateNumber" />
	<html:hidden property="rateVariance" />
	<html:hidden property="varianceCode" />
	<html:hidden property="paymentAmount" />

            <input type="hidden" name="nextTab">
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="70%">
						<h3><bean:message key="label.facility.multitierfin" /></h3>
						</td>
						<td width="30%" align="right"><bean:message key="label.indicate.mandatory" /></td>
					</tr>
					<tr>
						<td width="70%">
						<html:errors property="uniqueCombination" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<hr>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="tblInfo">
							<tbody>
								<tr class="<%=style[count++%2] %>">
									<td width="20%" class="fieldname"><span class="stp"><bean:message
										key="label.facility.aa.no" /></span><bean:message
										key="label.mandatory" /></td>
									<td width="30%"><%=limitProfile.getBCAReference()%></td>
									<td width="20%" class="fieldname"><span class="stp"><bean:message
										key="label.facility.sequence.no" /></span><bean:message
										key="label.mandatory" /></td>
									<td width="30%"><%=limit.getFacilitySequence()%></td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message
										key="label.facility.code" /></span><bean:message
										key="label.mandatory" /></td>
									<td><integro:empty-if-null
										value="<%=limit.getFacilityCode() %>" /></td>
									<td class="fieldname"><span class="stp"><bean:message
										key="label.facility.branch.no" /></span><bean:message key="label.mandatory" /></td>
									<td><integro:empty-if-null
											value="<%=limit.getBookingLocation().getOrganisationCode() %>" /></td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.seq.no" /></span></td>
									<td>
											<integro:empty-if-null value="<%= form.getTierSeqNo()%>" />
										
									</td>
									<td class="fieldname">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.tier.term" /></span><bean:message
										key="label.mandatory" /></td>
									<td><html:text property="tierTerm" />
										<html:errors property="tierTerm" />
									</td>
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.tier.term.code" /></span><bean:message
										key="label.mandatory" /></td>
									<td><html:select property="tierTermCode">
										<integro:common-code
										categoryCode="<%=CategoryCodeConstant.LIMIT_TENOR%>" />
										</html:select><html:errors property="tierTermCode" />&nbsp;</td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.interest.rate" /></span><bean:message
										key="label.mandatory" /></td>
									<td><html:text property="rate" />
							    <html:errors property="rate" />
									</td>
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.rate.number" /></span></td>
									<td><bean:write name="FacilityMultiTierFinForm" property="rateNumber"/>
									&nbsp;<html:errors property="rateNumber" /></td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.rate.variance" /></span></td>
									<td><bean:write name="FacilityMultiTierFinForm" property="rateVariance"/>
									&nbsp;<html:errors property="rateVariance" /></td>
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.variance.code" /></span></td>
									<td><bean:write name="FacilityMultiTierFinForm" property="varianceCode"/>
									&nbsp;<html:errors property="varianceCode" /></td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.grace.period" /></span></td>
									<td><html:radio property="gracePeriod" value="Y"></html:radio><bean:message key="label.common.yes" />&nbsp;
										<html:radio property="gracePeriod" value="N"></html:radio><bean:message key="label.common.no" />&nbsp;
										<html:radio property="gracePeriod" value=" "></html:radio><bean:message key="label.common.not.avail" />
									<html:errors property="gracePeriod" /></td>
									<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.payment.amount" /></span></td>
									<td><bean:write name="FacilityMultiTierFinForm" property="paymentAmount"/>
									&nbsp;<html:errors property="paymentAmount" /></td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
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
							href="FacilityMultiTierFin.do?event=list"
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
							href="FacilityMultiTierFin.do?event=list_no_frame"
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
							href="FacilityMultiTierFin.do?event=list"
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
							href="FacilityMultiTierFin.do?event=list_no_frame"
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
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>