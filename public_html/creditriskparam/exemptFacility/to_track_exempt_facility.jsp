<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.IExemptFacilityGroupTrxValue,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityForm,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacilityGroup,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.IExemptFacility,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.OBExemptFacility,
                 com.integrosys.cms.app.creditriskparam.bus.exemptFacility.OBExemptFacilityGroup,
                 java.util.Collection,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.creditriskparam.trx.exemptFacility.OBExemptFacilityGroupTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction,
                 com.integrosys.base.techinfra.util.AccessorUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 java.util.List,
                 java.util.Arrays,
                 com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityUIHelper"%>
                 
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    *
    * Purpose: Exempt Facility
    *
    * @author $Author: Lini $<br>
    * @version $Revision: 1.1 $
    * @since $Date: 2007/Mar/08 $
    * Tag: $Name:  $
    */
%>

<%
    String event = request.getParameter("event");
    OBExemptFacilityGroup exFacGroup = (OBExemptFacilityGroup)session.getAttribute("com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction.InitialExemptFacilityGroup");
    Object obj = session.getAttribute("com.integrosys.cms.ui.creditriskparam.exemptFacility.ExemptFacilityAction.exemptFacilityTrxValue");

    //ExemptFacilityForm aForm = (ExemptFacilityForm) request.getAttribute("ExemptFacilityForm");
    OBExemptFacilityGroupTrxValue obTrxValue = null;
    IExemptFacility[] facArr = null ;
    if( obj!=null ) {
        obTrxValue = (OBExemptFacilityGroupTrxValue)obj;
        if(event.equalsIgnoreCase(ExemptFacilityAction.EVENT_TO_TRACK)) {
        	
        	if (obTrxValue.getStatus().equals(ICMSConstant.STATE_CLOSED)) {
        		if (obTrxValue.getExemptFacilityGroup() != null)
        			facArr = obTrxValue.getExemptFacilityGroup().getExemptFacility();
        	} else {
        		if (obTrxValue.getStagingExemptFacilityGroup() != null)
              		facArr = obTrxValue.getStagingExemptFacilityGroup().getExemptFacility();
            }
        } 
    }
    else
    {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'ExemptFacilityTrxValue' ");
    }
    if (exFacGroup != null){
        facArr = exFacGroup.getExemptFacility();
        DefaultLogger.debug(this,"@@@Debug::: Getting from InitialExemptFacilityGroup ");
    }
    
    if( facArr!=null ) {
        
        ExemptFacilityUIHelper helper = new ExemptFacilityUIHelper();
        
        List sortList = helper.getSortedExemptFacilityMap(Arrays.asList(facArr));
        
        facArr = (IExemptFacility[])sortList.toArray(new IExemptFacility[] {});
        
        pageContext.setAttribute("facArr", facArr);
        
    }
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
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

function JumpOnSelectactive(selectObj, exemptFacilityID)
	{

  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "View")
		{
        	location.href = "ExemptFacility.do?event=view&index=" +exemptFacilityID;
        	//location.href = "ExemptFacility.do?event=view&exemptFacilityID=" +exemptFacilityID;
   		}
		else if (selectObj.options[selectIndex].value == "Edit")
        {
        	location.href = "ExemptFacility.do?event=prepare_edit&index=" +exemptFacilityID;
        	//location.href = "ExemptFacility.do?event=prepare_edit&exemptFacilityID=" +exemptFacilityID;
		}
    }


//-->
</script>
<!-- InstanceEndEditable -->
</head>


<html:form action="ExemptFacility.do">
<input type="hidden" name="event"/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index"/>
<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
    <td><h3><bean:message key="title.crp.exemptfac.list"/></h3></td>
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
    <td width="12%"><bean:message key="label.crp.exemptfac.facility.desc"/><font color="#0000FF"> *</font></td>
    <td width="5%"><bean:message key="label.crp.exemptfac.facility.code"/><font color="#0000FF"> *</font></td>
    <td width="12%"><bean:message key="label.crp.exemptfac.status.exempted"/>&nbsp;/&nbsp;<bean:message key="label.crp.exemptfac.conditional.perc"/><font color="#0000FF"> *</font></td>
</tr>
</thead>
<tbody>
<%
if (facArr != null && facArr.length >0) {
    for (int i = 0; i < facArr.length; i++) {
     DefaultLogger.debug(this,"facArr = "+i + " =  " + facArr[i]);
        %>
        <tr class='<%=(i%2==0?"even":"odd")%>'>
            <td valign="center" class="index"><%=(i+1)%></td>
            <td style="text-align:center">
                <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.FACILITY_DESCRIPTION, facArr[i].getFacilityCode())%>"/> &nbsp;
            </td>
            <td style="text-align:center">
                <integro:empty-if-null value="<%=facArr[i].getFacilityCode()%>"/>&nbsp;
            </td>
            <td style="text-align:center">
            <% if (ICMSConstant.EXEMPT_FACILITY_STATUS_EXEMPTED.equals(facArr[i].getFacilityStatusExempted())) {%>
                Exempted
            <%}else{%>
                <%=facArr[i].getFacilityStatusConditionalPerc()%>
            <%}%>
            </td>
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
</tbody>
</table>

    <table  width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
    <br>
    </tbody>
    </table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
</tr>
<tr>
   <td><a href='ToDo.do?event=totrack' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
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