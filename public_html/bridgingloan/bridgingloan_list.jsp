<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 java.util.HashMap,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoanSummary,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: List Bridging Loan
* Description: This screen displays the summary list of existing Bridging Loan information
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    IBridgingLoanSummary[] bridgingLoanSummary = (IBridgingLoanSummary[]) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanSummary");
    DefaultLogger.debug(this, "bridgingLoanSummary.length: " + bridgingLoanSummary.length);

    String limitProfileID = "";
    if (bridgingLoanSummary.length != 0) {
        limitProfileID = String.valueOf(bridgingLoanSummary[0].getLimitProfileID());
    }

    String userMembershipID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    boolean isMrMaker = false;

    if (userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH))) {
        isMrMaker = true;
    }
%>
<html>
<head>
<title>CMS</title>


<style>
<!--
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
//-->
</style>
<script src="js/imageNavigation.js"></script>
<script>
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function JumpOnSelectactive(selectObj, projectID) {
    var selectIndex = selectObj.selectedIndex;
	if (selectObj.options[selectIndex].value == "view")
        document.forms[0].event.value = "view";
    else if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete";

    document.forms[0].initEvent.value = document.forms[0].event.value;
    document.forms[0].projectID.value = projectID;
    document.forms[0].submit();
}

function submitPage(event, limitID, sourceLimit, productDescription) {
    document.forms[0].initEvent.value = event;
    document.forms[0].event.value = event;
    document.forms[0].limitID.value = limitID;
    document.forms[0].sourceLimit.value = sourceLimit;
    document.forms[0].productDescription.value = productDescription;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/return1.gif')">
<html:form action="BridgingLoan.do" >
<input type="hidden" name="initEvent"/>
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="limitProfileID" value="<%=limitProfileID%>" />
<input type="hidden" name="limitID"/>
<input type="hidden" name="sourceLimit"/>
<input type="hidden" name="productDescription"/>
<input type="hidden" name="projectID"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.bridgingloan.title"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
</table>

<%
    String tempLimitID = "";
    int count = 0;
    for (int i=0; i<bridgingLoanSummary.length; i++) {
        if (!String.valueOf(bridgingLoanSummary[i].getLimitID()).equals(tempLimitID)) {
            tempLimitID = String.valueOf(bridgingLoanSummary[i].getLimitID());
            count = 0;

            String productDescription = bridgingLoanSummary[i].getProductDescription();
            String sourceLimitID = bridgingLoanSummary[i].getSourceLimit();
            if (productDescription == null)
                productDescription = "Bridging Loan";
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr><td>&nbsp</td></tr>
        <tr><td colspan="7"><integro:empty-if-null value="<%=productDescription%>" /> (<%=sourceLimitID%>)</td>
        <% if (isMrMaker) { %>
            <td style="text-align:right" valign="bottom"><input name="Submit" type="button" class="btnNormal" value="Add New" onclick="submitPage('maker_prepare_create', '<%=bridgingLoanSummary[i].getLimitID()%>','<%=sourceLimitID%>','<integro:empty-if-null value="<%=productDescription%>" />');" /></td>
        <% } %>
        </tr>
    </thead>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
            <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
            <td width="*"><bean:message key="label.bridgingloan.proj.no"/></td>
            <td width="12%"><bean:message key="label.bridgingloan.cont.date"/></td>
            <td width="12%"><bean:message key="label.bridgingloan.act.st.date"/></td>
            <td width="12%"><bean:message key="label.bridgingloan.act.complt.date"/></td>
            <td width="16%"><bean:message key="label.bridgingloan.ofc.value"/></td>
            <td width="16%"><bean:message key="label.bridgingloan.fc.value"/></td>
            <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
        </tr>
    </thead>
    <tbody>
        <%
            }
            if (bridgingLoanSummary[i].getProjectID() != ICMSConstant.LONG_INVALID_VALUE) {
                count++;
        %>
        <tr class='<%=(count%2==0?"even":"odd")%>'>
            <td style="text-align:center" class="index"><%=count%></td>
            <td><integro:empty-if-null value="<%=bridgingLoanSummary[i].getProjectNumber()%>"/>&nbsp;</td>
            <td style="text-align:center"><integro:date object="<%=bridgingLoanSummary[i].getContractDate()%>"/>&nbsp;</td>
            <td style="text-align:center"><integro:date object="<%=bridgingLoanSummary[i].getActualStartDate()%>"/>&nbsp;</td>
            <td style="text-align:center"><integro:date object="<%=bridgingLoanSummary[i].getActualCompletionDate()%>"/>&nbsp;</td>
            <td style="text-align:right"><integro:amount param="all" amount="<%=bridgingLoanSummary[i].getContractAmount()%>" />&nbsp;</td>
            <td style="text-align:right"><integro:amount param="all" amount="<%=bridgingLoanSummary[i].getFinancedAmount()%>" />&nbsp;</td>

            <td style="text-align:center">
                <%
                    if (isMrMaker) {
                %>
                <select name="select3" onChange="JumpOnSelectactive(this, <%=bridgingLoanSummary[i].getProjectID()%>)">
                    <option selected="selected">Please Select</option>
                    <option value="view">View / Edit</option>
                    <option value="delete">Delete</option>
                </select>
                <% } else { //For checker view %>
                    <a href="BridgingLoan.do?initEvent=view&event=view&projectID=<%=bridgingLoanSummary[i].getProjectID()%>">View</a>
                <% } %>
            </td>
        </tr>
        <%  }
            else {
        %>
        <tr class="odd">
            <td colspan="10"><bean:message key="label.common.empty"/></td>
        </tr>
    </tbody>
</table>
<%
    }
}
%>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td width="100%" valign="baseline" style="text-align:center">
            <a href="CustomerSearch.do?event=return" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
        </td>
        <td> </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>