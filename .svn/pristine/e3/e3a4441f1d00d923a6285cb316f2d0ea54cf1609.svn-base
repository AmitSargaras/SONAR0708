<%@ page import="com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.gtegovtlink.IFeeDetails" %>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceAction" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.customer.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.guarantees.feedetails.FeeDetailsForm"%>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    String indexID = (String) request.getParameter("indexID");
    String from_event = request.getParameter("from_event");
    String formActionName = request.getParameter("formActionName");
    FeeDetailsForm colForm = (FeeDetailsForm) request.getAttribute("FeeDetailsForm");

    IFeeDetails stageObj = (IFeeDetails)request.getAttribute("stageFeeDetails");
    IFeeDetails actualObj = (IFeeDetails)request.getAttribute("actualFeeDetails");
    
    String event ="read_return"  ;
    boolean isProcess = false;
    if ("process".equals(from_event)){
    	isProcess = true;
     //    event = "process_return"  ;
    }

%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--
        function returnPage() {

            document.forms[0].action.value = "GteGovtLinkCollateral.do?event=read";
            document.forms[0].event.value = "read_return";
            document.forms[0].submit();
        }
        //-->
    </script>
    
</head>

<body>
<html:form action="FeeDetails.do">
<input type="hidden" name="event" value=">"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3><bean:message key="label.fee.details" /> - <bean:message key="label.view"/></h3></td>
                <td width="24%" align="right" valign="baseline">
                    <table width="130" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="100">&nbsp;</td>
                            <td width="50">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2"><hr/></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                            <tr class="even">
                                <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageObj,actualObj, "effectiveDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                	<bean:message key="label.fee.details.effective.date" /></td>
                                <td width="30%">
                                	<integro:empty-if-null value="<%= colForm.getEffectiveDate()%>"/>
                                	&nbsp; </td>
                                <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(stageObj,actualObj, "expirationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                	<bean:message key="label.fee.details.expiration.date" /></td>
                                <td width="30%">
                                <integro:empty-if-null value="<%= colForm.getExpirationDate()%>"/>
                                	&nbsp; </td>
                            </tr>
                            <tr class="odd">
                            	<%
                            		boolean isUnchanged = true;
                            		if (isProcess) {
                            			if ((stageObj != null && actualObj == null) ||
                            					(stageObj == null && actualObj != null))
                            				isUnchanged = false;
                            			else 
                            				isUnchanged = UIUtil.isAmountUnChanged(stageObj.getAmountFee(), actualObj.getAmountFee());                            				
                            		}
                            	%>
                                <td class="<%=isUnchanged?"fieldname":"fieldnamediff" %>">
                                	<bean:message key="label.fee.details.guarantee.amount"/>&nbsp;
                                	<bean:message key="label.mandatory"/></td>
                                <td><bean:write name="FeeDetailsForm" property="amountFee"/>&nbsp; </td>
                                <%--
                                <td class="fieldname"><bean:message key="label.fee.details.cgc.amount" /></td>
                                <td><bean:write name="FeeDetailsForm" property="amountCGC"/>&nbsp; </td>
                                --%>
                                <td class="<%=isProcess?(CompareOBUtil.compOB(stageObj,actualObj, "feePaymentDateCGC")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                	<bean:message key="label.fee.detail.cgc.payment.date"/> &nbsp;
                                	<bean:message key="label.mandatory"/> </td>
                                <td><integro:empty-if-null value="<%= colForm.getFeePaymentDateCGC()%>"/> &nbsp;
                                </td>
                            </tr>
                            <tr class="even">
                            	<%
                            	isUnchanged = true;
                            		if (isProcess) {
                            			isUnchanged = CompareOBUtil.compOB(stageObj,actualObj, "tenor");
                            			if (isUnchanged)
                            				isUnchanged = CompareOBUtil.compOB(stageObj,actualObj, "tenorFreq");
                            		}
                            	%>
                                <td class="<%=isUnchanged?"fieldname":"fieldnamediff" %>">
                                	<bean:message key="label.fee.details.tenor" /></td>
                                <td>
                                	<integro:empty-if-null value="<%=colForm.getTenor() %>"/>
                                    &nbsp;
                                    <integro:common-code categoryCode="<%=com.integrosys.cms.ui.collateral.CategoryCodeConstant.TIME_FREQ %>" entryCode="<%=colForm.getTenorFreq()%>" display="true" descWithCode="false"/>                                    
                                  </td>
                                <td class="fieldname">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>             
        </tbody>
    </table>

    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" width="100" valign="baseline" align="center">
                <a href="FeeDetails.do?event=<%=event%>&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>"  onMouseOut="MM_swapImgRestore()"
                   onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
            </td>
        </tr>
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
    </table>

</html:form>

</body>
</html>

