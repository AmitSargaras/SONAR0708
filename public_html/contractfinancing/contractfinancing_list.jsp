<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.contractfinancing.bus.IContractFinancingSummary"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: contract financing - prepare page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.2 $
* @since $Date: 2007/May/07 $
* Tag: $Name:  $
*/
%>

<%
    IContractFinancingSummary[] contractFinancingSummary = (IContractFinancingSummary[]) session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingSummary");

    String limitProfileID = null;
    if(contractFinancingSummary.length!=0){
        limitProfileID = String.valueOf(contractFinancingSummary[0].getLimitProfileID());    
    }

    String userMembershipID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    boolean isMrMaker = false;

    if (userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I))
    		||userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH))
    		) {
        isMrMaker = true;
    }
%>

<script language="JavaScript" type="text/JavaScript">
<!--
function JumpOnSelect(selectObj,contractID) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
        parent.document.location = "ContractFinancing.do?initEvent=view&event=view&contractID="+contractID
    if (selectObj.options[selectIndex].value == "delete")
        parent.document.location = "ContractFinancing.do?initEvent=maker_prepare_delete&event=maker_prepare_delete&contractID="+contractID
}

function submitPage(initEvent,event,limitID,sourceLimit,productDescription) {
    document.forms[0].initEvent.value=initEvent;
    document.forms[0].event.value=event;
    document.forms[0].limitID.value=limitID;
    document.forms[0].sourceLimit.value=sourceLimit;
    document.forms[0].productDescription.value=productDescription;
    document.forms[0].submit();
}
//-->
</script>

<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->


<script type="text/javascript" src="js/imageNavigation.js"></script>
</head>

<body>
<html:form action="ContractFinancing.do">
<input type="hidden" name="initEvent"/>
<input type="hidden" name="event"/>
<input type="hidden" name="limitProfileID" value="<%=limitProfileID%>" />
<input type="hidden" name="limitID"/>
<input type="hidden" name="sourceLimit"/>
<input type="hidden" name="productDescription"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.contractfinancing.title"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
</table>

<%
String tempLimitID = "";
int count = 0;
for (int i=0;i<contractFinancingSummary.length;i++){
    if (!String.valueOf(contractFinancingSummary[i].getLimitID()).equals(tempLimitID)) {
        tempLimitID = String.valueOf(contractFinancingSummary[i].getLimitID());
        count = 0; 
        %>
        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr><td>&nbsp</td></tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <td colspan="7"><integro:empty-if-null value="<%=contractFinancingSummary[i].getProductDescription()%>" /> (<%=contractFinancingSummary[i].getSourceLimit()%>)</td>
                <td align="right" valign="bottom">
                    <%
                        if(isMrMaker){
                            %><input name="Submit" type="button" class="btnNormal" value="Add New" onClick="submitPage('maker_prepare_create','maker_prepare_create',<%=contractFinancingSummary[i].getLimitID()%>,'<%=contractFinancingSummary[i].getSourceLimit()%>','<integro:empty-if-null value="<%=contractFinancingSummary[i].getProductDescription()%>" />')" /><%
                        }
                    %>
                </td>
            </tr>
        </thead>
        </table>

        <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
            <tr>
                <td width="3%"><bean:message key="label.contractfinancing.serialnumber"/></td>
                <td width="11%"><bean:message key="label.contractdetails.contract.no"/></td>
                <td width="12%"><bean:message key="label.contractdetails.contract.date"/></td>
                <td width="15%"><bean:message key="label.contractdetails.contract.expiry.date"/></td>
                <td width="16%"><bean:message key="label.contractdetails.contract.extended.date"/></td>
                <td width="14%"><bean:message key="label.contractdetails.contract.amount"/></td>
                <td width="14%"><bean:message key="label.contractdetails.financed.contract.value"/></td>
                <td width="15%"><bean:message key="label.contractfinancing.action"/></td>
            </tr>
        </thead>
        <%
    }
    if (contractFinancingSummary[i].getContractID() != ICMSConstant.LONG_INVALID_VALUE) {
        count++;
        %>
        <tbody>
            <tr class='<%=(count%2==0?"even":"odd")%>'>
                <td class="index"><%=count%></td>
                <td><%=contractFinancingSummary[i].getContractNumber()%></td>
                <td><integro:date object="<%=contractFinancingSummary[i].getContractDate()%>" /></td>
                <td><integro:date object="<%=contractFinancingSummary[i].getExpiryDate()%>" /></td>
                <td><integro:date object="<%=contractFinancingSummary[i].getExtendedDate()%>" /></td>
                <td><integro:amount param="all" amount="<%=contractFinancingSummary[i].getContractAmount()%>" /></td>
                <td><integro:amount param="all" amount="<%=contractFinancingSummary[i].getFinancedAmount()%>" /></td>
                <td>
                    <%
                        if(isMrMaker){
                            %>
                            <label>
                            <center>
                                <select onChange="JumpOnSelect(this,'<%=contractFinancingSummary[i].getContractID()%>')">
                                <option>Please Select</option>
                                <option value="view">View</option>
                                <option value="delete">Delete</option>
                            </select>
                            </center>
                            </label><%
                        } else {
                            %><center><a href="ContractFinancing.do?initEvent=view&event=view&contractID=<%=contractFinancingSummary[i].getContractID()%>">View</a></center><%    
                        }
                    %>

                </td>
            </tr>
        </tbody>
        <%
    }
    else {
        %>
        <tr class="odd">
            <td colspan="10"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%

    }
}
%>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td width="100%" valign="baseline" align="center">
            <a href="CustomerSearch.do?event=return" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
        </td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
</table>

</html:form>
</body>
</html>