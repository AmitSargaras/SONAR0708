<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    String indexID = (String) request.getParameter("indexID");
    String event = request.getParameter("event");
    String from_event = request.getParameter("from_event");
    String itemType = request.getParameter("itemType");

    // get tenor Type
    CommonCodeList commonCode = CommonCodeList.getInstance(CategoryCodeConstant.TIME_FREQ);
    List tenorUnitID = (List) commonCode.getCommonCodeValues();
    List tenorUnitValue = (List) commonCode.getCommonCodeLabels();

    pageContext.setAttribute("tenorUnitID", tenorUnitID);
    pageContext.setAttribute("tenorUnitValue", tenorUnitValue);


    int index = 2;
    if ("prepare".equals(event) || "create".equals(event)) {
        index = 1;
    }

    ICustGrpIdentifierTrxValue trxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction."+ CustGroupUIHelper.service_groupTrxValue);
   if (trxValue != null ) {
       CustGroupUIHelper.printChildMembers(trxValue);
   }   else{
      //System.out.println("trxValue is  null ");
   }
%>


<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="CssStyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
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
            }else if (num == 2) {
                document.forms[0].event.value="update";
            }else {
                document.forms[0].event.value="cancel";
                document.forms[0].action="GroupMember.do"
            }
            document.forms[0].submit();
        }

         function cancel() {
            document.forms[0].event.value="cancel";
            document.forms[0].submit();
        }
        -->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body >
<html:form action="GroupMember.do">
    <html:hidden property="event"/>
    <html:hidden property="groupMemberID"/>
    <html:hidden property="groupMemberRef"/>
    <html:hidden property="entityType" value="<%=ICMSConstant.ENTITY_TYPE_CUSTOMER%>"/>
    <html:hidden property="indexID" value="<%=indexID%>"/>
    <html:hidden property="nextPage" />
    <html:hidden property="itemType" value="<%=CustGroupUIHelper.GROUPMEMBER%>"/>

    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3><bean:message key="title.group.member" /> - View </h3></td>
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
                                <td width="38%" class="fieldname">Type</td>
                                <td width="62%">
                                    <html:select property="typeCD">
                                         <option value=""><bean:message key="label.please.select"/></option>
                                    </html:select>
                                   <html:errors property="typeCD"/>
                                    </td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname">Ratings</td>
                                <td> <html:select  property="ratingCD">
                                        <option value=""><bean:message key="label.please.select"/></option>
                                    </html:select>
                                    <html:errors property="ratingCD"/>
                                </td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname">Rating Date</td>
                                <td><html:text  property="ratingDt" readonly="true" size="15" maxlength="11"/>
                                <img src="img/calendara.gif" name="Image723" border="0" id="Image723"
                                        onclick="showCalendar('ratingDt', 'dd/mm/y')"
                                        onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
                                        onmouseout="MM_swapImgRestore()"/>
                                <html:errors property="ratingDt"/>
                                </td>
                            </tr>
                            <tr class="even">
                                <td class="fieldname">Expected Trend Rating</td>
                                <td>
                                     <html:text  property="expectedTrendRating" maxlength="100" size="20"/>
                                     <html:errors property="expectedTrendRating"/>
                                     </td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname">Reason for Change </td>
                                <td> <html:textarea  property="reason" rows="2" style="width:100%" /></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">&nbsp;<html:errors property="atleastOne"/>&nbsp;</td>
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
                <a href="javascript:submitPage(<%=index%>)"
                   onMouseOut="MM_swapImgRestore()"
                   onMouseOver="MM_swapImage('Image142','','img/ok2.gif',1)">
                    <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
            <td width="100" valign="baseline" align="center">
                <a href="javascript:cancel()"
                   onMouseOut="MM_swapImgRestore()"
                   onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)">
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

