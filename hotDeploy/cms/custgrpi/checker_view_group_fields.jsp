<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper" %>
<%@ page import="com.integrosys.cms.ui.common.tag.TokenTag"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>


<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">

    <tr class="odd">
        <td class="fieldname"><bean:message key="label.group.id"/> <span class="mandatory"> * </span></td>
        <td width="34%"><%=grpNo%>&nbsp;</td>
        <td  class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"groupName")?"fieldname":"fieldnamediff"%>' width="15%">
            <bean:message key="label.group.name"/> <span class="mandatory"> * </span></td>
        <td colspan="2" width="33%"><%=stagingObj.getGroupName()%>&nbsp;</td>
    </tr>

    <tr class="even">
        <td class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"masterGroupInd")?"fieldname":"fieldnamediff"%>'>
            <bean:message key="label.group.master.group"/>
            <span class="mandatory"> * </span></td>
        <td>
            <%
                boolean check1 = stagingObj.getMasterGroupInd();
                if (check1) { %>
                Yes
            <%} else {%>
                No
            <%}%>
            &nbsp;</td>
        <td class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"groupAccountMgrCode")?"fieldname":"fieldnamediff"%>'>
            <bean:message key="label.group.manager"/> <span class="mandatory"> * </span></td>
        <td> <%=stagingObj.getGroupAccountMgrCode()%>  </td>
    </tr>

    <tr class="odd">
        <td class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"groupType")?"fieldname":"fieldnamediff"%>'>
            <bean:message key="label.group.type"/> <span class="mandatory"> * </span></td>
        <td><%=CustGrpIdentifierUIHelper.getCodeDesc(stagingObj.getGroupType(), ICMSUIConstant.GRP_TYPE)%>&nbsp;</td>
        <td class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"groupCounty")?"fieldname":"fieldnamediff"%>'>
            <bean:message key="label.group.country"/> <span class="mandatory"> * </span></td>
        <td colspan="2"><%=CustGrpIdentifierUIHelper.getCountryCodeDesc(stagingObj.getGroupCounty())%>&nbsp;</td>
    </tr>

    <tr class="even">
        <td class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"accountMgmt")?"fieldname":"fieldnamediff"%>'>
            <bean:message key="label.group.account.mgmt"/> <span class="mandatory"> * </span></td>
        <td><%=CustGrpIdentifierUIHelper.getCodeDesc(stagingObj.getAccountMgmt(), ICMSUIConstant.ACC_MGNT)%>&nbsp;</td>
        <td class='<%=CompareOBUtil.compOB(stagingObj,actualObj,"businessUnit")?"fieldname":"fieldnamediff"%>'>
            <bean:message key="label.group.business.unit"/> <span class="mandatory"> * </span> &nbsp;</td>
        <td colspan="2"><%=CustGrpIdentifierUIHelper.getCodeDesc(stagingObj.getBusinessUnit(), ICMSUIConstant.BIZ_UNIT)%>&nbsp;</td>

    </tr>
</table>

<script type="text/javascript">
    <!--
      var tknGroupManager='<%=TokenTag.generateToken()%>';
        function viewGroupManager(userID) {
            var url = '<%=request.getContextPath()%>' +"/custgrpi/popup/popview_accountmanager.jsp?userID=" + userID  ;
            // alert(url)  ;
            MM_openBrWindow(url, tknGroupManager, "left=250,top=80,height=200, width=550, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
           disableGoButtons(false) ;
        }
 -->
</script>