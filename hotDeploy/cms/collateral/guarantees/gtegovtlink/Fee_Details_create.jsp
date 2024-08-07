<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String indexID = (String) request.getParameter("indexID");
    String from_event = request.getParameter("from_event");
    String formActionName = request.getParameter("formActionName");
    String subtype = request.getParameter("subtype");

    // get tenor Type
    CommonCodeList commonCode = CommonCodeList.getInstance(CategoryCodeConstant.TIME_FREQ);
    List tenorUnitID   = (List) commonCode.getCommonCodeValues();
    List tenorUnitValue   = (List) commonCode.getCommonCodeLabels();

    pageContext.setAttribute("tenorUnitID", tenorUnitID);
    pageContext.setAttribute("tenorUnitValue", tenorUnitValue);

    int index =2;
    if (  "prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))){
		index = 1;
    }

    //System.out.println("formActionName = " + formActionName);
   // System.out.println("from_event = " + from_event);
   // System.out.println("indexID = " + indexID);
   // System.out.println("index = " + index);
   // System.out.println("subtype = " + subtype);

%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
    <script type="text/javascript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
    <!--

    function submitPage(num) {

        if (num == 1) {
            document.forms[0].event.value="create";
        }
        if (num == 2) {
            document.forms[0].event.value="update";
        }
        if (num == 3) {
            document.forms[0].event.value="cancel";
        }
        document.forms[0].submit();
        }

    -->
   </script>
    
</head>

<body>
<html:form action="FeeDetails.do">
<input type="hidden" name="event" />
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="subtype" value="<%=subtype%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3><bean:message key="label.fee.detail.title.create"/></h3></td>
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
                                <td width="20%" class="fieldname"><bean:message key="label.fee.details.effective.date"/></td>
                                <td width="30%">
                                    <html:text property="effectiveDate" readonly="true" style="width:90px" size="15" maxlength="11" />
                                        <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('effectiveDate', 'dd/mm/y')" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                                        &nbsp;<html:errors property="effectiveDate" />
                                 </td>
                                <td width="20%" class="fieldname"><bean:message key="label.fee.details.expiration.date"/> </td>
                                <td width="30%">
                                    <html:text property="expirationDate" readonly="true" style="width:90px" size="15" maxlength="11" />
                                         <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('expirationDate', 'dd/mm/y')" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                                         &nbsp;<html:errors property="expirationDate" />
                                  </td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.fee.details.guarantee.amount"/>&nbsp;
                                	<bean:message key="label.mandatory"/></td>
                                <td><html:text property="amountFee" style="width:90px" size="15" maxlength="11" />
                                     &nbsp;<html:errors property="amountFee" /></td>
                                 <%--
                                <td class="fieldname"><bean:message key="label.fee.details.cgc.amount"/></td>
                                 <td><html:text property="amountCGC" style="width:90px" size="15" maxlength="11" />
                                     &nbsp;<html:errors property="amountCGC" /></td>
                                     --%>                                     
                                 <td class="fieldname"><bean:message key="label.fee.detail.cgc.payment.date"/>&nbsp;
                                 	<bean:message key="label.mandatory"/></td>
                                 <td><html:text property="feePaymentDateCGC" readonly="true" style="width:90px" size="15" maxlength="11" />
                                         <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('feePaymentDateCGC', 'dd/mm/y')" onMouseOver="MM_swapImage('Image723','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                                         &nbsp;<html:errors property="feePaymentDateCGC" />
                                 </td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname"><bean:message key="label.fee.details.tenor"/></td>
                                <td><html:text property="tenor" style="width:90px" size="15" maxlength="11" />                                    
                                     <html:select property="tenorFreq">
									    <html:options name="tenorUnitID" labelName="tenorUnitValue"/>
                                    </html:select>
                                    &nbsp;<html:errors property="tenor" /></td>
                                <td class="fieldname">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">&nbsp;<html:errors property="atleastOne" />&nbsp;</td>
            </tr>
        </tbody>
    </table>


    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td width="100" valign="baseline" align="center">
                <a href="javascript:submitPage(<%=index%>)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image142','','img/ok2.gif',1)">
                    <img src="img/ok1.gif" name="Image142" height="22" border="0" id="Image142"/></a></td>
            <td width="100" valign="baseline" align="center">
                <a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
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

