<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterparty" %>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails" %>
<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue" %>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<jsp:include page="printTransValue.jsp"/>

<%

    String event = request.getParameter("event");
    
    ICCICounterpartyDetails actualDetails = null;
    ICCICounterpartyDetails stagingDetails = null;
    String aGroupCCINo = "-";
    ICCICounterpartyDetailsTrxValue trxValue = (ICCICounterpartyDetailsTrxValue) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.ICCICounterpartyDetailsTrxValue");


    String lastActionBy = "";
    String lastRemarksMade = "";

    if (trxValue != null) {
        

        lastActionBy = trxValue.getUserInfo();
        lastRemarksMade = trxValue.getRemarks();
        if (lastRemarksMade == null) {
            lastRemarksMade = "";
        }

        actualDetails = trxValue.getCCICounterpartyDetails();
        stagingDetails = trxValue.getStagingCCICounterpartyDetails();
        if (stagingDetails != null) {
            if (stagingDetails.getGroupCCINo() != 0) {
                aGroupCCINo = stagingDetails.getGroupCCINo() + "";
            }
        }
    } else {
    	DefaultLogger.debug(this,"trxValue is null ");
    }


%>
<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript">
        <!--
        function approvePage() {
            var frm = document.forms[0];
            frm.action='CounterpartyCCI.do?event=checker_approve_edit_cci';
            frm.submit();
        }
        function rejectPage() {
            var frm = document.forms[0];
            frm.action='CounterpartyCCI.do?event=checker_reject_edit_cci';
            frm.submit();
        }

      /*  function viewCustomer(sub_profile_id){
		    var  url ="CounterpartyCCI.do?event=viewLimitProfile&sub_profile_id=" + sub_profile_id  ;
		    window.open(url,'' ,"height=600, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no",'yes');
        }*/

        -->
    </script>
</head>

<body>
<br><br>

<html:form action="CounterpartyCCI.do?event=list">
<input type="hidden" name="event"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
</thead>
<tbody>
<tr>
    <td>
        <table width="100%" align="center">
            <tr><td>
                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblInput">
                    <thead>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td width="25%" class="fieldname"><bean:message key="label.cci.cciNo"/></td>
                            <td width="75%">&nbsp;<% out.print(aGroupCCINo); %></td>
                        </tr>
                    </tbody>
                </table>
            </td></tr></table>
    </td>
</tr>

<tr>
    <td ><h3>Process CCI</h3></td>
    <td align="right" valign="bottom">&nbsp;</td>
</tr>

<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"
               class="tblInfo">
            <thead>

                <tr>
                    <td width="3%"><bean:message key="label.global.sn"/></td>
                    <td width="25%"><bean:message key="label.customer.name"/>/<br><bean:message key="label.agreement.address"/></td>
                    <td width="10%"><bean:message key="label.customer.doincorp"/></td>
                    <td width="10%"><bean:message key="label.customer.id.source"/></td>
                    <td width="10%"><bean:message key="label.customer.id"/></td>
                    <td width="25%"><bean:message key="label.col.owner.id.no"/></td>
                </tr>
            </thead>
            <tbody>
         <%
            ICCICounterparty[]  staging = null;
            ICCICounterparty[]  actual = null;
            if (stagingDetails != null) { staging = stagingDetails.getICCICounterparty();}
            if (actualDetails  != null) { actual = actualDetails.getICCICounterparty(); }

            if(staging == null ){
            %>
             <tr >
                  <td colspan="5" align="center"  ><bean:message key="label.global.not.found"/>&nbsp;</td>
               </tr>
            <%
	  	}else{
            int rowIdx = 0;
            int count = 1;
            if ( staging.length > 0) {
                for (int index = 0;index < staging.length; index++) {
                    ICCICounterparty OB = staging[index];
                    long subProfileID =  OB.getSubProfileID()  ;
//                    String legalName = (CounterpartyUIHelper.isNotEmpty(OB.getLegalName())) ? OB.getLegalName() : "-";
                    String legalName = (CounterpartyUIHelper.isNotEmpty(OB.getCustomerName())) ? OB.getCustomerName() : "-";
//                    String dob = CounterpartyUIHelper.isNotEmpty(OB.getDob())  ? OB.getDob() : "-";
                    String sourceID = (CounterpartyUIHelper.isNotEmpty(OB.getSourceID())) ? OB.getSourceID() : "-";
                    String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, sourceID);
                    sourceDesc = (CounterpartyUIHelper.isNotEmpty(sourceDesc)) ? sourceDesc : "-";
                    String lmpLeID = (CounterpartyUIHelper.isNotEmpty(OB.getLmpLeID())) ? OB.getLmpLeID() : "-";
                    String idNO = (CounterpartyUIHelper.isNotEmpty(OB.getIdNO())) ? OB.getIdNO() : "-";
                    String deleteValue = OB.getSubProfileID() + "";
                    String IndexClass = "index";
                    if (OB.getDeletedInd()){
                       IndexClass = "indexdel";
                    }else{
                        if (!CounterpartyUIHelper.isExist(actual,subProfileID)){
                          IndexClass = "indexAdd";
                        }
                    }
             %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="<%=IndexClass%>"><%=count++%></td>
                        <td><a href="javascript:viewCustomer('<%=OB.getSubProfileID() %>')"><%=legalName%>&nbsp;</a>
                            <br><%=CounterpartyUIHelper.displayAddress(OB.getAddress())%> </td>
                        <td>
                          <% if (OB.getDob() != null){%>
                            <integro:date object="<%=OB.getDob()%>"/>
                          <%}else {%>
                           -
                           <%}%>
                         &nbsp;</td>
                        <td><%=sourceDesc%>&nbsp;</td>
                        <td><%=lmpLeID%>&nbsp; </td>
                        <td><%=idNO%>&nbsp; </td>
                     </tr>
      <%          }
            } else {%>
                 <tr >
                  <td colspan="6" align="center"  ><bean:message key="label.global.not.found"/>&nbsp;</td>
               </tr>
          <% }
           } %>
    </tbody>
        </table>
    </td>
</tr>

<tr>
    <td colspan="2">&nbsp;</td>
</tr>

<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">Remarks</td>
                    <td class="odd"><html:textarea property="remarks" style="width:90%"/><br>
                        <html:errors property="remarks"/></td>
                </tr>
                <tr>
                    <td class="fieldname">Last Action By</td>
                    <td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Last Remarks Made</td>
                    <td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td align="center">&nbsp;</td>
</tr>
<tr>
    <td align="center"><%--&nbsp;<html:errors property="isExistCCICustomer" />
    &nbsp;<br>--%>
        <html:errors property="errorExistCCICustomer" /></td>
</tr>
</table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
   <%if ("to_track".equals(event)){ %>
      <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%}else {%>
      <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
      <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
      <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image11" /></a></td>
    <%}%>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<%@ include file="/customer/viewdetails/viewCustomer.jsp"%>
</body>
</html>