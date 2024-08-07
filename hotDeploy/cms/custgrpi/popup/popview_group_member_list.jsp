<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="java.util.Locale"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupCreditGrade"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupMember"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.cms.ui.common.tag.TokenTag"%>
<%@ page import="com.integrosys.cms.ui.customer.viewdetails.CustomerViewAction"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript" src="js/itgUtilities.js"></script>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="title.group.member" /></h3></td>
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
                                        <td width="3%"  align="center"><bean:message key="label.global.sn"/> </td>
                                        <td width="15%" align="center"><bean:message key="label.group.entity.name"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.group.leid.source"/> </td>
                                        <td width="10"  align="center"><bean:message key="label.group.leid.no"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.col.owner.id.no"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.group.relationship"/><span class="mandatory"> * </span>  </td>
                                        <td width="10%" align="center"><bean:message key="label.group.percentowned"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.group.relbor.membername"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.group.member.credit.rating"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.group.member.entity.limit" /></td>
                                        <%--<td width="10%" class="tblinfo"><bean:message key="label.global.action"/> </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String from_event_for_grpMember = event  ;
                                        IGroupMember[] grpMemberList = stagingObj.getGroupMember();
                                        if (grpMemberList != null && grpMemberList.length > 0) {
                                            for (int counter = 0; counter < grpMemberList.length; counter++) {
                                                String sourceID = (CounterpartyUIHelper.isNotEmpty(grpMemberList[counter].getSourceID())) ? grpMemberList[counter].getSourceID() : "-";
                                                String sourceDesc = CustGrpIdentifierUIHelper.getCodeDesc(sourceID, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE);

                                                String  idno =grpMemberList[counter].getIdNO();
                                                if (String.valueOf(ICMSConstant.LONG_INVALID_VALUE).equals(idno)){
                                                   idno= "-" ;
                                                }
                                                String sub_profile_id = grpMemberList[counter].getEntityID()+"";
                                                String percentOwned  ="-" ;
                                                if (grpMemberList[counter].getPercentOwned() != null ) {
                                                   percentOwned = String.valueOf(grpMemberList[counter].getPercentOwned()) ;
                                                    if ("-1.0".equals(percentOwned) || "null".equals(percentOwned)){
                                                        percentOwned="-";
                                                    }
                                                }
                                                String relationName  = CustGrpIdentifierUIHelper.getCodeDesc(grpMemberList[counter].getRelationName(),ICMSUIConstant.GENT_REL) ;

                                    %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getEntityName()%>"/>&nbsp;</td>
                                            <%--<td>--%>
                                                 <%--<% if (ICMSConstant.ENTITY_TYPE_CUSTOMER.equals(grpMemberList[counter].getEntityType())){ %>--%>
                                                    <%--<a href="javascript:popupShareHolder(<%=sub_profile_id%>);">View </a>--%>
                                                  <%--<%}else{ %>--%>
                                                    <%-----%>
                                                  <%--<%}%>--%>
                                                   <%--&nbsp; </td>--%>
                                            <td><integro:empty-if-null value="<%=sourceDesc%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getLmpLeID()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=idno%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=relationName%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=percentOwned%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getRelBorMemberName()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getMembersCreditRating()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=grpMemberList[counter].getMembersCreditRating()%>"/>&nbsp;</td>
                                       </tr>
                                    <%
                                        }
                                    } else {
                                           // System.out.println("groupMemeber no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="10"> <bean:message key="label.group.member.norecord" /> </td>
                                        </tr>
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
        function popupShareHolder(subProfileID) {
            //var url = "GroupMember.do?event=popup_shareholder&sub_profile_id=" + subProfileID ;
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