<%@ page import="com.integrosys.cms.app.custgrpi.bus.IGroupMember" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGrpIdentifierUIHelper"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.custgrpi.bus.OBGroupMember"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.group.members" /> </h3></td>
            <td style="text-align:right" valign="baseline">
                <input class="btnNormal" type="button" name="Submit9" value="Add Group"  onclick="javascript:submitPage(9)"/>&nbsp;
                <input class="btnNormal" type="button" name="Submit7" value="Add Member" onclick="javascript:submitPage(7)"/>&nbsp;
                <input class="btnNormal" type="button" name="Submit8" value="Remove"     onclick="javascript:submitPage(8)"/>
            </td>
        </tr>
       <tr>
          <td colspan="2"><hr /> </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                    <tbody>
                        <tr>
                            <td>
                            <html:errors property="groupGroupMembersListSelect"/>
                            <table class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0" width="100%">
                                <thead>
                                     <tr>
                                        <td width="3%"  align="center"><bean:message key="label.global.sn"/> </td>
                                        <td width="14%" align="center"><bean:message key="label.group.entity.name"/> </td>
                                        <td width="7%"  align="center"><bean:message key="label.group.leid.source"/> </td>
                                        <td width="9%"  align="center"><bean:message key="label.group.leid.no"/> </td>
                                        <td width="8%"  align="center"><bean:message key="label.col.owner.id.no"/> </td>
                                        <td width="15%" class="tblinfo"><bean:message key="label.group.relationship"/> <span class="mandatory"> * </span> </td>
                                        <td width="6%"><bean:message key="label.group.percentowned"/> </td>
                                        <td width="15%" class="tblinfo"><bean:message key="label.group.relbor.membername"/> </td>
                                        <td><bean:message key="label.group.member.credit.rating"/> </td>
                                        <td width="10%" align="center"><bean:message key="label.group.member.entity.limit" /></td>
                                        <td width="7%" class="tblinfo"><bean:message key="label.global.delete"/> </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%

                                       CustGrpIdentifierUIHelper helper = new CustGrpIdentifierUIHelper();
                                       Map secMap = helper.getRelationValue();
                                       List relationValue = (List) secMap.get("relationCodes");
                                       List relationLabel = (List) secMap.get("relationLabel");
                                       if (relationLabel==null){
                                           relationLabel= new ArrayList();
                                           relationValue= new ArrayList();
                                       }

                                        String[] percentOwnedList = aForm.getPercentOwned();
                                        String[] relationNameList = aForm.getRelationName();
                                        String[] relBorMemberNameList = aForm.getRelBorMemberName();
                                        String from_event_for_grpMember = event  ;
                                        IGroupMember[] grpMemberList = stagingObj.getGroupMember();

                                        if (grpMemberList != null && grpMemberList.length > 0) {
                                            for (int counter = 0; counter < grpMemberList.length; counter++) {
                                                IGroupMember objGrpMember = grpMemberList[counter] ;
                                                if (objGrpMember == null){
                                                    objGrpMember = new OBGroupMember();
                                                }
                                                String   percentOwned = (CustGrpIdentifierUIHelper.isNotEmpty(percentOwnedList[counter]) ? percentOwnedList[counter] :"") ;
                                                if ("-1.0".equals(percentOwned) || "null".equals(percentOwned)){
                                                    percentOwned="";
                                                }
                                                String  idno = objGrpMember.getIdNO();
                                                if (String.valueOf(ICMSConstant.LONG_INVALID_VALUE).equals(idno)){
                                                   idno= "-" ;
                                                }


                                                String   relationName ="" ;
                                                if (relationNameList[counter] != null){
                                                    relationName = (CustGrpIdentifierUIHelper.isNotEmpty(relationNameList[counter]) ? relationNameList[counter] :"") ;
                                                }
                                                String   relBorMemberName = (CustGrpIdentifierUIHelper.isNotEmpty(relBorMemberNameList[counter]) ? relBorMemberNameList[counter] :"") ;

                                                String percentOwnedErr = "percentOwned"+counter;
                                                String relationNameErr = "relationName"+counter;
                                                String groupNameErr = "groupName"+counter;
                                                String  entityID = "";
                                                String  entityType ="GROUP";
                                                String entityIDstr ="";
                                                 String groupNo = "" ;
                                                if (objGrpMember != null ) {
                                                    entityIDstr =  Long.toString(objGrpMember.getEntityID()) ;
                                                    entityType = objGrpMember.getEntityType();
                                                    entityID = objGrpMember.getEntityID() +"";
                                                    groupNo = objGrpMember.getGrpNo() +"";
                                                }


                                    %>
                                       <html:hidden  property="entityType" value="<%=entityType%>" />
                                       <html:hidden  property="entityID"  value="<%=entityIDstr%>" />

                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=counter + 1%></td>
                                            <td><integro:empty-if-null value="<%=objGrpMember.getEntityName()%>"/>
                                                 <br><html:errors property="<%=groupNameErr %>" />
                                                &nbsp;</td>
                                            <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, grpMemberList[counter].getSourceID())%>"/>  &nbsp; </td>
                                            <%--<td><integro:empty-if-null value="<%=objGrpMember.getLmpLeID()%>"/>&nbsp;</td>--%>
                                            <td>
                                                <% if (ICMSConstant.ENTITY_TYPE_GROUP.equals(objGrpMember.getEntityType())){ %>
                                                    <integro:empty-if-null value="<%=groupNo%>"/>
                                                <%}else{ %>
                                                    <integro:empty-if-null value="<%=objGrpMember.getLmpLeID()%>"/>
                                                 <%}%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=idno%>"/>&nbsp;</td>
                                            <td>
                                                <html:select property="relationName">
                                                    <option value=""><bean:message key="label.please.select"/></option>
                                                    <% for (int i = 0; i < relationValue.size(); i++) { %>
                                                    <option value="<%=relationValue.get(i)%>" <%=relationName.equals(relationValue.get(i)) ? "selected" : ""%>><%=relationLabel.get(i)%></option>
                                                    <% } %>
                                                 </html:select>
                                                 <html:errors property="<%=relationNameErr %>" />
                                            </td>
                                            <td><html:text  property="percentOwned"    value="<%=percentOwned%>" size="5" maxlength="5"/>
                                                <html:errors property="<%=percentOwnedErr %>" />
                                              </td>
                                            <td><html:text  property="relBorMemberName" value="<%=relBorMemberName%>" size="20" maxlength="40"/></td>
                                            <td><integro:empty-if-null value="<%=objGrpMember.getMembersCreditRating()%>"/>&nbsp;</td>
                                            <td><% if (objGrpMember.getEntityLmt() != null
                                                        && objGrpMember.getEntityLmt().getCurrencyCode() != null
                                                        && objGrpMember.getEntityLmt().getAmount() > 0) { %>
                                                <integro:empty-if-null value="<%=objGrpMember.getEntityLmt().getCurrencyCode()%>"/>
                                                <integro:amount param="amount" amount="<%=objGrpMember.getEntityLmt()%>"/>
                                            <%} %>&nbsp;</td>
                                            <td>
                                                <input type="checkbox"  name="deleteItem"  value="<%=String.valueOf(counter)%>"/>
                                            &nbsp;</td>
                                       </tr>
                                    <%
                                     }
                                    } else {
                                            //System.out.println("Group Member no records");
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

