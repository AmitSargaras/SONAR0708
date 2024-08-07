<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.*"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.manualinput.aa.RatingList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
     String indexID   = (String) request.getAttribute ("indexID");
    String event     = (String) request.getAttribute("event");
    String from_even = (String) request.getAttribute("from_even");
    String itemType  = (String) request.getAttribute("itemType");

    //System.out.println("indexID = " + indexID);
   // System.out.println("event = " + event);
   // System.out.println("from_event = " + from_even);
  //  System.out.println("itemType = " + itemType);

    int index = 2;
    if ("prepare".equals(event) || "create".equals(event)) {
        index = 1;
    }

    //event ="track_return";

    ICustGrpIdentifierTrxValue trxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction."+ CustGroupUIHelper.service_groupTrxValue);
    CustGroupUIHelper.printChildMembers(trxValue);

    IGroupCreditGrade  obj = (IGroupCreditGrade) request.getAttribute(CustGroupUIHelper.form_groupCreditGradeObj );
    if (obj ==null){
        obj =  new OBGroupCreditGrade();
    }
    ICustGrpIdentifier stagingObj = null;
    if (trxValue != null) {
        if ("read".equals(event)) {
            stagingObj = trxValue.getCustGrpIdentifier();
        } else {
            stagingObj = trxValue.getStagingCustGrpIdentifier();
        }

    } else {
       // System.out.println("itrxValue IS  NULL");
        stagingObj = new OBCustGrpIdentifier();

    }
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
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
            }
            document.forms[0].submit();
        }
        -->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">

<%@include file="/common/mandatory_for_submission_note.jsp" %>


<!-- InstanceBeginEditable name="Content" -->
<html:form action="GroupCreditGrade.do">
    <html:hidden property="event"/>
    <html:hidden property="groupCreditGradeID"/>
    <html:hidden property="groupCreditGradeIDRef"/>
    <html:hidden property="indexID" value="<%=indexID%>"/>
    <html:hidden property="nextPage" />
    <html:hidden property="itemType" />

    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
          <thead>
              <tr>
                  <td><h3><bean:message key="label.group.credit.grades"/> - View </h3></td>
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
                                  <td width="38%" class="fieldname"><bean:message key="label.group.credit.type" /></td>
                                  <td width="62%">
                                      <%=CustGrpIdentifierUIHelper.getCodeDesc(obj.getTypeCD(), ICMSUIConstant.RATING_TYPE)%>
                                      <%--<bean:write name="GroupCreditGradeForm" property="typeCD" />--%>
                                  </td>
                              </tr>
                              <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.group.credit.rating" /><span class="mandatory"> * </span></td>
                                  <td><integro:empty-if-null value="<%=CustGrpIdentifierUIHelper.getCodeDesc(obj.getRatingCD(), ICMSUIConstant.CREDIT_GRADE_RATING)%>" />
                                  </td>
                              </tr>
                              <tr class="even">
                                  <td class="fieldname"><bean:message key="label.group.credit.ratingdate" /><span class="mandatory"> * </span></td>
                                   <td><bean:write name="GroupCreditGradeForm" property="ratingDt" /></td>
                              </tr>
                              <tr class="even">
                                  <td class="fieldname"><bean:message key="label.group.credit.exp.trend" /></td>
                                  <td><bean:write name="GroupCreditGradeForm" property="expectedTrendRating" /></td>
                              </tr>
                              <tr class="odd">
                                  <td class="fieldname"><bean:message key="label.group.credit.reason" /></td>
                                  <td><bean:write name="GroupCreditGradeForm" property="reason" /></td>
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
        </tr>
        <tr>
            <td width="100" valign="baseline" align="center">
                <a href="CustGrpIdentifier.do?event=<%=event%>&from_event=process&itemType=<%=itemType%>" target="_parent" onMouseOut="MM_swapImgRestore()"
                 <%--<a href="CustGrpIdentifier.do?event=process_return&from_event=process&itemType=<%=request.getParameter("itemType")%>" target="_parent" onMouseOut="MM_swapImgRestore()"--%>
                   onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>

            </td>
        </tr>
        <tr>
            <td valign="baseline" align="center">&nbsp;</td>
        </tr>
    </table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

