<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger" %>
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
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper"%>
<%@ page import="com.integrosys.base.techinfra.util.SortUtil"%>
<%@ page import="com.integrosys.cms.app.customer.bus.ICMSCustomer" %>
<%@ page import="com.integrosys.cms.app.customer.bus.ICMSLegalEntity" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

    ICommonUser user2 = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam2 = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    boolean isGEMSMAKER2 = CustGrpIdentifierUIHelper.isGEMSMAKER(userTeam2, user2)  ;
    


%>


<script type="text/javascript">
<!--
    function fnViewGroupMember(from_event,event, counter) {
        var frm = document.forms[0];
        frm.itemType.value = "<%=CustGroupUIHelper.GROUPMEMBER%>";
        frm.action="CustGrpIdentifier.do?from_event="+from_event+"&event=<%=CustGrpIdentifierAction.EVENT_PREPARE2%>&indexID="+counter;
        frm.submit();
    }
-->
</script>

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
                                        <td width="2%"  align="center"><bean:message key="label.global.sn"/> </td>
                                        <td width="12%" align="center"><bean:message key="label.group.entity.name"/> </td>
                                        <td width="7%" align="center"><bean:message key="label.group.view.shareholder.director"/> </td>
                                        <td width="6%" align="center"><bean:message key="label.group.leid.source"/> </td>
                                        <td width="7%"  align="center"><bean:message key="label.group.leid.no"/> </td>
                                        <td width="13%" align="center"><bean:message key="label.col.owner.id.no"/> </td>
                                        <td width="12%" align="center"><bean:message key="label.group.relationship"/><span class="mandatory"> * </span>  </td>
                                        <td width="5%" align="center"><bean:message key="label.group.percentowned"/> </td>
                                        <td width="14%" align="center"><bean:message key="label.group.relbor.membername"/> </td>
                                        <td width="6%" align="center"><bean:message key="label.group.member.credit.rating"/> </td>
                                        <td width="16%" align="center"><bean:message key="label.group.member.entity.limit" /></td>
                                        <%--<td width="10%" class="tblinfo"><bean:message key="label.global.action"/> </td>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%		
                                        String from_event_for_grpMember = event  ;
                                        IGroupMember[] grpMemberList = stagingObj.getGroupMember();
                                        if (grpMemberList != null && grpMemberList.length > 0) {
										    String[] param = {"EntityName"};
									        SortUtil.sortObject(grpMemberList, param);   
										
                                            for (int counter = 0; counter < grpMemberList.length; counter++) {

                                                IGroupMember   obj=  grpMemberList[counter];
                                                String groupNo = obj.getGrpNo() +"" ;
                                                System.out.println("obj.getGrpNo() = " + obj.getGrpNo());
                                                String sourceID = (CounterpartyUIHelper.isNotEmpty(obj.getSourceID())) ? grpMemberList[counter].getSourceID() : "-";
                                                String sourceDesc = CustGrpIdentifierUIHelper.getCodeDesc(sourceID, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE);

                                                String  idno =obj.getIdNO();
                                                if (String.valueOf(ICMSConstant.LONG_INVALID_VALUE).equals(idno)){
                                                   idno= "-" ;
                                                }
                                                String entityID = obj.getEntityID()+"";
                                                String percentOwned  ="-" ;
                                                if (obj.getPercentOwned() != null ) {
                                                   percentOwned = String.valueOf(obj.getPercentOwned()) ;
                                                    if ("-1.0".equals(percentOwned) || "null".equals(percentOwned)){
                                                        percentOwned="-";
                                                    }
                                                }
                                                String relationName  = CustGrpIdentifierUIHelper.getCodeDesc(obj.getRelationName(),ICMSUIConstant.GENT_REL) ;

                                                String custType = "";
                                                
                                                try {
                                                    if (!ICMSConstant.ENTITY_TYPE_GROUP.equals(obj.getEntityType())){
                                                        ICMSCustomer customer = CustGrpIdentifierUIHelper.getCustomer(obj.getEntityID());
                                                        ICMSLegalEntity legalEntity = customer.getCMSLegalEntity();
                                                        custType = legalEntity.getCustomerType();
                                                    }
                                                } catch (Exception e) {}

                                    %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td>
										
                                                 <% if (ICMSConstant.ENTITY_TYPE_GROUP.equals(obj.getEntityType())){ %>
                                                        <a href="javascript:viewGroupSubGroup('<%=entityID%>');">
                                                        <integro:empty-if-null value="<%=obj.getEntityName()%>"/>
                                                        </a>
                                                  <%}else{ %>
                                                     <integro:empty-if-null value="<%=obj.getEntityName()%>"/>
                                                  <%}%>
                                            <td style="text-align:center">
                                                <%if (custType!=null && ICMSConstant.CUST_TYPE_CORPORATE.equals(custType)) {%>
                                                    <a href="javascript:popupShareHolder('<%=entityID%>');"><bean:message key="label.view" /></a>
                                                <%} else {%>-<%}%>
                                            </td>
                                            <td><integro:empty-if-null value="<%=sourceDesc%>"/>&nbsp;</td>
                                            <td>
                                                <% if (ICMSConstant.ENTITY_TYPE_GROUP.equals(obj.getEntityType())){ %>
                                                  <integro:empty-if-null value="<%=groupNo%>"/>
                                                <%}else{ %>
                                                    <integro:empty-if-null value="<%=obj.getLmpLeID()%>"/>
                                                 <%}%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=idno%>"/> &nbsp; </td>
                                            <td><integro:empty-if-null value="<%=relationName%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=percentOwned%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=obj.getRelBorMemberName()%>"/>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=obj.getMembersCreditRating()%>"/>&nbsp;</td>
                                            <td>
                                            <% if (obj.getEntityLmt() != null
                                                        && obj.getEntityLmt().getCurrencyCode() != null
                                                        && obj.getEntityLmt().getAmount() > 0) { %>
                                                <integro:empty-if-null value="<%=obj.getEntityLmt().getCurrencyCode()%>"/>
                                                <integro:amount param="amount" amount="<%=obj.getEntityLmt()%>"/>
                                            <%} %>&nbsp;</td>
                                       </tr>
                                    <%
                                        }
                                    } else {
                                           // System.out.println("groupMemeber no records");
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td colspan="11"> <bean:message key="label.group.member.norecord" /> </td>
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
        var token='<%=TokenTag.generateToken()%>';
        function viewGroupSubGroup(subProfileID) {
//            var url = "CustGrpIdentifier.do?event=view_subgroup&grpID=" + subProfileID  ;
//            var url = "/cms/custgrpi/popview_groupdetails.jsp?subGrpID=" + subProfileID  ;
            <%--var url = "CustGrpIdentifier.do?event=view_subgroup&subGrpID=" + subProfileID+"&TrxId=<%=popTrxId%>"  ;--%>
            var url = '<%=request.getContextPath()%>' +"/custgrpi/popup/popview_groupdetails.jsp?subGrpID=" + subProfileID  ;
            MM_openBrWindow(url, token, "left=220,top=10,height=600, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no", 'yes');
            disableGoButtons(false) ;
        }
        function popupShareHolder(subProfileID) {
           var url = '<%=request.getContextPath()%>' +"/custgrpi/popup/popup_shareholder_relationship.jsp?sub_profile_id=" + subProfileID  ;
//            var url = "GroupMember.do?event=popup_shareholder&sub_profile_id=" + subProfileID  ;
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
</script>