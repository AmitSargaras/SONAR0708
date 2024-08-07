<%@page import="com.integrosys.cms.ui.holiday.MaintainHolidayForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
com.integrosys.component.user.app.bus.ICommonUser,
com.integrosys.component.user.app.constant.UserConstant,
com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
com.integrosys.cms.app.user.trx.OBUserTrxValue,
java.util.List,com.integrosys.cms.ui.common.CountryList,
com.integrosys.component.bizstructure.app.bus.ITeam,
com.integrosys.cms.ui.common.constant.IGlobalConstant,
com.integrosys.base.uiinfra.common.ICommonEventConstant,
com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
com.integrosys.base.techinfra.util.DateUtil,
com.integrosys.base.techinfra.propertyfile.PropertyManager,
java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.component.MaintainComponentForm"%>
<%
	
 MaintainNewTatForm tatForm = (MaintainNewTatForm) request.getAttribute("MaintainNewTatForm");
	
	String event = request.getParameter("event");
	
%>



<%@page import="com.integrosys.cms.ui.newtatmaster.MaintainNewTatForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
function cancelPage(){
    document.forms[0].action="tatmaster.do?event=maker_list_tat_master";
    document.forms[0].submit();
}
function cancelPage1(){
    document.forms[0].action="tatmaster.do?event=checker_list_tat_master";
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='tatmaster.do?'>
<input type="hidden" name="event" />
<body>
<!-- InstanceBeginEditable name="Content" -->
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >

</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
   <tr><td align="right"><font color="blue">*</font> All timing values are in 24 hour format</td>
  </tr>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
      <td><h3>View TAT Master</h3></td>
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
           <tr class="even">
             
              <td class="fieldname" width="50%">Event</td>
               
             
              <td width="30%"><%=tatForm.getUserEvent()%></td>      </tr>
            
            <tr class="odd">             
              <td class="fieldname" width="20%">Timing </td>
              <td width="30%"><%=tatForm.getTiming()%> &nbsp;[hh:mm]&nbsp;<font color="blue">*</font>&nbsp;
              </td>             
            </tr>
            
            <tr class="odd">             
              <td class="fieldname" width="20%">Start Timing </td>
              <td width="30%"><%=tatForm.getStartTime()%> &nbsp;[hh:mm]&nbsp;<font color="blue">*</font>&nbsp;
              </td>             
            </tr>
            
            <tr class="even">             
              <td class="fieldname" width="20%">End Timing </td>
             <td width="30%"><%=tatForm.getEndTime()%> &nbsp;[hh:mm]&nbsp;<font color="blue">*</font>&nbsp;
              </td>                        
            </tr>

					</tbody>
        </table> </td>
  </tr>
  

  </tbody>
  
</table>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>&nbsp;</tr>
<tr>
<td>
<thead>
          </thead>
          <tbody>
<table width="80%" border="0" cellspacing="0" cellpadding="0" class="tblInput" align="center">
<tr class="even">
<td class="fieldname" width="20%">Edited By</td>
<%if(tatForm.getCreatedBy()!=null){ %>
<td ><%=tatForm.getCreatedBy() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>
<td class="fieldname" width="20%">Last Approved By</td>
<%if(tatForm.getLastUpdatedBy()!=null){ %>
<td ><%=tatForm.getLastUpdatedBy() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>
</tr>
<tr class="even">
<td class="fieldname" width="20%">Edited On</td>
<%if(tatForm.getCreatedOn()!=null){ %>
<td ><%=tatForm.getCreatedOn() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>

<td class="fieldname" width="20%">Last Approved On</td>
<%if(tatForm.getLastUpdatedOn()!=null){ %>
<td ><%=tatForm.getLastUpdatedOn() %></td>
<%}else{ %>
<td>- &nbsp;</td>
<%} %>

</tr>

</table>
</tbody>
</td>
</tr>
<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
 <td colspan="4">
 <%if("maker_view_tat_event".equals(event)){ %>
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						<%}else{ %>
						<center>
							<a href="javascript:cancelPage1();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						<%} %>
						&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
