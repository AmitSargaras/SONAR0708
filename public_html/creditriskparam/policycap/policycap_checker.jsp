<%@ page import="com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapTrxValue,
				 com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapGroupTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCap,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCapGroup,
                 com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapConstants"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: Marketable Securities Policy Cap - checker approve/reject page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.1 $
* @since $Date: 2007/Mar/08 $
* Tag: $Name:  $
*/
%>
<%
    CommonCodeList boardDescList = (CommonCodeList)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.boardDescList");

    IPolicyCapGroupTrxValue obTrxValue = (IPolicyCapGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.policyCapGroupTrxValue");
    IPolicyCap[] parametersArray;
    IPolicyCap[] stagingParametersArray;

    if(obTrxValue != null) {
        stagingParametersArray = obTrxValue.getStagingPolicyCapGroup().getPolicyCapArray();
        parametersArray = obTrxValue.getPolicyCapGroup().getPolicyCapArray();
        
        try {
            List compResult =CompareOBUtil.compOBArray(stagingParametersArray,parametersArray);
            ArrayList list = new ArrayList(compResult);
            pageContext.setAttribute("policyCapList",list);       
            
        } catch(Exception e) {
            DefaultLogger.debug(this, "<<<<<<>>>>>>>>> Error");
            e.printStackTrace();
        }
    }
    
    String bankEntityName = (String)request.getAttribute("bankEntityName");
    DefaultLogger.debug(this, ">>>>>>> bank Entity name = " + bankEntityName);
    if(bankEntityName == null ) {     //get around method for when there is error when submitting (under maker edit rejected transaction)
    	bankEntityName = request.getParameter("bankEntityName");
    }

    int i=0;
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
    var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
    var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
    if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
    var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
    if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function approvePage() {
    document.forms[0].event.value="checker_approve";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].event.value="checker_reject";
    document.forms[0].submit();
}
-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action="PolicyCap.do">
<input type="hidden" name="event"/>

<body>
<br>
<!-- InstanceBeginEditable name="Content" -->
<table id="tblExchange" width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr style="text-align:center">
    <td width="3%"><bean:message key="label.global.sno"/></td>
    <td width="10%"><bean:message key="label.board.desc"/></td>
    <!-- 
    <td width="12%">Maximum Trading Cap<br/>
    (excluding FI Shares) </td>
    -->
    <td width="11%"><bean:message key="label.max.col.cap"/><br/>
    <bean:message key="label.exclude.fi.shares"/></td>
    <td width="10%"><bean:message key="label.quota.col.cap"/><br/>
    <bean:message key="label.exclude.fi.shares"/></td>
    <td width="12%"><bean:message key="label.max.col.cap"/><br/>
    <bean:message key="label.fi.shares.only"/></td>
    <td width="11%"><bean:message key="label.quota.col.cap"/><br/>
    <bean:message key="label.fi.shares.only"/></td>
    <logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
    <td colspan="2"><bean:message key="label.moa"/></td>
    <td width="15%"><bean:message key="label.max.rice.cap"/></td>
    </logic:equal>
</tr>
</thead>
<tbody>
<logic:present name="policyCapList">
   <logic:iterate id="compResult" name="policyCapList"  type="com.integrosys.base.techinfra.diff.CompareResult">
<%
    IPolicyCap stagingParameter = (IPolicyCap)compResult.getObj();
	String exemptedFI = (PolicyCapConstants.FI_SHARES_EXEMPTED_MAP.get(stagingParameter.getBoard()) == null) ? "No" : "Yes";
    i++;
%>
    <tr class='<%=(i%2==0?"even":"odd")%>' >
        <td rowspan="2" class='<bean:write name="compResult" property="key" />'  ><%=i%></td>
        <td rowspan="2" style="text-align:center">
            <integro:empty-if-null value="<%=boardDescList.getCommonCodeLabel(stagingParameter.getBoard())%>" /></td>
        <!-- 
        <td rowspan="2" style="text-align:center">
            <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getMaxTradeCapNonFI()%>" /> %</td>
        -->
        <td rowspan="2" style="text-align:center">
            <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getMaxCollateralCapNonFI()%>" /> %</td>
        <td rowspan="2" style="text-align:center">
            <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getQuotaCollateralCapNonFI()%>" /> %</td>
        <td rowspan="2" style="text-align:center">
        <% if (exemptedFI.equals("No")) { %>
            <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getMaxCollateralCapFI()%>" /> %
        <% } else { %>
        	&nbsp;
        <% } %>
        </td>
        <td rowspan="2" style="text-align:center">
        <% if (exemptedFI.equals("No")) { %>        
            <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getQuotaCollateralCapFI()%>" /> %
        <% } else { %>
        	&nbsp;
        <% } %>            
         </td>
        <logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
        <td colspan="2" style="text-align:center">Liquid <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getLiquidMOA()%>" /> %</td>
        <td rowspan="2" style="text-align:center">
        <%
            if (stagingParameter.getPriceCap() != null) {
                %><integro:empty-if-null value="<%=stagingParameter.getPriceCap().getCurrencyCode()%>" />
                <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getPriceCap().getAmount()%>" /><%
            }
        %>
        </td>
        </logic:equal>
    </tr>
    <tr class='<%=(i%2==0?"even":"odd")%>'>
    	<logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
        <td colspan="2" style="text-align:center"><bean:message key="label.liquid.or.illiquid"/> <integro:empty-if-invalid displayForInvalid="-" value="<%=stagingParameter.getIlliquidMOA()%>" />	%</td>
        </logic:equal>
    </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="policyCapList" >
            <tr class="odd">
              <td colspan="10"><bean:message key="label.global.not.found"/></td>
            </tr>
</logic:notPresent>
</tbody>
</table>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <jsp:include page="../creditriskparam_remarks_section_include.jsp" flush="true" >
            <jsp:param name="UID" value='<%=obTrxValue.getUserInfo()%>' />
            <jsp:param name="remarks" value='<%=obTrxValue.getRemarks()%>' />
            </jsp:include>
        </td>
    </tr>
</tbody>
</table>

<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
</tr>
<tr>
    <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="ToDo.do?event=prepare&isMenu=Y" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
</tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>