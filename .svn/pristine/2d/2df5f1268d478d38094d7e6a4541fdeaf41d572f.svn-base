<%@ page import="com.integrosys.cms.app.collaborationtask.trx.ICCTaskTrxValue,
                 com.integrosys.cms.app.collaborationtask.bus.ICCTask,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccoltask.CCColTaskForm,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICCTaskTrxValue colTrxVal = (ICCTaskTrxValue)session.getAttribute("com.integrosys.cms.ui.cccoltask.CCColTaskAction.colTrxVal");
    ICCTask colTask = (ICCTask)session.getAttribute("com.integrosys.cms.ui.cccoltask.CCColTaskAction.colTask");
    if(colTask!=null){
        pageContext.setAttribute("colTask",colTask);
    }
    ICCTask act = null;
    ICCTask staging = null;

	String remarks = "";
    String lastActionBy = "";
    String status = "";
	if(colTrxVal!=null) {
        act = colTrxVal.getCCTask();
        staging = colTrxVal.getStagingCCTask();
        if(staging!=null){
            pageContext.setAttribute("colTask",staging);
        }
        status = colTrxVal.getStatus();
        remarks = colTrxVal.getRemarks();
        lastActionBy = colTrxVal.getUserInfo();
	}
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    boolean toView = false;
    String event = request.getParameter("event");
    if("view_task".equals(event)){
        toView = true;
    }
   	boolean toReject=false;
	if("maker_pre_reject".equals(event))
	{
	toReject=true;
	}
	
	String frame=(String)session.getAttribute("com.integrosys.cms.ui.cccoltask.CCColTaskAction.frame");
	boolean backTolist=false;
	if("true".equals(frame))
	{
	backTolist=true;
	}
	
    CCColTaskForm aForm = (CCColTaskForm)request.getAttribute("CCColTaskForm");


    int row = 0;
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

function submitForm() {
    document.forms[0].event.value="submit";
    document.forms[0].submit();
}

function back2tasklist()
{
	document.forms[0].event.value="list";
    document.forms[0].submit();
}

function reject(){
    document.forms[0].event.value="maker_reject";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="CCColTask" >
<html:hidden property="event" />
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
<%@include file="cccoltask_title.jsp" %>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <hr /></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
            <tr class="even">
              <td class="fieldname">Customer Category</td>

              <td>&nbsp;<bean:write name="CCColTaskForm" property="customerCategory" />
                        <html:hidden name="CCColTaskForm" property="customerCategory" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">LE ID</td>

              <td>
              <%    if ((aForm.getLegalRef() != null) && (aForm.getLegalRef().trim().length() > 0))
                    {              
              %>    &nbsp;<bean:write name="CCColTaskForm" property="legalRef" />                        
              <%    }
                    else
                    {
              %>    -
              <%    }%>                            
                    <html:hidden name="CCColTaskForm" property="legalRef" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Legal Name</td>

              <td>&nbsp;<bean:write name="CCColTaskForm" property="legalName" />
                        <html:hidden name="CCColTaskForm" property="legalName" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Instr Bkg Loc Ctry</td>
              <td>&nbsp;<bean:write name="CCColTaskForm" property="domicileCountry" />
                        <html:hidden name="CCColTaskForm" property="domicileCountry" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Type</td>
              <%
                  String custType = aForm.getCustomerType();
                  custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION,custType);
              %>
              <td>&nbsp;<integro:empty-if-null value="<%=custType%>" />
                        <html:hidden name="CCColTaskForm" property="customerType" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Organisation Code</td>
              <td>              
              <%
                  String orgCode = "-";
                  orgCode = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getOrgCode());
              %>
              &nbsp;<integro:empty-if-null value="<%=orgCode%>" />
              <html:hidden name="CCColTaskForm" property="orgCode" />
              </td>
            </tr>
            <tr class="even">
<%if(!toView) {%>
              <td height="25" class="fieldname">Remarks</td>
              <td>&nbsp; <html:textarea property="colRemarks" rows="5" cols="50" />
              <html:errors property="colRemarks" />
                         <html:hidden property="colRemarks"/>
              </td>
<% } else {%>
            <tr class="odd">
              <td height="25" class="fieldname">Remarks</td>
              <td>&nbsp;<integro:wrapper value="<%=aForm.getColRemarks()%>" /></textarea>
              </td>
            </tr>
<% } %>

            </tr>
          </tbody>
        </table></td>
    </tr>

  </tbody>
</table>
</p>
</p>

<%if(!toView && ICMSConstant.STATE_REJECTED.equals(status)) { %>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <!-- CR136 only one remarks field is enough
                                <tr>
					                <td class="fieldname">Remarks</td>
					                <td class="odd"><textarea name="remarks" rows="4" cols="90"></textarea></td>
					            </tr> -->
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
<% } %>
<%@ include file="/cccoltask/history_comments.jsp"%>                   
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <%if(toView){ %>
     <td colspan="2"><a href="javascript:back2tasklist()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else{%>
	
	<%if(toReject){%>
    <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
	<%}else{%>
    <td width="75" valign="baseline" align="center"><a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
	<% } %>
    <%if(backTolist){%>
    <td width="75" valign="baseline" align="center"><a href="javascript:back2tasklist()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
	<%}else{%>
	<td width="75" valign="baseline" align="center"><a href="ToDo.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>	
	<%}%>	
<% } %>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

