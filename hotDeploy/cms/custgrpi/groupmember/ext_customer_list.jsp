<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.customer.bus.OBCustomerSearchResult,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.custgrpi.groupmember.GroupMemberAction,
                 com.integrosys.cms.ui.custgrpi.groupmember.GroupMemberForm,
                 com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%//@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue"%>
<%@ page import="com.integrosys.base.uiinfra.tag.PageIndex" %>
<%@ page import="java.util.List" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<% try {%>

<%
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch (NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }

    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;

    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR) {
        isMR = true;
    } else if (teamTypeID == ICMSConstant.TEAM_TYPE_SSC) {
        isSAC = true;
    }
    GroupMemberForm aForm = (GroupMemberForm) request.getAttribute("GroupMemberForm");

    List v = null;
    int nItems = 0;
    if (aForm != null) {
        v = (List) aForm.getSearchResult();
    } else {
        System.out.println("GroupMemberForm is null");
    }


    if (v != null) {
        pageContext.setAttribute("groupMemberSearchList", v);
    }

    int rowIdx = 0;
    int numItem = 0;
    int prev = 0;
    int sno = 0;
    int count = 1;
    if (aForm != null) {
        sno = aForm.getStartIndex();
        prev = aForm.getStartIndex() - aForm.getNumItems();
        if (prev < 0) {
            prev = aForm.getStartIndex() - records_per_page;
        }
        numItem = aForm.getNumItems();
    }

    String alphaURL = "/GroupMember.do?event=first_search";

    String errNoSelection = (String) request.getAttribute("errNoSelection");
    String errINEntityID = (String) request.getAttribute("errEntityID");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />


    <script language="Javascript" type="text/javascript">

        // TODO: To be replace by loca form submit action
        function submitSearch() {
            location.href = "<%=request.getContextPath()+"/GroupMember.do?event=ext_customer_list&customerSeach=true"%>";


        }
    </script>

</head>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
    <html:form action="GroupMember.do?event=ext_customer_list">

        <html:hidden property="customerSeach" value="true"/>
        <html:hidden property="startIndex"/>
        <html:hidden property="numItems"/>
        <html:hidden property="legalName"/>

        <html:hidden property="customerName"/>
        <html:hidden property="sourceType"/>
        <html:hidden property="legalID"/>
        <html:hidden property="idNO"/>
        <html:hidden property="itemType" value="GROUPMEMBER"/>

        <html:hidden property="indicator"/>
        <html:hidden property="all"/>
        <html:hidden property="event"/>

        <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"
               id="custsearch" style="margin-top:15px">
            <tr>
                <td>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                        <tr>
                            <td valign="bottom"><h3>Search Result</h3></td>
                        </tr>
                    </table>
                    <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <td width="3%"><bean:message key="label.global.sn"/></td>
                                <td width="20%"><bean:message key="label.customer.name"/></td>
                                <td width="15%"><bean:message key="label.customer.id.source"/></td>
                                <td width="15%"><bean:message key="label.customer.id"/></td>
                                <td width="25%"><bean:message key="label.col.owner.id.no"/></td>
                                <td width="15%"><bean:message key="title.cci.select"/></td>
                            </tr>

                        </thead>
                        <tbody>
                            <% if (v != null) {
                            %>
                            <logic:present name="groupMemberSearchList">
                                <logic:iterate id="OB" name="groupMemberSearchList"
                                               type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"
                                               scope="page">
                                    <%
                                        if (OB == null) {
                                            OB = new OBCustomerSearchResult();
                                            //System.out.println(">>>>>>>>>>>>>>>>>>>>>>>OB = null so Created New OBCustomerSearchResult ");
                                        }
                                        String subprofileID = OB.getSubProfileID() + "";
                                        // This is same as in  getGroupMemebers
                                        String tempCustkey = "-";
                                        if (OB.getSourceID() != null && OB.getLegalReference() != null) {
                                            tempCustkey = OB.getSourceID() + OB.getLegalReference();
                                        }
                                        String errEntityID = "errEntityID" + tempCustkey;
                                        //System.out.println("tempCustkey = " + tempCustkey);
                                        sno++;

                                    %>
                                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                        <td style="text-align:center" class="index"><%=sno%>
                                        </td>
                                        <%--<td><integro:empty-if-null value="<%=OB.getLegalName()%>"/></td>--%>
                                        <td><integro:empty-if-null value="<%=OB.getCustomerName()%>"/></td>
                                        <td><integro:empty-if-null
                                                value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, OB.getSourceID())%>"/>
                                            &nbsp; </td>
                                        <td><integro:empty-if-null value="<%=OB.getLegalReference()%>"/>&nbsp; </td>
                                        <td><integro:empty-if-null value="<%=OB.getIdNo()%>"/>&nbsp; </td>
                                        <td>
                                            <html:checkbox property="entityCheckBoxID" value="<%=tempCustkey%>"/>
                                                <%--  <%  if (errINEntityID != null) {   %>
                                               <font color = red><%=errINEntityID%> </font>
                                             <% }  %>--%>
                                            <html:errors property="<%=errEntityID%>"/>
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </logic:present>
                            <%
                            } else {
                                //System.out.println("v.size() =0");
                            %>
                            <td colspan="6" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                            <%}%>
                        </tbody>
                    </table>
            <tr height="40">
                <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                                      onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                    <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                    <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()"
                       onmouseover="MM_swapImage('Image2','','img/cancel1.gif',1)">
                        <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                    <br>
                        <%--<html:errors property="errNoSelection"/>--%>
                    <% if (errNoSelection != null) { %>
                    <font color=red><%=errNoSelection%>
                    </font>
                    <% } %>
                </td>
            </tr>
        </table>
    </html:form>
</td>
</tr>

<tr>
    <td height="25">
            <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
               <tr>
                 <td width="580" valign="middle">
                 <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                 </td>
                 <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                 <td valign="middle" >
                  <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%=request.getContextPath()+"/GroupMember.do?event=first_search&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
                 </td>
               </tr>
           </table>
    </td>
</tr>

</table>

<script language="JavaScript">

    function submitForm() {
        var cstId = <%=rowIdx%>;
        if (cstId == 0) {
            alert("Please select one record")
        } else {
            var checkResult = false;
            var field = document.forms["GroupMemberForm"].entityCheckBoxID;
            var len = field.length ;
            if (len > 1) {
                for (i = 0; i < field.length; i++) {
                    if (field[i].checked) {
                        checkResult = true;
                        break;
                    }
                }
            } else {
                if (document.forms["GroupMemberForm"].entityCheckBoxID.checked) {
                    checkResult = true;
                }
            }
            if (!checkResult) {
                alert("Please select one record");
            } else {
                document.forms[0].action = "GroupMember.do?event=<%=GroupMemberAction.EVENT_CREATE_CUSTOMER%>";
                document.forms[0].submit();
            }

        }
    }

    function cancelForm() {
        document.forms[0].action = "GroupMember.do?event=<%=GroupMemberAction.EVENT_CANCEL%>";
        document.forms[0].submit();
    }

    function JumpOnSelectactive(selectObj, customerID, limitProfileID, groupCCINo) {
        var selectIndex = selectObj.selectedIndex;
        if (selectObj.options[selectIndex].value == "VIEW_CCI") {
            location.href = "GroupMember.do?event=read&groupCCINo=" + groupCCINo + "&limitProfileID=" + limitProfileID + "&startIndex=" + "<%=aForm.getStartIndex()%>";
        } else if (selectObj.options[selectIndex].value == "DELETE_CCI") {
            location.href = "GroupMember.do?event=prepare_delete&groupCCINo=" + groupCCINo + "&limitProfileID=" + limitProfileID + "&startIndex=" + "<%=aForm.getStartIndex()%>";
        }
    }

    function gotoPage() {
        parent.document.location = "User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
    }

    function goNextPrev(ind) {
        document.forms["GroupMemberForm"].cusName.value = '';
        document.forms["GroupMemberForm"].startIndex.value = ind;
        document.forms["GroupMemberForm"].numItems.value =<%=numItem%>;
    }

    function goPageIndex(ind) {
        document.forms["GroupMemberForm"].startIndex.value = ind;
        document.forms["GroupMemberForm"].numItems.value =<%=numItem%>;
        document.forms["GroupMemberForm"].submit();
    }

    function goAlphaIndex(ind) {

        document.forms["GroupMemberForm"].customerName.value = ind;
        if (ind == '' || ind == 'Y') {
            document.forms["GroupMemberForm"].all.value = 'Y';
        }
        document.forms[0].indicator.value = '*';
        document.forms["GroupMemberForm"].startIndex.value = 0;
        document.forms["GroupMemberForm"].submit();
    }
    function goPage(pageNo) {
        //alert("goPage(pageNo)= "+ ind);
        document.forms[0].startIndex.value = pageNo *<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
    }
</script>

</body>
</html>


<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

