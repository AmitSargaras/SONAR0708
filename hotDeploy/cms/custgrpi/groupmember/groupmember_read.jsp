<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustShareholder" %>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.shareholder.ICustShareholderTrxValue" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.groupmember.GroupMemberForm" %>
<%@ page import="com.integrosys.cms.ui.custrelationship.CustRelUtils" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustRelationship"%>
<%@ page import="com.integrosys.cms.app.custrelationship.trx.ICustRelationshipTrxValue"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    String indexID = (String) request.getAttribute("indexID");
    String event = (String) request.getAttribute("event");
    String from_event = (String) request.getAttribute("from_even");
    String itemType = (String) request.getAttribute("itemType");


   

    // get tenor Type
    CommonCodeList commonCode = CommonCodeList.getInstance(CategoryCodeConstant.TIME_FREQ);
    List tenorUnitID = (List) commonCode.getCommonCodeValues();
    List tenorUnitValue = (List) commonCode.getCommonCodeLabels();

    pageContext.setAttribute("tenorUnitID", tenorUnitID);
    pageContext.setAttribute("tenorUnitValue", tenorUnitValue);


    int index = 2;
    if ("prepare".equals(event) || "create".equals(event)){
        index = 1;
    }

    GroupMemberForm aForm = (GroupMemberForm) request.getAttribute("GroupMemberForm");
    String sourceDesc = "-";
    if (aForm != null && aForm.getSourceID() != null){
        sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, aForm.getSourceID());

    }
   /* ICustShareholderTrxValue custShareHolderTrxValue = (ICustShareholderTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction.CustShareHolderTrxValue");
    ICustShareholder[] custShareHolder = custShareHolderTrxValue.getCustShareholder();
    if (custShareHolder == null)custShareHolder = new ICustShareholder[0];
    pageContext.setAttribute("custShareHolder", custShareHolder);

    ICustRelationshipTrxValue custRelTrxValue = (ICustRelationshipTrxValue)session.getAttribute("com.integrosys.cms.ui.custrelationship.CustRelAction.CustRelationshipTrxValue");
    ICustRelationship[] custRelationship = custRelTrxValue.getCustRelationship();
    if (custRelationship == null)custRelationship = new ICustRelationship[0];
    pageContext.setAttribute("custRelationship", custRelationship);
*/

    // Get the record markers.
    int offset = 0;
    int rowIdx=0;
    String subProfileId = (String) session.getAttribute("sub_profile_id");


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
            }else if (num == 2) {
                document.forms[0].event.value="update";
            }else {
                document.forms[0].event.value="cancel";
            }
            document.forms[0].submit();
        }
        -->
    </script>
</head>

<body>
<html:form action="GroupMember.do">
<html:hidden property="event"/>
<html:hidden property="groupMemberID"/>
<html:hidden property="groupMemberIDRef"/>
<html:hidden property="indexID" value="<%=indexID%>"/>
<html:hidden property="nextPage"/>
<html:hidden property="itemType" value="<%=CustGroupUIHelper.GROUPMEMBER%>"/>


<input type="hidden" name="sub_profile_id" value="<%=subProfileId %>"/>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tbody>
    <tr>
        <td colspan="2">
          <%@ include file="view_cust_relationship.jsp"%>

          <%@ include file="view_share_holder.jsp"%>

        </td>
    </tr>
</tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="CustGrpIdentifier.do?event=<%=event%>&from_event=process&itemType=<%=itemType%>" target="_parent"
               onMouseOut="MM_swapImgRestore()"
               onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>

        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>


</html:form>
</body>
</html>

