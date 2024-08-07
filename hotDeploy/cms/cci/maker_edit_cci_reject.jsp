<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterparty" %>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails" %>
<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue" %>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartySearchForm" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<jsp:include page="printTransValue.jsp"/>
<%
    String TrxId="";
    String groupCCINo = "-";
    ICCICounterparty[]   obj;

    CounterpartySearchForm aForm = (CounterpartySearchForm) request.getAttribute("CounterpartySearchForm");
    if (aForm != null) {
//        System.out.println("aForm.getGroupCCINo() = " + aForm.getGroupCCINo());
        ICCICounterpartyDetails details = aForm.getICCICounterpartyDetails();
       if (details != null){
          obj = details.getICCICounterparty();
          if (obj != null && obj.length > 0) {
//              System.out.println("aForm obj.length  = " + obj.length );
          }
       }
    } else {
        System.out.println("aForm = null");
    }


    ICCICounterpartyDetails sessionDetails = (ICCICounterpartyDetails) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.session.ICCICounterpartyDetails");

    if (sessionDetails != null){
            groupCCINo = sessionDetails.getGroupCCINo() + "";
            obj = sessionDetails.getICCICounterparty();
            if (obj != null && obj.length > 0) {
            }
     }

    ICCICounterpartyDetailsTrxValue trxValue = (ICCICounterpartyDetailsTrxValue) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.ICCICounterpartyDetailsTrxValue");
    ICCICounterpartyDetails iCCICounterpartyDetails = null;
     if (trxValue != null){
         iCCICounterpartyDetails = trxValue.getStagingCCICounterpartyDetails();
         groupCCINo = iCCICounterpartyDetails.getGroupCCINo() + "";
         TrxId = trxValue.getTransactionID();
     }

%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript">
        <!--
        function fnEdit(){
            var frm = document.forms[0];
               frm.event.value='maker_prepare_update';
               frm.action="CounterpartyCCI.do?event=maker_prepare_update&TrxId=<%=TrxId%>";
               frm.submit();
        }
         function fnCance(){
               var frm = document.forms[0];
//               frm.event.value='list';
               frm.action ="ToDo.do" ;
               frm.submit();
        }
        -->
    </script>
</head>

<body>

<html:form action="CounterpartyCCI.do?event=read">
<input type="hidden" name="event"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" id="contentWindow">

<tr>
<td colspan="3" valign="top">
    <%--<div id="contentCanvas" style="height:100%;width:100%;">--%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:20px">
    <thead>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="95%" align="center">
                    <tr><td>
                        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblInput">
                            <thead>
                            </thead>
                            <tbody>
                                <tr class="odd">
                                    <td width="25%" class="fieldname"><bean:message key="label.cci.cciNo"/></td>
                                    <td width="75%">&nbsp;<% out.print(groupCCINo); %></td>
                                </tr>
                            </tbody>
                        </table>
                    </td></tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="73%"><h3><bean:message key="title.cci.counterparty.list"/></h3></td>
                        <td width="27%" align="right" valign="bottom">
                            <input type="button" name="Submit" value="Edit" class="btnNormal" onClick="fnEdit()"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr/></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                    <thead>
                        <tr>
                            <td width="3%"><bean:message key="label.global.sn"/></td>
                            <td width="25%"><bean:message key="label.customer.name"/></td>
                            <td width="10%"><bean:message key="label.customer.id.source"/></td>
                            <td width="10%"><bean:message key="label.customer.id"/></td>
                            <td width="25%"><bean:message key="label.col.owner.id.no"/></td>
                        </tr>
                    </thead>
                    <%

                        int rowIdx = 0;
                        int count = 1;
                        if (iCCICounterpartyDetails != null) {
                            ICCICounterparty[]  iCCICounterparty = iCCICounterpartyDetails.getICCICounterparty();
                            if (iCCICounterparty != null && iCCICounterparty.length > 0) {
                                for (int index = 0; index < iCCICounterparty.length; index++) {
                                    ICCICounterparty OB = iCCICounterparty[index];
//                                    String legalName = (OB.getLegalName() != null) ? OB.getLegalName() : "-";
                                    String legalName = (OB.getCustomerName() != null) ? OB.getCustomerName() : "-";
                                    String sourceID = (OB.getSourceID() != null) ? OB.getSourceID() : "-";
                                    String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, sourceID);
                                    sourceDesc = (sourceDesc != null) ? sourceDesc : "-";
                                    String lmpLeID = (OB.getLmpLeID() != null) ? OB.getLmpLeID() : "-";
                                    String idNO = (OB.getIdNO() != null) ? OB.getIdNO() : "-";
                    %>

                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index"><%=count++%></td>
                        <td><%=legalName%>&nbsp;</td>
                        <td><%=sourceDesc%>&nbsp;</td>
                        <td><%=lmpLeID%>&nbsp; </td>
                        <td><%=idNO%>&nbsp; </td>
                    </tr>
                    <%
                        }
                    } else {%>
                    <td colspan="5" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                    <% }
                    } %>
                </table>
            </td>
        </tr>
         <tr>
        <td height="2">
            <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">&nbsp;</td>
                    <td align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center">
                        <a href="#"
                           onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)">
                            <img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0" id="Image42"
                                 onclick="fnCance();"/>
                        </a>
                    </td>

                </tr>
            </table>
        </td>
    </tr>
</table>
<!--</div>-->
</td>
</tr>

</table>

</html:form>
</body>
</html>
