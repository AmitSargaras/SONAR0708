<%@ page import="com.integrosys.cms.app.collaborationtask.trx.ICollateralTaskTrxValue,
                 com.integrosys.cms.app.collaborationtask.bus.ICollateralTask,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.seccoltask.SecurityColTaskForm,
				 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICollateralTaskTrxValue colTrxVal = (ICollateralTaskTrxValue)session.getAttribute("com.integrosys.cms.ui.seccoltask.SecurityColTaskAction.colTrxVal");
    ICollateralTask act = colTrxVal.getCollateralTask();
    ICollateralTask staging = colTrxVal.getStagingCollateralTask();
    if(staging!=null){
        pageContext.setAttribute("colTask",staging);
    }

	String remarks = "";
    String lastActionBy = "";
    String status = "";
	if(colTrxVal!=null) {
        status = colTrxVal.getStatus();
        remarks = colTrxVal.getRemarks();
        lastActionBy = colTrxVal.getUserInfo();
	}
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    int row = 0;

    boolean toTrack = false;
    //String event = request.getParameter("event");
    String event = (String)session.getAttribute("com.integrosys.cms.ui.seccoltask.SecurityColTaskAction.originEvent");
    if("to_track".equals(event)){
        toTrack = true;
    }

    SecurityColTaskForm aForm = (SecurityColTaskForm)request.getAttribute("SecurityColTaskForm");
 boolean toView = false;
 boolean toReject=false;
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px ;
}
</style>


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

function gotopage (aLocation) {
	window.location = aLocation ;
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif','img/return2.gif','img/close2a.gif')">
<html:form action="SecurityColTask" >
<html:hidden property="event" />
<html:hidden property="collateralRef"/>
<html:hidden property="colLocation"/>
<html:hidden property="colType"/>
<html:hidden property="colSubType"/>
<html:hidden property="colRemarks"/>
<html:hidden property="customerCategory"/>
<html:hidden property="securityOrganization"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
<%@include file="seccoltask_title.jsp" %>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <hr /></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td class="fieldname">Limit ID</td>
              <td>
          <% if(staging != null && staging.getLimitList() != null) {%>
                 	<logic:present name="colTask" >
              		<logic:iterate id="subOb" name="colTask" property="limitList" type="com.integrosys.cms.app.limit.bus.ILimit" >
                  	<%=subOb.getLimitRef()%><br>
                	</logic:iterate>
                	</logic:present>
             <% }else if(staging !=null && staging.getCoBorrowerLimitList() != null) {%>
                 <logic:present name="colTask" >
                 <logic:iterate id="subOb" name="colTask" property="coBorrowerLimitList" type="com.integrosys.cms.app.limit.bus.ICoBorrowerLimit" >
                  <%=subOb.getLimitRef()%><br>
                </logic:iterate>
                </logic:present>
             <% }else {out.println("-");}%>
                
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Security ID</td>
              <td>&nbsp;<bean:write name="SecurityColTaskForm" property="collateralRef" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Security Location</td>
              <td>&nbsp;<bean:write name="SecurityColTaskForm" property="colLocation" /></td>
            </tr>
			 <tr class="even">
              <td class="fieldname">Organisation Code</td>
              <td>&nbsp; <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getSecurityOrganization())%>"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Security Type</td>
              <td>&nbsp;<bean:write name="SecurityColTaskForm" property="colType" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Security SubType</td>
              <td>&nbsp;<bean:write name="SecurityColTaskForm" property="colSubType" /></td>
            </tr>
			<tr class="odd">
              	<td class="fieldname">Customer Category</td>
              	<td>
               <bean:write name="SecurityColTaskForm" property="customerCategory" />     
               </td>
            </tr>
            <tr class="even">
              <td height="25" class="fieldname">Remarks</td>
              <td><integro:wrapper value="<%=aForm.getColRemarks()%>"/></td>
            </tr>
          </tbody>
        </table></td>
    </tr>

  </tbody>
</table>

<%if(!"view_task".equals(event) && !toTrack && ICMSConstant.STATE_REJECTED.equals(status)){%>
<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<%}%>
<%@ include file="/seccoltask/history_comments.jsp"%>                    	

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" valign="baseline" align="center">
    <%if(toTrack){%>
        <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44111','','img/return2.gif',1)"><img src="img/return1.gif" name="Image44111"  border="0" id="Image44111" /></a>
    <% } else if("view_task".equals(event)){%>
        <a href="SecurityColTask.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44112','','img/return2.gif',1)"><img src="img/return1.gif" name="Image44112"  border="0" id="Image44112" /></a>
    <%}else{%>
    <a href="SecurityColTask.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44113','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image44113"  border="0" id="Image44113" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
   <%}%>
    </td>
  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

