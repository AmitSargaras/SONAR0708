<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupMember" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareResult" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBGroupMember" %>
<%@ page import="com.integrosys.cms.ui.common.tag.TokenTag"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="title.group.member"/></h3></td>
    </tr>
    <tr>
            <td>
                <hr/>
            </td>
        </tr>
</thead>
<tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tbody>
                    <tr>
                        <td>
                        <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0" width="100%">
                            <thead>
                                <tr>
                                    <td width="3%" align="center"><bean:message key="label.global.sn"/></td>
                                    <td width="15%" align="center"><bean:message key="label.group.entity.name"/></td>
                                    <%--<td width="10%" align="center"><bean:message key="label.group.view.shareholder.director"/></td>--%>
                                    <td width="10%" align="center"><bean:message key="label.group.leid.source"/></td>
                                    <td width="10" align="center"><bean:message key="label.group.leid.no"/></td>
                                    <td width="10%" align="center"><bean:message key="label.col.owner.id.no"/></td>
                                    <td width="10%" align="center"><bean:message key="label.group.relationship"/><span  class="mandatory"> * </span></td>
                                    <td width="10%" align="center"><bean:message key="label.group.percentowned"/></td>
                                    <td width="10%" align="center"><bean:message key="label.group.relbor.membername"/></td>
                                    <td width="10%" align="center"><bean:message key="label.group.member.credit.rating"/></td>
                                    <td width="10%" align="center"><bean:message key="label.group.member.entity.limit" /></td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String from_event_for_grpMember = event;
                                    IGroupMember[] grpMemberList = stagingObj.getGroupMember();
                                    IGroupMember[] grpMemberList_actualObj = actualObj.getGroupMember();
                                    CompareResult[] resultList_grpMember = new CompareResult[0];
                                    if (grpMemberList != null || grpMemberList_actualObj != null) {        //required for situations where there is no share checklists
                                        List res = CompareOBUtil.compOBArray(grpMemberList, grpMemberList_actualObj);
                                        resultList_grpMember = (CompareResult[]) res.toArray(new CompareResult[0]);
                                    }
                                    ArrayList GroupMemberList = new ArrayList(Arrays.asList(resultList_grpMember));
                                    pageContext.setAttribute("GroupMemberList", GroupMemberList);

                                  %>

                                <% if (GroupMemberList == null || GroupMemberList.size() == 0){ %>
                                <tr>
                                    <td colspan="10"><bean:message key="label.group.member.norecord"/></td>
                                </tr>
                                <% } else {
                                    int index = 0;
                                %>
                                <logic:present name="GroupMemberList">
                                    <logic:iterate id="compResult" name="GroupMemberList" type="com.integrosys.base.techinfra.diff.CompareResult">
                                        <%
                                            OBGroupMember obj = (OBGroupMember) compResult.getObj();
                                            String sourceID = (CounterpartyUIHelper.isNotEmpty(obj.getSourceID())) ? obj.getSourceID() : "-";
                                            String sourceDesc = CustGrpIdentifierUIHelper.getCodeDesc(sourceID, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE);
                                            String idno = obj.getIdNO();
                                            if (String.valueOf(ICMSConstant.LONG_INVALID_VALUE).equals(idno)){
                                                idno = "-";
                                            }
                                            String sub_profile_id = obj.getEntityID() + "";
                                            String percentOwned = "-";
                                            String groupNo = obj.getGrpNo()+"";
                                            if (obj.getPercentOwned() != null){
                                                percentOwned = String.valueOf(obj.getPercentOwned());
                                                if ("-1.0".equals(percentOwned) || "null".equals(percentOwned)){
                                                    percentOwned = "-";
                                                }
                                            }
                                            String relationName = CustGrpIdentifierUIHelper.getCodeDesc(obj.getRelationName(), ICMSUIConstant.GENT_REL);

                                        %>
                                        <tr class="<%=index%2==0?"odd":"even"%>">
                                            <td class="<bean:write name="compResult" property="key" />"><%=index + 1%></td>
                                            <td>
                                                <% if (ICMSConstant.ENTITY_TYPE_GROUP.equals(obj.getEntityType())){ %>
                                                        <a href="javascript:viewGroupSubGroup('<%=sub_profile_id%>');">
                                                       <integro:empty-if-null value="<%=obj.getEntityName()%>"/>&nbsp;
                                                        </a>
                                                  <%}else{ %>
                                                      <integro:empty-if-null value="<%=obj.getEntityName()%>"/>&nbsp;
                                                  <%}%>
                                            <%--<td>--%>
                                                <%--<% if (ICMSConstant.ENTITY_TYPE_CUSTOMER.equals(obj.getEntityType())){ %>--%>
                                                    <%--<a href="GroupMember.do?from_event=<%=from_event_for_grpMember%>&event=read&indexID=<%=index%>&sub_profile_id=<%=sub_profile_id%>">View</a>--%>
                                                    <%--<a href="javascript:popupShareHolder(<%=sub_profile_id%>);"> View</a>--%>
                                                 <%--<%}else { %>--%>
                                                       <%-----%>
                                                  <%--<%}%>--%>
                                                <%--&nbsp; </td>--%>
                                            <td><integro:empty-if-null value="<%=sourceDesc%>"/>&nbsp;</td>
                                            <td>
                                                <% if (ICMSConstant.ENTITY_TYPE_GROUP.equals(obj.getEntityType())){ %>
                                                    <integro:empty-if-null value="<%=groupNo%>"/>
                                                <%}else{ %>
                                                    <integro:empty-if-null value="<%=obj.getLmpLeID()%>"/>
                                                 <%}%>&nbsp;</td>
                                            <%--<td><integro:empty-if-null value="<%=obj.getLmpLeID()%>"/>&nbsp;</td>--%>
                                            <td><integro:empty-if-null value="<%=idno%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=relationName%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=percentOwned%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=obj.getRelBorMemberName()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=obj.getMembersCreditRating()%>"/>&nbsp;</td>
                                            <td><% if (obj.getEntityLmt() != null
                                                        && obj.getEntityLmt().getCurrencyCode() != null
                                                        && obj.getEntityLmt().getAmount() > 0) { %>
                                                <integro:empty-if-null value="<%=obj.getEntityLmt().getCurrencyCode()%>"/>
                                                <integro:amount param="amount" amount="<%=obj.getEntityLmt()%>"/>
                                            <%} %>&nbsp;</td>
                                        </tr>
                                        <%index++;%>
                                    </logic:iterate>
                                </logic:present>
                                <% } %>
                            </tbody>
                        </table>
            </table>
        </td>
    </tr>
</tbody>
</table>

<script type="text/javascript">
    <!--
        var token='<%=TokenTag.generateToken()%>';

        function viewGroupSubGroup(subProfileID) {
            <%--var url = "CustGrpIdentifier.do?event=view_subgroup&subGrpID=" + subProfileID+"&TrxId=<%=popTrxId%>"  ;--%>
             var url = '<%=request.getContextPath()%>' +"/custgrpi/popup/popview_groupdetails.jsp?subGrpID=" + subProfileID  ;
            MM_openBrWindow(url, token, "left=220,top=10,height=600, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
            disableGoButtons(false) ;
        }

       function popupShareHolder(subProfileID) {
//            var url = "GroupMember.do?event=popup_shareholder&sub_profile_id=" + subProfileID  ;
            var url = '<%=request.getContextPath()%>' +"/custgrpi/popup/popup_shareholder_relationship.jsp?sub_profile_id=" + subProfileID  ;
            MM_openBrWindow(url, token, "left=220,top=10,height=400, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
            disableGoButtons(false) ;
        }

    var w = null;
    function MM_openBrWindow(theURL,winName,features) {
         if(w != undefined && isOpen() && w.name == winName){
            w.location.replace(theURL);
         }else{
           w = window.open(theURL,winName,features);
        }
        w.focus();
    }

     function isOpen(){
      try{
        w.document;
        return true;
      } catch(ex){}
      return false;
    }
   -->
</script>

