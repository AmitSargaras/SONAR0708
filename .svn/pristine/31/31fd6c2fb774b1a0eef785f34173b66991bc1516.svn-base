<%@ page import="com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCap,
                 com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCapGroup,
                 com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapGroupTrxValue,
                 com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapConstants,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapForm"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    *
    * Purpose: Marketable Securities Policy Cap - maker update page
    *
    * @author $Author: KienLeong $<br>
    * @version $Revision: 1.1 $
    * @since $Date: 2007/Mar/08 $
    * Tag: $Name:  $
    */
%>

<%
        DefaultLogger.debug(this, "Enter PolicyCap JSP");
        IPolicyCapGroupTrxValue obTrxValue = (IPolicyCapGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.policyCapGroupTrxValue");

        String stockExchangeName = (String)request.getAttribute("stockExchangeName");

        if(stockExchangeName == null ) {     //get around method for when there is error when submitting (under maker edit rejected transaction)
            stockExchangeName = request.getParameter("stockExchangeName");
        }
        
        String bankEntityName = (String)request.getAttribute("bankEntityName");

        if(bankEntityName == null ) {     //get around method for when there is error when submitting (under maker edit rejected transaction)
        	bankEntityName = request.getParameter("bankEntityName");
        }
        
        CommonCodeList boardDescList = (CommonCodeList)session.getAttribute("com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapAction.boardDescList");
        
        String isRejectedStr = request.getParameter("isRejected");
        boolean isRejected = !(isRejectedStr == null);
		
        PolicyCapForm aForm = (PolicyCapForm) request.getAttribute("PolicyCapForm");

        int formSize = 0;
        if(obTrxValue != null) {    //need this as the check as form object is always retrieved/not null.
            if (aForm!=null && aForm.getStockExchange()!=null) {
                formSize = aForm.getBoard().length;
            }
        }        
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

function submitPage(exchangeName, bankEntityName) {
    document.forms[0].event.value="maker_update";
    document.forms[0].stockExchangeName.value=exchangeName;
    document.forms[0].bankEntityName.value=bankEntityName;
    document.forms[0].submit();
}
function gotoPreparePage() {
    document.forms[0].event.value="prepare";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>


<html:form action="PolicyCap.do">
<input type="hidden" name="event"/>
<input type="hidden" name="stockExchangeName"/>
<input type="hidden" name="bankEntityName"/>
<html:hidden property="isBankGroup"/>
<% if(isRejected) { %>
    <input type="hidden" name="isRejected"/>
<% } %>

<body>
<p class="required"><bean:message key="label.mandatory"/> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
    <td><h3>Policy Cap Limit - (<%=stockExchangeName%>) - <%=bankEntityName %></h3></td>
    <td align="right" valign="bottom"></td>
</tr>
<tr>
    <td colspan="2"><hr /> </td>
</tr>
</thead>
</table>

<table id="tblExchange" width="95%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr style="text-align:center"> 
    <td width="3%"><bean:message key="label.global.sno"/></td>
    <td width="10%"><bean:message key="label.board.desc"/></td>
    <!-- 
    <td width="12%">Maximum Trading Cap<br/>
    (excluding FI Shares)<font color="#0000FF">*</font></td>
    -->
    <td width="11%"><bean:message key="label.max.col.cap"/><br/>
    <bean:message key="label.exclude.fi.shares"/><font color="#0000FF">*</font></td>
    <td width="10%"><bean:message key="label.quota.col.cap"/><br/>
    <bean:message key="label.exclude.fi.shares"/><font color="#0000FF">*</font></td>
    <td width="12%"><bean:message key="label.max.col.cap"/><br/>
    <bean:message key="label.fi.shares.only"/><font color="#0000FF">*</font></td>
    <td width="11%"><bean:message key="label.quota.col.cap"/><br/>
    <bean:message key="label.fi.shares.only"/><font color="#0000FF">*</font></td>
    <logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
    <td colspan="2"><bean:message key="label.moa"/><font color="#0000FF">*</font></td>
    <td width="15%"><bean:message key="label.max.rice.cap"/><font color="#0000FF">*</font></td>
    </logic:equal>
</tr>
</thead>
<tbody>
<%
// Prepare maximum price caps
String[] maxPriceCaps = new String[formSize];
String[] exemptedFI = new String[formSize];
DefaultLogger.debug(this, ">>>>>>> formSize 2 = " + formSize);
for (int i = 0; i < formSize; i++) {
	DefaultLogger.debug(this, ">>>>>>> i = " + i);
	if (aForm.getMaxPriceCap() != null) {
		maxPriceCaps[i] = (aForm.getMaxPriceCap()[i]==null)?
							(PolicyCapConstants.DEFAULT_MAX_PRICE_CAP_MAP.get(aForm.getBoard()[i]) == null)?"0":
								String.valueOf(PolicyCapConstants.DEFAULT_MAX_PRICE_CAP_MAP.get(aForm.getBoard()[i]))
							:aForm.getMaxPriceCap()[i];
	}
	exemptedFI[i] = (PolicyCapConstants.FI_SHARES_EXEMPTED_MAP.get(aForm.getBoard()[i]) == null) ? "No" : "Yes";
}
DefaultLogger.debug(this, ">>>>>>> formSize 4 = " + formSize);

if (formSize>0) {
    for (int i = 0; i < formSize; i++) {
        %>
        <input type="hidden" name="stockExchange" value="<%=aForm.getStockExchange()%>"/>
        <input type="hidden" name="board" value="<%=aForm.getBoard()[i]%>"/>
        <tr class='<%=(i%2==0?"even":"odd")%>'>
            <td rowspan="2" valign="center" class="index"><%=(i+1)%></td>
            <td rowspan="2" style="text-align:center">
                <%=boardDescList.getCommonCodeLabel(aForm.getBoard()[i])%>
            </td>
            

            
            <td rowspan="2" style="text-align:center">
                <input type="text" name="maxCollateralCapNonFI" size="6" value="<%=(aForm.getMaxCollateralCapNonFI()[i]==null?"5":aForm.getMaxCollateralCapNonFI()[i])%>"/> %
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="maxCollateralCapNonFI" + i%>' />
                </font>
            </td>
            <td rowspan="2" style="text-align:center">
                <input type="text" name="quotaCollateralCapNonFI" size="6" value="<%=(aForm.getQuotaCollateralCapNonFI()[i]==null?"5":aForm.getQuotaCollateralCapNonFI()[i])%>"/> %
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="quotaCollateralCapNonFI" + i%>' />
                </font>
            </td>
            <td rowspan="2" style="text-align:center">
            	<% if (exemptedFI[i].equals("No")) { %>
                <input type="text" name="maxCollateralCapFI" size="6" value="<%=(aForm.getMaxCollateralCapFI()[i]==null?"5":aForm.getMaxCollateralCapFI()[i])%>"/> %
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="maxCollateralCapFI" + i%>' />
                </font>
                <% } else { %>
                	&nbsp;
                <% } %> 
            </td>
            <td rowspan="2" style="text-align:center">
                <% if (exemptedFI[i].equals("No")) { %>
                <input type="text" name="quotaCollateralCapFI" size="6" value="<%=(aForm.getQuotaCollateralCapFI()[i]==null?"5":aForm.getQuotaCollateralCapFI()[i])%>"/> %
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="quotaCollateralCapFI" + i%>' />
                </font>
                <% } else { %>
                	&nbsp;
                <% } %>
            </td>
            
            <logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
            <td colspan="2" style="text-align:center">
                Liquid
                <input type="text" name="liquidMOA" size="6" value="<%=((aForm.getLiquidMOA()==null || aForm.getLiquidMOA()[i]==null)?"0":aForm.getLiquidMOA()[i])%>"/> %
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="liquidMOA" + i%>' />
                </font>
            </td>
            <td rowspan="2" style="text-align:center">
                <%=aForm.getCurrency()[i]%>
                <input type="hidden" name="currency" value="<%=aForm.getCurrency()[i]%>"/>
                <input type="text" name="maxPriceCap" size="10" value="<%=maxPriceCaps[i]%>"/>
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="maxPriceCap" + i%>' />
                </font>
            </td>
            </logic:equal>
        </tr>
        <tr class='<%=(i%2==0?"even":"odd")%>'>
        	<logic:equal name="PolicyCapForm" property="isBankGroup" value="true">
            <td colspan="2" style="text-align:center">
                Illiquid <input type="text" name="illiquidMOA" size="6" value="<%=((aForm.getIlliquidMOA()==null || aForm.getIlliquidMOA()[i]==null)?"0":aForm.getIlliquidMOA()[i])%>"> %
                <font color="#FF0000" size="1">
                <br><html:errors property='<%="illiquidMOA" + i%>' />
                </font>
            </td>
            </logic:equal>
        </tr>
        <%
    }
}
else {
    %>
    <tr class="odd">
        <td colspan="10"><bean:message key="label.global.not.found"/></td>
    </tr>
    <%         
}
%>
<html:errors property="policyCapError" />
</tbody>
</table>

<%
   if(isRejected ) {
%>
    <table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
    <br>
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
<% } %>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
</tr>
<tr>
    <%
        if (formSize>0) {
            %><td><a href="javascript:submitPage('<%=stockExchangeName%>','<%=bankEntityName%>')"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
            <td><a href='<%=isRejected?"ToDo.do?event=prepare&isMenu=Y":"javascript:gotoPreparePage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td><%
        }
        else {
            %><td width="100%" valign="baseline" align="center"> <a href="PolicyCap.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td><%    
        }
    %>
</tr>
<tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>