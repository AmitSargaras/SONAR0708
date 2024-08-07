<%@ page import="com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IPropertyType,
                 com.integrosys.cms.app.bridgingloan.bus.IProjectSchedule,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Project Information
* Description: This screen allows the view of project details.
* It can be reached by clicking on the “Project Info” tab on the top of the screen.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        String event = String.valueOf(request.getParameter("event"));
        DefaultLogger.debug(this, "event="+event);
        String initEvent = String.valueOf(session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.initEvent"));
        DefaultLogger.debug(this, "initEvent="+initEvent);

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");

        String productDescription = objBridgingLoan.getProductDescription();
        if (productDescription == null)
            productDescription = "Bridging Loan";

        String userMembershipID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
        boolean isMrMaker = false;

        if (userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER))
        		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH))
        		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I))
        		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH))) {
            isMrMaker = true;
        }
%>

<html>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script>
function submitPage(event) {
    document.forms[0].initEvent.value=event;
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function gotoPage(actionPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/delete1.gif','img/close2a.gif','img/return1.gif','img/cancel1.gif')">
<html:form action="BridgingLoan.do">
<input type="hidden" name="event"/>
<input type="hidden" name="initEvent"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="limitProfileID" value="<%=objBridgingLoan.getLimitProfileID()%>"/>
<%
    //only need project ID when this is not to_track event.
    if (initEvent.equals("maker_prepare_create") || initEvent.equals("maker_prepare_update") || initEvent.equals("view")) {
        %><input type="hidden" name="projectID" value="<%=objBridgingLoan.getProjectID()%>"/><%
    }
%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" style="text-align:left"><h3><bean:message key="label.bridgingloan.cont.title"/></h3></td>
        <td width="42%" style="text-align:right" valign="bottom">
            <%  if (initEvent!=null && initEvent.equals("view") && isMrMaker) { %>
                <input name="btnEdit" type="button" class="btnNormal" value="Edit" onclick="submitPage('maker_prepare_update')" style="width:60px" />
            <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2">
        <hr/>      </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.limit.id"/></td>
                <td width="30%"><%=objBridgingLoan.getSourceLimit()%>&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prd.desc"/></td>
                <td width="30%"><integro:empty-if-null value="<%=productDescription%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.proj.no"/></td>
                <td><integro:empty-if-null value="<%=objBridgingLoan.getProjectNumber()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.cont.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getContractDate()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.ofc.value"/></td>
                <td><integro:amount amount="<%=objBridgingLoan.getContractAmount()%>"/>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.per.finc"/></td>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=objBridgingLoan.getFinancePercent()%>" />&nbsp;%</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.finc.cont.value"/></td>
                <td><integro:amount amount="<%=objBridgingLoan.getFinancedAmount()%>"/>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.fsc.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getFullSettlementContractDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.col.acc.no"/></td>
                <td><%=objBridgingLoan.getCollectionAccount()%>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.hda.acc.no"/></td>
                <td><%=objBridgingLoan.getHdaAccount()%>&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.proj.acc"/></td>
                <td><%=objBridgingLoan.getProjectAccount()%>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.curr.acc"/></td>
                <td><%=objBridgingLoan.getCurrentAccount()%>&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.prop.no.typ"/></td>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=objBridgingLoan.getNoOfTypes()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                <%
                    int noUnit = 0;
                    if (objBridgingLoan != null) {
                        IPropertyType[] obPropertyType = (IPropertyType[]) objBridgingLoan.getPropertyTypeList();
                        if (obPropertyType != null && obPropertyType.length > 0) {
                            for (int index=0; index<obPropertyType.length; index++) {
                                if (obPropertyType[index].getIsDeletedInd() != true) {
                                    noUnit += obPropertyType[index].getNoOfUnits();
                                }
                            }
                        }
                    }
                    String noOfUnit = "";
                    if (noUnit <= 0)
                        noOfUnit = "-"; //Return "-" when noUnit = 0
                    else
                        noOfUnit = Integer.toString(noUnit);
                %>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=noOfUnit%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.exp.st.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getExpectedStartDate()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.exp.complt.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getExpectedCompletionDate()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.act.st.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getActualStartDate()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.act.complt.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getActualCompletionDate()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.expry.avail.date"/></td>
                <td><integro:date object="<%=objBridgingLoan.getAvailabilityExpiryDate()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.date.fs"/></td>
                <td><integro:date object="<%=objBridgingLoan.getFullSettlementDate()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td colspan="3" style="text-align:left"><integro:htmltext value="<%=objBridgingLoan.getBlRemarks()%>" />&nbsp;</td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td style="text-align:right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td><h3>Property Type </h3> </td>
        <td style="text-align:right"></td>
    </tr>
    <tr>
        <td colspan="2"><hr></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            <tr>
                <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                <td width="*"><bean:message key="label.bridgingloan.prty.typ"/></td>
                <td width="12%"><bean:message key="label.bridgingloan.prop.no.unt"/></td>
                <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
            </tr>
            </thead>
            <tbody>
                <%
                    IPropertyType[] objPropertyType = null;
                    if (objBridgingLoan != null)
                        objPropertyType = (IPropertyType[]) objBridgingLoan.getPropertyTypeList();

                    if (objBridgingLoan == null || objPropertyType == null) {
                %>
                <tr class="even">
                    <td width="100%" colspan="9"><bean:message key="label.global.not.found"/></td>
                </tr>
                <%  }
                    else {
                        for (int index=0; index<objPropertyType.length; index++) {
                            if (objPropertyType[index].getIsDeletedInd() != true) {
                %>
                <tr class='<%=(index%2==0?"even":"odd")%>'>
                    <td style="text-align:center" class="index"><%=(index+1)%></td>
                    <td><integro:empty-if-null value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(objPropertyType[index].getPropertyType())%>"/></td>
                    <td style="text-align:right"><integro:number number="<%=objPropertyType[index].getNoOfUnits()%>"/></td>
                    <td style="text-align:center"><a href="BL_PropertyType.do?event=view&propertyTypeIndex=<%=index%>">View</a></td>
                </tr>
                <% } } } %>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td><h3> Project Schedule </h3></td>
        <td style="text-align:right" valign="bottom"></td>
    </tr>
    <tr>
        <td colspan="2"><hr /></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.prgs.stg"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.prop.st.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.prop.end.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.act.st.date"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.act.end.date"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
            </thead>
            <tbody>
                <%
                    IProjectSchedule[] objProjectSchedule = null;
                    if (objBridgingLoan != null)
                        objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();

                    if (objBridgingLoan == null || objProjectSchedule == null) {
                %>
                <tr class="even">
                    <td width="100%" colspan="9"><bean:message key="label.global.not.found"/></td>
                </tr>
                <%  }
                    else {
                        for (int index=0; index<objProjectSchedule.length; index++) {
                            if (objProjectSchedule[index].getIsDeletedInd() != true) {
                %>
                <tr class='<%=(index%2==0?"even":"odd")%>'>
                    <td style="text-align:center" class="index"><%=(index+1)%></td>
                    <td><integro:empty-if-null value="<%=objProjectSchedule[index].getProgressStage()%>"/></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getStartDate()%>" /></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getEndDate()%>" /></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getActualStartDate()%>" /></td>
                    <td style="text-align:center"><integro:date object="<%=objProjectSchedule[index].getActualEndDate()%>" /></td>
                    <td style="text-align:center"><a href="BL_ProjectSchedule.do?event=view&projectScheduleIndex=<%=index%>">View</a></td>
                </tr>
                <% } } } %>
            </tbody>
            </table>
        </td>
    </tr>
	<tr>
	    <td colspan="2">&nbsp; </td>
	</tr>
</tbody>
</table>

<%
IBridgingLoanTrxValue bridgingLoanTrxValue = (IBridgingLoanTrxValue) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanTrxValue");
if (initEvent!=null && initEvent.equals("maker_prepare_close")) {
%>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tbody>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <jsp:include page="/bridgingloan/bridgingloan_remarks_section_include.jsp" flush="true">
                <jsp:param name="UID" value='<%=bridgingLoanTrxValue.getUserInfo()%>'/>
                <jsp:param name="remarks" value='<%=bridgingLoanTrxValue.getRemarks()%>'/>
                </jsp:include>
            </td>
        </tr>
    </tbody>
    </table>
<% } %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <table width="246" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td style="text-align:center">
                    <%
                    if (initEvent != null && (initEvent.equals("maker_prepare_delete") || initEvent.equals("maker_process"))) {
                        %><a href="javascript:gotoPage('BridgingLoan.do','delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a><%
                    }
                    else if (initEvent!=null && initEvent.equals("maker_prepare_close")) {
                        %><a href="javascript:gotoPage('BridgingLoan.do','maker_close');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a><%
                    }

                    if (initEvent != null && initEvent.equals("to_track")) {
                        %><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a><%
                    }
                    if (initEvent != null && (initEvent.equals("maker_prepare_delete") || initEvent.equals("maker_process"))) {
                        %><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/return1.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a><%    
                    }
                    else {
                        if (initEvent!=null && initEvent.equals("maker_prepare_close")) {
                            %><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a><%
                        }
                        else {
                            %><a href="javascript:gotoPage('BridgingLoan.do','list_summary')"><img src="img/return1.gif" width="70" height="20" border="0"></a><%
                        }
                    }
                    %>
                </td>
            </tr>
            </table>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { DefaultLogger.debug(this, e.toString()); } %>