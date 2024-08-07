<%@ page import="com.integrosys.cms.ui.commodityglobal.commodityprice.CommodityPriceAction,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityprice/select.jsp,v 1.7 2006/07/26 11:08:45 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.7 $
    * Date: $Date: 2006/07/26 11:08:45 $
    * Tag: $Name:  $
    */
%>

<%
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isSSCMaker = false;
    boolean isCMTMaker = false;
  	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                long teamType = userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID();
	            if(teamType ==ICMSConstant.TEAM_TYPE_SSC_MAKER 
	            		|| teamType ==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
	            		|| teamType ==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
	            		|| teamType ==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
                    isSSCMaker = true;
                }
                if(teamType ==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    isCMTMaker = true;
                }
            }
        }
  	}   
  	
	boolean isRIC = !("n".equals(request.getParameter("ricType"))||"n".equals(request.getAttribute("ricType")));
	
	String event = CommodityPriceAction.EVENT_READ;
  	
	if ((isSSCMaker&&isRIC)||(isCMTMaker&&!isRIC)) {
		event = CommodityPriceAction.EVENT_PREPARE;
	}
%>


<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage() {
    document.forms[0].submit();
}

function refresh() {
    document.forms[0].event.value= "<%=CommodityPriceAction.EVENT_REFRESH%>"
    document.forms[0].submit();
}
//-->
</script>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>
<html:form action="CommodityPrice.do">
<input type="hidden" name="event" value="<%=event%>"/>
<input type="hidden" name="ricType" value="<%=isRIC?"":"n"%>"/>

<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
        <thead>
        <tr>
            <td > <h3>Maintain Commodity Price</h3></td>
        </tr>
        <tr>
            <td ><hr/></td>
        </tr>
        </thead>
    <tbody>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <tbody>
            <tr class="odd">
                <td class="fieldname" width="65%"><bean:message key="label.cmdt.profile.cmdt.sub.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td width="35%">
                    <html:select property="category" onchange="refresh()">
                    <html:option value="">Please Select</html:option>
                    <html:options name="categoryID" labelName="cateogryValue"/>
                    </html:select>&nbsp;
                    <html:errors property="category"/>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td>
                    <html:select property="commodityType">
                    <html:option value="">Please Select</html:option>
                    <html:options name="productTypeID" labelName="productTypeValue"/>
                    </html:select>&nbsp;
                    <html:errors property="commodityType"/>
                </td>
            </tr>
        </tbody>
        </table>
    </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    </tr>
            <tr>
                <td style="text-align:center">
                    <input onclick="javascript:submitPage()" name="select" type="button" id="select" value="Select"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                </td>
            </tr>
    </tbody>
</table>
</html:form>
